Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout2.w2.samsung.com ([211.189.100.12]:56267 "EHLO
	usmailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752854AbaHFOES (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Aug 2014 10:04:18 -0400
Message-id: <53E235DE.70604@samsung.com>
Date: Wed, 06 Aug 2014 08:04:14 -0600
From: Shuah Khan <shuah.kh@samsung.com>
Reply-to: shuah.kh@samsung.com
MIME-version: 1.0
Subject: Re: [PATCH] kbuild: devtest - new make target for build all and run
 tests
References: <1405716274-24420-1-git-send-email-shuah.kh@samsung.com>
 <53E232E6.8060506@suse.cz>
In-reply-to: <53E232E6.8060506@suse.cz>
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, gregkh@linuxfoundation.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <shuah.kh@samsung.com>

On 08/06/2014 07:51 AM, Michal Marek wrote:
> On 2014-07-18 22:44, Shuah Khan wrote:
>> Add a new devtest make target to enable developer testing. This
>> new target does full build (make all) and then runs selftests.
>
> I agree with Sam that the name is rather ambiguous, but I can't suggest
> a better alternative right now.

Does kselftest or kern_selftest sound better?

>
>
>> Signed-off-by: Shuah Khan <shuah.kh@samsung.com>
>> ---
>>   Makefile | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Makefile b/Makefile
>> index f3c543d..1ef3128 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1034,6 +1034,14 @@ headers_check: headers_install
>>   	$(Q)$(MAKE) $(hdr-inst)=arch/$(hdr-arch)/include/uapi/asm $(hdr-dst) HDRCHECK=1
>>
>>   # ---------------------------------------------------------------------------
>> +# Kernel devtest
>> +
>> +PHONY += devtest
>> +devtest:
>> +	make all
>
> devtest: all
>
>
>> +	make -C tools/testing/selftests run_tests
>
> Please use $(Q)$(MAKE), to keep the build silent by default and to
> consistently use the same make program with the same options throughout
> the build.
>

Working on the change - send v2 patch.

-- Shuah


-- 
Shuah Khan
Senior Linux Kernel Developer - Open Source Group
Samsung Research America(Silicon Valley)
shuah.kh@samsung.com | (970) 672-0658
