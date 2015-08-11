Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg002.nifty.com ([202.248.44.40]:57159 "EHLO
	conssluserg002-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750710AbbHKEAZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 11 Aug 2015 00:00:25 -0400
MIME-Version: 1.0
In-Reply-To: <1438617993-1012-1-git-send-email-ian.campbell@citrix.com>
References: <1438617993-1012-1-git-send-email-ian.campbell@citrix.com>
Date: Tue, 11 Aug 2015 13:00:06 +0900
Message-ID: <CAK7LNARyEbnOWTis0Nx9zwTcwH_s3GZKg2XYG3+zLnf=FhhctA@mail.gmail.com>
Subject: Re: [PATCH v4] dtb: Create a common home for cross-architecture dtsi files.
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ian Campbell <ian.campbell@citrix.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kristina Martsenko <kristina.martsenko@arm.com>, Kevin Hilman <khilman@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi

2015-08-04 1:06 GMT+09:00 Ian Campbell <ian.campbell@citrix.com>:
> Commit 9ccd608070b6 ("arm64: dts: add device tree for ARM SMM-A53x2 on
> LogicTile Express 20MG") added a new dts file to arch/arm64 which
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
> Rather than using ../../ tricks to pickup .dtsi files from another
> arch this patch creates a new directory kernel/dts as a home for such
> cross-arch .dtsi files and arranges for it to be in the include path
> for both dtc and cpp. The dtsi file itself is moved into a vendor
> subdir in this case "arm" (the vendor, not the ARCH=).


Question:
If this patch is applied, which directory will be created in
device-tree-rebasing?
src/kernel/, src/common/, or something else?
Either will do, of course.


Another nit:
I just noticed a period at the end of the commit subject.
Re-post would not be needed only for such a minor thing,
but please try best to remember to drop it when this patch is applied.




-- 
Best Regards
Masahiro Yamada
