Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.wow.synacor.com ([64.8.70.55]:40210 "EHLO
	smtp.mail.wowway.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751427Ab2LSHWN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 19 Dec 2012 02:22:13 -0500
Date: Wed, 19 Dec 2012 02:22:11 -0500
From: Paul Thompson <set.mailinglist@gmail.com>
Subject: SPARSE_IRQ
Message-ID: <20121219072211.GE2939@squish.home.loc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

	Hi;

	Perhaps Im being an idiot, but it looks to me like the
menu-item for SPARSE_IRQ (under General setup -> IRQ subsystem)
depends solely on MAY_HAVE_SPARSE_IRQ, but I only see *one* user
for that in the kernel now, the SuperH arch (arch/sh/Kconfig). It
looks like everyone else explicitly sets SPARSE_IRQ. However the
menu-items description implies it is a more generic option...
	It seems like this menu item used to appear, in a forced
on state, then this condition made it disapear, leaving a blank
IRQ subsystem menu for me. I was trying to work around that, but
now, I am not sure exactly what is supposed to be going on here...

Paul

(from kernel/irq/Kconfig)
config SPARSE_IRQ
        bool "Support sparse irq numbering" if MAY_HAVE_SPARSE_IRQ
        ---help---

          Sparse irq numbering is useful for distro kernels that want
          to define a high CONFIG_NR_CPUS value but still want to have
          low kernel memory footprint on smaller machines.

          ( Sparse irqs can also be beneficial on NUMA boxes, as they spread
            out the interrupt descriptors in a more NUMA-friendly way. )

          If you don't know what to do here, say N.

