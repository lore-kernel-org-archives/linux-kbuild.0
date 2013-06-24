Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50799 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750900Ab3FXNgD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 Jun 2013 09:36:03 -0400
Date: Mon, 24 Jun 2013 15:36:00 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH v7] kbuild: fix error when building from src rpm
Message-ID: <20130624133600.GA2069@sepie.suse.cz>
References: <20130624124836.31126.67401.stgit@phlsvslse11.ph.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130624124836.31126.67401.stgit@phlsvslse11.ph.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Marciniszyn <mike.marciniszyn@intel.com>
Cc: linux-kbuild@vger.kernel.org, mmarcini@yahoo.com

On Mon, Jun 24, 2013 at 08:48:37AM -0400, Mike Marciniszyn wrote:
> The following issue can be reproduced with Linus' tree on
> an x86_64 server.
> 
> >+ cp /home/user/rpmbuild-test/BUILDROOT/kernel-3.9.2.x86_64/boot/vmlinuz-3.9.2
> >cp: missing destination file operand after
> >/home/user/rpmbuild-test/BUILDROOT/kernel-3.9.2-1.x86_64/boot/vmlinuz-3.9.2'
> >Try `cp --help' for more information.
> >error: Bad exit status from /var/tmp/rpm-tmp.R4o0iI (%install)
> 
> Here are the commands to reproduce:
> 
> make defconfig
> make rpm-pkg
> 
> Use the resulting src rpm to build as follows:
> 
> mkdir ~/rpmbuild-test
> cd ~/rpmbuild-test
> rpmbuild --rebuild --define "_topdir `pwd`" -vv ~/rpmbuild/SRPMS/kernel-3.10.0_rc1+-1.src.rpm
> 
> The issue is because the %install script uses $KBUILD_IMAGE and it hasn't
> been set since it is only available in the kbuild system and not in the
> %install script.
> 
> This patch adds a Makefile target to emit the image_name that can be used
> and modifies the mkspec to use the dynamic name in %install.
> 
> Signed-off-by: Mike Marciniszyn <mike.marciniszyn@intel.com>

Applied to kbuild.git#kbuild, thanks.

Michal
