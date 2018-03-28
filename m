Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:36442 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751859AbeC1DrA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 23:47:00 -0400
Received: by mail-vk0-f65.google.com with SMTP id q198so619099vke.3
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Mar 2018 20:47:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-11-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-11-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 27 Mar 2018 20:46:59 -0700
Message-ID: <CAGXu5jLTSh5OHVBCCzZmafxueJH23ey2ELXD1Sn4HAc_DrHEMQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/21] kconfig: add 'success' and 'cc-option' macros
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Mar 26, 2018 at 10:29 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 'cc-option' will be the most frequently used macro.  It evaluates to 'y'
> if the given argument is supported by the compiler, or 'n' otherwise.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

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

This should be fine since most cc-option uses are quite simple. The
specialized per-arch and other-flag-dependency checks can just
continue to live in Makefile if we actually need them.

-Kees

-- 
Kees Cook
Pixel Security
