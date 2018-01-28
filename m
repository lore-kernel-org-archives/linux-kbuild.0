Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:21779 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751607AbeA1Bmh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jan 2018 20:42:37 -0500
MIME-Version: 1.0
In-Reply-To: <1516246306-12851-1-git-send-email-yamada.masahiro@socionext.com>
References: <1516246306-12851-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 28 Jan 2018 10:41:42 +0900
Message-ID: <CAK7LNASbdy99XO712fpEW0j-wTPyMZCEuCrAOjJae2iuORut2w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix W= option checks for extra DTC warnings
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-01-18 12:31 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Kbuild supports 3 levels of extra warnings, and multiple levels can
> be combined, like W=12, W=123.  It was added by commit a6de553da01c
> ("kbuild: Allow to combine multiple W= levels").
>
> From the log of commit 8654cb8d0371 ("dtc: update warning settings
> for new bus and node/property name checks"), I assume:
>
>  - unit_address_vs_reg, simple_bus_reg, etc. belong to level 1
>  - node_name_chars_strict, property_name_chars_strict belong to level 2
>
> However, the level 1 warnings are displayed by any argument to W=.
> On the other hand, the level 2 warnings are displayed by W=2, but
> not by W=12, or W=123.
>
> Use $(findstring ...) like scripts/Makefile.extrawarn.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild/kbuild.


-- 
Best Regards
Masahiro Yamada
