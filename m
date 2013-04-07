Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]:38607
	"EHLO co9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757035Ab3DGHPp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 7 Apr 2013 03:15:45 -0400
Date: Sun, 7 Apr 2013 15:15:45 +0800
From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [GIT PULL] dt: run C pre-processor on *.dts, create some
 standard headers
Message-ID: <20130407071542.GA4214@S2101-09.ap.freescale.net>
References: <1365187610-29422-1-git-send-email-swarren@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1365187610-29422-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Michal Marek <mmarek@suse.cz>, Grant Likely <glikely@secretlab.ca>, linux-kbuild@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org

On Fri, Apr 05, 2013 at 12:46:50PM -0600, Stephen Warren wrote:
> Rob, it might be worth keeping this in a separate branch in linux-next
> so you can pull it out if it causes any issues. I've been using these
> patches for quite a while now, but there's always opportunity for
> surprises on architectures I don't use. I did just fix a bug when
> building with O= a few days back, hence the V2 that I posted as patches.
> 
> ----------------------------------------------------------------
> 
> This branch enhances the support for running dtc on device tree files.
> 
> A dedicated directory is created for header files that provide constants
> for device-tree bindings.
> 
> The kbuild dependency script processor is enhanced to support processing
> the dependency outputs from multiple separate commands at once.
> 
> The kbuild dtc rule is modified so that the C pre-processor is always
> applied when compiling any device tree.
> 
> Some standard headers are created which define common constants for GPIO,
> IRQ, and ARM GIC device tree bindings.
> 
> ----------------------------------------------------------------
> 
> The following changes since commit 6dbe51c251a327e012439c4772097a13df43c5b8:
> 
>   Linux 3.9-rc1
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.10-dtc-cpp-chroot-std-headers
> 
I just rebuilt my imx/dt branch based on this to avoid all those dts
files renaming.  So regardless of the path it goes to mainline, I will
need it as a dependency in arm-soc tree.

Shawn

> for you to fetch changes up to 4be505d4fc7a07371a2b658469ca1dda99993ca3:
> 
>   ARM: dt: create a DT header for the GIC
> 
> ----------------------------------------------------------------
> 
> Stephen Warren (7):
>       kbuild: create an "include chroot" for DT bindings
>       kbuild: fixdep: support concatenated dep files
>       kbuild: cmd_dtc_cpp: extract deps from both gcc -E and dtc
>       kbuild: always run gcc -E on *.dts, remove cmd_dtc_cpp
>       ARM: dt: add header to define GPIO flags
>       ARM: dt: add header to define IRQ flags
>       ARM: dt: create a DT header for the GIC
> 
>  arch/arm/boot/dts/include/dt-bindings           |    1 +
>  include/dt-bindings/gpio/gpio.h                 |   15 +++
>  .../dt-bindings/interrupt-controller/arm-gic.h  |   22 +++++
>  include/dt-bindings/interrupt-controller/irq.h  |   19 ++++
>  scripts/Makefile.lib                            |   17 ++--
>  scripts/basic/fixdep.c                          |   93 ++++++++++++------
>  6 files changed, 125 insertions(+), 42 deletions(-)
>  create mode 120000 arch/arm/boot/dts/include/dt-bindings
>  create mode 100644 include/dt-bindings/gpio/gpio.h
>  create mode 100644 include/dt-bindings/interrupt-controller/arm-gic.h
>  create mode 100644 include/dt-bindings/interrupt-controller/irq.h
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss

