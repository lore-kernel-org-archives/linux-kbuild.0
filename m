Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:44715 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752434Ab3A3Deo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Jan 2013 22:34:44 -0500
Message-ID: <510894C3.1020605@zytor.com>
Date: Tue, 29 Jan 2013 19:34:27 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Add Intel Ivy bridge CPU flags
References: <51002135.2060302@theangrymob.co.uk> <20130124174148.GA15499@merkur.ravnborg.org>
In-Reply-To: <20130124174148.GA15499@merkur.ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Alec Bickerton <alec@theangrymob.co.uk>, linux-kbuild@vger.kernel.org

On 01/24/2013 09:41 AM, Sam Ravnborg wrote:
>
>> --- a/arch/x86/Makefile_32.cpu
>> +++ b/arch/x86/Makefile_32.cpu
>> @@ -33,6 +33,7 @@ cflags-$(CONFIG_MCYRIXIII)	+= $(call cc-option,-march=c3,-march=i486) $(align)-f
>>   cflags-$(CONFIG_MVIAC3_2)	+= $(call cc-option,-march=c3-2,-march=i686)
>>   cflags-$(CONFIG_MVIAC7)		+= -march=i686
>>   cflags-$(CONFIG_MCORE2)		+= -march=i686 $(call tune,core2)
>> +cflags-$(CONFIG_MIVYBRIDGE)		+= -march=i686 $(call tune,core-avx-i)
>>   cflags-$(CONFIG_MATOM)		+= $(call cc-option,-march=atom,$(call cc-option,-march=core2,-march=i686)) \
>>   	$(call cc-option,-mtune=atom,$(call cc-option,-mtune=generic))
>
> Not a fault in your patch - but the x86 guys should learn to use the
> X86_ prefix on x86 specific config symbols :-(
> For consistency do not add it.
>

These are some of the oldest config symbols in the entire kernel.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

