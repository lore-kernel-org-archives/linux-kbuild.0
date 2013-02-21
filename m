Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:41149 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752044Ab3BUBhL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Feb 2013 20:37:11 -0500
MIME-Version: 1.0
Date: Wed, 20 Feb 2013 19:37:10 -0600
Message-ID: <CAD=GYpbF_3uRzhUnV=MwDiy-ekvZKJztJbkhNM0u_pvG-UCw4w@mail.gmail.com>
Subject: [RFC] Kbuild support for ARM FIT images
From: Joel A Fernandes <agnel.joel@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: u-boot@lists.denx.de, Linux OMAP List <linux-omap@vger.kernel.org>, linux-kbuild@vger.kernel.org, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>
Cc: "Fernandes, Joel A" <joelagnel@ti.com>, tony@atomide.com, "Rini, Tom" <trini@ti.com>, Grant Likely <grant.likely@secretlab.ca>, Grant Likely <glikely@secretlab.ca>

Hello,
I've been spinning some work-in-progress patches for FIT build support
in the kernel.
With the move to multiplatform support on OMAP, I feel it is a good
time to add  FIT support, also looking at the proliferating number of
dtbs, as it is a nice way

Currently the following is what I envision the way it will work:
- New "uImage-fit" target in $(boot)/ which is made to depend on "dtbs" target
- Changes to dtbs target to output a $(srctree)/.tmp_list_dtbs listing
the full paths to all the dtbs built
- A new script "mkfitsrc.sh" that spits out an ITS to
$(srctree)/.tmp_its . The above tmp file is passed
   - For each dtb, a new "device tree" node is created in the ITS
   - For each dtb, a new "configuration" node is created in the ITS
- mkimage is called on the ITS sources to output the kernel image.
(TODO: to use mkuboot.sh)

I have yet to do some boot time tests, as I don't have my board now
and don't want to post something that doesn't work. But all this has
been build-tested.

Any comments on this approach? Is it better to merge mkfitsrc.sh with
mkuboot.sh?

Regards,
Joel
