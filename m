Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:40551 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755525AbeAJQN2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jan 2018 11:13:28 -0500
MIME-Version: 1.0
In-Reply-To: <1507482683-22651-1-git-send-email-ulfalizer@gmail.com>
References: <1507482683-22651-1-git-send-email-ulfalizer@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 11 Jan 2018 01:12:42 +0900
Message-ID: <CAK7LNARr9JJLKwDe-j_VjHPYhwf3Li0wDx+-rw38Bj3fR2p2UA@mail.gmail.com>
Subject: Re: [PATCH 0/6] kconfig: Fix memory leaks during parsing
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, zippel@linux-m68k.org, Nicolas Pitre <nicolas.pitre@linaro.org>, Michal Marek <michal.lkml@markovi.net>, dirk@gouders.net, Arnaud Lacombe <lacombar@gmail.com>, walch.martin@web.de, Jan Beulich <JBeulich@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-09 2:11 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> Hello,
>
> This patchset plugs all memory leaks that occur in the parser (zconf.y) while
> parsing the x86 Kconfigs (and likely the other ARCHes too). I noticed that
> Kconfig is pretty leaky while working on the fix for 'm' before MODULES
> (http://www.spinics.net/lists/linux-kbuild/msg15606.html).
>
> The biggest culprit is all symbol names being leaked outside of expressions:
> 316 KB leaked. 'source' filenames being leaked adds another 41 KB. The other
> leaks are minor (< 1 KB each). The fixes can be applied independently.
>
> This is mostly just to get a clean slate with Valgrind, but also cleans up the
> code a bit as a side effect. Any performance difference (plus or minus) seems
> to be in the noise.
>
> Tested with the Kconfiglib test suite, which indirectly verifies that Kconfig
> still generates the same .config for alldefconfig, allnoconfig, allyesconfig,
> and all defconfigs, for all architectures. I also tested that menuconfig gets
> the right main menu text with and without a 'mainmenu' statement.
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
> Ulf Magnusson (6):
>   kconfig: Don't leak symbol names during parsing
>   kconfig: Don't leak 'source' filenames during parsing
>   kconfig: Don't leak 'option' arguments during parsing
>   Kconfig: Don't leak main menus during parsing
>   kconfig: Don't leak help strings during parsing
>   kconfig: Regenerate parser


I applied 1-5.

I left some comments on 5.


-- 
Best Regards
Masahiro Yamada
