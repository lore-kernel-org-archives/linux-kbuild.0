Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg004.nifty.com ([202.248.44.42]:16656 "EHLO
	conssluserg004-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751020AbbHAGVi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 1 Aug 2015 02:21:38 -0400
MIME-Version: 1.0
In-Reply-To: <1438353109-373-1-git-send-email-ian.campbell@citrix.com>
References: <1438353109-373-1-git-send-email-ian.campbell@citrix.com>
Date: Sat, 1 Aug 2015 15:21:15 +0900
Message-ID: <CAK7LNATj96OKFDTgyPC8Uu0qt=4NQ7ZVeLKEEP3K7-smFP2SCw@mail.gmail.com>
Subject: Re: [PATCH v3] dtb: Create a common home for cross-architecture dtsi files.
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ian Campbell <ian.campbell@citrix.com>
Cc: devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Kristina Martsenko <kristina.martsenko@arm.com>, Kumar Gala <galak@codeaurora.org>, Kevin Hilman <khilman@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

2015-07-31 23:31 GMT+09:00 Ian Campbell <ian.campbell@citrix.com>:
> Commit 9ccd608070b6 "arm64: dts: add device tree for ARM SMM-A53x2 on
> LogicTile Express 20MG" added a new dts file to arch/arm64 which
> included "../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi", i.e. a
> .dtsi supplied by arch/arm.
>
> Unfortunately this causes some issues for the split device tree
> repository[0], since things get moved around there. In that context
> the new .dts ends up at src/arm64/arm/vexpress-v2f-1xv7-ca53x2.dts
> while the include is at src/arm/vexpress-v2m-rs1.dtsi.

Typo?

src/arm64  ->  arch/arm64
src/arm    ->  arch/arm



> The sharing of the .dtsi is legitimate since the baseboard is the same
> for various vexpress systems whatever processor they use.
>
> Rather than using ../../ tricks to pickup .dtsi files from another
> arch this patch creates a new directory include/dt-dtsi as a
> home for such cross-arch .dtsi files, arranges for it to be in the
> include path when the .dts files are processed by cpp and switches the
> .dts files to use cpp #include instead of /include/. The dtsi file
> itself is moved into a vendor subdir in this case "arm" (the vendor,
> not the ARCH=).

As Rob pointed out, this does not match the code.


> [0] https://git.kernel.org/cgit/linux/kernel/git/devicetree/devicetree-rebasing.git/




Nit just in case.

scripts/checkpatch.pl reported 1 error, 1 warning:


ERROR: Please use git commit description style 'commit <12+ chars of
sha1> ("<title line>")' - ie: 'Commit 9ccd608070b6 ("arm64: dts: add
device tree for ARM SMM-A53x2 on LogicTile Express 20MG")'
#23:
Commit 9ccd608070b6 "arm64: dts: add device tree for ARM SMM-A53x2 on

WARNING: Possible unwrapped commit description (prefer a maximum 75
chars per line)
#44:
[0] https://git.kernel.org/cgit/linux/kernel/git/devicetree/devicetree-rebasing.git/

total: 1 errors, 1 warnings, 58 lines checked



The URL should not be split into two lines, so I think the warning can
be ignored.
But I think it is better to fix the error of commit description style.


Apart from the git-description,

Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>


-- 
Best Regards
Masahiro Yamada
