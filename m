Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:52950 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753431AbdLGOvT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Dec 2017 09:51:19 -0500
MIME-Version: 1.0
In-Reply-To: <1507073146-19847-1-git-send-email-ulfalizer@gmail.com>
References: <1507073146-19847-1-git-send-email-ulfalizer@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 7 Dec 2017 23:50:24 +0900
Message-ID: <CAK7LNATTvbR=5+QLFxUFJwQpvr3rAHWNkmZj7inzu=Ps6pudaQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Warn if choice default is not in choice
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>

2017-10-04 8:25 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> This will catch mistakes like in the following real-world example, where
> a "CONFIG_" prefix snuck in, making an undefined symbol the default:
>
>         choice
>                 prompt "Compiler optimization level"
>                 default CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
>
>         config CC_OPTIMIZE_FOR_PERFORMANCE
>                 ...
>
>         config CC_OPTIMIZE_FOR_SIZE
>                 ...
>
>         endchoice
>
> This now prints the following warning:
>
>         init/Kconfig:1036:warning: choice default symbol 'CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE' is not contained in the choice
>
> Cases where the default symbol belongs to the wrong choice are also
> detected.
>
> (The mistake is harmless here: Since the default symbol is not visible,
> the choice falls back on using the first visible symbol as the default,
> which is CC_OPTIMIZE_FOR_PERFORMANCE, as intended.)
>
> Discovered while playing around with Kconfiglib
> (https://github.com/ulfalizer/Kconfiglib).
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---

Applied to linux-kbuild/kconfig.
Thanks!

-- 
Best Regards
Masahiro Yamada
