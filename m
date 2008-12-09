Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from yorgi.telenet-ops.be ([195.130.133.69]:46531 "EHLO
	yorgi.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751466AbYLIIZW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Dec 2008 03:25:22 -0500
Received: from harold.telenet-ops.be (harold.telenet-ops.be [195.130.133.65])
	by yorgi.telenet-ops.be (Postfix) with ESMTP id 3631D6815E5
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Dec 2008 09:25:21 +0100 (CET)
Date: Tue, 9 Dec 2008 09:24:47 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Merge headerfiles for m68k and m68knommu to arch/m68k/include/asm
In-Reply-To: <20081209054528.GA1407@uranus.ravnborg.org>
Message-ID: <Pine.LNX.4.64.0812090921310.29640@anakin>
References: <20081208205814.GA22697@uranus.ravnborg.org>
 <Pine.LNX.4.64.0812082359190.29640@anakin> <200812090026.06689.arnd@arndb.de>
 <20081209054528.GA1407@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, uclinux-dev <uclinux-dev@uclinux.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, 9 Dec 2008, Sam Ravnborg wrote:
> On Tue, Dec 09, 2008 at 12:26:05AM +0100, Arnd Bergmann wrote:
> > On Tuesday 09 December 2008, Geert Uytterhoeven wrote:
> > > > I have used the following include guard:
> > > > 
> > > > #ifdef __uClinux__
> > > > #include "atomic_no.h"
> > > > #else
> > > > #include "atomic_mm.h"
> > > > #endif
> > > > 
> > > > gcc -E -dM for the two compilers revealed that this was the
> > > > only symbol that differed.
> > > 
> > > I think you can share a toolchain for m68k and m68knommu, at least for the
> > > kernel (I used my plain m68k toolchain when experimenting with m68knommu for
> > > Amiga).
> > > 
> > > > With the above construct we do the "right thing" also for
> > > > headers exported to userspace.
> > > > But actually none of the headers using the above are
> > > > subject for export at the moment so we could use a
> > > > CONFIG_ symbol for the same.
> > > 
> > > So I prefer to just check CONFIG_MMU.
> > 
> > Some of them are, by means of include/asm-generic/Kbuild.asm, e.g.
> > unistd.h!

Interesting, I'd expect unistd.h to be the same!

Ah, it's the restart_syscall:

--- include/asm-m68k/unistd.h	2008-10-18 10:34:15.000000000 +0200
+++ arch/m68knommu/include/asm/unistd.h	2008-10-12 14:08:01.000000000 +0200
@@ -5,6 +5,7 @@
  * This file contains the system call numbers.
  */
 
+#define __NR_restart_syscall      0
 #define __NR_exit		  1
 #define __NR_fork		  2
 #define __NR_read		  3
@@ -359,9 +360,6 @@
 #define __ARCH_WANT_SYS_SIGPROCMASK
 #define __ARCH_WANT_SYS_RT_SIGACTION
 
-/* whitelist for checksyscalls */
-#define __IGNORE_restart_syscall
-
 /*
  * "Conditional" syscalls
  *

Sorry, I don't know about syscall restart handling, and why it differs. Anyone
who can enlighten me?

> I was fooled by make headers_check showing no errros.
> But it turns out that headers_check does not recognize
> includes made with "".
> 
> So I will update the patch to include revevant *_{no,mm}.h files
> in Kbuild.
> 
> > 
> > I'm not sure if it's entirely correct, but I think you can use
> > 
> > #ifdef __KERNEL__
> > # ifdef CONFIG_MMU
> > #  include "atomic_mm.h
> > # else
> > #  include "atomic_no.h
> > # endif
> > #else
> > # ifndef __uClinux__
> > #  include "atomic_mm.h
> > # else
> > #  include "atomic_no.h
> > # endif
> > #endif
> 
> Can someone with a shared (m68k/m68knommu) please check if
> __uClinux__ is only set in the m68knommu case.
                 ^^^^
		 always and only
> 
> Use:
> 
>     touch foo.h; gcc -E -dM
> 
> to see what is defined by the compiler.
> You will also need to specify if this is for m68k or m68knommu.

Still, I don't see why the compiler needs to be aware of being configured for
m68k or m68knommu, so IMHO this is a very fragile test...

What are the other exported headers that differ?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
