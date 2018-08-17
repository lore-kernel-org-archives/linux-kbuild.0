Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:51404 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbeHQE5b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Aug 2018 00:57:31 -0400
MIME-Version: 1.0
In-Reply-To: <a4139b9d-9842-a595-b273-1fce3eecf6a3@infradead.org>
References: <abba6b9a-597b-a3eb-6d91-8a7261492c78@infradead.org>
 <CAK7LNAQ3NnWvK=jJ5a-bpYuCGtpfYztu7qPpi4Gd+6jR_62eQQ@mail.gmail.com> <a4139b9d-9842-a595-b273-1fce3eecf6a3@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 17 Aug 2018 10:55:13 +0900
Message-ID: <CAK7LNASb4+dvhWKaNgn66+9RiJEosAbv2f_d7RsD48Tt9_LziQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: add build-only configurator targets
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

2018-08-17 1:30 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> On 08/15/2018 08:27 PM, Masahiro Yamada wrote:
>> 2018-08-15 9:36 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
>>> From: Randy Dunlap <rdunlap@infradead.org>
>>>
>>> Add build-only targets for build_menuconfig, build_nconfig,
>>> build_xconfig, and build_gconfig.
>>> (targets must end in "config" to qualify in top-level Makefile)
>>>
>>> This allows these target to be built without execution (e.g., to
>>> look for errors or warnings) and/or to be built and checked by sparse.
>>>
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> ---


Applied to linux-kbuild. Thanks!

>>>  scripts/kconfig/Makefile |    8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> --- linux-next-20180814.orig/scripts/kconfig/Makefile
>>> +++ linux-next-20180814/scripts/kconfig/Makefile
>>> @@ -33,6 +33,14 @@ config: $(obj)/conf
>>>  nconfig: $(obj)/nconf
>>>         $< $(silent) $(Kconfig)
>>>
>>> +build_menuconfig: $(obj)/mconf
>>> +
>>> +build_nconfig: $(obj)/nconf
>>> +
>>> +build_gconfig: $(obj)/gconf
>>> +
>>> +build_xconfig: $(obj)/qconf
>>> +
>>>  localyesconfig localmodconfig: $(obj)/conf
>>>         $(Q)perl $(srctree)/$(src)/streamline_config.pl --$@ $(srctree) $(Kconfig) > .tmp.config
>>>         $(Q)if [ -f .config ]; then                                     \
>>>
>>
>>
>> OK, seems useful,
>> but these should be phony targets.
>>
>> May I squash the following change?
>>
>
> Of course.  Thanks.
>
>>
>> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
>> index c0ca9ea..f7bdcc9 100644
>> --- a/scripts/kconfig/Makefile
>> +++ b/scripts/kconfig/Makefile
>> @@ -3,7 +3,8 @@
>>  # Kernel configuration targets
>>  # These targets are used from top-level makefile
>>
>> -PHONY += xconfig gconfig menuconfig config localmodconfig localyesconfig
>> +PHONY += xconfig gconfig menuconfig config localmodconfig localyesconfig \
>> +       build_menuconfig build_nconfig build_gconfig build_xconfig
>>
>>  ifdef KBUILD_KCONFIG
>>  Kconfig := $(KBUILD_KCONFIG)
>
>
> --
> ~Randy



-- 
Best Regards
Masahiro Yamada
