Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:37087 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752098Ab1DSOd4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Apr 2011 10:33:56 -0400
Date: Tue, 19 Apr 2011 14:33:55 +0000
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] kbuild, deb-pkg: set host machine after dpkg-gencontrol
Message-ID: <20110419143355.GC17786@vostochny.stro.at>
References: <1302891806-10458-1-git-send-email-robert@greenroomsoftware.com>
 <20110417222945.GC14561@stro.at>
 <20110418160625.GA13973@vostochny.stro.at>
 <aa1e1ed259dba5b6db3c3516bab80eef@greenroomsoftware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa1e1ed259dba5b6db3c3516bab80eef@greenroomsoftware.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: robert@greenroomsoftware.com
Cc: linux-kbuild@vger.kernel.org, Robert Nelson <robertcnelson@gmail.com>

On Mon, Apr 18, 2011 at 03:28:28PM -0400, robert@greenroomsoftware.com wrote:
> Here is the original 'make' command:
> make ARCH=arm LOCALVERSION=-x1 CROSS_COMPILE=arm-linux-gnueabi-
> KDEB_PKGVERSION=1.0cross deb-pkg
> 
> Here is how it fails:
> dpkg-gencontrol: error: current host architecture 'armel' does not
> appear in package's architecture list (i386)
> make[1]: *** [deb-pkg] Error 255
> make: *** [deb-pkg] Error 2
> 

did you check how it dpkg-gencontrol is called?
just put an set -x on the top of builddeb.

-- 
maks
