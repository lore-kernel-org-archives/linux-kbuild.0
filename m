Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rv-out-0708.google.com ([209.85.198.244]:10557 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753063AbYEBBs6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 May 2008 21:48:58 -0400
Received: by rv-out-0506.google.com with SMTP id k29so713168rvb.1
        for <linux-kbuild@vger.kernel.org>; Thu, 01 May 2008 18:48:58 -0700 (PDT)
Message-ID: <8499950a0805011848h713606e3mda5dd2aed31dfa91@mail.gmail.com>
Date: Fri, 2 May 2008 02:48:58 +0100
From: "Oleg Verych" <olecom@gmail.com>
Subject: Re: gcc 3.4.6 fails to build 2.6.25 due to offsetof() not digestible by gas
In-Reply-To: <52649.81.193.128.196.1209689622.squirrel@galactus.symlabs.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <16355.213.30.72.21.1209618475.squirrel@galactus.symlabs.net>
	 <38941.81.193.128.196.1209654347.squirrel@galactus.symlabs.net>
	 <20080501163453.GF29330@cs181133002.pp.htv.fi>
	 <34486.81.193.128.196.1209659903.squirrel@galactus.symlabs.net>
	 <20080501165333.GG29330@cs181133002.pp.htv.fi>
	 <33623.81.193.128.196.1209661842.squirrel@galactus.symlabs.net>
	 <20080501191714.GM29330@cs181133002.pp.htv.fi>
	 <20080501213952.GA8281@uranus.ravnborg.org>
	 <20080501220747.GV29330@cs181133002.pp.htv.fi>
	 <52649.81.193.128.196.1209689622.squirrel@galactus.symlabs.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Sam Ravnborg (kbuild list)" <linux-kbuild@vger.kernel.org>

Sam, please, tell to those guys, that shell must be `bash`, as Roman wanted.
Also, please, ask if they don't see my messages about simple `sed` and all
other stuff, or if just ignore me or like to express own ignorance.

Thanks.

On Fri, May 2, 2008 at 1:53 AM,  <sampo@symlabs.com> wrote:
> Adrian Bunk wrote:
>  > On Thu, May 01, 2008 at 11:39:52PM +0200, Sam Ravnborg wrote:
>  >>
>  >> Do we know why it picked up the busy box version?
>
>  I think it has to do with my /bin/sh being the busybox ash. It seems
>  the ash prefers its built-in version over the one in path. This is
>  probably due to me having compiled busybox with some option. Sorry
>  for the confusion.
>
>  If I edit linux/Kbuild to reference explicitly /usr/bin/sed (which
>  is the gnu sed), the compile proceeds ok up to a point where
>  following happens
>
>  (snip)
>  make -f scripts/Makefile.build obj=arch/x86/vdso
>   gcc -Wp,-MD,arch/x86/vdso/vdso32/.int80.o.d  -nostdinc -isystem
>  /apps/gcc/3.4.6/lib/gcc/i686-pc-linux-gnu/3.4.6/include -D__KERNEL__
>  -Iinclude  -include include/linux/autoconf.h -D__ASSEMBLY__ -m32
>  -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1
>  -Iinclude/asm-x86/mach-default     -c -o arch/x86/vdso/vdso32/int80.o
>  arch/x86/vdso/vdso32/int80.S
>  arch/x86/vdso/vdso32/int80.S: Assembler messages:
>  arch/x86/vdso/vdso32/int80.S:68: Fatal error: cannot write to output file
>  make[1]: *** [arch/x86/vdso/vdso32/int80.o] Error 1
>  make: *** [arch/x86/vdso] Error 2
>
>  Here the problem appears to be that -c is supplied but there is no
>  source file to compile. The error message certainly is not
>  helpful. I'll investigate further.
>
>  >> Because from the commandline it was the correct sed - and I do not
>  >> know that make should do different.
>
>  Busybox ash compiled with certain options is the culprit for
>  this one.
>
>  > Good point.
>  >
>  > No, and we might actually have two issues:
>  > - what happened with the PATH (Sampo, is it really PATH or do you use an
>  >                                alias?)
>  > - we must somehow handle non-GNU sed's (either change the code or error)
>
>  I would wish at least busybox sed be accommodated. Looking at the
>  sed expression, it seems unnecessarily complicated. I'll try to formulate
>  a simpler expression that accomplishes the same net result, namely
>  transforming
>
>   ->IA32_SIGCONTEXT_ax $44 offsetof(struct sigcontext, ax)
>
>  to
>
>   #define IA32_SIGCONTEXT_ax 44 /* offsetof(struct sigcontext, ax) # */
>
>  It can't be as difficult as
>
>   "/^->/{s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:;
>  s:->::; p;}"
>
>  Cheers,
>  --Sampo
>
>  >>      Sam
>  >
>  > cu
>  > Adrian
-- 
sed 'sed && sh + olecom = love' << ''
-o--=O`C
 #oo'L O
<___=E M
