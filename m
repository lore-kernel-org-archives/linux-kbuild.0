Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36461 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750880AbeBPXvt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 18:51:49 -0500
Date: Sat, 17 Feb 2018 00:51:38 +0100
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: Re: [PATCH 08/23] kconfig: add 'macro' keyword to support
 user-defined function
Message-ID: <20180216235138.b4p6q62auvnzb2sy@huvuddator>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
 <1518806331-7101-9-git-send-email-yamada.masahiro@socionext.com>
 <nycvar.YSQ.7.76.1802161438470.31719@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.1802161438470.31719@knanqh.ubzr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Fri, Feb 16, 2018 at 02:49:31PM -0500, Nicolas Pitre wrote:
> On Sat, 17 Feb 2018, Masahiro Yamada wrote:
> 
> > Now, we got a basic ability to test compiler capability in Kconfig.
> > 
> > config CC_HAS_STACKPROTECTOR
> >         bool
> >         default $(shell $CC -Werror -fstack-protector -c -x c /dev/null -o /dev/null)
> > 
> > This works, but it is ugly to repeat this long boilerplate.
> > 
> > We want to describe like this:
> > 
> > config CC_HAS_STACKPROTECTOR
> >         bool
> >         default $(cc-option -fstack-protector)
> > 
> > It is straight-forward to implement a new function, but I do not like
> > to hard-code specialized functions like this.  Hence, here is another
> > feature to add functions from Kconfig files.
> > 
> > A user-defined function can be defined as a string type symbol with
> > a special keyword 'macro'.  It can be referenced in the same way as
> > built-in functions.  This feature was also inspired by Makefile where
> > user-defined functions are referenced by $(call func-name, args...),
> > but I omitted the 'call' to makes it shorter.
> > 
> > The macro definition can contain $(1), $(2), ... which will be replaced
> > with arguments from the caller.
> > 
> > Example code:
> > 
> >   config cc-option
> >           string
> >           macro $(shell $CC -Werror $(1) -c -x c /dev/null -o /dev/null)
> 
> I think this syntax for defining a macro shouldn't start with the 
> "config" keyword, unless you want it to be part of the config symbol 
> space and land it in .config. And typing it as a "string" while it 
> actually returns y/n (hence a bool) is also strange.
> 
> What about this instead:
> 
> macro cc-option
> 	bool $(shell $CC -Werror $(1) -c -x c /dev/null -o /dev/null)
> 
> This makes it easier to extend as well if need be.
> 
> 
> Nicolas

I haven't gone over the patchset in detail yet and might be missing
something here, but if this is just meant to be a textual shorthand,
then why give it a type at all?

Do you think a simpler syntax like this would make sense?

	macro cc-option "$(shell $CC -Werror $(1) -c -x c /dev/null -o /dev/null)"

That's the most general version, where you could use it for other stuff
besides $(shell ...) as well, just to keep parity.

You could then always just expand $() as a string, and maybe spit out
"n" and "y" in the cases Linus suggested for $(shell ...). The existing
logic for constant symbols should then take care of converting that into
a tristate value where appropriate.

If you go with that and want to support $() outside quotes, then

	$(foo)

would just be a shorthand for

	"$(foo)"

Are there any cases where something more advanced than that might be
warranted (e.g., macros that expand to complete expressions)? It seems
pretty nice and nonmagical otherwise.

Cheers,
Ulf
