Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ns.iliad.fr ([212.27.33.1]:41780 "EHLO ns.iliad.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755594Ab3I3VHr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Sep 2013 17:07:47 -0400
Message-ID: <1380575265.23932.11.camel@sakura.staff.proxad.net>
Subject: Re: [PATCH RESEND] ARM: add dtbImage.<dt> and dtbuImage.<dt> rules
From: Maxime Bizon <mbizon@freebox.fr>
Reply-To: mbizon@freebox.fr
Date: Mon, 30 Sep 2013 23:07:45 +0200
In-Reply-To: <20130930204223.GJ31178@titan.lakedaemon.net>
References: <504DFBBF.5010202@free-electrons.com>
	 <1348733441-11626-1-git-send-email-richard.genoud@gmail.com>
	 <20120927082955.GR17667@game.jcrosoft.org>
	 <CACQ1gAgwv4pBFZBrVZiWM2_=OneUO-s16LufSENx27gMC3DUig@mail.gmail.com>
	 <52416F97.802@keymile.com> <20130924120152.GI11119@titan.lakedaemon.net>
	 <20130924121939.GD12758@n2100.arm.linux.org.uk>
	 <1380572483.31472.51.camel@sakura.staff.proxad.net>
	 <20130930204223.GJ31178@titan.lakedaemon.net>
Content-Type: text/plain; charset="ANSI_X3.4-1968"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>
Cc: Michal Marek <mmarek@suse.cz>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-kbuild@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Gerlando Falauto <gerlando.falauto@keymile.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org


On Mon, 2013-09-30 at 16:42 -0400, Jason Cooper wrote:

> Nicolas Pitre already suggested an impedance matcher that keeps this
> kind of hacky code out of the kernel, and allows users to do exactly

I know that, my proposal was to bring this back into the kernel.

That "kind of hacky" ATAG thing was actually the only supported way to
boot a platform not so long ago :)

In the end, people needing the impedance matcher will somehow integrate
it in the kernel build system anyway.

-- 
Maxime


