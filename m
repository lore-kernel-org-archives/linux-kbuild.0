Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from [212.203.95.146] ([212.203.95.146]:35558 "EHLO
	srv01.theangrymob.co.uk" rhost-flags-FAIL-FAIL-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756165Ab3AaSpe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 31 Jan 2013 13:45:34 -0500
Received: from [192.168.150.5] (217-162-209-89.dynamic.hispeed.ch [217.162.209.89])
	by srv01.theangrymob.co.uk (Postfix) with ESMTPSA id 00C92800003
	for <linux-kbuild@vger.kernel.org>; Thu, 31 Jan 2013 19:45:31 +0100 (CET)
Message-ID: <510ABBCA.5090007@theangrymob.co.uk>
Date: Thu, 31 Jan 2013 19:45:30 +0100
From: Alec Bickerton <alec@theangrymob.co.uk>
Reply-To: alec@theangrymob.co.uk
MIME-Version: 1.0
Subject: Re: [PATCH] Add Intel Ivy bridge CPU flags
References: <51002135.2060302@theangrymob.co.uk> <20130124174148.GA15499@merkur.ravnborg.org> <510894C3.1020605@zytor.com>
In-Reply-To: <510894C3.1020605@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: linux-kbuild@vger.kernel.org

on 30/01/13 04:34 H. Peter Anvin gazed into the seeing stone and said...:
> On 01/24/2013 09:41 AM, Sam Ravnborg wrote:
>>
>>> --- a/arch/x86/Makefile_32.cpu
>>> +++ b/arch/x86/Makefile_32.cpu
>>> @@ -33,6 +33,7 @@ cflags-$(CONFIG_MCYRIXIII)    += $(call
>>> cc-option,-march=c3,-march=i486) $(align)-f
>>>   cflags-$(CONFIG_MVIAC3_2)    += $(call cc-option,-march=c3-2,-march=i686)
>>>   cflags-$(CONFIG_MVIAC7)        += -march=i686
>>>   cflags-$(CONFIG_MCORE2)        += -march=i686 $(call tune,core2)
>>> +cflags-$(CONFIG_MIVYBRIDGE)        += -march=i686 $(call tune,core-avx-i)
>>>   cflags-$(CONFIG_MATOM)        += $(call cc-option,-march=atom,$(call
>>> cc-option,-march=core2,-march=i686)) \
>>>       $(call cc-option,-mtune=atom,$(call cc-option,-mtune=generic))
>>
>> Not a fault in your patch - but the x86 guys should learn to use the
>> X86_ prefix on x86 specific config symbols :-(
>> For consistency do not add it.
>>
> 
> These are some of the oldest config symbols in the entire kernel.
> 
>     -hpa
> 

That maybe so, I just want to be able to build an ivy bridge optimised kernel
without having to think about it too much. While I don't know how much it'd
bring, this is more of a convenience than anything else.

Alec

