Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:62442 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757719Ab2AKTiA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Jan 2012 14:38:00 -0500
Subject: Re: [PATCH 2/2] Kbuild: Use dtc's -d (dependency) option
From: Mark Salter <msalter@redhat.com>
Date: Wed, 11 Jan 2012 14:36:21 -0500
In-Reply-To: <1326134295-15547-2-git-send-email-swarren@nvidia.com>
References: <1326134295-15547-1-git-send-email-swarren@nvidia.com>
	 <1326134295-15547-2-git-send-email-swarren@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <1326310587.2535.291.camel@deneb.redhat.com>
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Warren <swarren@nvidia.com>
Cc: Michal Marek <mmarek@suse.cz>, Jon Loeliger <jdl@jdl.com>, David Gibson <david@gibson.dropbear.id.au>, Russell King <linux@arm.linux.org.uk>, Aurelien Jacquiot <a-jacquiot@ti.com>, Michal Simek <monstr@monstr.eu>, Jonas Bonn <jonas@southpole.se>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-c6x-dev@linux-c6x.org, microblaze-uclinux@itee.uq.edu.au, linux@openrisc.net, linuxppc-dev@lists.ozlabs.org, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>

On Mon, 2012-01-09 at 11:38 -0700, Stephen Warren wrote:
> This hooks dtc into Kbuild's dependency system.
> 
> Thus, for example, "make dtbs" will rebuild tegra-harmony.dtb if only
> tegra20.dtsi has changed yet tegra-harmony.dts has not. The previous
> lack of this feature recently caused me to have very confusing "git
> bisect" results.
> 
> For ARM, it's obvious what to add to $(targets). I'm not familiar enough
> with other architectures to know what to add there. Powerpc appears to
> already add various .dtb files into $(targets), but the other archs may
> need something added to $(targets) to work.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> 

Acked-by: Mark Salter <msalter@redhat.com>

For the arch/c6x bit.


