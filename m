Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:56757 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751923Ab1DQW3r (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 17 Apr 2011 18:29:47 -0400
Date: Mon, 18 Apr 2011 00:29:45 +0200
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] kbuild, deb-pkg: set host machine after dpkg-gencontrol
Message-ID: <20110417222945.GC14561@stro.at>
References: <1302891806-10458-1-git-send-email-robert@greenroomsoftware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1302891806-10458-1-git-send-email-robert@greenroomsoftware.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Robert Gordon <robert@greenroomsoftware.com>
Cc: linux-kbuild@vger.kernel.org, Robert Nelson <robertcnelson@gmail.com>

On Fri, 15 Apr 2011, Robert Gordon wrote:

> This patch was prepared using git format-patch and git send-email.  Details follow.
> Regards,
> Robert Gordon

thanks so the patch was now applyable and so testable. (:
 
> scripts/package/builddeb script was setting the host machine $arch in the KERNEL/debian/control prior to an invocation of dpkg-gencontrol.  The patch modifies the script to guarantee the correct debian arch for the target is written to the control file instead.  The issue originally arose in the 2.6.38 series.

hmm don't be shy to use line-breaks in the desc for next times..
 
>  Signed-off-by: Robert Gordon <robert@greenroomsoftware.com>

rudimentary testing showed, that `make deb-pkg` works,
but `make ARCH=i386 deb-pkg` on an amd64 Debian box seems borked:
+ dpkg-gencontrol -isp -DArchitecture=i386 -plinux-headers-2.6.39-rc3+
-P/media/data/mattems/src/linux-2.6/debian/hdrtmp
dpkg-gencontrol: error: current host architecture 'amd64' does not appear in package's architecture list (i386)

had no time to investigate yet, hope you will do.

greetings

-- 
maks
