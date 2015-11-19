Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:50492 "EHLO
	relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751221AbbKSQEL convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Nov 2015 11:04:11 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH] ARM: xip: Move XIP linking to a separate file
Date: Thu, 19 Nov 2015 16:04:03 +0000
Message-ID: <HK2PR06MB0561F1A746E04D0A205B2DBB8A1B0@HK2PR06MB0561.apcprd06.prod.outlook.com>
References: <1447943047-22427-1-git-send-email-chris.brandt@renesas.com>
 <alpine.LFD.2.20.1511191050080.22569@knanqh.ubzr>
In-Reply-To: <alpine.LFD.2.20.1511191050080.22569@knanqh.ubzr>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>, "mmarek@suse.com" <mmarek@suse.com>
Cc: "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>

On Thu, 19 Nov 2015, Michal Marek wrote:
> Why not have a vmlinux.lds.S and #include a vmlinux-xip.lds.S / 
> vmlinux-nonxip.lds.S from there? That way, you do not clutter the
> main Makefile and you can reuse the boilerplate of the linker script.
> 
> Michal

On Thu, 19 Nov 2015, Nicolas Pitre wrote:
> I agree with Michal's suggestion to do the selection locally with an
> include.


That's actually how I started out locally, but I thought if I tried submitting that, I'd get a bunch of "Eww, that's ugly".
I'm happy to redo the patch and contain the dysfunctionalism of XIP to the ARM tree.

Chris

