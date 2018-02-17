Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:44178 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751011AbeBQE3R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 23:29:17 -0500
MIME-Version: 1.0
In-Reply-To: <nycvar.YSQ.7.76.1802162118010.31644@knanqh.ubzr>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
 <1518806331-7101-9-git-send-email-yamada.masahiro@socionext.com>
 <nycvar.YSQ.7.76.1802161438470.31719@knanqh.ubzr> <20180216235138.b4p6q62auvnzb2sy@huvuddator>
 <nycvar.YSQ.7.76.1802162118010.31644@knanqh.ubzr>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Sat, 17 Feb 2018 05:29:15 +0100
Message-ID: <CAFkk2KTUGdLm+7HAFCq+dv78+QT9-GJivayh7M4pG9O_UkeLMQ@mail.gmail.com>
Subject: Re: [PATCH 08/23] kconfig: add 'macro' keyword to support
 user-defined function
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Feb 17, 2018 at 3:30 AM, Nicolas Pitre <nico@fluxnic.net> wrote:
> On Sat, 17 Feb 2018, Ulf Magnusson wrote:
>
>> On Fri, Feb 16, 2018 at 02:49:31PM -0500, Nicolas Pitre wrote:
>> > On Sat, 17 Feb 2018, Masahiro Yamada wrote:
>> >
>> > > Now, we got a basic ability to test compiler capability in Kconfig.
>> > >
>> > > config CC_HAS_STACKPROTECTOR
>> > >         bool
>> > >         default $(shell $CC -Werror -fstack-protector -c -x c /dev/null -o /dev/null)
>> > >
>> > > This works, but it is ugly to repeat this long boilerplate.
>> > >
>> > > We want to describe like this:
>> > >
>> > > config CC_HAS_STACKPROTECTOR
>> > >         bool
>> > >         default $(cc-option -fstack-protector)
>> > >
>> > > It is straight-forward to implement a new function, but I do not like
>> > > to hard-code specialized functions like this.  Hence, here is another
>> > > feature to add functions from Kconfig files.
>> > >
>> > > A user-defined function can be defined as a string type symbol with
>> > > a special keyword 'macro'.  It can be referenced in the same way as
>> > > built-in functions.  This feature was also inspired by Makefile where
>> > > user-defined functions are referenced by $(call func-name, args...),
>> > > but I omitted the 'call' to makes it shorter.
>> > >
>> > > The macro definition can contain $(1), $(2), ... which will be replaced
>> > > with arguments from the caller.
>> > >
>> > > Example code:
>> > >
>> > >   config cc-option
>> > >           string
>> > >           macro $(shell $CC -Werror $(1) -c -x c /dev/null -o /dev/null)
>> >
>> > I think this syntax for defining a macro shouldn't start with the
>> > "config" keyword, unless you want it to be part of the config symbol
>> > space and land it in .config. And typing it as a "string" while it
>> > actually returns y/n (hence a bool) is also strange.
>> >
>> > What about this instead:
>> >
>> > macro cc-option
>> >     bool $(shell $CC -Werror $(1) -c -x c /dev/null -o /dev/null)
>> >
>> > This makes it easier to extend as well if need be.
>> >
>> >
>> > Nicolas
>>
>> I haven't gone over the patchset in detail yet and might be missing
>> something here, but if this is just meant to be a textual shorthand,
>> then why give it a type at all?
>
> It is meant to be like a user-defined function.
>
>> Do you think a simpler syntax like this would make sense?
>>
>>       macro cc-option "$(shell $CC -Werror $(1) -c -x c /dev/null -o /dev/null)"
>>
>> That's the most general version, where you could use it for other stuff
>> besides $(shell ...) as well, just to keep parity.
>
> This is not extendable.  Let's imagine that you might want to implement
> some kind of conditionals some day e.g.:
>
> macro complex_test
>         bool $(shell foo) if LOCKDEP_SUPPORT
>         bool y if DEBUG_DRIVER
>         bool n

I still don't quite get the semantics here. How would the behavior
change if the type was changed to say string or int in some or all of
the lines?

Since the current model is to evaluate $() while the Kconfig files are
being parsed, would this require evaluating Kconfig expressions during
parsing? There is a relatively clean and (somewhat) easy to understand
parsing/evaluation separation at the moment, which I like.

Do you have anything in mind that would be cleaner and simpler to
implement in this way compared to using plain symbols?

>
> There is no real advantage to simplify the macro definition to its
> simplest expression, unlike its actual usage.

Maybe I'm being grumpy, but this feels like it's adding complexity
rather than reducing it.

I like the rest of this patchset, because the behavior is easy to
understand and fits well with Kconfig's evaluation model: $() is just
a kind of preprocessor that runs during parsing and does value
substitution based on shell commands, possibly along with some helper
macros to avoid repetition.

I think we should think hard about whether we actually need anything
more than that before complicating Kconfig even further "just in
case." If the goal is simplification, then it's bad if we eventually
end up with a bigger mess than the Makefiles.

>
>> Are there any cases where something more advanced than that might be
>> warranted (e.g., macros that expand to complete expressions)?
>
> Maybe not now, but there is no need to close the door on the possibility
> either.
>
>
> Nicolas

Kconfig has no notion of types for expressions by the way. The
simplest way to look at it is that all symbols have a tristate value
(which is n for non-bool/tristate symbols) and a string value. Which
one gets used depends on the context. In A && B, the tristate values
are used, and in A = B the string values are compared.

In something like 'default "foo bar"', "foo bar" is actually a
constant symbol. If we were to drop the straightforward preprocessor
model, then constant symbols would no longer necessarily be constant.
I have a feeling that that might turn Kconfig's internals even
messier.

Constant (and undefined) symbols end up with their name as their
string value by the way, which is why stuff like 'A = "foo"' works.

IMO, let's just go with the simple preprocessor model and let macros
be dumb text substitutions (if we don't want to hardcode
functionality). It's simple and probably good enough, keeps parsing
and evaluation nicely separated, and keeps Kconfig somewhat
comprehensible.

(Note that the preprocessor could still be extended, if we ever need
anything besides $(shell ...). Macros could still just do text
substitution.)

Cheers,
Ulf
