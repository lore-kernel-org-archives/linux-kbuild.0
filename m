Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from winston.telenet-ops.be ([195.130.137.75]:56224 "EHLO
	winston.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754322AbYLIRjT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Dec 2008 12:39:19 -0500
Date: Tue, 9 Dec 2008 18:39:16 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [uClinux-dev] Re: Merge headerfiles for m68k and m68knommu to
 arch/m68k/include/asm
In-Reply-To: <2929E10F-8611-41C9-8B15-C734AA7D7820@argonst.com>
Message-ID: <Pine.LNX.4.64.0812091838500.27084@anakin>
References: <20081208205814.GA22697@uranus.ravnborg.org>
 <Pine.LNX.4.64.0812082359190.29640@anakin> <2929E10F-8611-41C9-8B15-C734AA7D7820@argonst.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Allon Stern <allon.stern@argonst.com>
Cc: uClinux development list <uclinux-dev@uclinux.org>, Sam Ravnborg <sam@ravnborg.org>, linux-m68k <linux-m68k@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild <linux-kbuild@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>

On Tue, 9 Dec 2008, Allon Stern wrote:
> On Dec 8, 2008, at 6:01 PM, Geert Uytterhoeven wrote:
> > I think you can share a toolchain for m68k and m68knommu, at least for the
> > kernel (I used my plain m68k toolchain when experimenting with m68knommu for
> > Amiga).
> 
> The coldfire (m68knommu) doesn't have some instructions; this caused us some
> grief in the assembly code exported from m68k for byte order in user-space.

Sure, but that one is nicely protected by "#if defined (__mcfisaaplus__) ||
defined (__mcfisac__)", right?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
