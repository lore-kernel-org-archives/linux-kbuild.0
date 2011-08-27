Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:59993 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751114Ab1H0Lsx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 27 Aug 2011 07:48:53 -0400
Message-ID: <4E58D99A.2050400@zytor.com>
Date: Sat, 27 Aug 2011 04:48:42 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: Generating unistd_*.h
References: <4E583860.5080603@zytor.com> <20110827101820.GA2990@merkur.ravnborg.org>
In-Reply-To: <20110827101820.GA2990@merkur.ravnborg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On 08/27/2011 03:18 AM, Sam Ravnborg wrote:
>>
>> 1. Is there a better place than others to put these generated files
>>    (i.e. other than $(obj)/arch/x86/include/asm)?
> $(obj)/arch/x86/include/generated
> 
> This is what generic-y supports uses.
> 
>>
>> 2. Is there a better place than others to put the rules for generate
>>    these files?
>>
>> 3. There needs to be an arch-specific way to encode the dependency
>>    before asm-offsets.h is generated.  Preferences here?
> 
> Use "archprepare".
> 
> Something like this in arch/x86/Makefile:
> 
> archprepare: arch/x86/tools/syscall-magic.sh
> 	$(CONFIG_SHELL) $<
> 
> It should IIRC be execute before we try to create asm-offsets.h.
> So there is no dependency issues.
> 

I'll try this and see how it works out.  Sounds quite clean.

	-hpa


-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

