Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from barikada.upol.cz ([158.194.242.200]:59703 "EHLO
	barikada.upol.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762667AbYEASdE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 May 2008 14:33:04 -0400
Date: Thu, 1 May 2008 20:53:53 +0200
Subject: `sed`ing asm-offsets (Re: gcc 3.4.6 fails to build 2.6.25 due to offsetof() not digestible by gas)
Message-ID: <20080501185352.GU24008@flower.upol.cz>
References: <16355.213.30.72.21.1209618475.squirrel@galactus.symlabs.net> <20080501120616.GY29330@cs181133002.pp.htv.fi> <38941.81.193.128.196.1209654347.squirrel@galactus.symlabs.net> <20080501163453.GF29330@cs181133002.pp.htv.fi> <34486.81.193.128.196.1209659903.squirrel@galactus.symlabs.net> <20080501165333.GG29330@cs181133002.pp.htv.fi> <33623.81.193.128.196.1209661842.squirrel@galactus.symlabs.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33623.81.193.128.196.1209661842.squirrel@galactus.symlabs.net>
From: Oleg Verych <olecom@flower.upol.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sampo@symlabs.com
Cc: Adrian Bunk <bunk@kernel.org>, linux-kbuild@vger.kernel.org

sampo@symlabs.com @ Thu, May 01, 2008 at 07:10:42PM +0200:

> > If you run
> >
> >   sed -ne "/^->/{s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /*
> > \3 */:; s:->::; p;}" < asm-offsets.s
> >

Here is side-problem with this script, which manifests itself as so:

> #define CPUINFO_x86  /* offsetof(struct cpuinfo_x86, x86)       # */
> #define CPUINFO_x86_vendor 1 /* offsetof(struct cpuinfo_x86, x86_vendor)  
> 
> #define TI_task  /* offsetof(struct thread_info, task)  # */

> #define GDS_size  /* offsetof(struct desc_ptr, size)    # */
> #define GDS_address 2 /* offsetof(struct desc_ptr, address)     # */
> 
> #define PT_EBX  /* offsetof(struct pt_regs, bx) # */
> #define PT_ECX 4 /* offsetof(struct pt_regs, cx)        # */

there's no zero in CPUINFO_x86, TI_task, GDS_size, etc.
Script "[\$$#]" -> $# is a number of parameters in `sh`
But this no problem so far. 


> > with your asm-offsets.s file and this sed, does the result contain
> >
> >   IA32_SIGCONTEXT_ax $44 offsetof(struct sigcontext, ax)  #
> >
> > or
> >
> >   #define IA32_SIGCONTEXT_ax 44 /* offsetof(struct sigcontext, ax)
> > # */
> 
> The latter. Which one is correct? Is asm-offsets.h the output of
> the above command? Please confirm.

latter, of course. It looks more like header file.

> Since on command line it seems to work fine,
> but in make time it bombs, I suspect make somehow manages to find
> the busybox sed, which verifiably produces output
> 
> IA32_SIGCONTEXT_ax $44 offsetof(struct sigcontext, ax)  #

In top Kbuild file change
--this--
define cmd_offsets
	(set -e; \
--to--
define cmd_offsets
	(set -xe; \
--

And check (in stderr) what script is fed to `sed`.

> Thus this is probably a PATH issue of some sort. I will investigate,
> but will not delay this response.

Seems like it's not.

> Of course as a mild feature request, please fix the sed parts to
> be more tolerant of lesser seds.

It seems more like `make` problem, if in command line it is kind of OK.
I.e. garbage-like syntax and coding. If you want, you can find
"asm-values" patches from a year or so ago. There was more readable
example of the job.
____
