Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 75.98.165.80.static.a2webhosting.com ([75.98.165.80]:42098 "EHLO
	greenroomsoftware.com" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with ESMTP id S932320Ab1DMWCX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Apr 2011 18:02:23 -0400
Message-ID: <4DA613A3.7070600@greenroomsoftware.com>
Date: Wed, 13 Apr 2011 17:20:35 -0400
From: Robert <robert@greenroomsoftware.com>
MIME-Version: 1.0
Subject: [PATCH] kbuild, deb-pkg: set host machine after dpkg-gencontrol
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.orglinux-kbuild@vger.kernel.org, robertcnelson@gmail.com

This is my first patch, so hopefully I've done it correctly.  Details follow.

Regards,
Robert Gordon


scripts/package/builddeb script was setting the host machine
$arch in the KERNEL/debian/control prior to an invocation of
dpkg-gencontrol.  The patch modifies the script to guarantee the correct
debian arch for the target is written to the control file instead.

Signed-off-by: Robert Gordon <robert@greenroomsoftware.com>
---
 scripts/package/builddeb |   70 +++++++++++++++++++++++----------------------
 1 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f6cbc3d..2a15fda 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -26,37 +26,7 @@ create_package() {
 	chmod -R go-w "$pdir"
 
 	# Attempt to find the correct Debian architecture
-	local forcearch="" debarch=""
-	case "$UTS_MACHINE" in
-	i386|ia64|alpha)
-		debarch="$UTS_MACHINE" ;;
-	x86_64)
-		debarch=amd64 ;;
-	sparc*)
-		debarch=sparc ;;
-	s390*)
-		debarch=s390 ;;
-	ppc*)
-		debarch=powerpc ;;
-	parisc*)
-		debarch=hppa ;;
-	mips*)
-		debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y .config && echo el) ;;
-	arm*)
-		debarch=arm$(grep -q CONFIG_AEABI=y .config && echo el) ;;
-	*)
-		echo "" >&2
-		echo "** ** **  WARNING  ** ** **" >&2
-		echo "" >&2
-		echo "Your architecture doesn't have it's equivalent" >&2
-		echo "Debian userspace architecture defined!" >&2
-		echo "Falling back to using your current userspace instead!" >&2
-		echo "Please add support for $UTS_MACHINE to ${0} ..." >&2
-		echo "" >&2
-	esac
-	if [ -n "$KBUILD_DEBARCH" ] ; then
-		debarch="$KBUILD_DEBARCH"
-	fi
+	local forcearch=""
 	if [ -n "$debarch" ] ; then
 		forcearch="-DArchitecture=$debarch"
 	fi
@@ -66,6 +36,38 @@ create_package() {
 	dpkg --build "$pdir" ..
 }
 
+#Set the correct debian arch
+case "$UTS_MACHINE" in
+i386|ia64|alpha)
+    debarch="$UTS_MACHINE" ;;
+x86_64)
+    debarch=amd64 ;;
+sparc*)
+    debarch=sparc ;;
+s390*)
+    debarch=s390 ;;
+ppc*)
+    debarch=powerpc ;;
+parisc*)
+    debarch=hppa ;;
+mips*)
+    debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y .config && echo el) ;;
+arm*)
+    debarch=arm$(grep -q CONFIG_AEABI=y .config && echo el) ;;
+*)
+    echo "" >&2
+    echo "** ** **  WARNING  ** ** **" >&2
+    echo "" >&2
+    echo "Your architecture doesn't have it's equivalent" >&2
+    echo "Debian userspace architecture defined!" >&2
+    echo "Falling back to using your current userspace instead!" >&2
+    echo "Please add support for $UTS_MACHINE to ${0} ..." >&2
+    echo "" >&2
+esac
+if [ -n "$KBUILD_DEBARCH" ] ; then
+    debarch="$KBUILD_DEBARCH"
+fi
+
 # Some variables and settings used throughout the script
 version=$KERNELRELEASE
 revision=$(cat .version)
@@ -252,9 +254,9 @@ cat <<EOF >> debian/control
 
 Package: $kernel_headers_packagename
 Provides: linux-headers, linux-headers-2.6
-Architecture: $arch
-Description: Linux kernel headers for $KERNELRELEASE on $arch
- This package provides kernel header files for $KERNELRELEASE on $arch
+Architecture: $debarch
+Description: Linux kernel headers for $KERNELRELEASE on $debarch
+ This package provides kernel header files for $KERNELRELEASE on $debarch
  .
  This is useful for people who need to build external modules
 EOF
-- 

