Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.citrix.com ([66.165.176.89]:2104 "EHLO SMTP.CITRIX.COM"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750827AbbG2NXB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Jul 2015 09:23:01 -0400
Message-ID: <1438176174.11600.198.camel@citrix.com>
Subject: Re: [PATCH v2] dtb: Create a common home for cross-architecture
 dtsi files.
From: Ian Campbell <ian.campbell@citrix.com>
Date: Wed, 29 Jul 2015 14:22:54 +0100
In-Reply-To: <CAK7LNAQKswPzeFYdSVq3JDk2qawZ8e5ogBFMWdor-CibMovU3g@mail.gmail.com>
References: <1437993343-9542-1-git-send-email-ian.campbell@citrix.com>
	 <CAK7LNAQKswPzeFYdSVq3JDk2qawZ8e5ogBFMWdor-CibMovU3g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Kristina Martsenko <kristina.martsenko@arm.com>, Kumar Gala <galak@codeaurora.org>, Kevin Hilman <khilman@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Wed, 2015-07-29 at 20:07 +0900, Masahiro Yamada wrote:
> Hi Ian,
> 
> 
> 2015-07-27 19:35 GMT+09:00 Ian Campbell <ian.campbell@citrix.com>:
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
> > Rather than using ../../ tricks to pickup .dtsi files from another
> > arch this patch creates a new directory include/dt-dtsi as a
> > home for such cross-arch .dtsi files, arranges for it to be in the
> > include path when the .dts files are processed by cpp and switches the
> 
> 
> "include/dt-dtsi/"  can be referenced from normal C sources.
> 
> I think another possible home for cross-arch DTSI is "kernel/dts/".
> This directory can be hidden from C sources.

I suppose, I don't really mind and will follow the direction of the other
DTB maintainers. It doesn't seem like a big deal to me.

> >@@ -223,7 +223,7 @@ Example of a VE tile description (simplified)
> >                 /* Active high IRQ 0 is connected to GIC's SPI0 */
> >                 interrupt-map = <0 0 0 &gic 0 0 4>;
> > 
> > -               /include/ "vexpress-v2m-rs1.dtsi"
> > +               #include <arm/vexpress-v2m-rs1.dtsi>
> >         };
> >  };
> 
> 
> 
> You do not have to replace /include/ with #include,
> if you add the include path for DTC.

Ah, I looked for this but -i is not documented in the man page.

Is there any reason to prefer one over the other?

> Please add include path for DTC too
> so that both /include/ and #include are available.

OK.

I shall await further feedback on what path to use before spinning a v3.

Ian.

> 
> 
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 79e8661..fc6c06c 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -285,7 +285,7 @@ quiet_cmd_dtc = DTC     $@
>  cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
>         $(CPP) $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; 
> \
>         $(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 \
> -               -i $(dir $<) $(DTC_FLAGS) \
> +               -i $(dir $<) -i $(srctree)/kernel/dts $(DTC_FLAGS) \
>                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
>         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
> 
> 
> 
> 
