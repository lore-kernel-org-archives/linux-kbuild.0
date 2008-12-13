Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:52789 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750745AbYLMQQx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 13 Dec 2008 11:16:53 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Merge headerfiles for m68k and m68knommu to arch/m68k/include/asm
Date: Sat, 13 Dec 2008 17:16:30 +0100
References: <20081208205814.GA22697@uranus.ravnborg.org> <Pine.LNX.4.64.0812110932510.7310@anakin> <Pine.LNX.4.64.0812112116060.333@anakin>
In-Reply-To: <Pine.LNX.4.64.0812112116060.333@anakin>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200812131716.31874.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k <linux-m68k@vger.kernel.org>, Greg Ungerer <gerg@uclinux.org>, uclinux-dev <uclinux-dev@uclinux.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Thursday 11 December 2008, Geert Uytterhoeven wrote:
> 
> > None of my m68k-linux compilers set __uClinux__, as expected.
> 
> Can't we unifdef out in scripts/headers_install.pl based on CONFIG_MMU?

That should work, but I'm not convinced that it is what you want.
If you want binaries to be used interchangably between the two,
you really need to fix the signal handling and pt_regs on m68knommu,
and someone should try to work out what EXEC_PAGESIZE and COMMAND_LINE_SIZE
should really be defined to.

	Arnd <><
