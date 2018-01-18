Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:35300 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750910AbeARJZ5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Jan 2018 04:25:57 -0500
MIME-Version: 1.0
In-Reply-To: <1516246306-12851-1-git-send-email-yamada.masahiro@socionext.com>
References: <1516246306-12851-1-git-send-email-yamada.masahiro@socionext.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 18 Jan 2018 10:25:54 +0100
Message-ID: <CAK8P3a04vu=C4Aop1WpT7KnB_yP2J1wK5oJv9QiubiSxr0-ykw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix W= option checks for extra DTC warnings
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Jan 18, 2018 at 4:31 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
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

Good catch!

Acked-by: Arnd Bergmann <arnd@arndb.de>

> Side Notes for possible additional works:
>
>  [1] I implemented DTC extra warnings differently in U-Boot:
>
>     https://github.com/u-boot/u-boot/blob/v2018.01/scripts/Makefile.extrawarn#L64
>
>     Better to collect extra warning stuff into scripts/Makefile.extrawarn ?
>
>  [2] KBUILD_ENABLE_EXTRA_GCC_CHECKS is getting a historical misnomer
>      because we use it for Clang and DTC too.
>
>      Better to rename?  (keeping backward-compatibility for a while)?

I'd suggest we leave it for now, I still plan to eventually do my
large rework of
the way we handle extra warning levels, likely that will result in
Makefile.extrawarn
being completely replaced.

       Arnd
