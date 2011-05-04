Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 75.98.165.80.static.a2webhosting.com ([75.98.165.80]:36876 "EHLO
	greenroomsoftware.com" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with ESMTP id S1752195Ab1EDG13 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2011 02:27:29 -0400
From: Robert Gordon <robert@greenroomsoftware.com>
Subject: [PATCH] kbuild, deb-pkg: set host machine $arch correctly when cross-compiling or not
Date: Tue,  3 May 2011 23:27:18 -0700
Message-Id: <1304490438-17099-1-git-send-email-robert@greenroomsoftware.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Robert Nelson <robertcnelson@gmail.com>, maximilian attems <max@stro.at>, Robert Gordon <robert@greenroomsoftware.com>

scripts/package/builddeb script was setting the host machine $arch
in the KERNEL/debian/control prior to an invocation of dpkg-gencontrol.
The existing method is appropriate for i386/x86_64 but fails when
cross-compiling for non-intel.  The patch modifies the script to
guarantee the correct $arch for the target is written to the control
file.  This patch has been tested building x86_64 on an i386 machine
and also when cross-compiling for ARM on an i386 machine.
The issue first arose in the 2.6.38 release.

Signed-off-by: Robert Gordon <robert@greenroomsoftware.com>

---
 scripts/package/builddeb |   18 +++++++++++++++++-
 1 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f6cbc3d..91ced36 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -246,7 +246,23 @@ mkdir -p "$destdir"
 (cd $srctree; tar -c -f - -T /tmp/files$$) | (cd $destdir; tar -xf -)
 (cd $objtree; tar -c -f - -T /tmp/objfiles$$) | (cd $destdir; tar -xf -)
 rm -f /tmp/files$$ /tmp/objfiles$$
-arch=$(dpkg --print-architecture)
+
+case "$UTS_MACHINE" in
+sparc*)
+	arch=sparc ;;
+s390*)
+	arch=s390 ;;
+ppc*)
+	arch=powerpc ;;
+parisc*)
+	arch=hppa ;;
+mips*)
+	arch=mips$(grep -q CPU_LITTLE_ENDIAN=y .config && echo el) ;;
+arm*)
+	arch=arm$(grep -q CONFIG_AEABI=y .config && echo el) ;;
+i386|ia64|alpha|x86_64|*)
+	arch=$(dpkg --print-architecture) ;;
+esac
 
 cat <<EOF >> debian/control
 
-- 
1.7.1

