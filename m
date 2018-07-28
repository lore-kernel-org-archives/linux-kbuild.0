Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:32021 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388527AbeG1CQA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Jul 2018 22:16:00 -0400
MIME-Version: 1.0
In-Reply-To: <20180727074854.GA21840@lst.de>
References: <20180724175646.3621-1-hch@lst.de> <CAK7LNARP2HZ8GdsAU8h_b04jLWbvFXTWqiVt2hpE0vJbjP82ZA@mail.gmail.com>
 <20180726172143.GA9836@lst.de> <CAK7LNASd0YCj4wwmT9-6GYiBz=wDoXkmQW2F_5XjbCzS9-weUw@mail.gmail.com>
 <20180727074854.GA21840@lst.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 28 Jul 2018 09:50:45 +0900
Message-ID: <CAK7LNATnt9ryzMD7=6WNnoJq2B3wT_TJisJgpF=MPFwqF6yP=g@mail.gmail.com>
Subject: Re: include architecture Kconfig files from top-level Kconfig v3
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, Richard Weinberger <richard@nod.at>, Ley Foon Tan <lftan@altera.com>, Michal Simek <monstr@monstr.eu>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-um@lists.infradead.org, linux-arch@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-07-27 16:48 GMT+09:00 Christoph Hellwig <hch@lst.de>:
> On Fri, Jul 27, 2018 at 10:32:19AM +0900, Masahiro Yamada wrote:
>> This will just add a new unmet dependency warning.
>> CONFIG_PREEMPT_COUNT will be still selected.
>
> True.  I guess we simply need to prohibit CONFIG_DEBUG_ATOMIC_SLEEP
> explicitly if PREEMPT_COUNT isn't supported.  E.g something like this:
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 26d3ff7e3cf4..373ce9fecd7e 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1195,6 +1195,7 @@ config DEBUG_ATOMIC_SLEEP
>         bool "Sleep inside atomic section checking"
>         select PREEMPT_COUNT
>         depends on DEBUG_KERNEL
> +       depends on !ARCH_NO_PREEMPT
>         help
>           If you say Y here, various routines which may sleep will become very
>           noisy if they are called inside atomic sections: when a spinlock is


I will fold this into 07/10.


I see another 'select PREEMPT_COUNT' in
drivers/gpu/drm/i915/Kconfig.debug
but DRM_I915 depends on X86, so this is not
a real problem.



-- 
Best Regards
Masahiro Yamada
