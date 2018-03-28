Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:46802 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751096AbeC1D2g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 23:28:36 -0400
Received: by mail-ua0-f193.google.com with SMTP id u9so647289ual.13
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Mar 2018 20:28:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-3-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-3-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 27 Mar 2018 20:28:34 -0700
Message-ID: <CAGXu5jLYVspSAYHpATmND8HpYY+2+y_U7vrhGsjMcZQ-WRMpbg@mail.gmail.com>
Subject: Re: [PATCH v2 02/21] kbuild: remove CONFIG_CROSS_COMPILE support
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Mar 26, 2018 at 10:29 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Kbuild provides a couple of ways to specify CROSS_COMPILE:
>
> [1] Command line
> [2] Environment
> [3] arch/*/Makefile (only some architectures)
> [4] CONFIG_CROSS_COMPILE
>
> [4] is problematic for the compiler capability tests in Kconfig.
> CONFIG_CROSS_COMPILE allows users to change the compiler prefix from
> 'make menuconfig', etc.  It means, the compiler options would have
> to be all re-calculated everytime CONFIG_CROSS_COMPILE is changed.
>
> To avoid complexity and performance issues, I'd like to evaluate
> the shell commands statically, i.e. only parsing Kconfig files.
>
> I guess the majority is [1] or [2].  Currently, there are only
> 4 defconfig files that specify CONFIG_CROSS_COMPILE.
>   arch/arm/configs/lpc18xx_defconfig
>   arch/hexagon/configs/comet_defconfig
>   arch/openrisc/configs/or1ksim_defconfig
>   arch/openrisc/configs/simple_smp_defconfig
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
Pixel Security
