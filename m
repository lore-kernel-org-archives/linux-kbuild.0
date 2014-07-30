Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:61789 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751805AbaG3Vjs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Jul 2014 17:39:48 -0400
Received: by mail-pa0-f45.google.com with SMTP id eu11so2273637pac.4
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Jul 2014 14:39:48 -0700 (PDT)
Message-ID: <53D96620.10700@converseincode.com>
Date: Wed, 30 Jul 2014 14:39:44 -0700
From: Behan Webster <behanw@converseincode.com>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild, LLVMLinux: only use warnings when using clang
References: <20140629201308.GC12943@pd.tnic> <1404175346-12330-1-git-send-email-behanw@converseincode.com> <20140701101214.GA14882@pd.tnic> <53D8ED5D.8070604@suse.cz>
In-Reply-To: <53D8ED5D.8070604@suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, dl9pf@gmx.de
Cc: Borislav Petkov <bp@alien8.de>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, pageexec@freemail.hu, mcharleb@gmail.com

On 07/30/14 06:04, Michal Marek wrote:
> On 2014-07-01 12:12, Borislav Petkov wrote:
>> On Mon, Jun 30, 2014 at 05:42:26PM -0700, behanw@converseincode.com wrote:
>>> From: Behan Webster <behanw@converseincode.com>
>>>
>>> Only consider clang warnings in Kbuild when using the clang compiler.
>>>
>>> Signed-off-by: Behan Webster <behanw@converseincode.com>
>>> ---
>>>   scripts/Makefile.extrawarn | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
>>> index 6564350..e350127 100644
>>> --- a/scripts/Makefile.extrawarn
>>> +++ b/scripts/Makefile.extrawarn
>>> @@ -26,7 +26,7 @@ warning-1 += $(call cc-option, -Wmissing-include-dirs)
>>>   warning-1 += $(call cc-option, -Wunused-but-set-variable)
>>>   warning-1 += $(call cc-disable-warning, missing-field-initializers)
>>>   
>>> -# Clang
>>> +ifeq ($(COMPILER),clang)
>>>   warning-1 += $(call cc-disable-warning, initializer-overrides)
>>>   warning-1 += $(call cc-disable-warning, unused-value)
>>>   warning-1 += $(call cc-disable-warning, format)
>>> @@ -35,6 +35,7 @@ warning-1 += $(call cc-disable-warning, sign-compare)
>>>   warning-1 += $(call cc-disable-warning, format-zero-length)
>>>   warning-1 += $(call cc-disable-warning, uninitialized)
>>>   warning-1 += $(call cc-option, -fcatch-undefined-behavior)
>>> +endif
>> Ok, just to make sure I understand that whole use case correctly:
>>
>> The disabling of those warnings is really intended for the case where
>> people build the kernel with "W=1" on the make cmdline *and* clang?
> Behan, Jan-Simon,
>
> can you explain why are those -Wno-... options needed in the W=1 case?
> The whole point of the W= option is to enable noisy warnings, so I don't
> quite get why you want to silence these.
Sorry for the delay.

That code is indeed not what was intended. It's more that these warnings 
should normally be disabled, and when W is set they should not be disabled.

Just putting the final touches on a patch which addresses this situation.

Behan

-- 
Behan Webster
behanw@converseincode.com

