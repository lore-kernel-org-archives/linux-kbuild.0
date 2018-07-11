Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:31768 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732985AbeGKM0Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Jul 2018 08:26:16 -0400
MIME-Version: 1.0
In-Reply-To: <20180708152004.21679-5-hch@lst.de>
References: <20180708152004.21679-1-hch@lst.de> <20180708152004.21679-5-hch@lst.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 11 Jul 2018 21:21:24 +0900
Message-ID: <CAK7LNAT5dzU-SOvqwnDs=bn3WA1_fmDj2abETmoHUdUExVF+WA@mail.gmail.com>
Subject: Re: [PATCH 4/9] kconfig: include common Kconfig files from top-level Kconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-um@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-07-09 0:19 GMT+09:00 Christoph Hellwig <hch@lst.de>:
> Instead of duplicating the source statements in every architecture just
> do it once in the toplevel Kconfig file.
>
> Note that with this the inclusion of arch/$(SRCARCH/Kconfig moves out of
> the top-level Kconfig into arch/Kconfig so that don't violate ordering
> constraits while keeping a sensible menu structure.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>


> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index dd4f3d3e644f..7ab7b148181b 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -168,10 +168,6 @@ config PGTABLE_LEVELS
>         default 3 if X2TLB
>         default 2
>
> -source "init/Kconfig"
> -
> -source "kernel/Kconfig.freezer"
> -
>  menu "System type"
>
>  #
> @@ -553,8 +549,6 @@ endchoice
>
>  endif
>
> -source "arch/sh/mm/Kconfig"


I noticed at least sh is broken
because "arch/sh/mm/Kconfig" is no longer included by anyone.

I am not doing further tests.


Please test *ALL* architectures.

If possible, matrix tests (arch, config-target), where
arch = arm, arm64, ...
config-target = allyesconfig, allnoconfig, alldefconfig, ...


Note:
scripts/diffconf is helpful.

-- 
Best Regards
Masahiro Yamada
