Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:12520 "EHLO
	relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S933201AbbKSQ0P convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Nov 2015 11:26:15 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH] ARM: xip: Move XIP linking to a separate file
Date: Thu, 19 Nov 2015 16:26:11 +0000
Message-ID: <HK2PR06MB0561EC19AE06D509A4E408B98A1B0@HK2PR06MB0561.apcprd06.prod.outlook.com>
References: <1447943047-22427-1-git-send-email-chris.brandt@renesas.com>
 <alpine.LFD.2.20.1511191050080.22569@knanqh.ubzr>
 <HK2PR06MB0561F1A746E04D0A205B2DBB8A1B0@HK2PR06MB0561.apcprd06.prod.outlook.com>
 <564DF6F2.5090808@suse.com>
In-Reply-To: <564DF6F2.5090808@suse.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicolas Pitre <nico@fluxnic.net>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>

On Thu, 19 Nov 2015, Michal Marek wrote:
> UM even uses it in its linker script:
> 
> arch/um/kernel/vmlinux.lds.S:#include "uml.lds.S"
> arch/um/kernel/vmlinux.lds.S:#include "dyn.lds.S"


"When in Rome, ..."


