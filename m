Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:38761 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750860AbeDAG2W (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 1 Apr 2018 02:28:22 -0400
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-11-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-11-git-send-email-yamada.masahiro@socionext.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Sun, 1 Apr 2018 08:28:21 +0200
Message-ID: <CAFkk2KRexq4Up1roVj_KY-ONohYbG2V8K0cm-jO-1ucCCVxv+A@mail.gmail.com>
Subject: Re: [PATCH v2 10/21] kconfig: add 'success' and 'cc-option' macros
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Mar 27, 2018 at 7:29 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 'cc-option' will be the most frequently used macro.  It evaluates to 'y'
> if the given argument is supported by the compiler, or 'n' otherwise.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v2:
>   - Implement 'success' as a macro
>
>  init/Kconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 0d6fe20..c456030 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -8,6 +8,12 @@ config DEFCONFIG_LIST
>         default ARCH_DEFCONFIG
>         default "arch/$ARCH/defconfig"
>
> +# expanded to y if the command exits with 0, n otherwise
> +macro success $(shell ($(1) && echo y) || echo n)
> +
> +# expanded to y if the given compiler flag is supported, n otherwise
> +macro cc-option $(success $CC -Werror $(1) -c -x c /dev/null -o /dev/null)
> +
>  config CONSTRUCTORS
>         bool
>         depends on !UML
> --
> 2.7.4
>

Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>

Some other tests (e.g. scripts/*-stack-protector.sh) also pass -S and
-O0 and stuff to speed things up. Feels like that could lead to
gotchas though.

-S does help a bit at least:

    $ time gcc -c -x c /dev/null -o /dev/null
    real 0m0.020s
    user 0m0.013s
    sys 0m0.007s

    $ time gcc -S -x c /dev/null -o /dev/null
    real 0m0.012s
    user 0m0.009s
    sys 0m0.003s
