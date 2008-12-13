Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:43640 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751547AbYLMUob (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 13 Dec 2008 15:44:31 -0500
Date: Sat, 13 Dec 2008 21:46:01 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Merge headerfiles for m68k and m68knommu to arch/m68k/include/asm
Message-ID: <20081213204601.GB27748@uranus.ravnborg.org>
References: <20081208205814.GA22697@uranus.ravnborg.org> <Pine.LNX.4.64.0812082359190.29640@anakin> <200812090026.06689.arnd@arndb.de> <20081209054528.GA1407@uranus.ravnborg.org> <Pine.LNX.4.64.0812110932510.7310@anakin> <4941F93A.7090604@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4941F93A.7090604@snapgear.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Ungerer <gerg@snapgear.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, uclinux-dev <uclinux-dev@uclinux.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

> >>
> >>>I'm not sure if it's entirely correct, but I think you can use
> >>>
> >>>#ifdef __KERNEL__
> >>># ifdef CONFIG_MMU
> >>>#  include "atomic_mm.h
> >>># else
> >>>#  include "atomic_no.h
> >>># endif
> >>>#else
> >>># ifndef __uClinux__
> >>>#  include "atomic_mm.h
> >>># else
> >>>#  include "atomic_no.h
> >>># endif
> >>>#endif
> >>Can someone with a shared (m68k/m68knommu) please check if
> >>__uClinux__ is only set in the m68knommu case.
> >>
> >>Use:
> >>
> >>    touch foo.h; gcc -E -dM
> >>
> >>to see what is defined by the compiler.
> >>You will also need to specify if this is for m68k or m68knommu.
> >
> >Any comments from the m68knommu toolchain people?
> >
> >None of my m68k-linux compilers set __uClinux__, as expected.
> 
> A m68k-uclinux- gcc will. From a gcc-4.2.4
> 
>   m68k-uclinux-gcc -E -dM /tmp/foo.h | grep -i linux
> 
>   #define __linux 1
>   #define __linux__ 1
>   #define __uClinux__ 1
>   #define __gnu_linux__ 1
>   #define linux 1
> 
> (I think that is one of the very few differences of m68k-linux
> over m68k-uclinux...)
> 
> I would rather just have a m68k-linux myself, and not have a
> separate m68k-uclinux toolchain.

A precondition for this is I expect a unified ABI for m68k and m68knommu.
With the merged headers it is now much more obvious where the ABI differs,
so fixing the ABI differences now got one step easier.

	Sam
