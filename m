Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:47503 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753255Ab3BUKh0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Feb 2013 05:37:26 -0500
Date: Thu, 21 Feb 2013 10:37:06 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC] Kbuild support for ARM FIT images
Message-ID: <20130221103705.GB17852@n2100.arm.linux.org.uk>
References: <CAD=GYpbF_3uRzhUnV=MwDiy-ekvZKJztJbkhNM0u_pvG-UCw4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=GYpbF_3uRzhUnV=MwDiy-ekvZKJztJbkhNM0u_pvG-UCw4w@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joel A Fernandes <agnel.joel@gmail.com>
Cc: u-boot@lists.denx.de, Linux OMAP List <linux-omap@vger.kernel.org>, linux-kbuild@vger.kernel.org, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, tony@atomide.com, "Fernandes, Joel A" <joelagnel@ti.com>, "Rini, Tom" <trini@ti.com>, Grant Likely <glikely@secretlab.ca>, Grant Likely <grant.likely@secretlab.ca>

On Wed, Feb 20, 2013 at 07:37:10PM -0600, Joel A Fernandes wrote:
> Hello,
> I've been spinning some work-in-progress patches for FIT build support
> in the kernel.
> With the move to multiplatform support on OMAP, I feel it is a good
> time to add  FIT support, also looking at the proliferating number of
> dtbs, as it is a nice way

I'm not looking to add yet another crappy uboot image format to the kernel
just for the hell of uboot.

And don't think that the dtbs in the kernel are going to stay there.  The
longer term plan is for them to end up in an external git tree, entirely
separate from the kernel source.  So anything that ties them with the
kernel build process will ultimately have to be removed again.
