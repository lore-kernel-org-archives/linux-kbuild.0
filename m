Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:20573 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755752Ab3JADOv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Sep 2013 23:14:51 -0400
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; CHARSET=US-ASCII
Received: from yoda.home ([70.83.209.44]) by VL-VM-MR005.ip.videotron.ca
 (Oracle Communications Messaging Exchange Server 7u4-22.01 64bit (built Apr 21
 2011)) with ESMTP id <0MTY004WEZOQ6J00@VL-VM-MR005.ip.videotron.ca> for
 linux-kbuild@vger.kernel.org; Mon, 30 Sep 2013 23:14:50 -0400 (EDT)
Date: Mon, 30 Sep 2013 23:14:49 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH RESEND] ARM: add dtbImage.<dt> and dtbuImage.<dt> rules
In-reply-to: <1380575265.23932.11.camel@sakura.staff.proxad.net>
Message-id: <alpine.LFD.2.03.1309302241400.6331@syhkavp.arg>
References: <504DFBBF.5010202@free-electrons.com>
 <1348733441-11626-1-git-send-email-richard.genoud@gmail.com>
 <20120927082955.GR17667@game.jcrosoft.org>
 <CACQ1gAgwv4pBFZBrVZiWM2_=OneUO-s16LufSENx27gMC3DUig@mail.gmail.com>
 <52416F97.802@keymile.com> <20130924120152.GI11119@titan.lakedaemon.net>
 <20130924121939.GD12758@n2100.arm.linux.org.uk>
 <1380572483.31472.51.camel@sakura.staff.proxad.net>
 <20130930204223.GJ31178@titan.lakedaemon.net>
 <1380575265.23932.11.camel@sakura.staff.proxad.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Maxime Bizon <mbizon@freebox.fr>
Cc: Jason Cooper <jason@lakedaemon.net>, Michal Marek <mmarek@suse.cz>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-kbuild@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Gerlando Falauto <gerlando.falauto@keymile.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org

On Mon, 30 Sep 2013, Maxime Bizon wrote:

> 
> On Mon, 2013-09-30 at 16:42 -0400, Jason Cooper wrote:
> 
> > Nicolas Pitre already suggested an impedance matcher that keeps this
> > kind of hacky code out of the kernel, and allows users to do exactly
> 
> I know that, my proposal was to bring this back into the kernel.

And obviously I disagree with such a proposal.

> That "kind of hacky" ATAG thing was actually the only supported way to
> boot a platform not so long ago :)

Strictly speaking, this was never supported in mainline.

> In the end, people needing the impedance matcher will somehow integrate
> it in the kernel build system anyway.

As long as it remains their own cost to maintain then nobody will 
object, which means "not in mainline".

The ultimate idea with the impedance matcher was to augment existing 
bootloaders with sort of a semi second stage bootloader that would be 
separate from zImage and installed permanently, and then only the zImage 
itself would be updateable.  This way you'd get a DT capable environment 
without replacing the actual bootloader.


Nicolas
