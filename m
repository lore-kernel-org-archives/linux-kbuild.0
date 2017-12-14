Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:52360 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754416AbdLNX2N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Dec 2017 18:28:13 -0500
MIME-Version: 1.0
In-Reply-To: <1507204875-5021-1-git-send-email-ulfalizer@gmail.com>
References: <1507204875-5021-1-git-send-email-ulfalizer@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 15 Dec 2017 08:27:27 +0900
Message-ID: <CAK7LNAS9DNWkjo5PpqoMW1b_iJtMFrp+7Kp4Ycu05Po=idUS_w@mail.gmail.com>
Subject: Re: [PATCH 0/3] kconfig: Make 'm' safe before modules symbol is defined
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, zippel@linux-m68k.org, Nicolas Pitre <nicolas.pitre@linaro.org>, Michal Marek <mmarek@suse.com>, dirk@gouders.net, Arnaud Lacombe <lacombar@gmail.com>, Jan Beulich <JBeulich@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-05 21:01 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> Hello,
>
> This patchset fixes a segfault that occurs if 'm' appears in certain
> expressions before the modules symbol is defined. The problem is that m is
> rewritten to m && <modules symbol> already during parsing. Doing it in
> menu_finalize(), which runs after parsing, fixes the problem.
>
> To aid the review and people trying to understand menu_finalize() in the future
> (including me), it also renames menu_check_dep() to rewrite_m() and adds
> comments to clarify the existing expression rewriting and dependency
> propagation logic.
>
> The changes have been tested for regressions using zconfdump(), Kconfiglib, and
> Valgrind.
>
> Cheers,
> Ulf
>
> Ulf Magnusson (3):
>   kconfig: Rename menu_check_dep() to rewrite_m()
>   kconfig: Clarify expression rewriting
>   kconfig: Clean up modules handling and fix crash
>
>  scripts/kconfig/menu.c | 74 ++++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 66 insertions(+), 8 deletions(-)
>


Series, applied to linux-kbuild/kconfig.  Thanks!

-- 
Best Regards
Masahiro Yamada
