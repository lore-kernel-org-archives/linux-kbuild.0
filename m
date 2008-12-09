Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:50475 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751073AbYLIFoE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Dec 2008 00:44:04 -0500
Date: Tue, 9 Dec 2008 06:45:28 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Merge headerfiles for m68k and m68knommu to arch/m68k/include/asm
Message-ID: <20081209054528.GA1407@uranus.ravnborg.org>
References: <20081208205814.GA22697@uranus.ravnborg.org> <Pine.LNX.4.64.0812082359190.29640@anakin> <200812090026.06689.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200812090026.06689.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, uclinux-dev <uclinux-dev@uclinux.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, Dec 09, 2008 at 12:26:05AM +0100, Arnd Bergmann wrote:
> On Tuesday 09 December 2008, Geert Uytterhoeven wrote:
> > > I have used the following include guard:
> > > 
> > > #ifdef __uClinux__
> > > #include "atomic_no.h"
> > > #else
> > > #include "atomic_mm.h"
> > > #endif
> > > 
> > > gcc -E -dM for the two compilers revealed that this was the
> > > only symbol that differed.
> > 
> > I think you can share a toolchain for m68k and m68knommu, at least for the
> > kernel (I used my plain m68k toolchain when experimenting with m68knommu for
> > Amiga).
> > 
> > > With the above construct we do the "right thing" also for
> > > headers exported to userspace.
> > > But actually none of the headers using the above are
> > > subject for export at the moment so we could use a
> > > CONFIG_ symbol for the same.
> > 
> > So I prefer to just check CONFIG_MMU.
> 
> Some of them are, by means of include/asm-generic/Kbuild.asm, e.g.
> unistd.h!
I was fooled by make headers_check showing no errros.
But it turns out that headers_check does not recognize
includes made with "".

So I will update the patch to include revevant *_{no,mm}.h files
in Kbuild.

> 
> I'm not sure if it's entirely correct, but I think you can use
> 
> #ifdef __KERNEL__
> # ifdef CONFIG_MMU
> #  include "atomic_mm.h
> # else
> #  include "atomic_no.h
> # endif
> #else
> # ifndef __uClinux__
> #  include "atomic_mm.h
> # else
> #  include "atomic_no.h
> # endif
> #endif

Can someone with a shared (m68k/m68knommu) please check if
__uClinux__ is only set in the m68knommu case.

Use:

    touch foo.h; gcc -E -dM

to see what is defined by the compiler.
You will also need to specify if this is for m68k or m68knommu.

Thanks,
	Sam
