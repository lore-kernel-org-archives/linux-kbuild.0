Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:44581 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751904AbbGXLcR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 24 Jul 2015 07:32:17 -0400
Date: Fri, 24 Jul 2015 12:31:49 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] dtb: Create a common home for cross-architecture dtsi
 files.
Message-ID: <20150724113149.GE4348@leverpostej>
References: <1437496204-5438-1-git-send-email-ian.campbell@citrix.com>
 <20150722084753.GC14923@e106497-lin.cambridge.arm.com>
 <1437558438.8383.72.camel@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437558438.8383.72.camel@citrix.com>
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Ian.Campbell@citrix.com" <Ian.Campbell@citrix.com>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Kumar Gala <galak@codeaurora.org>, Sudeep Holla <Sudeep.Holla@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Kristina Martsenko <Kristina.Martsenko@arm.com>, Kevin Hilman <khilman@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

On Wed, Jul 22, 2015 at 10:47:18AM +0100, Ian Campbell wrote:
> On Wed, 2015-07-22 at 09:47 +0100, Liviu Dudau wrote:
> > 
> > Acked-by: Liviu Dudau <Liviu.Dudau@arm.com>
> 
> Thanks.
> 
> > Picking your brains here: would it be worth to have some vendor directories in
> > this shared area or we can hope that there will be very few files living here?
> 
> I'm honestly not sure.
> 
> I don't expect there will be very many files under here, and I would
> expect the norm would be that common .dtsi files used by multiple
> arches would be things from the same vendor, but I don't think we can
> guarantee that.

I'm not so sure that this area will remain small. I suspect we'll see
a reasonable amount of sharing for arm/arm64 where two SoCs differ sith
s/Cortex-A7/Cortex-A53/, for example.

Perhaps we could wait until the that starts to happen; we managed to
survive for a while before moving arm64's dts into subdirs.

Mark.
