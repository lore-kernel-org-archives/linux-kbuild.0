Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:51423 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753994AbeAKPat (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jan 2018 10:30:49 -0500
MIME-Version: 1.0
In-Reply-To: <1507485055-24507-1-git-send-email-ulfalizer@gmail.com>
References: <1507485055-24507-1-git-send-email-ulfalizer@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 12 Jan 2018 00:30:02 +0900
Message-ID: <CAK7LNARh1VsWoveZMfg9daa=YgF4c6QzgLYKfjXUcvLLjC6MdA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Document important expression functions
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, zippel@linux-m68k.org, Nicolas Pitre <nicolas.pitre@linaro.org>, Michal Marek <michal.lkml@markovi.net>, dirk@gouders.net, Arnaud Lacombe <lacombar@gmail.com>, Jan Beulich <JBeulich@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-09 2:50 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> Many of these functions are quite the head scratchers if you don't know
> what they're trying to do. Document them.
>
> Also make it clear which functions rewrite expressions in-place and
> which return new expressions. This prevents memory errors.
>
> No functional changes. Only comments added.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>


Applied to linux-kbuild/kconfig.  Thanks!

-- 
Best Regards
Masahiro Yamada
