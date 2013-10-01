Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:42461 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755452Ab3JACk0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Sep 2013 22:40:26 -0400
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; CHARSET=US-ASCII
Received: from yoda.home ([70.83.209.44]) by VL-VM-MR005.ip.videotron.ca
 (Oracle Communications Messaging Exchange Server 7u4-22.01 64bit (built Apr 21
 2011)) with ESMTP id <0MTY008ASY3C5870@VL-VM-MR005.ip.videotron.ca> for
 linux-kbuild@vger.kernel.org; Mon, 30 Sep 2013 22:40:25 -0400 (EDT)
Date: Mon, 30 Sep 2013 22:40:24 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH RESEND] ARM: add dtbImage.<dt> and dtbuImage.<dt> rules
In-reply-to: <CA+bK7J7=x6=ZsWnSkGByvDLbht9nD6G3wQ5d05P-D96v6udDgg@mail.gmail.com>
Message-id: <alpine.LFD.2.03.1309302230440.6331@syhkavp.arg>
References: <504DFBBF.5010202@free-electrons.com>
 <1348733441-11626-1-git-send-email-richard.genoud@gmail.com>
 <20120927082955.GR17667@game.jcrosoft.org>
 <CACQ1gAgwv4pBFZBrVZiWM2_=OneUO-s16LufSENx27gMC3DUig@mail.gmail.com>
 <52416F97.802@keymile.com> <20130924120152.GI11119@titan.lakedaemon.net>
 <20130924121939.GD12758@n2100.arm.linux.org.uk>
 <CA+bK7J7=x6=ZsWnSkGByvDLbht9nD6G3wQ5d05P-D96v6udDgg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tim Bird <tbird20d@gmail.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Michal Marek <mmarek@suse.cz>, Jason Cooper <jason@lakedaemon.net>, linux-kbuild@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Gerlando Falauto <gerlando.falauto@keymile.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org

On Mon, 30 Sep 2013, Tim Bird wrote:

> What is the long-term mechanism/methodology for creating a kernel
> that runs on a single system?  So many drivers now have device-tree
> dependencies that it seems unlikely we'll be able to avoid using
> device tree.  But if we don't care or don't want to support more than
> a single platform, what should we do (if appending DTB to the zImage
> will eventually go away).  Will the requirement be that all future
> Linux bootloaders will be DT-aware?

The ability to append a DTB to zImage is not going away tomorrow, 
although I encourage you to use another solution if possible.

What can be done on a simple single platform setup is to load the DTB 
from flash into RAM just like another blob along with the ramdisk image 
and the zImage itself.  Then you just have to branch into zImage with 
the address of the DTB in RAM into r2.  Most bootloaders are able to 
load arbitrary binaries into memory, and most bootloaders (except for 
U-Boot) are able to set arbitrary values into r0-r3 before branching to 
some location in memory.


Nicolas
