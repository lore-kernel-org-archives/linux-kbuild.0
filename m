Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:19147 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755417Ab3JADVW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Sep 2013 23:21:22 -0400
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; CHARSET=US-ASCII
Received: from yoda.home ([70.83.209.44]) by VL-VM-MR001.ip.videotron.ca
 (Oracle Communications Messaging Exchange Server 7u4-22.01 64bit (built Apr 21
 2011)) with ESMTP id <0MTY00D5EZZL4T60@VL-VM-MR001.ip.videotron.ca> for
 linux-kbuild@vger.kernel.org; Mon, 30 Sep 2013 23:21:21 -0400 (EDT)
Date: Mon, 30 Sep 2013 23:21:20 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH RESEND] ARM: add dtbImage.<dt> and dtbuImage.<dt> rules
In-reply-to: <CAL_JsqJ4Fn93ULo1sAA=8VUm33XkKY9iVpdqjQm6jh0s4pNFBw@mail.gmail.com>
Message-id: <alpine.LFD.2.03.1309302316580.6331@syhkavp.arg>
References: <504DFBBF.5010202@free-electrons.com>
 <1348733441-11626-1-git-send-email-richard.genoud@gmail.com>
 <20120927082955.GR17667@game.jcrosoft.org>
 <CACQ1gAgwv4pBFZBrVZiWM2_=OneUO-s16LufSENx27gMC3DUig@mail.gmail.com>
 <52416F97.802@keymile.com> <20130924120152.GI11119@titan.lakedaemon.net>
 <20130924121939.GD12758@n2100.arm.linux.org.uk>
 <CA+bK7J7=x6=ZsWnSkGByvDLbht9nD6G3wQ5d05P-D96v6udDgg@mail.gmail.com>
 <CAL_JsqJ4Fn93ULo1sAA=8VUm33XkKY9iVpdqjQm6jh0s4pNFBw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: Tim Bird <tbird20d@gmail.com>, Michal Marek <mmarek@suse.cz>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, linux-kbuild@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Gerlando Falauto <gerlando.falauto@keymile.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, 30 Sep 2013, Rob Herring wrote:

> I don't think appended DTB will go away. In fact, use of it is now
> being added to flash-kernel in debian/ubuntu. However, this is only
> done at OS install time on running on the h/w.

Excellent!  That is exactly the use case this feature was designed for.  
Otherwise we would simply have linked the DTB into the kernel image 
directly.

Appending a DTB to zImage should be done at kernel installation time, 
not at build time.  The nuance might not mean a lot for some 
environment, but for a distro this is clearly separate operations.


Nicolas
