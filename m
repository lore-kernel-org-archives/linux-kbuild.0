Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:42357 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754355Ab2DLThO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Apr 2012 15:37:14 -0400
Message-ID: <4F872ED8.1060608@kernel.org>
Date: Thu, 12 Apr 2012 12:36:56 -0700
From: "H. Peter Anvin" <hpa@kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] Add CONFIG_READABLE_ASM
References: <1332960678-11879-1-git-send-email-andi@firstfloor.org> <1332960678-11879-2-git-send-email-andi@firstfloor.org> <CAMuHMdVX28zeebzN6277B5p2b=9s-Q06i01o5AHPyXAuKMigGQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVX28zeebzN6277B5p2b=9s-Q06i01o5AHPyXAuKMigGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org, Andi Kleen <ak@linux.intel.com>

On 04/12/2012 12:08 PM, Geert Uytterhoeven wrote:
> Hi Andi,
> 
> On Wed, Mar 28, 2012 at 20:51, Andi Kleen <andi@firstfloor.org> wrote:
>> +ifdef CONFIG_READABLE_ASM
>> +# Disable optimizations that make assembler listings hard to read.
>> +# reorder blocks reorders the control in the function
>> +# ipa clone creates specialized cloned functions
>> +# partial inlining inlines only parts of functions
>> +KBUILD_CFLAGS += $(call cc-option,-fno-reorder-blocks,) \
>> +                 $(call cc-option,-fno-ipa-cp-clone,) \
>> +                 $(call cc-option,-fno-partial-inlining)
>> +endif
> 
> This (now in linux-next) causes m68k/allmodconfig to fail for me:
> 
>   CHK     include/linux/version.h
>   CHK     include/generated/utsrelease.h
>   CC      kernel/bounds.s
> cc1: error: unrecognized command line option "-fno-ipa-cp-clone"
> 
> Somehow, "$(call cc-option,-fno-ipa-cp-clone,)" doesn't detect that my
> toolchain (gcc version 4.1.2 20061115 (prerelease) (Ubuntu 4.1.1-21))
> doesn't support this option.
> 
> I tried playing with the trailing comma (why do the first 2 tests have it,
> and the 3rd one doesn't?), but that didn't make a difference.
> 
> linux-next builds (using a newer toolchain) don't show this.
> 

Sounds like the fundamental action item is to find out what makes
cc-option not work.

	-hpa
