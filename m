Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:46141 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751538AbYEBGGL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 May 2008 02:06:11 -0400
Date: Fri, 2 May 2008 08:06:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: gcc 3.4.6 fails to build 2.6.25 due to offsetof() not digestible by gas
Message-ID: <20080502060645.GA19090@uranus.ravnborg.org>
References: <20080501120616.GY29330@cs181133002.pp.htv.fi> <38941.81.193.128.196.1209654347.squirrel@galactus.symlabs.net> <20080501163453.GF29330@cs181133002.pp.htv.fi> <34486.81.193.128.196.1209659903.squirrel@galactus.symlabs.net> <20080501165333.GG29330@cs181133002.pp.htv.fi> <33623.81.193.128.196.1209661842.squirrel@galactus.symlabs.net> <20080501191714.GM29330@cs181133002.pp.htv.fi> <20080501213952.GA8281@uranus.ravnborg.org> <20080501220747.GV29330@cs181133002.pp.htv.fi> <52649.81.193.128.196.1209689622.squirrel@galactus.symlabs.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52649.81.193.128.196.1209689622.squirrel@galactus.symlabs.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sampo@symlabs.com
Cc: Adrian Bunk <bunk@kernel.org>, linux-kbuild@vger.kernel.org

On Fri, May 02, 2008 at 02:53:42AM +0200, sampo@symlabs.com wrote:
> Adrian Bunk wrote:
> > On Thu, May 01, 2008 at 11:39:52PM +0200, Sam Ravnborg wrote:
> >>
> >> Do we know why it picked up the busy box version?
> 
> I think it has to do with my /bin/sh being the busybox ash. It seems
> the ash prefers its built-in version over the one in path. This is
> probably due to me having compiled busybox with some option. Sorry
> for the confusion.

This makes sense - thanks for the explanation!

> If I edit linux/Kbuild to reference explicitly /usr/bin/sed (which
> is the gnu sed), the compile proceeds ok up to a point where
> following happens
> 
> (snip)
> make -f scripts/Makefile.build obj=arch/x86/vdso
>   gcc -Wp,-MD,arch/x86/vdso/vdso32/.int80.o.d  -nostdinc -isystem
> /apps/gcc/3.4.6/lib/gcc/i686-pc-linux-gnu/3.4.6/include -D__KERNEL__
> -Iinclude  -include include/linux/autoconf.h -D__ASSEMBLY__ -m32
> -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1
> -Iinclude/asm-x86/mach-default     -c -o arch/x86/vdso/vdso32/int80.o
> arch/x86/vdso/vdso32/int80.S
> arch/x86/vdso/vdso32/int80.S: Assembler messages:
> arch/x86/vdso/vdso32/int80.S:68: Fatal error: cannot write to output file
> make[1]: *** [arch/x86/vdso/vdso32/int80.o] Error 1
> make: *** [arch/x86/vdso] Error 2

I will assume this is sed that is playing tricks with us again.
If you replace sed with /usr/bin/sed in the arch/x86/vdso/Makefile
does the build then proceed?

If this does not fix it then try to post what happens a few lines
before the gcc invocation - this is likely where we start to see
the problem.

> I would wish at least busybox sed be accommodated. Looking at the
> sed expression, it seems unnecessarily complicated. I'll try to formulate
> a simpler expression that accomplishes the same net result, namely
> transforming
> 
>   ->IA32_SIGCONTEXT_ax $44 offsetof(struct sigcontext, ax)
> 
> to
> 
>   #define IA32_SIGCONTEXT_ax 44 /* offsetof(struct sigcontext, ax) # */
> 
> It can't be as difficult as
> 
>   "/^->/{s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:;
> s:->::; p;}"

There a special mips case to consider too.
A patch is appreciated!

	Sam
