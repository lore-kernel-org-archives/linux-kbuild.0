Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e5.ny.us.ibm.com ([32.97.182.145]:55364 "EHLO e5.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754455AbYGJOLY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Jul 2008 10:11:24 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e5.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m6AEBHJF028638
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Jul 2008 10:11:17 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m6AEASB2189404
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Jul 2008 10:10:28 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m6AEARN3020259
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Jul 2008 10:10:28 -0400
Message-ID: <4876184E.7040705@in.ibm.com>
Date: Thu, 10 Jul 2008 19:40:22 +0530
From: Mohan Kumar M <mohan@in.ibm.com>
MIME-Version: 1.0
Subject: Re: Integrating relocatable kernel build with kernel build
References: <4875040A.7020306@in.ibm.com> <20080709202740.GA2655@uranus.ravnborg.org>
In-Reply-To: <20080709202740.GA2655@uranus.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

Hi Sam,

Thank you for the reply.

Sam Ravnborg wrote:
> Hi Mohan.
> 

> 
> Add the relevant target to the all: rule in arch/powerpc/Makefile
> 
> # Default to zImage, override when needed
> all: zImage

I added vmlinux.reloc here and now by default vmlinux.reloc is also built.
> 
> And include support for the target in same file.
> 
> 
>> 2. During build process, build is not able to build the 
>> vmlinux.reloc.lds linker script from the vmlinux.reloc.lds.S source file.
> 
> If you just add:
> extra-y += vmlinux.reloc.lds

After including the above entry, make builds the linker script.

> 
> then it should happen automatically.
> ee how all archs does it in arch/$ARCH/kernel/Makefile for vmlinx.lds
> 

> I did not look at it this time - lacking time.
> But tr to provide a single unified diff next time - that i
> at least remotely readable.
> 
>> Another feature I am looking is to generate the "relocatable vmlinux" 
>> image in the top directory of kernel source and the intermediate vmlinux 
>> file either in arch/powerpc/kernel or arch/powerpc/boot.
> We no longer build arch specific targets in the top-level directory
> of the kernel src. We print out where to locate the build file.
>

Still need to build the final "relocatable vmlinux" image in the top
level directory of kernel source (either as vmlinux or vmlinux.reloc).

Once again thank you.

Regards,
Mohan.


