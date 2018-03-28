Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:45497 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751205AbeC1DpK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 23:45:10 -0400
Received: by mail-ua0-f194.google.com with SMTP id j18so666462uae.12
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Mar 2018 20:45:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-10-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-10-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 27 Mar 2018 20:45:08 -0700
Message-ID: <CAGXu5jJkqgAYexAq27fK75cLRaWaHwac9oTMWqgqbDVZxApVFA@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] kconfig: add 'macro' keyword to support
 user-defined function
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Mar 26, 2018 at 10:29 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Now, we got a basic ability to test compiler capability in Kconfig.
>
> config CC_HAS_STACKPROTECTOR
>         def_bool $(shell (($CC -Werror -fstack-protector -c -x c /dev/null -o /dev/null) && echo y) || echo n)
>
> This works, but it is ugly to repeat this long boilerplate.
>
> We want to describe like this:
>
> config CC_HAS_STACKPROTECTOR
>         bool
>         default $(cc-option -fstack-protector)
>
> It is straight-forward to add a new function, but I do not like to
> hard-code specialized functions like this.  Hence, here is another
> feature to add functions from Kconfig files.
>
> A user-defined function is defined with a special keyword 'macro'.
> It can be referenced in the same way as built-in functions.  This
> feature was also inspired by Makefile where user-defined functions
> are referenced by $(call func-name, args...), but I omitted the 'call'
> to makes it shorter.
>
> The macro definition can contain $(1), $(2), ... which will be replaced
> with arguments from the caller.  The macro works just as a textual
> shorthand, which is also expanded in the lexer phase.
>
> [Example Code]
>
>   macro success $(shell ($(1) && echo y) || echo n)
>
>   config TRUE
>           bool "true"
>           default $(success true)
>
>   config FALSE
>           bool "false"
>           default $(success false)
>
> [Result]
>
>   $ make -s alldefconfig
>   $ tail -n 2 .config
>   CONFIG_TRUE=y
>   # CONFIG_FALSE is not set
>
> [Example Code]
>
>   macro success $(shell ($(1) && echo y) || echo n)
>
>   macro cc-option $(success $CC -Werror $(1) -c -x c /dev/null -o /dev/null)
>
>   config CC_HAS_STACKPROTECTOR
>           def_bool $(cc-option -fstack-protector)
>
> [Result]
>   $ make -s alldefconfig
>   $ tail -n 1 .config
>   CONFIG_CC_HAS_STACKPROTECTOR=y
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Cool, I like this "macro" idea for keeping this clean.

> ---
>
> Reminder for myself:
> Update Documentation/kbuild/kconfig-language.txt

Yes please. :)

Otherwise, looks good!

-Kees

-- 
Kees Cook
Pixel Security
