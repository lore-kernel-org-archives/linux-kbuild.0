Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yk0-f173.google.com ([209.85.160.173]:35932 "EHLO
	mail-yk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753583AbbG2PX4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Jul 2015 11:23:56 -0400
MIME-Version: 1.0
In-Reply-To: <1438176174.11600.198.camel@citrix.com>
References: <1437993343-9542-1-git-send-email-ian.campbell@citrix.com>
 <CAK7LNAQKswPzeFYdSVq3JDk2qawZ8e5ogBFMWdor-CibMovU3g@mail.gmail.com> <1438176174.11600.198.camel@citrix.com>
From: Rob Herring <robherring2@gmail.com>
Date: Wed, 29 Jul 2015 10:23:36 -0500
Message-ID: <CAL_JsqL7KRcSv5jSneWYj1PJOYbvMQ8HOAGK+w-+MDBMpMatow@mail.gmail.com>
Subject: Re: [PATCH v2] dtb: Create a common home for cross-architecture dtsi files.
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ian Campbell <ian.campbell@citrix.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Kristina Martsenko <kristina.martsenko@arm.com>, Kumar Gala <galak@codeaurora.org>, Kevin Hilman <khilman@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Wed, Jul 29, 2015 at 8:22 AM, Ian Campbell <ian.campbell@citrix.com> wrote:
> On Wed, 2015-07-29 at 20:07 +0900, Masahiro Yamada wrote:
>> Hi Ian,
>>
>>
>> 2015-07-27 19:35 GMT+09:00 Ian Campbell <ian.campbell@citrix.com>:
>> > Commit 9ccd608070b6 "arm64: dts: add device tree for ARM SMM-A53x2 on
>> > LogicTile Express 20MG" added a new dts file to arch/arm64 which
>> > included "../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi", i.e. a
>> > .dtsi supplied by arch/arm.
>> >
>> > Unfortunately this causes some issues for the split device tree
>> > repository[0], since things get moved around there. In that context
>> > the new .dts ends up at src/arm64/arm/vexpress-v2f-1xv7-ca53x2.dts
>> > while the include is at src/arm/vexpress-v2m-rs1.dtsi.
>> >
>> > The sharing of the .dtsi is legitimate since the baseboard is the same
>> > for various vexpress systems whatever processor they use.
>> >
>> > Rather than using ../../ tricks to pickup .dtsi files from another
>> > arch this patch creates a new directory include/dt-dtsi as a
>> > home for such cross-arch .dtsi files, arranges for it to be in the
>> > include path when the .dts files are processed by cpp and switches the
>>
>>
>> "include/dt-dtsi/"  can be referenced from normal C sources.
>>
>> I think another possible home for cross-arch DTSI is "kernel/dts/".
>> This directory can be hidden from C sources.
>
> I suppose, I don't really mind and will follow the direction of the other
> DTB maintainers. It doesn't seem like a big deal to me.

Seems fine to me. We might think of other things to put here that are
not includes. Overlays perhaps?

>
>> >@@ -223,7 +223,7 @@ Example of a VE tile description (simplified)
>> >                 /* Active high IRQ 0 is connected to GIC's SPI0 */
>> >                 interrupt-map = <0 0 0 &gic 0 0 4>;
>> >
>> > -               /include/ "vexpress-v2m-rs1.dtsi"
>> > +               #include <arm/vexpress-v2m-rs1.dtsi>
>> >         };
>> >  };
>>
>>
>>
>> You do not have to replace /include/ with #include,
>> if you add the include path for DTC.
>
> Ah, I looked for this but -i is not documented in the man page.
>
> Is there any reason to prefer one over the other?

Yes, so you don't force the use of the C preprocessor.

Rob
