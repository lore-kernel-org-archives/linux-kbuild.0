Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]:58427 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751423AbcCRKU3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Mar 2016 06:20:29 -0400
Subject: Re: [PATCH] ARC: build: Turn off -Wmaybe-uninitialized for ARC gcc
 4.8
References: <1458290783-31491-1-git-send-email-vgupta@synopsys.com>
 <23667289.mNa1Q2STbY@wuerfel>
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Message-ID: <56EBD65B.10109@synopsys.com>
Date: Fri, 18 Mar 2016 15:50:11 +0530
MIME-Version: 1.0
In-Reply-To: <23667289.mNa1Q2STbY@wuerfel>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-snps-arc@lists.infradead.org, Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>, Michal Marek <mmarek@suse.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Friday 18 March 2016 03:22 PM, Arnd Bergmann wrote:
> On Friday 18 March 2016 14:16:23 Vineet Gupta wrote:
>> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
>> index fed12f39d8ce..aeb101e8e674 100644
>> --- a/arch/arc/Makefile
>> +++ b/arch/arc/Makefile
>> @@ -48,9 +48,14 @@ endif
>>  upto_gcc44    :=  $(call cc-ifversion, -le, 0404, y)
>>  atleast_gcc44 :=  $(call cc-ifversion, -ge, 0404, y)
>>  atleast_gcc48 :=  $(call cc-ifversion, -ge, 0408, y)
>> +is_gcc48      :=  $(call cc-ifversion, -eq, 0408, y)
>>  
>>  cflags-$(atleast_gcc44)                        += -fsection-anchors
>>  
>> +# gcc 4.8 spits out false positives for default -O3
>> +# disable these for 4.8 and revisit when we upgrade to newer ver
>> +cflags-$(is_gcc48)                     += $(call cc-disable-warning,maybe-uninitialized,)
>> +
>>  cflags-$(CONFIG_ARC_HAS_LLSC)          += -mlock
>>  cflags-$(CONFIG_ARC_HAS_SWAPE)         += -mswape
> 
> Is this any better with gcc-4.9 or gcc-5? 

I don't think there's a production ARC toolchain with gcc 4.9 which we can use yet
- Claudiu is still in the the middle of upstreaming the new ARC HS port bits so
things are still in flight there. These tools are off of github !

Maybe it's better to add the flag to
> the line that adds -O3 for consistency. We do the same thing for -Os in the
> global Makefile, as that triggers a similar load of warnings.

Sure, but I prefer this to be only for gcc 4.8 as this warning seems to be
healthy in small doses :-) At least it keeps the door open for future discussion
with gcc guys !

The following nested construct actually works - does that look OK to you ?

ARCH_CFLAGS += -O3 $(call cc-ifversion, -lt, 0408, $(call
cc-disable-warning,maybe-uninitialized,))

Thx,
-Vineet
> 
> 	Arnd
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

