Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:45315 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731937AbeG0Cwi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jul 2018 22:52:38 -0400
MIME-Version: 1.0
In-Reply-To: <20180726172143.GA9836@lst.de>
References: <20180724175646.3621-1-hch@lst.de> <CAK7LNARP2HZ8GdsAU8h_b04jLWbvFXTWqiVt2hpE0vJbjP82ZA@mail.gmail.com>
 <20180726172143.GA9836@lst.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 27 Jul 2018 10:32:19 +0900
Message-ID: <CAK7LNASd0YCj4wwmT9-6GYiBz=wDoXkmQW2F_5XjbCzS9-weUw@mail.gmail.com>
Subject: Re: include architecture Kconfig files from top-level Kconfig v3
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>, Ley Foon Tan <lftan@altera.com>, Michal Simek <monstr@monstr.eu>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-um@lists.infradead.org, linux-arch@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-07-27 2:21 GMT+09:00 Christoph Hellwig <hch@lst.de>:
> On Wed, Jul 25, 2018 at 01:30:24PM +0900, Masahiro Yamada wrote:
>> Could you check the difference of CONFIG_PREEMPT_COUNT, please?
>>
>>
>> For alpha, hexagon, um,
>> CONFIG_PREEMPT_COUNT was previously never enabled
>> because kernel/Kconfig.preempt was not included.
>>
>> Now, CONFIG_PREEMPT_COUNT can be enabled
>> if it is select'ed by someone.
>>
>> I guess this change will be OK, but
>> I'd like you and Randy to double-check it just in case.
>
> It might be fine, but with this little fix folded in we should be
> safer:
>
> diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
> index cd1655122ec0..1321a4a7a677 100644
> --- a/kernel/Kconfig.preempt
> +++ b/kernel/Kconfig.preempt
> @@ -57,4 +57,5 @@ config PREEMPT
>  endchoice
>
>  config PREEMPT_COUNT
> -       bool
> \ No newline at end of file
> +       depends on !ARCH_NO_PREEMPT
> +       bool
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



This will just add a new unmet dependency warning.
CONFIG_PREEMPT_COUNT will be still selected.


$ make ARCH=alpha allyesconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  YACC    scripts/kconfig/zconf.tab.c
  LEX     scripts/kconfig/zconf.lex.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf  --allyesconfig Kconfig

WARNING: unmet direct dependencies detected for PREEMPT_COUNT
  Depends on [n]: !ARCH_NO_PREEMPT [=y]
  Selected by [y]:
  - DEBUG_ATOMIC_SLEEP [=y] && DEBUG_KERNEL [=y]
#
# configuration written to .config
#






-- 
Best Regards
Masahiro Yamada
