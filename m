Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:45312 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932690AbeGHKmT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Jul 2018 06:42:19 -0400
MIME-Version: 1.0
In-Reply-To: <AM5PR0701MB265789020943AD2E03E81AD2E4450@AM5PR0701MB2657.eurprd07.prod.outlook.com>
References: <AM5PR0701MB2657B3C36CDB2D67702077D8E4450@AM5PR0701MB2657.eurprd07.prod.outlook.com>
 <AM5PR0701MB265789020943AD2E03E81AD2E4450@AM5PR0701MB2657.eurprd07.prod.outlook.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 8 Jul 2018 19:41:32 +0900
Message-ID: <CAK7LNAT1bqDKo2zS3kUVKnPYgziibuwCdQ4+Y5hQE_xbjcGAWw@mail.gmail.com>
Subject: Re: [PATCH] Fix the oldconfig target rule
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bernd Edlinger <bernd.edlinger@hotmail.de>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2018-07-08 17:09 GMT+09:00 Bernd Edlinger <bernd.edlinger@hotmail.de>:
> On 07/08/18 08:31, Bernd Edlinger wrote:
>> The next make after an oldconfig reads in the outdated
>> include/config/auto.conf which can kill the make before
>> it is able to call the syncconfig target.
>>
>> $ make defconfig
>> *** Default configuration is based on 'x86_64_defconfig'
>> $ make
>> scripts/kconfig/conf  --syncconfig Kconfig
>> Makefile:936: *** "Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y,
>> please install libelf-dev, libelf-devel or elfutils-libelf-devel".  Stop.
>>
>> $ sed -i s/CONFIG_UNWINDER_ORC=y// .configs
>> $ make oldconfig
>> Choose kernel unwinder
>>> 1. ORC unwinder (UNWINDER_ORC) (NEW)
>>    2. Frame pointer unwinder (UNWINDER_FRAME_POINTER)
>> choice[1-2?]: 2
>> $ make
>> Makefile:936: *** "Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y,
>> please install libelf-dev, libelf-devel or elfutils-libelf-devel".  Stop.
>>
>> With this patch oldconfig and similar targets like
>> menuconfig call syncconfig to avoid this failure.
>>
>> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
>> ---
>>   scripts/kconfig/Makefile | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
>> index a3ac2c9..ef34275 100644
>> --- a/scripts/kconfig/Makefile
>> +++ b/scripts/kconfig/Makefile
>> @@ -62,6 +62,7 @@ PHONY += $(simple-targets)
>>
>>   $(simple-targets): $(obj)/conf
>>       $< $(silent) --$@ $(Kconfig)
>> +    $(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
>
> On second thought, removing the auto.conf might be sufficient:
> $(Q)rm -f include/config/auto.conf include/config/auto.conf.cmd
>
> Would you prefer that?

No.

My suggestion is this:
https://patchwork.kernel.org/patch/10513065/






-- 
Best Regards
Masahiro Yamada
