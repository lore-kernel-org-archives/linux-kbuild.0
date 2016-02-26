Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:40983 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752174AbcBZPPU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Feb 2016 10:15:20 -0500
Date: Fri, 26 Feb 2016 16:15:17 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
Subject: [PATCH] kbuild/mkspec: fix grub2 installkernel issue
Message-ID: <alpine.LNX.2.00.1602261612350.22700@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

mkspec is copying built kernel to temporrary location

	/boot/vmlinuz-$KERNELRELEASE-rpm

and runs installkernel on it. This however directly leads to grub2 
menuentry for this suffixed binary being generated as well during the run 
of installkernel script.

Later in the process the temporary -rpm suffixed files are removed, and 
therefore we end up with spurious (and non-functional) grub2 menu entries 
for each installed kernel RPM.

Fix that by using a different temporary name (prefixed by '.'), so that 
the binary is not recognized as an actual kernel binary and no menuentry 
is created for it.

Signed-off-by: Jiri Kosina <jkosina@suse.cz>
---
 scripts/package/mkspec | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 71004da..fe44d68 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -131,11 +131,11 @@ echo 'rm -rf $RPM_BUILD_ROOT'
 echo ""
 echo "%post"
 echo "if [ -x /sbin/installkernel -a -r /boot/vmlinuz-$KERNELRELEASE -a -r /boot/System.map-$KERNELRELEASE ]; then"
-echo "cp /boot/vmlinuz-$KERNELRELEASE /boot/vmlinuz-$KERNELRELEASE-rpm"
-echo "cp /boot/System.map-$KERNELRELEASE /boot/System.map-$KERNELRELEASE-rpm"
+echo "cp /boot/vmlinuz-$KERNELRELEASE /boot/.vmlinuz-$KERNELRELEASE-rpm"
+echo "cp /boot/System.map-$KERNELRELEASE /boot/.System.map-$KERNELRELEASE-rpm"
 echo "rm -f /boot/vmlinuz-$KERNELRELEASE /boot/System.map-$KERNELRELEASE"
-echo "/sbin/installkernel $KERNELRELEASE /boot/vmlinuz-$KERNELRELEASE-rpm /boot/System.map-$KERNELRELEASE-rpm"
-echo "rm -f /boot/vmlinuz-$KERNELRELEASE-rpm /boot/System.map-$KERNELRELEASE-rpm"
+echo "/sbin/installkernel $KERNELRELEASE /boot/.vmlinuz-$KERNELRELEASE-rpm /boot/.System.map-$KERNELRELEASE-rpm"
+echo "rm -f /boot/.vmlinuz-$KERNELRELEASE-rpm /boot/.System.map-$KERNELRELEASE-rpm"
 echo "fi"
 echo ""
 echo "%files"

-- 
Jiri Kosina
SUSE Labs
