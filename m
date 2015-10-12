Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.citrix.com ([66.165.176.89]:10575 "EHLO SMTP.CITRIX.COM"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751337AbbJLNES (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 12 Oct 2015 09:04:18 -0400
Message-ID: <1444655053.1410.540.camel@citrix.com>
Subject: Re: [PATCH] ARM64: dts: vexpress: Use a symlink to
 vexpress-v2m-rs1.dtsi from arch=arm
From: Ian Campbell <ian.campbell@citrix.com>
Date: Mon, 12 Oct 2015 14:04:13 +0100
In-Reply-To: <1444046032-31310-1-git-send-email-ian.campbell@citrix.com>
References: <1444046032-31310-1-git-send-email-ian.campbell@citrix.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Kristina Martsenko <kristina.martsenko@arm.com>, Kevin Hilman <khilman@linaro.org>, Frank Rowand <frank.rowand@sonymobile.com>, Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2015-10-05 at 12:53 +0100, Ian Campbell wrote:

Ping?

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
> [0] https://git.kernel.org/cgit/linux/kernel/git/devicetree/devicetree-re
> basing.git/
> 
> Signed-off-by: Ian Campbell <ian.campbell@citrix.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Kristina Martsenko <kristina.martsenko@arm.com>
> Cc: Kevin Hilman <khilman@linaro.org>
> Cc: Frank Rowand <frank.rowand@sonymobile.com>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: arm@kernel.org
> Cc: linux-kbuild@vger.kernel.org
> ---
> For more on flattening symlinks see
> http://thread.gmane.org/gmane.linux.kernel.input/45646/focus=45742
> ---
>  arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts | 2 +-
>  arch/arm64/boot/dts/arm/vexpress-v2m-rs1.dtsi        | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  create mode 120000 arch/arm64/boot/dts/arm/vexpress-v2m-rs1.dtsi
> 
> diff --git a/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
> b/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
> index 5b1d018..bb3c26d 100644
> --- a/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
> +++ b/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
> @@ -186,6 +186,6 @@
>  				<0 0 41 &gic GIC_SPI 41
> IRQ_TYPE_LEVEL_HIGH>,
>  				<0 0 42 &gic GIC_SPI 42
> IRQ_TYPE_LEVEL_HIGH>;
>  
> -		/include/ "../../../../arm/boot/dts/vexpress-v2m
> -rs1.dtsi"
> +		/include/ "vexpress-v2m-rs1.dtsi"
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/arm/vexpress-v2m-rs1.dtsi
> b/arch/arm64/boot/dts/arm/vexpress-v2m-rs1.dtsi
> new file mode 120000
> index 0000000..68fd0f8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/arm/vexpress-v2m-rs1.dtsi
> @@ -0,0 +1 @@
> +../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi
> \ No newline at end of file
