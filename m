Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 75.98.165.80.static.a2webhosting.com ([75.98.165.80]:39293 "EHLO
	greenroomsoftware.com" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with ESMTP id S1755576Ab1DOSXh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 Apr 2011 14:23:37 -0400
From: Robert Gordon <robert@greenroomsoftware.com>
Subject: Re: [PATCH] kbuild, deb-pkg: set host machine after dpkg-gencontrol
Date: Fri, 15 Apr 2011 14:23:26 -0400
Message-Id: <1302891806-10458-1-git-send-email-robert@greenroomsoftware.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Robert Nelson <robertcnelson@gmail.com>, maximilian attems <max@stro.at>, Robert Gordon <robert@greenroomsoftware.com>

This patch was prepared using git format-patch and git send-email.  Details follow.
Regards,
Robert Gordon

scripts/package/builddeb script was setting the host machine $arch in the KERNEL/debian/control prior to an invocation of dpkg-gencontrol.  The patch modifies the script to guarantee the correct debian arch for the target is written to the control file instead.  The issue originally arose in the 2.6.38 series.

 Signed-off-by: Robert Gordon <robert@greenroomsoftware.com>

---
 scripts/package/builddeb |   73 +++++++++++++++++++++++----------------------
 1 files changed, 37 insertions(+), 36 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f6cbc3d..975e39a 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -25,38 +25,7 @@ create_package() {
 	chown -R root:root "$pdir"
 	chmod -R go-w "$pdir"
 
-	# Attempt to find the correct Debian architecture
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
@@ -66,6 +35,39 @@ create_package() {
 	dpkg --build "$pdir" ..
 }
 
+# Attempt to find the correct Debian architecture
+case "$UTS_MACHINE" in
+i386|ia64|alpha)
+	debarch="$UTS_MACHINE" ;;
+x86_64)
+	debarch=amd64 ;;
+sparc*)
+	debarch=sparc ;;
+s390*)
+	debarch=s390 ;;
+ppc*)
+	debarch=powerpc ;;
+parisc*)
+	debarch=hppa ;;
+mips*)
+	debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y .config && echo el) ;;
+arm*)
+	debarch=arm$(grep -q CONFIG_AEABI=y .config && echo el) ;;
+*)
+	echo "" >&2
+	echo "** ** **  WARNING  ** ** **" >&2
+	echo "" >&2
+	echo "Your architecture doesn't have it's equivalent" >&2
+	echo "Debian userspace architecture defined!" >&2
+	echo "Falling back to using your current userspace instead!" >&2
+	echo "Please add support for $UTS_MACHINE to ${0} ..." >&2
+	echo "" >&2
+esac
+if [ -n "$KBUILD_DEBARCH" ] ; then
+	debarch="$KBUILD_DEBARCH"
+fi
+
+
 # Some variables and settings used throughout the script
 version=$KERNELRELEASE
 revision=$(cat .version)
@@ -246,15 +248,14 @@ mkdir -p "$destdir"
 (cd $srctree; tar -c -f - -T /tmp/files$$) | (cd $destdir; tar -xf -)
 (cd $objtree; tar -c -f - -T /tmp/objfiles$$) | (cd $destdir; tar -xf -)
 rm -f /tmp/files$$ /tmp/objfiles$$
-arch=$(dpkg --print-architecture)
 
 cat <<EOF >> debian/control
 
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
1.7.1

