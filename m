Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml103.kpnxchange.com ([195.121.3.7]:62450 "EHLO
	CPSMTPM-EML103.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751043AbZDVXIf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2009 19:08:35 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 1/14] deb-pkg: minor general improvements in builddeb script
Date: Thu, 23 Apr 2009 01:08:31 +0200
References: <200904230034.59627.elendil@planet.nl>
In-Reply-To: <200904230034.59627.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904230108.32683.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

Minor coding style improvements and typo fix in leading comment.

Signed-off-by: Frans Pop <elendil@planet.nl>
Cc: maximilian attems <max@stro.at>
Cc: Andres Salomon <dilinger@debian.org>

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 1264b8e..eff7f9d 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -4,7 +4,7 @@
 # Copyright 2003 Wichert Akkerman <wichert@wiggy.net>
 #
 # Simple script to generate a deb package for a Linux kernel. All the
-# complexity of what to do with a kernel after it is installer or removed
+# complexity of what to do with a kernel after it is installed or removed
 # is left to other scripts and packages: they can install scripts in the
 # /etc/kernel/{pre,post}{inst,rm}.d/ directories that will be called on
 # package install and removal.
@@ -13,13 +13,13 @@ set -e
 
 # Some variables and settings used throughout the script
 version=$KERNELRELEASE
-revision=`cat .version`
+revision=$(cat .version)
 tmpdir="$objtree/debian/tmp"
 fwdir="$objtree/debian/fwtmp"
 packagename=linux-$version
 fwpackagename=linux-firmware-image
 
-if [ "$ARCH" == "um" ] ; then
+if [ "$ARCH" = "um" ] ; then
 	packagename=user-mode-linux-$version
 fi
 
@@ -27,12 +27,12 @@ fi
 rm -rf "$tmpdir" "$fwdir"
 mkdir -p "$tmpdir/DEBIAN" "$tmpdir/lib" "$tmpdir/boot"
 mkdir -p "$fwdir/DEBIAN" "$fwdir/lib"
-if [ "$ARCH" == "um" ] ; then
+if [ "$ARCH" = "um" ] ; then
 	mkdir -p "$tmpdir/usr/lib/uml/modules/$version" "$tmpdir/usr/share/doc/$packagename" "$tmpdir/usr/bin"
 fi
 
 # Build and install the kernel
-if [ "$ARCH" == "um" ] ; then
+if [ "$ARCH" = "um" ] ; then
 	$MAKE linux
 	cp System.map "$tmpdir/usr/lib/uml/modules/$version/System.map"
 	cp .config "$tmpdir/usr/share/doc/$packagename/config"
@@ -46,7 +46,7 @@ fi
 
 if grep -q '^CONFIG_MODULES=y' .config ; then
 	INSTALL_MOD_PATH="$tmpdir" make KBUILD_SRC= modules_install
-	if [ "$ARCH" == "um" ] ; then
+	if [ "$ARCH" = "um" ] ; then
 		mv "$tmpdir/lib/modules/$version"/* "$tmpdir/usr/lib/uml/modules/$version/"
 		rmdir "$tmpdir/lib/modules/$version"
 	fi
@@ -77,9 +77,8 @@ linux ($version-$revision) unstable; urgency=low
 EOF
 
 # Generate a control file
-if [ "$ARCH" == "um" ]; then
-
-cat <<EOF > debian/control
+if [ "$ARCH" = "um" ]; then
+	cat <<EOF > debian/control
 Source: linux
 Section: base
 Priority: optional
@@ -101,7 +100,7 @@ Description: User Mode Linux kernel, version $version
 EOF
 
 else
-cat <<EOF > debian/control
+	cat <<EOF > debian/control
 Source: linux
 Section: base
 Priority: optional
@@ -116,6 +115,7 @@ Description: Linux kernel, version $version
  This package contains the Linux kernel, modules and corresponding other
  files version $version
 EOF
+
 fi
 
 # Fix some ownership and permissions
@@ -143,4 +143,3 @@ dpkg-gencontrol -isp -p$packagename
 dpkg --build "$tmpdir" ..
 
 exit 0
-
