Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpm-eml104.kpnxchange.com ([195.121.3.8]:60718 "EHLO
	CPSMTPM-EML104.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751276AbZDVXIr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Apr 2009 19:08:47 -0400
From: Frans Pop <elendil@planet.nl>
Subject: [PATCH 2/14] deb-pkg: refactor code to reduce duplication
Date: Thu, 23 Apr 2009 01:08:44 +0200
References: <200904230034.59627.elendil@planet.nl>
In-Reply-To: <200904230034.59627.elendil@planet.nl>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904230108.46011.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>, Andres Salomon <dilinger@debian.org>

Factor out code to build package into separate function and
only write "source" section for the debian/control file once.

Signed-off-by: Frans Pop <elendil@planet.nl>
Cc: maximilian attems <max@stro.at>
Cc: Andres Salomon <dilinger@debian.org>
---

Because of this patch some things that needed to be done in two places in
later patches in the series now only need to be done once.

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index eff7f9d..feebd69 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -11,6 +11,18 @@
 
 set -e
 
+create_package() {
+	local pname="$1" pdir="$2"
+
+	# Fix ownership and permissions
+	chown -R root:root "$pdir"
+	chmod -R go-w "$pdir"
+
+	# Create the package
+	dpkg-gencontrol -isp -p$pname -P"$pdir"
+	dpkg --build "$pdir" ..
+}
+
 # Some variables and settings used throughout the script
 version=$KERNELRELEASE
 revision=$(cat .version)
@@ -77,13 +89,16 @@ linux ($version-$revision) unstable; urgency=low
 EOF
 
 # Generate a control file
-if [ "$ARCH" = "um" ]; then
-	cat <<EOF > debian/control
+cat <<EOF > debian/control
 Source: linux
 Section: base
 Priority: optional
 Maintainer: $name
 Standards-Version: 3.6.1
+EOF
+
+if [ "$ARCH" = "um" ]; then
+	cat <<EOF >> debian/control
 
 Package: $packagename
 Provides: kernel-image-$version, linux-image-$version
@@ -100,12 +115,7 @@ Description: User Mode Linux kernel, version $version
 EOF
 
 else
-	cat <<EOF > debian/control
-Source: linux
-Section: base
-Priority: optional
-Maintainer: $name
-Standards-Version: 3.6.1
+	cat <<EOF >> debian/control
 
 Package: $packagename
 Provides: kernel-image-$version, linux-image-$version
@@ -118,10 +128,6 @@ EOF
 
 fi
 
-# Fix some ownership and permissions
-chown -R root:root "$tmpdir"
-chmod -R go-w "$tmpdir"
-
 # Do we have firmware? Move it out of the way and build it into a package.
 if [ -e "$tmpdir/lib/firmware" ]; then
 	mv "$tmpdir/lib/firmware" "$fwdir/lib/"
@@ -134,12 +140,9 @@ Description: Linux kernel firmware, version $version
  This package contains firmware from the Linux kernel, version $version
 EOF
 
-	dpkg-gencontrol -isp -p$fwpackagename -P"$fwdir"
-	dpkg --build "$fwdir" ..
+	create_package "$fwpackagename" "$fwdir"
 fi
 
-# Perform the final magic
-dpkg-gencontrol -isp -p$packagename
-dpkg --build "$tmpdir" ..
+create_package "$packagename" "$tmpdir"
 
 exit 0
