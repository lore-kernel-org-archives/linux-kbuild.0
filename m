Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:35390 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751606AbeDDQbk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Apr 2018 12:31:40 -0400
Received: by mail-pl0-f68.google.com with SMTP id 61-v6so12797937plb.2
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Apr 2018 09:31:40 -0700 (PDT)
Subject: Re: [PATCH v2] tools: fix cross-compile var clobbering
References: <20180106201601.11074-1-martin@martingkelly.com>
 <20180107214028.23771-1-martin@martingkelly.com>
 <cc9e8b57-b2e0-91a5-aa9f-9488c78a9860@suse.cz>
From: Martin Kelly <martin@martingkelly.com>
Message-ID: <54661ff7-5c2a-473b-e08c-1cd267353c03@martingkelly.com>
Date: Wed, 4 Apr 2018 09:31:37 -0700
MIME-Version: 1.0
In-Reply-To: <cc9e8b57-b2e0-91a5-aa9f-9488c78a9860@suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Slaby <jslaby@suse.cz>, linux-kbuild@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, Linus Walleij <linus.walleij@linaro.org>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Robert Moore <robert.moore@intel.com>, Lv Zheng <lv.zheng@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuahkh@osg.samsung.com>, Shuah Khan <shuah@kernel.org>, Mario Limonciello <mario.limonciello@dell.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org

On 04/04/2018 06:20 AM, Jiri Slaby wrote:
> On 01/07/2018, 10:40 PM, Martin Kelly wrote:
>> From: Martin Kelly <martin@martingkelly.com>
> ...
>> --- a/tools/power/acpi/Makefile.config
>> +++ b/tools/power/acpi/Makefile.config
>> @@ -56,9 +56,6 @@ INSTALL_SCRIPT = ${INSTALL_PROGRAM}
>>   # to compile vs uClibc, that can be done here as well.
>>   CROSS = #/usr/i386-linux-uclibc/usr/bin/i386-uclibc-
>>   CROSS_COMPILE ?= $(CROSS)
>> -CC = $(CROSS_COMPILE)gcc
>> -LD = $(CROSS_COMPILE)gcc
> 
> This one makes difference -- acpi is special. This used to be:
> LD = gcc
> 
> Now it is:
> LD = ld
> 
> And due to that, we get:
> ld: unrecognized option '-D_LINUX'
> 
> Should we do:
> LD = $(CC)
> 
> or fix this elsewhere differently?
> 
> thanks,
>
Yes, I think LD = $(CC) should work. $(CC) will be defaulted to 
$(CROSS_COMPILE)gcc due to the call to $(call 
allow-override,CC,$(CROSS_COMPILE)gcc) in 
tools/scripts/Makefile.include. The allow-override function will 
correctly handle env and command-line settings.

This will clobber any special $(LD) settings that the user has set, but 
that was true as well for the acpi Makefile before this patch.
