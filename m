Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:52210 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758263AbYLKQxr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Dec 2008 11:53:47 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Merge headerfiles for m68k and m68knommu to arch/m68k/include/asm
Date: Thu, 11 Dec 2008 17:48:18 +0100
References: <20081208205814.GA22697@uranus.ravnborg.org> <Pine.LNX.4.64.0812110932510.7310@anakin> <je1vwfuk47.fsf@sykes.suse.de>
In-Reply-To: <je1vwfuk47.fsf@sykes.suse.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200812111748.20012.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andreas Schwab <schwab@suse.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, uclinux-dev <uclinux-dev@uclinux.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Thursday 11 December 2008, Andreas Schwab wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> 
> > None of my m68k-linux compilers set __uClinux__, as expected.
> 
> IIUC, userspace ABI is supposed to be completely identical.

The header files are currently different for the definitions of
__arch__swab32, EXEC_PAGESIZE, struct sigcontext, struct siginfo,
struct pt_regs (coldfire only) and COMMAND_LINE_SIZE.

I don't expect the last two to cause any trouble, but the others
are likely to.

__arch_swab32 should be protected with __mcfisaaplus__ (as it
already is on m68knommu). 

pt_regs on m68knommu is already screwed by itself, because it
depends on the CONFIG_COLDFIRE symbol. I don't think that it's
possible to build a gdb for coldfire with the current headers,
because CONFIG_* symbols are not visible in user space.

The signal handling ABI is currently broken on m68knommu:

commit 19dbaf6f6 "m68knommu: save reg a5 on context change",
changes the layout of struct sigcontext in an incompatible
way from older m68knommu and all m68k versions.

Prior to that, Linux-2.5.64 changed m68knommu to use the generic
siginfo instead of the m68k compatible one, thereby removing
uid32 support from it. This breaks when you build a libc with
uid32 against the m68k headers.

	Arnd <><
