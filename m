Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:65161 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750884AbeGEGFG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 02:05:06 -0400
MIME-Version: 1.0
In-Reply-To: <7f7dfd3d-6d4b-fc64-956b-1defc5c5a7c3@infradead.org>
References: <20180702144711.22111-1-hch@lst.de> <20180702144711.22111-2-hch@lst.de>
 <43b9a29d-27fc-1b6e-6f90-9187749bf338@infradead.org> <7f7dfd3d-6d4b-fc64-956b-1defc5c5a7c3@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 5 Jul 2018 15:04:07 +0900
Message-ID: <CAK7LNASspaTidLtkfnip5rfmEOdt4uw94kzN=obo_1VM-q80=A@mail.gmail.com>
Subject: Re: [PATCH 1/5] kconfig: include common Kconfig files from top-level Kconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-07-03 5:50 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> On 07/02/18 13:41, Randy Dunlap wrote:
>
>> --- linux-next-20180702.orig/init/Kconfig
>> +++ linux-next-20180702/init/Kconfig
>> @@ -1717,6 +1717,12 @@ config PROFILING
>>  config TRACEPOINTS
>>       bool
>>
>> +# Note:  arch/$(SRCARCH)/Kconfig needs to be before arch/Kconfig
>> +# so that each $ARCH can specify its values for CONFIG_PGTABLE_LEVELS
>> +# before the default value is found in arch/Kconfig.
>> +
>> +source "arch/$(SRCARCH)/Kconfig"
>> +
>>  source "arch/Kconfig"
>>
>>  endmenu              # General setup
>>
>
> except that the endmenu should be moved up a few lines so that the
> Processor type and features menu is not part of the General setup menu.
>
> v2 patch is below.
>
> ---
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Present "General setup" before "Processor type and features".
> This is done by sourcing arch/$(SRCARCH)/Kconfig before arch/Kconfig
> inside init/Kconfig.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> v2: move General setup's endmenu before the $ARCH Kconfigs.
>
>  Kconfig      |    2 --
>  init/Kconfig |   10 ++++++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> --- linux-next-20180702.orig/Kconfig
> +++ linux-next-20180702/Kconfig
> @@ -9,8 +9,6 @@ comment "Compiler: $(CC_VERSION_TEXT)"
>
>  source "scripts/Kconfig.include"
>
> -source "arch/$(SRCARCH)/Kconfig"
> -
>  source "init/Kconfig"
>
>  source "kernel/Kconfig.freezer"
> --- linux-next-20180702.orig/init/Kconfig
> +++ linux-next-20180702/init/Kconfig
> @@ -1717,10 +1717,16 @@ config PROFILING
>  config TRACEPOINTS
>         bool
>
> -source "arch/Kconfig"
> -
>  endmenu                # General setup
>
> +# Note:  arch/$(SRCARCH)/Kconfig needs to be before arch/Kconfig
> +# so that each $ARCH can specify its values for CONFIG_PGTABLE_LEVELS
> +# before the default value is found in arch/Kconfig.


Is it possible to explain it in a little more generic way?


...
so that arch/$(SRCARCH)/Kconfig can override the default values
in arch/Kconfig.


I am not a native speaker.
Please reword it so that it sounds more natural.


Thanks.






> +source "arch/$(SRCARCH)/Kconfig"
> +
> +source "arch/Kconfig"
> +
>  config RT_MUTEXES
>         bool
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
