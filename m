Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:38807 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbeGYFlK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Jul 2018 01:41:10 -0400
MIME-Version: 1.0
In-Reply-To: <20180724175646.3621-1-hch@lst.de>
References: <20180724175646.3621-1-hch@lst.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 25 Jul 2018 13:30:24 +0900
Message-ID: <CAK7LNARP2HZ8GdsAU8h_b04jLWbvFXTWqiVt2hpE0vJbjP82ZA@mail.gmail.com>
Subject: Re: include architecture Kconfig files from top-level Kconfig v3
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>, Ley Foon Tan <lftan@altera.com>, Michal Simek <monstr@monstr.eu>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-um@lists.infradead.org, linux-arch@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-07-25 2:56 GMT+09:00 Christoph Hellwig <hch@lst.de>:
> Hi Masahiro,
>
> what do you think about the series below, which moves the includes
> of all the architecture independ Kconfig files to the top-level
> Kconfig instead of duplicating the includes in all architectures?
>
> Note that this only handles the low-hanging fruite, there are a lot
> of other bits that should probably be cleaned up to be common,
> but those will be not entirely trivial.
>
> Changes since v2:
>  - fix the missing sh conversion
>  - handle the lack of CONFIG_SWAP support in microblaze and nios2 properly
>
> Changes since v1:
>  - add back a remove source statement from arch/arm/Kconfig
>  - various fixes from Randy
>  - various UML patches to be able to use the common Kconfig
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


This version passed my tests.


Could you check the difference of CONFIG_PREEMPT_COUNT, please?


For alpha, hexagon, um,
CONFIG_PREEMPT_COUNT was previously never enabled
because kernel/Kconfig.preempt was not included.

Now, CONFIG_PREEMPT_COUNT can be enabled
if it is select'ed by someone.

I guess this change will be OK, but
I'd like you and Randy to double-check it just in case.



-- 
Best Regards
Masahiro Yamada
