Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp1.pobox.com ([64.147.108.70]:57721 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751029AbeBQEo2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 23:44:28 -0500
Date: Fri, 16 Feb 2018 23:44:25 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH 08/23] kconfig: add 'macro' keyword to support user-defined
 function
In-Reply-To: <CAFkk2KTUGdLm+7HAFCq+dv78+QT9-GJivayh7M4pG9O_UkeLMQ@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1802162331400.31644@knanqh.ubzr>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com> <1518806331-7101-9-git-send-email-yamada.masahiro@socionext.com> <nycvar.YSQ.7.76.1802161438470.31719@knanqh.ubzr> <20180216235138.b4p6q62auvnzb2sy@huvuddator>
 <nycvar.YSQ.7.76.1802162118010.31644@knanqh.ubzr> <CAFkk2KTUGdLm+7HAFCq+dv78+QT9-GJivayh7M4pG9O_UkeLMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, 17 Feb 2018, Ulf Magnusson wrote:

> On Sat, Feb 17, 2018 at 3:30 AM, Nicolas Pitre <nico@fluxnic.net> wrote:
> > On Sat, 17 Feb 2018, Ulf Magnusson wrote:
> >
> >> On Fri, Feb 16, 2018 at 02:49:31PM -0500, Nicolas Pitre wrote:
> >> > On Sat, 17 Feb 2018, Masahiro Yamada wrote:
> >> >
> >> > > Now, we got a basic ability to test compiler capability in Kconfig.
> >> > >
> >> > > config CC_HAS_STACKPROTECTOR
> >> > >         bool
> >> > >         default $(shell $CC -Werror -fstack-protector -c -x c /dev/null -o /dev/null)
> >> > >
> >> > > This works, but it is ugly to repeat this long boilerplate.
> >> > >
> >> > > We want to describe like this:
> >> > >
> >> > > config CC_HAS_STACKPROTECTOR
> >> > >         bool
> >> > >         default $(cc-option -fstack-protector)
> >> > >
> >> > > It is straight-forward to implement a new function, but I do not like
> >> > > to hard-code specialized functions like this.  Hence, here is another
> >> > > feature to add functions from Kconfig files.
> >> > >
> >> > > A user-defined function can be defined as a string type symbol with
> >> > > a special keyword 'macro'.  It can be referenced in the same way as
> >> > > built-in functions.  This feature was also inspired by Makefile where
> >> > > user-defined functions are referenced by $(call func-name, args...),
> >> > > but I omitted the 'call' to makes it shorter.
> >> > >
> >> > > The macro definition can contain $(1), $(2), ... which will be replaced
> >> > > with arguments from the caller.
> >> > >
> >> > > Example code:
> >> > >
> >> > >   config cc-option
> >> > >           string
> >> > >           macro $(shell $CC -Werror $(1) -c -x c /dev/null -o /dev/null)
> >> >
> >> > I think this syntax for defining a macro shouldn't start with the
> >> > "config" keyword, unless you want it to be part of the config symbol
> >> > space and land it in .config. And typing it as a "string" while it
> >> > actually returns y/n (hence a bool) is also strange.
> >> >
> >> > What about this instead:
> >> >
> >> > macro cc-option
> >> >     bool $(shell $CC -Werror $(1) -c -x c /dev/null -o /dev/null)
> >> >
> >> > This makes it easier to extend as well if need be.
> >> >
> >> >
> >> > Nicolas
> >>
> >> I haven't gone over the patchset in detail yet and might be missing
> >> something here, but if this is just meant to be a textual shorthand,
> >> then why give it a type at all?
> >
> > It is meant to be like a user-defined function.
> >
> >> Do you think a simpler syntax like this would make sense?
> >>
> >>       macro cc-option "$(shell $CC -Werror $(1) -c -x c /dev/null -o /dev/null)"
> >>
> >> That's the most general version, where you could use it for other stuff
> >> besides $(shell ...) as well, just to keep parity.
> >
> > This is not extendable.  Let's imagine that you might want to implement
> > some kind of conditionals some day e.g.:
> >
> > macro complex_test
> >         bool $(shell foo) if LOCKDEP_SUPPORT
> >         bool y if DEBUG_DRIVER
> >         bool n
> 
> I still don't quite get the semantics here. How would the behavior
> change if the type was changed to say string or int in some or all of
> the lines?

I admit this wouldn't make sense to have multiple different types. In 
this example, the bool keyword acts as syntactic sugar more than 
anything else.

> Since the current model is to evaluate $() while the Kconfig files are
> being parsed, would this require evaluating Kconfig expressions during
> parsing? There is a relatively clean and (somewhat) easy to understand
> parsing/evaluation separation at the moment, which I like.

Agreed. Let's forget about the conditionals then.


Nicolas
