Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg004.nifty.com ([202.248.44.42]:34322 "EHLO
	conssluserg004-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751636AbbGaFqg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 31 Jul 2015 01:46:36 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNAS_P65k3T_J_vXZ9dxBB-uVbrTW-qFE_fJEOSLcOW4JsA@mail.gmail.com>
References: <1437993343-9542-1-git-send-email-ian.campbell@citrix.com>
	<CAK7LNAQKswPzeFYdSVq3JDk2qawZ8e5ogBFMWdor-CibMovU3g@mail.gmail.com>
	<1438176174.11600.198.camel@citrix.com>
	<CAL_JsqL7KRcSv5jSneWYj1PJOYbvMQ8HOAGK+w-+MDBMpMatow@mail.gmail.com>
	<CAK7LNAS_P65k3T_J_vXZ9dxBB-uVbrTW-qFE_fJEOSLcOW4JsA@mail.gmail.com>
Date: Fri, 31 Jul 2015 14:46:18 +0900
Message-ID: <CAK7LNAQ4hT133v0iH7z6JxfaBDjrGgaX2M9pA9H=sPxsmorDNw@mail.gmail.com>
Subject: Re: [PATCH v2] dtb: Create a common home for cross-architecture dtsi files.
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: Ian Campbell <ian.campbell@citrix.com>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Kumar Gala <galak@codeaurora.org>, Liviu Dudau <liviu.dudau@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Kristina Martsenko <kristina.martsenko@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Kevin Hilman <khilman@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi.

2015-07-30 10:30 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Hi,
>
>
> 2015-07-30 0:23 GMT+09:00 Rob Herring <robherring2@gmail.com>:
>> On Wed, Jul 29, 2015 at 8:22 AM, Ian Campbell <ian.campbell@citrix.com> wrote:
>>> On Wed, 2015-07-29 at 20:07 +0900, Masahiro Yamada wrote:
>>>> Hi Ian,
>>>>
>>>>
>>>> 2015-07-27 19:35 GMT+09:00 Ian Campbell <ian.campbell@citrix.com>:
>>>> > Commit 9ccd608070b6 "arm64: dts: add device tree for ARM SMM-A53x2 on
>>>> > LogicTile Express 20MG" added a new dts file to arch/arm64 which
>>>> > included "../../../../arm/boot/dts/vexpress-v2m-rs1.dtsi", i.e. a
>>>> > .dtsi supplied by arch/arm.



BTW, is there any chance to merge arch/arm64 and arch/arm in the future?

For example, U-boot supports ARM64/32 in a single arch directory, arch/arm/.


I guess, the cross-arch home directory for DTSI would be only used to
share device trees between arm64 and arm32.





-- 
Best Regards
Masahiro Yamada
