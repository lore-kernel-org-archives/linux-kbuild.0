Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:47927 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751073AbbJLPHT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 12 Oct 2015 11:07:19 -0400
Date: Mon, 12 Oct 2015 16:07:13 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] ARM64: dts: vexpress: Use a symlink to
 vexpress-v2m-rs1.dtsi from arch=arm
Message-ID: <20151012150713.GB6320@e104818-lin.cambridge.arm.com>
References: <1444046032-31310-1-git-send-email-ian.campbell@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444046032-31310-1-git-send-email-ian.campbell@citrix.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ian Campbell <ian.campbell@citrix.com>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, linux-kbuild@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Will Deacon <will.deacon@arm.com>, arm@kernel.org, Rob Herring <robh+dt@kernel.org>, Kristina Martsenko <kristina.martsenko@arm.com>, Frank Rowand <frank.rowand@sonymobile.com>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org

On Mon, Oct 05, 2015 at 12:53:52PM +0100, Ian Campbell wrote:
> Commit 9ccd608070b6 "arm64: dts: add device tree for ARM SMM-A53x2 on
> LogicTile Express 20MG" added a new dts file to arch/arm64 which
> included "../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi", i.e. a
> .dtsi supplied by arch/arm.
> 
> Unfortunately this causes some issues for the split device tree
> repository[0], since things get moved around there. In that context
> the new .dts ends up at src/arm64/arm/vexpress-v2f-1xv7-ca53x2.dts
> while the include is at src/arm/vexpress-v2m-rs1.dtsi.
> 
> The sharing of the .dtsi is legitimate since the baseboard is the same
> for various vexpress systems whatever processor they use.
> 
> Previously I attempted to resolve this by creating a shared location
> for such things but we have been unable to come to a consensus on
> where that should be.
> 
> Instead this patch simply replaces the use of ../../ in the dts
> /include/ with a symlink in arch/arm64/boot/dts/arm pointing to the
> file arch/arm/boot/dts.
> 
> Since the split device tree repo will shortly be required to flatten
> symlinks for other reasons this will cause the dtsi file to appear in
> both src/arm and src/arm64 in the split repo, which is an improvement
> on not building for arm64 now.
> 
> [0] https://git.kernel.org/cgit/linux/kernel/git/devicetree/devicetree-rebasing.git/

I don't have any objections but these patches usually go in via the
arm-soc tree.

-- 
Catalin
