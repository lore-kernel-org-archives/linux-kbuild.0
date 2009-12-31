Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xes-mad.com ([216.165.139.218]:52595 "EHLO xes-mad.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751766AbZLaXKx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 31 Dec 2009 18:10:53 -0500
Subject: Re: [PATCH v2 3/3] powerpc: Add support for ram filesystems in FIT
 uImages
From: Peter Tyser <ptyser@xes-inc.com>
In-Reply-To: <20091231224439.AF5353F6D1@gemini.denx.de>
References: <1261446643-21714-1-git-send-email-ptyser@xes-inc.com>
	 <1261446643-21714-4-git-send-email-ptyser@xes-inc.com>
	 <fa686aa40912301502x48785614ya4dd5c71815a7633@mail.gmail.com>
	 <20091231224439.AF5353F6D1@gemini.denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Dec 2009 17:10:38 -0600
Message-ID: <1262301038.29396.137.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wolfgang Denk <wd@denx.de>
Cc: Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev@ozlabs.org, linux-kbuild@vger.kernel.org

Hi Wolfgang,

> > IIRC, uImage.fit.initrd.% should appear before uImage.fit.% in the
> > Makefile so that make behaves more consistently.  Speaking of which,
> > the number of '.' in the name is getting rather large.  Would you
> > consider using 'fitImage' instead of 'uImage.fit'?
> 
> Why chose a different name at all? We could still call it "uImage",
> meaning "U-Boot image" - U-Boot is clever enought o detect
> automatically if we pass it an old style or a fit image.

I agree with your point to an extent, but having 2 types of uImages is
somewhat confusing to a user, even if U-Boot can differentiate between
them.  And if the legacy image and FIT image had the same Make target,
how does a user specify which type they want to build?  The fact that
both "legacy" and FIT images would reside at arch/powerpc/boot/uImage
doesn't make things any less confusing to Joe User.

Currently U-Boot supports booting:
1 "legacy" uImages
2 "new" Flattened Image Tree (FIT) uImages

What do you think about changing the U-Boot documentation to rename
those 2 image types to:
1 uImages
2 FIT Images

The FIT image is a relatively generic image type - its just a blob that
dtc created from a device tree and some input binaries.  In my mind its
not intimately tied to U-Boot, at least not conceptually.  The "legacy"
uImages have to agree with U-Boot's header format defined in the U-Boot
source code, so the uImage name does make sense with respect to the
"legacy" uImages.

My vote would be to make the Linux FIT target rule "fitImage" and then
update the U-Boot documentation to make obvious the differences between
uImages and FIT images.

What do you think of that?

Thanks,
Peter



