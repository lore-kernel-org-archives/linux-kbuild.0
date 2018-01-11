Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:44188 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753994AbeAKPaM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jan 2018 10:30:12 -0500
MIME-Version: 1.0
In-Reply-To: <1507484538-24051-1-git-send-email-ulfalizer@gmail.com>
References: <1507484538-24051-1-git-send-email-ulfalizer@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 12 Jan 2018 00:29:18 +0900
Message-ID: <CAK7LNATGtVRaNjat35jcn22rO7erLVPkyggeRi=3k1zNVD2JKw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Document automatic submenu creation code
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, zippel@linux-m68k.org, Nicolas Pitre <nicolas.pitre@linaro.org>, Michal Marek <michal.lkml@markovi.net>, dirk@gouders.net, Arnaud Lacombe <lacombar@gmail.com>, Jan Beulich <JBeulich@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-09 2:42 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> It's tricky to figure out what it does (and how) without staring at the
> code for a long time. Document it to make it more transparent.
>
> No functional changes. Only comments added.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  scripts/kconfig/menu.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)


Applied to linux-kbuild/kconfig.  Thanks!

-- 
Best Regards
Masahiro Yamada
