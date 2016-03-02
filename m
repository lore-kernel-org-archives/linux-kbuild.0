Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:36239 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754186AbcCBO2n (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Mar 2016 09:28:43 -0500
From: Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH] kbuild/mkspec: clean boot loader configuration on rpm removal
Date: Wed,  2 Mar 2016 15:28:00 +0100
Message-Id: <cf947ffc2e633b0a2b75c21bd42c2061f3c5d418.1456925798.git.pabeni@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, Hannes Frederic Sowa <hannes@stressinduktion.org>

This patch add a rpm preuninstall scriptlet to cleanup the
boot loader configuration on kernel package uninstall.
The initrd for the to-be-removed kernel is deleted, too.

Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
 scripts/package/mkspec | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index fe44d68..b6de63c 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -138,6 +138,11 @@ echo "/sbin/installkernel $KERNELRELEASE /boot/.vmlinuz-$KERNELRELEASE-rpm /boot
 echo "rm -f /boot/.vmlinuz-$KERNELRELEASE-rpm /boot/.System.map-$KERNELRELEASE-rpm"
 echo "fi"
 echo ""
+echo "%preun"
+echo "if [ -x /sbin/new-kernel-pkg ]; then"
+echo "new-kernel-pkg --remove $KERNELRELEASE --rminitrd --initrdfile=/boot/initramfs-$KERNELRELEASE.img"
+echo "fi"
+echo ""
 echo "%files"
 echo '%defattr (-, root, root)'
 echo "/lib/modules/$KERNELRELEASE"
-- 
1.8.3.1

