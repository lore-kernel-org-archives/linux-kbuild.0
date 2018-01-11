Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:30727 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932197AbeAKP3d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jan 2018 10:29:33 -0500
MIME-Version: 1.0
In-Reply-To: <1507484146-23617-1-git-send-email-ulfalizer@gmail.com>
References: <1507484146-23617-1-git-send-email-ulfalizer@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 12 Jan 2018 00:28:46 +0900
Message-ID: <CAK7LNAR2zQM46WscNG+4L2UO9yZ1mButRFtYF=RHu649b05EUA@mail.gmail.com>
Subject: Re: [PATCH 0/3] kconfig: Fix expression memory leaks
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, zippel@linux-m68k.org, Nicolas Pitre <nicolas.pitre@linaro.org>, Michal Marek <michal.lkml@markovi.net>, dirk@gouders.net, Arnaud Lacombe <lacombar@gmail.com>, walch.martin@web.de, Jan Beulich <JBeulich@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-09 2:35 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> Hello,
>
> This patchset plugs all memory leaks that are due to expressions not being
> freed, when parsing the x86 Kconfigs (and likely the other ARCHes too). 336 KB
> are leaked in total.
>
> Together with the memory leaks plugged in the parser in
> https://lkml.org/lkml/2017/10/8/126, this plugs all memory leaks when parsing
> the x86 Kconfigs.
>
> As a reminder, the parsers can be rebuilt like this:
>
>         $ make REGENERATE_PARSERS=1 conf
>
> Here's an easy way to run Valgrind on menuconfig (nothing seems to look at
> KERNELVERSION, so just set it to avoid a warning):
>
>         $ ARCH=x86 SRCARCH=x86 KERNELVERSION=4.14.0-rc2 valgrind --leak-check=full scripts/kconfig/mconf Kconfig
>
> Cheers,
> Ulf
>
> Ulf Magnusson (3):
>   kconfig: Fix automatic menu creation mem leak
>   kconfig: Fix expr_free() E_NOT leak
>   kconfig: Fix choice symbol expression leak
>

Applied to linux-kbuild/kconfig.  Thanks!



-- 
Best Regards
Masahiro Yamada
