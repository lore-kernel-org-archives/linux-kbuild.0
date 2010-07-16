Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:64676 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759161Ab0GPULh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Jul 2010 16:11:37 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH] Kconfig: Enable Kconfig fragments to be used for defconfig
Date: Fri, 16 Jul 2010 22:11:31 +0200
References: <20100713230352.6781.18644.stgit@angua> <alpine.LFD.2.00.1007161439240.10598@xanadu.home> <AANLkTikqHnyFVJF0Pzwy2xtKeNSXYAPFdPkAkLiXK8Ls@mail.gmail.com>
In-Reply-To: <AANLkTikqHnyFVJF0Pzwy2xtKeNSXYAPFdPkAkLiXK8Ls@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201007162211.31973.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nicolas Pitre <nico@fluxnic.net>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Grant Likely <grant.likely@secretlab.ca>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, Daniel Walker <dwalker@codeaurora.org>, Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>

On Friday 16 July 2010 20:46:17 Linus Torvalds wrote:
> Maybe a full "solver" is unnecessary, for example, but just a simple
> "automatically enable the direct dependencies and scream when it's not
> simple any more" would take care of 99% of the common cases, and then
> warn when it needs some manual help.

I think the recursion should also be limited to cases where the
dependency is a valid selectable option, i.e. not for

# this architecture does not support MMIO
config HAS_IOMEM 
	def_bool 'n'

config PCI
	bool "PCI Device drivers"
	depends on HAS_IOMEM

config FOO
	tristate "Some device driver"
	depends on PCI

In this case, it would be straightforward for the solver to enable PCI
for when something selects CONFIG_FOO, but it should print a warning
if this is attempted while HAS_IOMEM is unconditionally disabled,
since that puts it into the "not simple" category.

	Arnd
