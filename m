Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:62672 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964785AbbJNP5L (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Oct 2015 11:57:11 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM64: dts: vexpress: Use a symlink to vexpress-v2m-rs1.dtsi from arch=arm
Date: Wed, 14 Oct 2015 17:56:27 +0200
Message-ID: <19050561.IRVkypnnKH@wuerfel>
In-Reply-To: <20151012153750.GE7452@leverpostej>
References: <1444046032-31310-1-git-send-email-ian.campbell@citrix.com> <20151012153750.GE7452@leverpostej>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, arm@kernel.org, Pawel Moll <pawel.moll@arm.com>, linux-kbuild@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Kumar Gala <galak@codeaurora.org>, Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Kristina Martsenko <kristina.martsenko@arm.com>, Frank Rowand <frank.rowand@sonymobile.com>, Sudeep Holla <sudeep.holla@arm.com>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>

On Monday 12 October 2015 16:37:50 Mark Rutland wrote:
> On Mon, Oct 05, 2015 at 12:53:52PM +0100, Ian Campbell wrote:
> > Commit 9ccd608070b6 "arm64: dts: add device tree for ARM SMM-A53x2 on
> > LogicTile Express 20MG" added a new dts file to arch/arm64 which
> > included "../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi", i.e. a
> > .dtsi supplied by arch/arm.
> > 
> > Unfortunately this causes some issues for the split device tree
> > repository[0], since things get moved around there. In that context
> > the new .dts ends up at src/arm64/arm/vexpress-v2f-1xv7-ca53x2.dts
> > while the include is at src/arm/vexpress-v2m-rs1.dtsi.
> > 
> > The sharing of the .dtsi is legitimate since the baseboard is the same
> > for various vexpress systems whatever processor they use.
> > 
> > Previously I attempted to resolve this by creating a shared location
> > for such things but we have been unable to come to a consensus on
> > where that should be.
> > 
> > Instead this patch simply replaces the use of ../../ in the dts
> > /include/ with a symlink in arch/arm64/boot/dts/arm pointing to the
> > file arch/arm/boot/dts.
> > 
> > Since the split device tree repo will shortly be required to flatten
> > symlinks for other reasons this will cause the dtsi file to appear in
> > both src/arm and src/arm64 in the split repo, which is an improvement
> > on not building for arm64 now.
> > 
> > [0] https://git.kernel.org/cgit/linux/kernel/git/devicetree/devicetree-rebasing.git/
> > 
> > Signed-off-by: Ian Campbell <ian.campbell@citrix.com>


> Acked-by: Mark Rutland <mark.rutland@arm.com>
> 

Applied to next/dt, thanks!

	Arnd
