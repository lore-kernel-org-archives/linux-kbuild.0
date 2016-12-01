Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:49040 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753591AbcLAPW5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Dec 2016 10:22:57 -0500
Subject: Re: Odd build breakage in 4.9-rc7
References: <20161130172435.GG8563@redhat.com>
 <CA+55aFz0f6ykvWt+f0ALD62mngJuTrjNY8CQLK3qNAuYUzMeDw@mail.gmail.com>
 <583F1A5A.7040708@redhat.com>
 <CA+55aFyPhpYQR-a+PNcDSNBTaRk5CeWAwynSp2QUcStfWazTZA@mail.gmail.com>
 <583F1F6A.5010307@redhat.com>
 <CA+55aFyvvVG2-fZbefGXV_dznz16jfKRFukX1u4hWEtG5DfJMw@mail.gmail.com>
 <alpine.LFD.2.20.1611301726240.1715@knanqh.ubzr>
 <58402D96.9020101@redhat.com>
From: Jarod Wilson <jarod@redhat.com>
Message-ID: <a8e3cb76-f8bc-3ed9-4e15-011a35037cd4@redhat.com>
Date: Thu, 1 Dec 2016 10:22:55 -0500
MIME-Version: 1.0
In-Reply-To: <58402D96.9020101@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Prarit Bhargava <prarit@redhat.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, zarniwhoop73@googlemail.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 2016-12-01 9:03 AM, Prarit Bhargava wrote:
>
>
> On 11/30/2016 05:41 PM, Nicolas Pitre wrote:
>> On Wed, 30 Nov 2016, Linus Torvalds wrote:
>>
>>> On Wed, Nov 30, 2016 at 10:50 AM, Prarit Bhargava <prarit@redhat.com> wrote:
>>>>
>>>> It comes back.  The steps to reproduce this are:
>>>>
>>>> 1.  checkout latest linux.git
>>>> 2.  make -j112
>>>>
>>>> (IOW, it occurs 100% of the time for me on a clean tree.)
>>
>> I don't have access to such hardware where -j112 could ever make sense.  :-)
>> In other words, I can't reproduce regardless of the -j value I try.
>>
>>> I suspect it's not new, it's just that you are able to hit the timing
>>> just right (and the new include presumable makes that just be much
>>> easier).
>>
>> Here's the best fix I can think of. I can't convince myself any other
>> location would be 100% safe.  Obviously I can't confirm if this actually
>> fixes anything.
>>
>> ----- >8
>> Subject: kbuild: make sure autoksyms.h exists early
>>
>> Some people are able to trigger a race where autoksyms.h is used before
>> its empty version is even created. Let's create it at the same time as
>> the directory holding it is created.
>>
>> Signed-off-by: Nicolas Pitre <nico@linaro.org>
>>
>> diff --git a/Makefile b/Makefile
>> index 694111b43c..9f9c3b577c 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1019,8 +1019,6 @@ prepare2: prepare3 prepare-compiler-check outputmakefile asm-generic
>>  prepare1: prepare2 $(version_h) include/generated/utsrelease.h \
>>                     include/config/auto.conf
>>  	$(cmd_crmodverdir)
>> -	$(Q)test -e include/generated/autoksyms.h || \
>> -	    touch   include/generated/autoksyms.h
>>
>>  archprepare: archheaders archscripts prepare1 scripts_basic
>>
>> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
>> index ebced77deb..90a091b6ae 100644
>> --- a/scripts/kconfig/Makefile
>> +++ b/scripts/kconfig/Makefile
>> @@ -35,6 +35,8 @@ nconfig: $(obj)/nconf
>>
>>  silentoldconfig: $(obj)/conf
>>  	$(Q)mkdir -p include/config include/generated
>> +	$(Q)test -e include/generated/autoksyms.h || \
>> +	    touch   include/generated/autoksyms.h
>>  	$< $(silent) --$@ $(Kconfig)
>>
>>  localyesconfig localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
>>
>
> The testing was successful.
>
> After testing an hour of builds with different -j values, I'm no longer seeing
> any compile issues when this patch is applied.  When I remove the patch the
> compile error returns so I'm going to say that this patch fixed it.
>
> Thanks again Nicolas.
>
> Tested-by: Prarit Bhargava <prarit@redhat.com>

Looks good here as well, can do parallel make w/o reverting Tony's 
patches again.

Tested-by: Jarod Wilson <jarod@redhat.com>

-- 
Jarod Wilson
jarod@redhat.com
