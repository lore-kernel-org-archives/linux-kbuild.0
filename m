Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:57341 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751455AbYGIU0w (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Jul 2008 16:26:52 -0400
Date: Wed, 9 Jul 2008 22:27:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Integrating relocatable kernel build with kernel build
Message-ID: <20080709202740.GA2655@uranus.ravnborg.org>
References: <4875040A.7020306@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4875040A.7020306@in.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mohan Kumar M <mohan@in.ibm.com>
Cc: linux-kbuild@vger.kernel.org

Hi Mohan.

On Thu, Jul 10, 2008 at 12:01:38AM +0530, Mohan Kumar M wrote:
> Hi,
> 
> I am developing relocatable kernel for PPC64 and as part of it I need to 
> integrate the build process with the kernel build itself. As of now I am 
> using a separate makefile to build the relocatable kernel after building 
> the kernel.
> 
> I have updated the Makefile(s) in arch/powerpc and arch/powerpc/boot to 
> build the relocatable kernel image as part of kernel build.
> 
> With this approach I have two problems:
> 1. I need to explicitly specify the relocatable vmlinux target to build 
> it. ie
> 	make vmlinux.reloc

Add the relevant target to the all: rule in arch/powerpc/Makefile

# Default to zImage, override when needed
all: zImage

And include support for the target in same file.


> 2. During build process, build is not able to build the 
> vmlinux.reloc.lds linker script from the vmlinux.reloc.lds.S source file.

If you just add:
extra-y += vmlinux.reloc.lds 

then it should happen automatically.
ee how all archs does it in arch/$ARCH/kernel/Makefile for vmlinx.lds

> I am attaching the separate makefile to build the relocatable vmlinux, 
> makefile diffs diff.Makefile (diff between original 
> arch/powerpc/Makefile and arch/powerpc/Makefile for relocatable 
> support), diff.Makefile.boot (diff between original 
> arch/powerpc/boot/Makefile and arch/powerpc/boot/Makefile for 
> relocatable support)

I did not look at it this time - lacking time.
But tr to provide a single unified diff next time - that i
at least remotely readable.

> Another feature I am looking is to generate the "relocatable vmlinux" 
> image in the top directory of kernel source and the intermediate vmlinux 
> file either in arch/powerpc/kernel or arch/powerpc/boot.
We no longer build arch specific targets in the top-level directory
of the kernel src. We print out where to locate the build file.

See x86 as an example.

> I have not subscribed to the kbuild mailing list, so please include me 
> in to/cc while replying to this thread.
[We always do so here].

	Sam
