Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:43475 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755931AbZKDWbh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Nov 2009 17:31:37 -0500
From: maximilian attems <max@stro.at>
Subject: [PATCH] deb-pkg: Make deb-pkg generate a seperate linux-libc-dev deb
Date: Wed,  4 Nov 2009 23:30:49 +0100
Message-Id: <1257373849-25557-1-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, maximilian attems <max@stro.at>

userland dev likes latest incarnation of that userland API.
make it easy to also build it on make deb-pkg invocation:

dpkg-deb: building package `linux-libc-dev' in `../linux-libc-dev_2.6.32-rc6-4_amd64.deb'.

Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |   20 +++++++++++++++++++-
 1 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 8b357b0..fbd1994 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -38,17 +38,20 @@ else
 fi
 tmpdir="$objtree/debian/tmp"
 fwdir="$objtree/debian/fwtmp"
+headerdir="$objtree/debian/headertmp"
 packagename=linux-image-$version
 fwpackagename=linux-firmware-image
+headerpackagename=linux-libc-dev
 
 if [ "$ARCH" = "um" ] ; then
 	packagename=user-mode-linux-$version
 fi
 
 # Setup the directory structure
-rm -rf "$tmpdir" "$fwdir"
+rm -rf "$tmpdir" "$fwdir" "$headerdir"
 mkdir -p "$tmpdir/DEBIAN" "$tmpdir/lib" "$tmpdir/boot" "$tmpdir/usr/share/doc/$packagename"
 mkdir -p "$fwdir/DEBIAN" "$fwdir/lib" "$fwdir/usr/share/doc/$fwpackagename"
+mkdir -p "$headerdir/DEBIAN" "$headerdir/usr" "$headerdir/usr/share/doc/$headerpackagename"
 if [ "$ARCH" = "um" ] ; then
 	mkdir -p "$tmpdir/usr/lib/uml/modules/$version" "$tmpdir/usr/bin"
 fi
@@ -77,6 +80,9 @@ if grep -q '^CONFIG_MODULES=y' .config ; then
 	fi
 fi
 
+make headers_check
+make headers_install INSTALL_HDR_PATH="$headerdir/usr" 
+
 # Install the maintainer scripts
 # Note: hook scripts under /etc/kernel are also executed by official Debian
 # kernel packages, as well as kernel packages built using make-kpkg
@@ -198,6 +204,18 @@ EOF
 	create_package "$fwpackagename" "$fwdir"
 fi
 
+cat <<EOF >> debian/control
+
+Package: $headerpackagename
+Section: devel
+Provides: linux-kernel-headers
+Architecture: any
+Description: Linux support headers for userspace development
+ This package provides userspaces headers from the Linux kernel.  These headers
+ are used by the installed headers for GNU glibc and other system libraries.
+EOF
+
+create_package "$headerpackagename" "$headerdir"
 create_package "$packagename" "$tmpdir"
 
 exit 0
-- 
1.5.6.5

