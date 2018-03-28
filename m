Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:40242 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751150AbeC1DlU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 23:41:20 -0400
Received: by mail-vk0-f68.google.com with SMTP id x5so606128vkd.7
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Mar 2018 20:41:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-8-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-8-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 27 Mar 2018 20:41:18 -0700
Message-ID: <CAGXu5jKmnO3o4dwWXrizKCeVpj3RCzw_zsHPseZrLXAgGb0YdQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/21] kconfig: add function support and implement
 'shell' function
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Mar 26, 2018 at 10:29 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> This commit adds a new concept 'function' to do more text processing
> in Kconfig.
>
> A function call looks like this:
>
>   $(function arg1, arg2, arg3, ...)
>
> (Actually, this syntax was inspired by make.)
>
> Real examples will look like this:
>
>   $(shell echo hello world)
>   $(cc-option -fstackprotector)
>
> This commit adds the basic infrastructure to add, delete, evaluate
> functions, and also the first built-in function $(shell ...).  This
> accepts a single command to execute.  It returns the standard output
> from it.
>
> [Example code]
>
>   config HELLO
>           string
>           default "$(shell echo hello world)"
>
>   config Y
>           def_bool $(shell echo y)
>
> [Result]
>
>   $ make -s alldefconfig && tail -n 2 .config
>   CONFIG_HELLO="hello world"
>   CONFIG_Y=y
>
> Caveat:
> Like environments, functions are expanded in the lexer.  You cannot
> pass symbols to function arguments.  This is a limitation to simplify
> the implementation.  I want to avoid the dynamic function evaluation,
> which would introduce much more complexity.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Reminder for myself:
> Update Documentation/kbuild/kconfig-language.txt

Yeah, this needs to be included here, especially given the "cannot
pass symbols" aspect which might surprise people.

> [...]
> +/* built-in functions */
> +static char *do_shell(struct function *f, int argc, char *argv[])
> +{
> +       static const char *pre = "(";
> +       static const char *post = ") 2>/dev/null";

Right now the search and help screens in menuconfig just show the line
a config is defined and nothing more. I think it would be extremely
handy to include shell output here in some way. Especially when trying
to answer questions like "why aren't GCC plugins available?" it's got
quite a bit harder to debug.

Could we capture the output (especially stderr) for these kinds of hints?

Beyond that, looks good!

-Kees

-- 
Kees Cook
Pixel Security
