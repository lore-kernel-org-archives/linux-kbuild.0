Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:41816 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751443AbeDEVvM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Apr 2018 17:51:12 -0400
Received: by mail-pl0-f65.google.com with SMTP id bj1-v6so18744981plb.8
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Apr 2018 14:51:12 -0700 (PDT)
Subject: Re: [PATCH 3/3] kbuild: Allow passing additional HOSTCFLAGS and
 HOSTLDFLAGS
References: <20180329004805.7278-1-labbott@redhat.com>
 <20180329004805.7278-4-labbott@redhat.com>
 <CAK7LNAT8gsvd-DP_TAFNSbJ_Bn=H-gjfuirWd9kmxh8Yx60cfA@mail.gmail.com>
From: Laura Abbott <labbott@redhat.com>
Message-ID: <535356b9-2c3b-46cc-e53e-820a932a0d6e@redhat.com>
Date: Thu, 5 Apr 2018 14:51:09 -0700
MIME-Version: 1.0
In-Reply-To: <CAK7LNAT8gsvd-DP_TAFNSbJ_Bn=H-gjfuirWd9kmxh8Yx60cfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>

On 04/04/2018 09:59 PM, Masahiro Yamada wrote:
> 2018-03-29 9:48 GMT+09:00 Laura Abbott <labbott@redhat.com>:
>>
>> Similar to AFLAGS_KBUILD, there may be uses (e.g. hardening) for passing in
>> additional flags to host programs. Allow these to be passed in from the
>> environment.
>>
>> Signed-off-by: Laura Abbott <labbott@redhat.com>
>> ---
>>   Documentation/kbuild/kbuild.txt | 9 +++++++++
>>   Makefile                        | 3 +++
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
>> index ac2363ea05c5..3751a4bc8596 100644
>> --- a/Documentation/kbuild/kbuild.txt
>> +++ b/Documentation/kbuild/kbuild.txt
>> @@ -24,6 +24,15 @@ KAFLAGS
>>   --------------------------------------------------
>>   Additional options to the assembler (for built-in and modules).
>>
>> +AFLAGS_HOSTCFLAGS
>> +--------------------------------------------------
>> +Additional options passed to the compiler when building host programs.
>> +
>> +AFLAGS_HOSTLDFLAGS
>> +--------------------------------------------------
>> +Additional options passed to the linker (through the compiler) when buidling
>> +host programs.
>> +
> 
> 
> I am afraid you misunderstood the meaning of 'AFLAGS'.
> 
> AFLAGS is not 'Additional flags', but 'Assembler flags'
> that are used for compiling *.S files.
> 
> AFLAGS for host programs is weird.
> 
> 
> 
> I see similar proposals from different people.
> 
> I replied like follows:
> https://lkml.org/lkml/2018/2/28/178
> 
> However, Robin seems busy lately.
> 
> I will wait a bit, then
> if nobody does this, I may do it.
> 

Thanks for the pointer. I'll keep an eye out for those patches.

> 
> 
> 
>>   AFLAGS_MODULE
>>   --------------------------------------------------
>>   Additional module specific options to use for $(AS).
>> diff --git a/Makefile b/Makefile
>> index 7ba478ab8c82..2cab3f8d489c 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -367,6 +367,9 @@ HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS)
>>   HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
>>   HOST_LOADLIBES := $(HOST_LFS_LIBS)
>>
>> +HOSTCFLAGS  += $(AFLAGS_HOSTCFLAGS)
>> +HOSTLDFLAGS  += $(AFLAGS_HOSTLDFLAGS)
>> +
>>   # Make variables (CC, etc...)
>>   AS             = $(CROSS_COMPILE)as
>>   LD             = $(CROSS_COMPILE)ld
>> --
>> 2.16.2
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 

