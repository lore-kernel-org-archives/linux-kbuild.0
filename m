Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from jdl.com ([208.123.74.7]:35515 "EHLO jdl.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933288Ab2AITmL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Jan 2012 14:42:11 -0500
Message-Id: <E1RkKQN-0000nM-2c@jdl.com>
Subject: Re: [PATCH 1/2] dtc: Implement -d option to write out a dependency file
In-reply-to: <1326134295-15547-1-git-send-email-swarren@nvidia.com>
References: <1326134295-15547-1-git-send-email-swarren@nvidia.com>
Date: Mon, 09 Jan 2012 12:58:27 -0600
From: Jon Loeliger <jdl@jdl.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Warren <swarren@nvidia.com>
Cc: Michal Marek <mmarek@suse.cz>, David Gibson <david@gibson.dropbear.id.au>, Jonas Bonn <jonas@southpole.se>, Michal Simek <monstr@monstr.eu>, Russell King <linux@arm.linux.org.uk>, linux-c6x-dev@linux-c6x.org, Arnd Bergmann <arnd@arndb.de>, Aurelien Jacquiot <a-jacquiot@ti.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, microblaze-uclinux@itee.uq.edu.au, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Paul Mackerras <paulus@samba.org>, Mark Salter <msalter@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux@lists.openrisc.net, linux-arm-kernel@lists.infradead.org

> This will allow callers to rebuild .dtb files when any of the /include/d
> .dtsi files are modified, not just the top-level .dts file.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> This patch is against the Linux kernel's copy of dtc, but it applies to
> upstream dtc with a couple of trivial conflicts. I can post a version for
> upstream dtc as well if desired.

If it does go upstream into Linux proper, we should
definitely have it in the main DTC repository.
So if you would, please send me a path that applies there.

Thanks,
jdl

