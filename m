Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:36310 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754586Ab1DRQG1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Apr 2011 12:06:27 -0400
Date: Mon, 18 Apr 2011 16:06:26 +0000
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] kbuild, deb-pkg: set host machine after dpkg-gencontrol
Message-ID: <20110418160625.GA13973@vostochny.stro.at>
References: <1302891806-10458-1-git-send-email-robert@greenroomsoftware.com>
 <20110417222945.GC14561@stro.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110417222945.GC14561@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Robert Gordon <robert@greenroomsoftware.com>
Cc: linux-kbuild@vger.kernel.org, Robert Nelson <robertcnelson@gmail.com>

On Mon, Apr 18, 2011 at 12:29:45AM +0200, maximilian attems wrote:
> On Fri, 15 Apr 2011, Robert Gordon wrote:
> 
> > This patch was prepared using git format-patch and git send-email.  Details follow.
> > Regards,
> > Robert Gordon
> 
> thanks so the patch was now applyable and so testable. (:
>  
> > scripts/package/builddeb script was setting the host machine $arch in the KERNEL/debian/control prior to an invocation of dpkg-gencontrol.  The patch modifies the script to guarantee the correct debian arch for the target is written to the control file instead.  The issue originally arose in the 2.6.38 series.
> 
> hmm don't be shy to use line-breaks in the desc for next times..
>  
> >  Signed-off-by: Robert Gordon <robert@greenroomsoftware.com>
> 
> rudimentary testing showed, that `make deb-pkg` works,
> but `make ARCH=i386 deb-pkg` on an amd64 Debian box seems borked:
> + dpkg-gencontrol -isp -DArchitecture=i386 -plinux-headers-2.6.39-rc3+
> -P/media/data/mattems/src/linux-2.6/debian/hdrtmp
> dpkg-gencontrol: error: current host architecture 'amd64' does not appear in package's architecture list (i386)

at a second look your patch is just wrong the arch overriding is
currently correctly done in create_package(), with the debian/control
file having the host arch written to it.

so please post what exactly you were trying to build in the first place?

-- 
maks
