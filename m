Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay2.synopsys.com ([198.182.60.111]:59523 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754932AbcCRKnr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 18 Mar 2016 06:43:47 -0400
Subject: Re: [PATCH] ARC: build: Turn off -Wmaybe-uninitialized for ARC gcc
 4.8
References: <1458290783-31491-1-git-send-email-vgupta@synopsys.com>
 <23667289.mNa1Q2STbY@wuerfel> <56EBD65B.10109@synopsys.com>
 <3287558.oO5rz13nxZ@wuerfel>
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Message-ID: <56EBDBD0.6090001@synopsys.com>
Date: Fri, 18 Mar 2016 16:13:28 +0530
MIME-Version: 1.0
In-Reply-To: <3287558.oO5rz13nxZ@wuerfel>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-snps-arc@lists.infradead.org, Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>, Michal Marek <mmarek@suse.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Friday 18 March 2016 03:59 PM, Arnd Bergmann wrote:
> On Friday 18 March 2016 15:50:11 Vineet Gupta wrote:
>> Sure, but I prefer this to be only for gcc 4.8 as this warning seems to be
>> healthy in small doses  At least it keeps the door open for future discussion
>> with gcc guys !
> 
> FWIW, testing on ARM with gcc-6.0 -O3, I also get tons of maybe-uninitialized
> warnings. It's unlikely that this is architecture specific or fixed in newer
> compiler versions.

So we disable this for good just like -Os.
What a shame - seemed like a reasonable safety net for programming errors.

>> The following nested construct actually works - does that look OK to you ?
>>
>> ARCH_CFLAGS += -O3 $(call cc-ifversion, -lt, 0408, $(call cc-disable-warning,maybe-uninitialized,))
> 
> Yes, that seems ok.

There was typo actually -lt needed to be -eq

> I don't really understand why -O3 is needed though, maybe it's better to
> assume that it won't be needed in future gcc versions and do

Not sure what you mean, -O3 for triggering the warnings or -O3 in ARC makefile at all.
Assuming it's latter, this is how its been forever and was added consciously as
performance seemed better with -O3 than the default -O2.


> 
> ARCH_CFLAGS += $(call cc-ifversion, -lt, 0408, -O3 $(call cc-disable-warning,maybe-uninitialized,))
> 
> 	Arnd
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

