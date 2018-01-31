Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:20651 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753356AbeAaP2d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Jan 2018 10:28:33 -0500
MIME-Version: 1.0
In-Reply-To: <20180131093434.20050-1-ulfalizer@gmail.com>
References: <20180131093434.20050-1-ulfalizer@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 1 Feb 2018 00:27:37 +0900
Message-ID: <CAK7LNAQYT2DuGkP1s+BP8OHChgqE_o6vCwhkU0ZEsFzveb-Bhg@mail.gmail.com>
Subject: Re: [PATCH 00/11] Remove blank help texts from Kconfig files and add warning
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>, Paul Bolle <pebolle@tiscali.nl>

2018-01-31 18:34 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> This patchset first removes all blank help texts from Kconfig files for all
> arches, and then makes Kconfig print a warning for blank help texts.
>
> All patches can be applied independently, but to avoid warning spam, the blank
> help texts ought to be removed before the warning is added.
>
> Ulf Magnusson (11):
>   net/sched: kconfig: Remove blank help texts
>   video: fbdev: kconfig: Remove blank help text
>   mmc: kconfig: Remove blank help text
>   Staging: rtl8192u: kconfig: Remove blank help text
>   Staging: rtl8192e: kconfig: Remove blank help text
>   lib/Kconfig.debug: Remove blank help text
>   MIPS: BCM63XX: kconfig: Remove blank help text
>   MIPS: kconfig: Remove blank help text
>   arm: vt8500: kconfig: Remove blank help text
>   nios2: kconfig: Remove blank help text
>   kconfig: Warn if help text is blank


Whole of the series, applied to linux-kbuild/kconfig.  Thanks!



>  arch/arm/mach-vt8500/Kconfig              | 1 -
>  arch/mips/Kconfig                         | 1 -
>  arch/mips/bcm63xx/boards/Kconfig          | 1 -
>  arch/nios2/Kconfig                        | 1 -
>  drivers/mmc/host/Kconfig                  | 1 -
>  drivers/staging/rtl8192e/rtl8192e/Kconfig | 1 -
>  drivers/staging/rtl8192u/Kconfig          | 1 -
>  drivers/video/fbdev/Kconfig               | 1 -
>  lib/Kconfig.debug                         | 1 -
>  net/sched/Kconfig                         | 3 ---
>  scripts/kconfig/zconf.y                   | 6 ++++++
>  11 files changed, 6 insertions(+), 12 deletions(-)
>
> --
> 2.14.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
