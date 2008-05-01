Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp6.pp.htv.fi ([213.243.153.40]:45123 "EHLO smtp6.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753167AbYEAQyV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 May 2008 12:54:21 -0400
Date: Thu, 1 May 2008 19:53:33 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: gcc 3.4.6 fails to build 2.6.25 due to offsetof() not
	digestible by gas
Message-ID: <20080501165333.GG29330@cs181133002.pp.htv.fi>
References: <16355.213.30.72.21.1209618475.squirrel@galactus.symlabs.net> <20080501120616.GY29330@cs181133002.pp.htv.fi> <38941.81.193.128.196.1209654347.squirrel@galactus.symlabs.net> <20080501163453.GF29330@cs181133002.pp.htv.fi> <34486.81.193.128.196.1209659903.squirrel@galactus.symlabs.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <34486.81.193.128.196.1209659903.squirrel@galactus.symlabs.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sampo@symlabs.com
Cc: linux-kbuild@vger.kernel.org

On Thu, May 01, 2008 at 06:38:23PM +0200, sampo@symlabs.com wrote:
> Adrian Bunk wrote:
> > On Thu, May 01, 2008 at 05:05:47PM +0200, sampo@symlabs.com wrote:
> >> Adrian Bunk wrote:
> >> > On Thu, May 01, 2008 at 07:07:55AM +0200, sampo@symlabs.com wrote:
> >> >> Platform: x86
> >> >> Compiler: gcc-3.4.6
> >> >> Binutils: 2.17.50.0.8
> >> >> Kernel under build: 2.6.25 (from kernel.org)
> >> >>
> >> >> Problem: Build fails due to incompatibility of asm-offsets.h with
> >> >> assembler. See below:
> >> >>
> >> >> gcc -Wp,-MD,arch/x86/kernel/.entry_32.o.d  -nostdinc -isystem
> >> >> /apps/gcc/3.4.6/lib/gcc/i686-pc-linux-gnu/3.4.6/include -D__KERNEL__
> >> >> -Iinclude  -include include/linux/autoconf.h -D__ASSEMBLY__ -m32
> >> >> -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1
> >> >> -Iinclude/asm-x86/mach-default     -c -o arch/x86/kernel/entry_32.o
> >> >> arch/x86/kernel/entry_32.S
> >> >> include/asm/asm-offsets.h: Assembler messages:
> >> >> include/asm/asm-offsets.h:10: Error: invalid character '_' in
> >> mnemonic
> >> >> include/asm/asm-offsets.h:11: Error: invalid character '_' in
> >> mnemonic
> >> >> include/asm/asm-offsets.h:12: Error: invalid character '_' in
> >> mnemonic
> >> >> include/asm/asm-offsets.h:13: Error: invalid character '_' in
> >> mnemonic
> >> >> include/asm/asm-offsets.h:14: Error: invalid character '_' in
> >> mnemonic
> >> >> include/asm/asm-offsets.h:15: Error: invalid character '_' in
> >> mnemonic
> >> >> (snip - much more of the same)
> >> >>...
> >> >
> >> > Thanks for your report.
> >> >
> >> > Please send:
> >> > - your .config
> >> > - your include/asm/asm-offsets.h
> >>
> >> Please see attached. FYI
> >>
> >> ls-alFg include/asm
> >> lrwxrwxrwx 1 sampo sampo 7 May  1 02:30 include/asm -> asm-x86/
> >
> > Thanks, the next things I need are:
> > - arch/x86/kernel/asm-offsets.s
> 
> See attached.

Thanks.

> > - the output of "sed --version"
> 
> sed --version
> GNU sed version 4.1.5-boot
>...

Where does this "4.1.5-boot" version come from?
Is this some stripped down version of sed?

If you run

  sed -ne "/^->/{s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; s:->::; p;}" < asm-offsets.s

with your asm-offsets.s file and this sed, does the result contain

  IA32_SIGCONTEXT_ax $44 offsetof(struct sigcontext, ax)  #

or

  #define IA32_SIGCONTEXT_ax 44 /* offsetof(struct sigcontext, ax)        # */

> To facilitate more rapid communication,
>...

You already answer faster than the speed of light.  :-)

> Cheers,
> --Sampo

Thanks
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

