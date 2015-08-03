Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp02.citrix.com ([66.165.176.63]:25462 "EHLO
	SMTP02.CITRIX.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753255AbbHCQEP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 3 Aug 2015 12:04:15 -0400
Message-ID: <1438617839.31129.30.camel@citrix.com>
Subject: Re: [PATCH v4] dtb: Create a common home for cross-architecture
 dtsi files.
From: Ian Campbell <ian.campbell@citrix.com>
Date: Mon, 3 Aug 2015 17:03:59 +0100
In-Reply-To: <CAL_JsqLU_CMaYN=FpVdeenVYgvBNDUQsqvi=uwuENOk=pt0WZQ@mail.gmail.com>
References: <1438592111-8471-1-git-send-email-ian.campbell@citrix.com>
	 <CAL_JsqLU_CMaYN=FpVdeenVYgvBNDUQsqvi=uwuENOk=pt0WZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kristina Martsenko <kristina.martsenko@arm.com>, Kevin Hilman <khilman@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, 2015-08-03 at 10:55 -0500, Rob Herring wrote:
> On Mon, Aug 3, 2015 at 3:55 AM, Ian Campbell <ian.campbell@citrix.com> 
> wrote:
> > Commit 9ccd608070b6 ("arm64: dts: add device tree for ARM SMM-A53x2 on
> > LogicTile Express 20MG") added a new dts file to arch/arm64 which
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
> > Rather than using ../../ tricks to pickup .dtsi files from another
> > arch this patch creates a new directory kernel/dts as a home for such
> > cross-arch .dtsi files, arranges for it to be in the include path when
> > the .dts files are processed by cpp and switches the .dts files to use
> > cpp #include instead of /include/. The dtsi file itself is moved into
> > a vendor subdir in this case "arm" (the vendor, not the ARCH=).
> 
> Sigh, it was not the include path I was referring to being wrong
> although that was too. It was the part about using #include instead of
> /include/.

Damn, how did I miss that!

v5 coming up, sorry :-/

