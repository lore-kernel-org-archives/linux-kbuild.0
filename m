Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:47034 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752021AbeBUQlc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Feb 2018 11:41:32 -0500
Date: Wed, 21 Feb 2018 17:41:18 +0100
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: Re: [PATCH 11/23] kconfig: add 'shell-stdout' function
Message-ID: <20180221164118.4jwjg6npbqt6xfms@huvuddator>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
 <1518806331-7101-12-git-send-email-yamada.masahiro@socionext.com>
 <CA+55aFwQLrrBeXZXK_qUXiGVFNv3qPJS4tNKFacuk0Y0WgZjCA@mail.gmail.com>
 <20180219044845.7cnqpgyiinn6hkyb@huvuddator>
 <CA+55aFwiRzpSRW8xhoMs9cbFFXZGmEyyVa4a7aeZzQGYuO211w@mail.gmail.com>
 <CA+55aFzu8+yaAGvdZMRYJWWZmv_OnFnocnvUiSKcAyNQ1z9kmQ@mail.gmail.com>
 <CAK7LNAT1QNMrHL_JikeEk1ejen-03u_vwkdQmHhHxrxHLtaa0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAT1QNMrHL_JikeEk1ejen-03u_vwkdQmHhHxrxHLtaa0Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Feb 21, 2018 at 01:59:59PM +0900, Masahiro Yamada wrote:
> 2018-02-20 3:01 GMT+09:00 Linus Torvalds <torvalds@linux-foundation.org>:
> > On Mon, Feb 19, 2018 at 9:44 AM, Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> >>
> >> I do like your "success"/"stdout" more than "shell"/"shell-stdout",
> >> because with that naming I don't get the feeling that one should
> >> subsume the other.
> >
> > Hmm. Thinking about it some more, I really would prefer just "$(shell
> > ...)" everywhere.
> >
> > But it would be nice if perhaps the error handling would match the
> > context somehow.
> >
> > I'm wondering if this might tie into the whole quoting discussion in
> > the other thread.
> >
> > Because the rule could be:
> >
> > (a) unquoted $(shell ) is a bool, and failing is ok (and turns into
> > y/n depending on whether successful or failing)
> >
> > So
> >
> >   config CC_IS_GCC
> >           bool
> >           default $(shell $CC --version | grep -q gcc)
> >
> > works automatically.
> >
> > (b) but with quoting, $(shell ) is a string, and failing is an error
> >
> > So
> >
> >   config GCC_VERSION
> >           int
> >           default "$(shell-stdout $srctree/scripts/gcc-version.sh $CC
> > | sed 's/^0*//')" if CC_IS_GCC
> >           default 0
> >
> > would need those quotes, and if the shell-script returns a failure,
> > we'd _abort_.
> 
> 
> GCC_VERSION is int type.
> 
> Setting aside the Kconfig internal, I prefer 50700 to "50700"
> 
> According to my common sense, I do not want to quote integers.

Yeah, definitely looks a bit weird coming from other languages. "" just
means constant (a literal value, implemented as a constant symbol, as
opposed to a symbol reference).


If I were to redesign things, something like this would be closer to
what people intuitively expect:

  - n, m, y produces three predefined tristate symbols (they already do,
    through the n/m/y -> "n"/"m"/"y" shorthand)

  - "foo" produces a symbol of type string. Get rid of "n", "m", "y"
    (would require cleanup in Kconfig files).

  - 123 produces a symbol of type int

  - 0x123 produces a symbol of type hex

  - Everything else is a symbol reference

A nice side effect would be making all undefined symbol references just
that. I think that might come in handy. Some simple type checking could
be added to expressions as well.

You could also get rid of the obscure "undefined symbols produce their
name as their string value" magic at that point if you wanted to. That's
what makes 123 work currently.

One thing that gets a bit icky is that Kconfig currently stores constant
symbols in the symbol table, meaning "123" as a string might clash with
123 as an int, if you use the string value as the key (this would be a
problem if you want to give them the proper type). I wonder if there's
even any point to storing constant symbols in the symbol table though,
as opposed to just having them appear in expressions.

> IMO, I prefer to use different names for different purpose.
> So, 'stdout' and 'success' look good to me.
> 
> 
> 
> BTW, I noticed just one built-in function is enough
> because 'success' can be derived from 'stdout'.
> 
> 
> So, my plan is, implement $(shell ...) as a built-in function.
> This returns the stdout from the command.
> 
> 
> Then, implement 'success' as a textual shorthand
> by using macro, like this:
> 
> macro success $(shell ($(1) && echo y) || echo n)
> 
> 
> macro can be expanded recursively, so cc-option
> can be implemented based on 'success' macro.

Was worried about the error handling for a second there, but this looks
like it might work out pretty nicely. $(success) would never have non-0
exit status, so you could still warn for that in $(shell).

There's also the question of shared Windows/Linux support in other
projects that use Kconfig, though my feeling is kernel devs don't care.
Might be pretty easy to work around anyway, by source'ing a different
Kconfig file with macro definitions depending on the OS. Would need that
for more complicated stuff anyway.

Cheers,
Ulf
