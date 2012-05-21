Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy7-pub.bluehost.com ([67.222.55.9]:53175 "HELO
	oproxy7-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1757185Ab2EUCtf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 20 May 2012 22:49:35 -0400
Message-ID: <4FB9AD43.1020608@xenotime.net>
Date: Sun, 20 May 2012 19:49:39 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: [PATCH 3/3] scripts/patch-kernel: update comments to 3.x
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

From: Randy Dunlap <rdunlap@xenotime.net>

Update comments from 2.6.x to 3.x.

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 scripts/patch-kernel |   16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

--- lnx-34-rc7-pk.orig/scripts/patch-kernel
+++ lnx-34-rc7-pk/scripts/patch-kernel
@@ -7,8 +7,10 @@
 #   scripts/patch-kernel . ..
 #      Update the kernel tree in the current directory using patches in the
 #      directory above to the latest Linus kernel
-#   scripts/patch-kernel . .. 2.4.9
-#      Gets standard kernel 2.4.9
+#   scripts/patch-kernel . .. 3.2.5
+#      Gets standard kernel 3.2.5
+#   scripts/patch-kernel . .. 3.3-rc4
+#      Gets standard kernel 3.3-rc4
 #
 # It determines the current kernel version from the top-level Makefile.
 # It then looks for patches for the next sublevel in the patch directory.
@@ -203,7 +205,7 @@ else
 	STOPEXTRA=9999
 fi
 
-# This all assumes a 2.6.x[.y] kernel tree.
+# This all assumes a 3.x[.y] kernel tree.
 # Don't allow backwards/reverse patching.
 if [ $STOPSUBLEVEL -lt $SUBLEVEL ]; then
 	backwards
@@ -222,10 +224,10 @@ if [ x$EXTRAVER != "x" ]; then
 	reversePatch ${patch} || exit 1
 fi
 
-# now current is 2.6.x, with no EXTRA applied,
-# so update to target SUBLEVEL (2.6.SUBLEVEL)
-# and then to target EXTRAVER (2.6.SUB.EXTRAVER) if requested.
-# If not ending sublevel is specified, it is incremented until
+# now current is 3.x, with no EXTRA applied,
+# so update to target SUBLEVEL (3.PATCHLEVEL.SUBLEVEL)
+# and then to target EXTRAVER (3.PATCHLEVEL.SUBLEVEL.EXTRAVER) if requested.
+# If no ending sublevel is specified, it is incremented until
 # no further sublevels are found.
 
 if [ $STOPSUBLEVEL -gt $SUBLEVEL ]; then
