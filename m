Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46957 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756179AbcDGNA5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Apr 2016 09:00:57 -0400
Date: Thu, 7 Apr 2016 15:00:54 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
Subject: [PATCH] kbuild/mkspec: support 'update-bootloader'-based systems
Message-ID: <alpine.LNX.2.00.1604071459520.27368@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

From: Jiri Kosina <jkosina@suse.cz>

When uninstalling kernel RPM, we're unconditionally calling 
"new-kernel-pkg --remove". This is useless on systems which are based on 
'update-bootloader' script instead.

Support update-bootloader removal method as well in case the script is 
present; contrary to new-kernel-pkg, this needs to be done in %postun, 
otherwise update-bootloader will refuse to remove entry for kernel for 
which the binary still exists.

Signed-off-by: Jiri Kosina <jkosina@suse.cz>
---
 scripts/package/mkspec | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index b6de63c..857c37d 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -143,6 +143,11 @@ echo "if [ -x /sbin/new-kernel-pkg ]; then"
 echo "new-kernel-pkg --remove $KERNELRELEASE --rminitrd --initrdfile=/boot/initramfs-$KERNELRELEASE.img"
 echo "fi"
 echo ""
+echo "%postun"
+echo "if [ -x /sbin/update-bootloader ]; then"
+echo "/sbin/update-bootloader --remove $KERNELRELEASE"
+echo "fi"
+echo ""
 echo "%files"
 echo '%defattr (-, root, root)'
 echo "/lib/modules/$KERNELRELEASE"

-- 
Jiri Kosina
SUSE Labs

