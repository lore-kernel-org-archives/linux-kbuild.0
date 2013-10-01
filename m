Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mho-02-ewr.mailhop.org ([204.13.248.72]:61760 "EHLO
	mho-02-ewr.mailhop.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752913Ab3JALNL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 1 Oct 2013 07:13:11 -0400
Date: Tue, 1 Oct 2013 07:12:57 -0400
From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH RESEND] ARM: add dtbImage.<dt> and dtbuImage.<dt> rules
Message-ID: <20131001111257.GN31178@titan.lakedaemon.net>
References: <20120927082955.GR17667@game.jcrosoft.org>
 <CACQ1gAgwv4pBFZBrVZiWM2_=OneUO-s16LufSENx27gMC3DUig@mail.gmail.com>
 <52416F97.802@keymile.com>
 <20130924120152.GI11119@titan.lakedaemon.net>
 <20130924121939.GD12758@n2100.arm.linux.org.uk>
 <1380572483.31472.51.camel@sakura.staff.proxad.net>
 <20130930204223.GJ31178@titan.lakedaemon.net>
 <1380575265.23932.11.camel@sakura.staff.proxad.net>
 <alpine.LFD.2.03.1309302241400.6331@syhkavp.arg>
 <20131001104115.GA1384@sakura.staff.proxad.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20131001104115.GA1384@sakura.staff.proxad.net>
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Maxime Bizon <mbizon@freebox.fr>
Cc: Nicolas Pitre <nico@fluxnic.net>, Michal Marek <mmarek@suse.cz>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-kbuild@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Gerlando Falauto <gerlando.falauto@keymile.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org

On Tue, Oct 01, 2013 at 12:41:15PM +0200, Maxime Bizon wrote:
> On Monday 30 Sep 2013 à 23:14:49 (-0400), Nicolas Pitre wrote:
> 
> > > That "kind of hacky" ATAG thing was actually the only supported way to
> > > boot a platform not so long ago :)
> > 
> > Strictly speaking, this was never supported in mainline.

I was referring to the non-approved atags many vendors arbitrarily added
to their bootloaders and kernels.  Ethernet mac addresses, etc.  It's
not proper to go cluttering the kernel with every hair-brained, one-off
tag a board vendor came up with to ship a product.

> > The ultimate idea with the impedance matcher was to augment existing 
> > bootloaders with sort of a semi second stage bootloader that would be 
> > separate from zImage and installed permanently, and then only the zImage 
> > itself would be updateable.  This way you'd get a DT capable environment 
> > without replacing the actual bootloader.
> 
> That's true if you have access to the bootloader in some way (serial,
> flash env).
> 
> But for devices in the field for which upgrading the booloader is not
> an option, neither is changing anything else in the boot process
> (anything before linux starts). The risk of bricking the device is
> just too high.

This is the exact scenario we are solving with the impedance matcher.
It's a wrapper around a kernel and a series of dtbs.  To the bootloader,
it looks _exactly_ like the kernel, but it translates the info passed to
it into terms newer kernels can understand.  No need for a separate
binary.

hth,

Jason.
