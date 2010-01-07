Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from isilmar.linta.de ([213.133.102.198]:34276 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753159Ab0AGU5a (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jan 2010 15:57:30 -0500
Date: Thu, 7 Jan 2010 21:57:28 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: linux-next: Tree for January 7 (pcmcia)
Message-ID: <20100107205728.GA19115@isilmar.linta.de>
References: <20100107172134.af71c742.sfr@canb.auug.org.au> <20100107101006.e59989a8.rdunlap@xenotime.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100107101006.e59989a8.rdunlap@xenotime.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kbuild@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Valdis.Kletnieks@vt.edu

Hey,

On Thu, Jan 07, 2010 at 10:10:06AM -0800, Randy Dunlap wrote:
> > Hi all,
> > 
> > Changes since 20100106:
> 
> 
> drivers/built-in.o: In function `yenta_probe':
> yenta_socket.c:(.devinit.text+0x1e582): undefined reference to `pccard_nonstatic_ops'
> 
> CONFIG_PCCARD=y
> CONFIG_PCMCIA=m
> CONFIG_PCCARD_NONSTATIC=m
> CONFIG_YENTA=y
> 
> so yenta code (built-in) tries to reference data that lives in a
> loadable module.

Uh, that was I. If kconfig can't be fixed easily, I'll revert the change

>  But I would expect this Kconfig:
> 
> config YENTA
> 	tristate "CardBus yenta-compatible bridge support"
> 	depends on PCI
> 	select CARDBUS if !EMBEDDED
> 	select PCCARD_NONSTATIC if PCMCIA
> 
> to make PCCARD_NONSTATIC=y instead of =m.  Has something changed in
> kconfig recently that would make that different?

Best,
	Dominik
