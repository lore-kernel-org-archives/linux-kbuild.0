Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:33051 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752259AbeC1Dd4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 23:33:56 -0400
Received: by mail-vk0-f66.google.com with SMTP id j85so609441vke.0
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Mar 2018 20:33:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-5-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-5-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 27 Mar 2018 20:33:54 -0700
Message-ID: <CAGXu5jJRQfBWQ7Mx+dp_sMYiaLUs=yCVMKz0220aTNRdsZk3nQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/21] kconfig: reference environments directly and
 remove 'option env=' syntax
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>

On Mon, Mar 26, 2018 at 10:29 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> To get an environment value, Kconfig needs to define a symbol using
> "option env=" syntax.  It is tedious to add a config entry for each
> environment given that we need more environments such as 'CC', 'AS',
> 'srctree' etc. to evaluate the compiler capability in Kconfig.
>
> Adding '$' to symbols is weird.  Kconfig can reference symbols directly
> like this:
>
>   config FOO
>           string
>           default BAR
>
> So, I want to use the following syntax to get environment 'BAR' from
> the system:
>
>   config FOO
>           string
>           default $BAR
>
> Looking at the code, the symbols prefixed with 'S' are expanded by:
>  - conf_expand_value()
>    This is used to expand 'arch/$ARCH/defconfig' and 'defconfig_list'
>  - expand_string_value()
>    This is used to expand strings in 'source' and 'mainmenu'
>
> All of them are fixed values independent of user configuration.  So,
> this kind of syntax should be moved to simply take the environment.
>
> This change makes the code much cleaner.  The bounce symbols 'SRCARCH',
> 'ARCH', 'SUBARCH', 'KERNELVERSION' are gone.
>
> sym_init() hard-coding 'UNAME_RELEASE' is also gone.  'UNAME_RELEASE'
> should be be given from the environment.
>
> ARCH_DEFCONFIG is a normal symbol, so it should be simply referenced
> by 'default ARCH_DEFCONFIG'.
>
> The environments are expanding in the lexer; when '$' is encountered,
> it is expanded, and resulted strings are pushed back to the input
> stream.  This makes the implementation simpler.
>
> For example, the following code works.
>
> [Example code]
>
>   config TOOLCHAIN_LIST
>           string
>           default "My tools: CC=$CC, AS=$AS, CPP=$CPP"
>
> [Result]
>
>   $ make -s alldefconfig && tail -n 1 .config
>   CONFIG_TOOLCHAIN_LIST="My tools: CC=gcc, AS=as, CPP=gcc -E"
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

For easier review this patch could maybe get split into a couple (i.e.
refactoring of things like env_write_dep()) but it's probably fine
as-is. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
Pixel Security
