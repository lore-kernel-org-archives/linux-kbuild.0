Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:46142 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751848Ab3BWIiC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 23 Feb 2013 03:38:02 -0500
MIME-Version: 1.0
In-Reply-To: <20130221103705.GB17852@n2100.arm.linux.org.uk>
References: <CAD=GYpbF_3uRzhUnV=MwDiy-ekvZKJztJbkhNM0u_pvG-UCw4w@mail.gmail.com>
	<20130221103705.GB17852@n2100.arm.linux.org.uk>
Date: Sat, 23 Feb 2013 02:38:01 -0600
Message-ID: <CAD=GYpY4eTsRyYtbtoG-2TuSqOyXAANgjazpWDNE2B36Z6aokw@mail.gmail.com>
Subject: Re: [RFC] Kbuild support for ARM FIT images
From: Joel A Fernandes <agnel.joel@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: u-boot@lists.denx.de, Linux OMAP List <linux-omap@vger.kernel.org>, linux-kbuild@vger.kernel.org, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, tony@atomide.com, "Fernandes, Joel A" <joelagnel@ti.com>, "Rini, Tom" <trini@ti.com>, Grant Likely <glikely@secretlab.ca>, Grant Likely <grant.likely@secretlab.ca>

On Thu, Feb 21, 2013 at 4:37 AM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Wed, Feb 20, 2013 at 07:37:10PM -0600, Joel A Fernandes wrote:
>> Hello,
>> I've been spinning some work-in-progress patches for FIT build support
>> in the kernel.
>> With the move to multiplatform support on OMAP, I feel it is a good
>> time to add  FIT support, also looking at the proliferating number of
>> dtbs, as it is a nice way
>
> I'm not looking to add yet another crappy uboot image format to the kernel
> just for the hell of uboot.
>
> And don't think that the dtbs in the kernel are going to stay there.  The
> longer term plan is for them to end up in an external git tree, entirely
> separate from the kernel source.  So anything that ties them with the
> kernel build process will ultimately have to be removed again.

Sorry for hopping in late as I have been travelling.

Guess much has been said, but for courtesy sake till dts/u-boot build
support is dropped, would you consider accepting a simple extension to
mkuboot.sh with minimal Kbuild changes? I can promise there will be
quite a few users.

Lots of folks want embedded device trees and there are already out of
tree hacks floating as you know that do this. FIT approach to this is
more cleaner I feel.

Let me know what you can do.

Thanks,
Joel
