Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:57474 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S935091Ab3BNXnk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 14 Feb 2013 18:43:40 -0500
Message-ID: <511D7621.1050704@zytor.com>
Date: Thu, 14 Feb 2013 15:41:21 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Add Intel Ivy bridge CPU flags
References: <51002135.2060302@theangrymob.co.uk> <20130124174148.GA15499@merkur.ravnborg.org> <510894C3.1020605@zytor.com> <510ABBCA.5090007@theangrymob.co.uk>
In-Reply-To: <510ABBCA.5090007@theangrymob.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: alec@theangrymob.co.uk

On 01/31/2013 10:45 AM, Alec Bickerton wrote:
> on 30/01/13 04:34 H. Peter Anvin gazed into the seeing stone and said...:
>> On 01/24/2013 09:41 AM, Sam Ravnborg wrote:
>>>
>>>> --- a/arch/x86/Makefile_32.cpu
>>>> +++ b/arch/x86/Makefile_32.cpu
>>>> @@ -33,6 +33,7 @@ cflags-$(CONFIG_MCYRIXIII)    += $(call
>>>> cc-option,-march=c3,-march=i486) $(align)-f
>>>>    cflags-$(CONFIG_MVIAC3_2)    += $(call cc-option,-march=c3-2,-march=i686)
>>>>    cflags-$(CONFIG_MVIAC7)        += -march=i686
>>>>    cflags-$(CONFIG_MCORE2)        += -march=i686 $(call tune,core2)
>>>> +cflags-$(CONFIG_MIVYBRIDGE)        += -march=i686 $(call tune,core-avx-i)
>>>>    cflags-$(CONFIG_MATOM)        += $(call cc-option,-march=atom,$(call
>>>> cc-option,-march=core2,-march=i686)) \
>>>>        $(call cc-option,-mtune=atom,$(call cc-option,-mtune=generic))
>>>
>>> Not a fault in your patch - but the x86 guys should learn to use the
>>> X86_ prefix on x86 specific config symbols :-(
>>> For consistency do not add it.
>>>
>>
>> These are some of the oldest config symbols in the entire kernel.
>>
>>      -hpa
>>
>
> That maybe so, I just want to be able to build an ivy bridge optimised kernel
> without having to think about it too much. While I don't know how much it'd
> bring, this is more of a convenience than anything else.
>

I was referring to the lack of the X86_ prefix on the CONFIG_M* symbols.

	-hpa


-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

