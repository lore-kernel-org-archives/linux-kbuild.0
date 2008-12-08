Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:57868 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753243AbYLHX0a (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Dec 2008 18:26:30 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Merge headerfiles for m68k and m68knommu to arch/m68k/include/asm
Date: Tue, 9 Dec 2008 00:26:05 +0100
References: <20081208205814.GA22697@uranus.ravnborg.org> <Pine.LNX.4.64.0812082359190.29640@anakin>
In-Reply-To: <Pine.LNX.4.64.0812082359190.29640@anakin>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200812090026.06689.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, uclinux-dev <uclinux-dev@uclinux.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tuesday 09 December 2008, Geert Uytterhoeven wrote:
> > I have used the following include guard:
> > 
> > #ifdef __uClinux__
> > #include "atomic_no.h"
> > #else
> > #include "atomic_mm.h"
> > #endif
> > 
> > gcc -E -dM for the two compilers revealed that this was the
> > only symbol that differed.
> 
> I think you can share a toolchain for m68k and m68knommu, at least for the
> kernel (I used my plain m68k toolchain when experimenting with m68knommu for
> Amiga).
> 
> > With the above construct we do the "right thing" also for
> > headers exported to userspace.
> > But actually none of the headers using the above are
> > subject for export at the moment so we could use a
> > CONFIG_ symbol for the same.
> 
> So I prefer to just check CONFIG_MMU.

Some of them are, by means of include/asm-generic/Kbuild.asm, e.g.
unistd.h!

I'm not sure if it's entirely correct, but I think you can use

#ifdef __KERNEL__
# ifdef CONFIG_MMU
#  include "atomic_mm.h
# else
#  include "atomic_no.h
# endif
#else
# ifndef __uClinux__
#  include "atomic_mm.h
# else
#  include "atomic_no.h
# endif
#endif

	Arnd <><
