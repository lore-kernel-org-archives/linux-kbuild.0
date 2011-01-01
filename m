Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:39699 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750845Ab1AAPo2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 1 Jan 2011 10:44:28 -0500
From: maximilian attems <max@stro.at>
Subject: [PATCH] deb-pkg: Make deb-pkg generate a seperate linux-libc-dev deb
Date: Sat,  1 Jan 2011 16:44:13 +0100
Message-Id: <1293896653-17947-1-git-send-email-max@stro.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>

userland dev likes latest incarnation of that userland API.
make it easy to also build it on make deb-pkg invocation:

dpkg-deb: building package `linux-libc-dev' in `../linux-libc-dev_2.6.32-rc6-4_amd64.deb'.

Last year patch rebased on top of latest deb-pkg changes.

Signed-off-by: maximilian attems <max@stro.at>
---
 scripts/package/builddeb |   21 ++++++++++++++++++++-
 1 files changed, 20 insertions(+), 1 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 5fc1e6f..8c1f8d4 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -77,20 +77,24 @@ fi
 tmpdir="$objtree/debian/tmp"
 fwdir="$objtree/debian/fwtmp"
 hdrdir="$objtree/debian/hdrtmp"
+headerdir="$objtree/debian/headertmp"
 packagename=linux-image-$version
 fwpackagename=linux-firmware-image
 hdrpackagename=linux-headers-$version
+headerpackagename=linux-libc-dev
 
 if [ "$ARCH" = "um" ] ; then
 	packagename=user-mode-linux-$version
 fi
 
 # Setup the directory structure
-rm -rf "$tmpdir" "$fwdir" "$hdrdir"
+rm -rf "$tmpdir" "$fwdir" "$hdrdir" "$headerdir"
 mkdir -m 755 -p "$tmpdir/DEBIAN"
 mkdir -p  "$tmpdir/lib" "$tmpdir/boot" "$tmpdir/usr/share/doc/$packagename"
 mkdir -m 755 -p "$fwdir/DEBIAN"
 mkdir -p "$fwdir/lib" "$fwdir/usr/share/doc/$fwpackagename"
+mkdir -m 755 -p "$headerdir/DEBIAN"
+mkdir -p "$headerdir/usr/share/doc/$headerpackagename"
 if [ "$ARCH" = "um" ] ; then
 	mkdir -p "$tmpdir/usr/lib/uml/modules/$version" "$tmpdir/usr/bin"
 fi
@@ -121,6 +125,9 @@ if grep -q '^CONFIG_MODULES=y' .config ; then
 	fi
 fi
 
+make headers_check
+make headers_install INSTALL_HDR_PATH="$headerdir/usr" 
+
 # Install the maintainer scripts
 # Note: hook scripts under /etc/kernel are also executed by official Debian
 # kernel packages, as well as kernel packages built using make-kpkg
@@ -267,6 +274,18 @@ EOF
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
1.7.2.3

