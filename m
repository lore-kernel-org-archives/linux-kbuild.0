Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:21727 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755145AbbDIMoj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Apr 2015 08:44:39 -0400
Message-id: <55267431.7030304@samsung.com>
Date: Thu, 09 Apr 2015 15:44:33 +0300
From: Andrey Ryabinin <a.ryabinin@samsung.com>
MIME-version: 1.0
Subject: Re: [PATCH] kasan: Makefile: shut up warnings if CONFIG_COMPILE_TEST=y
References: <20150407160213.8f66c90ca812c30f362dd543@linux-foundation.org>
 <1428507505-4015-1-git-send-email-a.ryabinin@samsung.com>
 <1428577598.14000.31.camel@x220>
In-reply-to: <1428577598.14000.31.camel@x220>
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/09/2015 02:06 PM, Paul Bolle wrote:
> On Wed, 2015-04-08 at 18:38 +0300, Andrey Ryabinin wrote:
>> It might be annoying to constantly see this:
>>
>> 	scripts/Makefile.kasan:16: Cannot use CONFIG_KASAN: -fsanitize=kernel-address is not supported by compiler
>>
>> while performing allmodconfig/allyesconfig build tests.
> 
> That warning might be seen - once per build - because allmodconfig and
> allyesconfig enable both CONFIG_KASAN and CONFIG_COMPILE_TEST, right?
> 

It might be seen once per build because all*config enables CONFIG_KASAN.
There was no dependency on CONFIG_COMPILE_TEST before this patch.

>> Disable this warning if CONFIG_COMPILE_TEST=y.
> 
> Do we expect that some people want to enable both KASAN and COMPILE_TEST
> manually (ie, not as a result of allmodconfig or allyesconfig)? If so,
> those people might now be in for some head-scratching if their compiler
> lacks what's apparently needed to run kasan.
> 

I think this shouldn't be a problem.
CONFIG_COMPILE_TEST used for building drivers that cannot be loaded on
platform used for compiling these drivers.
So it's unlikely that such kernel will be used for runtime testing.


>> Signed-off-by: Andrey Ryabinin <a.ryabinin@samsung.com>
>> ---
>>  scripts/Makefile.kasan | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
>> index 631619b..3f874d2 100644
>> --- a/scripts/Makefile.kasan
>> +++ b/scripts/Makefile.kasan
>> @@ -13,12 +13,16 @@ CFLAGS_KASAN := $(call cc-option, -fsanitize=kernel-address \
>>  		--param asan-instrumentation-with-call-threshold=$(call_threshold))
>>  
>>  ifeq ($(call cc-option, $(CFLAGS_KASAN_MINIMAL) -Werror),)
>> +   ifneq ($(CONFIG_COMPILE_TEST),y)
>>          $(warning Cannot use CONFIG_KASAN: \
>>              -fsanitize=kernel-address is not supported by compiler)
>> +   endif
>>  else
>>      ifeq ($(CFLAGS_KASAN),)
>> -        $(warning CONFIG_KASAN: compiler does not support all options.\
>> -            Trying minimal configuration)
>> +        ifneq ($(CONFIG_COMPILE_TEST),y)
>> +            $(warning CONFIG_KASAN: compiler does not support all options.\
>> +                Trying minimal configuration)
> 
> (Side note: in this case the compiler supports that minimal
> configuration, doesn't it? So shouldn't the second warning end in
>                 Running with minimal configuration)
> 
> or something to that effect?)
>

It should and it does.
CFLAGS_KASAN reassigned to minimal set of options below.

>> +        endif
>>          CFLAGS_KASAN := $(CFLAGS_KASAN_MINIMAL)
>>      endif
>>  endif
> 
> Thanks,
> 
> 
> Paul Bolle
> 
> 

