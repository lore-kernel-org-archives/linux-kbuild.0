Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.citrix.com ([66.165.176.89]:46826 "EHLO SMTP.CITRIX.COM"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753696AbbGVJrV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Jul 2015 05:47:21 -0400
Message-ID: <1437558438.8383.72.camel@citrix.com>
Subject: Re: [PATCH] dtb: Create a common home for cross-architecture dtsi
 files.
From: Ian Campbell <ian.campbell@citrix.com>
Date: Wed, 22 Jul 2015 10:47:18 +0100
In-Reply-To: <20150722084753.GC14923@e106497-lin.cambridge.arm.com>
References: <1437496204-5438-1-git-send-email-ian.campbell@citrix.com>
	 <20150722084753.GC14923@e106497-lin.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Sudeep Holla <Sudeep.Holla@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Kristina Martsenko <Kristina.Martsenko@arm.com>, Kevin Hilman <khilman@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

On Wed, 2015-07-22 at 09:47 +0100, Liviu Dudau wrote:
> 
> Acked-by: Liviu Dudau <Liviu.Dudau@arm.com>

Thanks.

> Picking your brains here: would it be worth to have some vendor directories in
> this shared area or we can hope that there will be very few files living here?

I'm honestly not sure.

I don't expect there will be very many files under here, and I would
expect the norm would be that common .dtsi files used by multiple
arches would be things from the same vendor, but I don't think we can
guarantee that.

Ian.
