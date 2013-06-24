Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:64451 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752003Ab3FXOid (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 Jun 2013 10:38:33 -0400
Subject: [PATCH 1/3] kbuild: add %post section to create initramfs and grub
 hooks
From: Mike Marciniszyn <mike.marciniszyn@intel.com>
Date: Mon, 24 Jun 2013 10:38:22 -0400
Message-ID: <20130624143822.10761.47446.stgit@phlsvslse11.ph.intel.com>
In-Reply-To: <20130624143658.10761.3787.stgit@phlsvslse11.ph.intel.com>
References: <20130624143658.10761.3787.stgit@phlsvslse11.ph.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: Doug Ledford <dledford@redhat.com>, linux-kbuild@vger.kernel.org, mmarcini@yahoo.com

/sbin/installkernel is used to insure grub hooks are
inserted and the initramfs is created on the
target system.

The invokation installkernel will work with any
kernel as long as:
- /sbin/installkernel exists
- the kernel and sysem map files are readable

Signed-off-by: Mike Marciniszyn <mike.marciniszyn@intel.com>
---
 scripts/package/mkspec |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index fdd3fbf..0aa6a24 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -112,6 +112,15 @@ echo ""
 echo "%clean"
 echo 'rm -rf $RPM_BUILD_ROOT'
 echo ""
+echo "%post"
+echo "if [ -x /sbin/installkernel -a -r /boot/vmlinuz-$KERNELRELEASE -a -r /boot/System.map-$KERNELRELEASE ]; then"
+echo "cp /boot/vmlinuz-$KERNELRELEASE /boot/vmlinuz-$KERNELRELEASE-rpm"
+echo "cp /boot/System.map-$KERNELRELEASE /boot/System.map-$KERNELRELEASE-rpm"
+echo "rm -f /boot/vmlinuz-$KERNELRELEASE /boot/System.map-$KERNELRELEASE"
+echo "/sbin/installkernel $KERNELRELEASE /boot/vmlinuz-$KERNELRELEASE-rpm /boot/System.map-$KERNELRELEASE-rpm"
+echo "rm -f /boot/vmlinuz-$KERNELRELEASE-rpm /boot/System.map-$KERNELRELEASE-rpm"
+echo "fi"
+echo ""
 echo "%files"
 echo '%defattr (-, root, root)'
 echo "%dir /lib/modules"

