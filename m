Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:45448 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752734AbeFHIU5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Jun 2018 04:20:57 -0400
MIME-Version: 1.0
In-Reply-To: <1528417303-14842-1-git-send-email-yamada.masahiro@socionext.com>
References: <1528417303-14842-1-git-send-email-yamada.masahiro@socionext.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Jun 2018 10:20:56 +0200
Message-ID: <CAMuHMdX7oyxQKyc-DTXKG+o0SA_eJhKEFznn3bPxD0Gi=sA01A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix endless syncconfig in case arch Makefile sets CROSS_COMPILE
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>

Hi Yamada-san,

On Fri, Jun 8, 2018 at 2:21 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Commit 21c54b774744 ("kconfig: show compiler version text in the top
> comment") was intended to detect the compiler upgrade, but Geert
> reported a breakage on the m68k build.
>
> The compiler upgrade is detected by the change of the environment
> variable, CC_VERSION_TEXT, which contains the first line of the output
> from $(CC) --version.  Currently, this works well when CROSS_COMPILE
> is given via the environment variable or the Make command line.
>
> However, some architectures such as m68k can specify CROSS_COMPILE
> from arch/$(SRCARCH)/Makefile as well.  In this case, "make ARCH=m68k"
> ends up with endless syncconfig loop.
>
>   $ make ARCH=m68k defconfig
>   *** Default configuration is based on 'multi_defconfig'
>   #
>   # configuration written to .config
>   #
>   $ make ARCH=m68k
>   scripts/kconfig/conf  --syncconfig Kconfig
>   scripts/kconfig/conf  --syncconfig Kconfig
>   scripts/kconfig/conf  --syncconfig Kconfig
>   scripts/kconfig/conf  --syncconfig Kconfig

[...]

> Fixes: 21c54b774744 ("kconfig: show compiler version text in the top comment")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks for fixing this quickly!

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
