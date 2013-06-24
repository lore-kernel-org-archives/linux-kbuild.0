Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:12992 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750936Ab3FXOiT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 Jun 2013 10:38:19 -0400
Subject: [PATCH 0/3] RPM enhancements for kbuild
From: Mike Marciniszyn <mike.marciniszyn@intel.com>
Date: Mon, 24 Jun 2013 10:38:17 -0400
Message-ID: <20130624143658.10761.3787.stgit@phlsvslse11.ph.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: Doug Ledford <dledford@redhat.com>, linux-kbuild@vger.kernel.org, mmarcini@yahoo.com

This series of patches enhances the kernel RPM mechanism
as follows:
- executes /sbin/installkernel in a %post
- installs the firmware into a KERNELRELEASE specific directory
- adds a kernel-devel package

The installkernel allows for booting the target server
after the RPM has been installed.  A "make install" would
have done that.

The unique firmware directory avoids conflicts with distribution
firmware rpm's as recommended by Doug Ledford.

The kernel-devel package allows for external module builds
against the kernel.  A "make modules" install would have
supported such a build on a single server. The capability is lost
through the rpm mechanism because the build server source
directory is no longer appropriate for the target server.

---

Mike Marciniszyn (3):
      kbuild: add %post section to create initramfs and grub hooks
      kbuilld: install firmware files in kernel relative directory
      kbuild: add generation of kernel-devel


 scripts/package/mkspec |   44 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 4 deletions(-)

-- 
Mike
