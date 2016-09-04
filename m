Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from dd34104.kasserver.com ([85.13.151.79]:59344 "EHLO
        dd34104.kasserver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754115AbcIDXxs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Sep 2016 19:53:48 -0400
From: Timo Sigurdsson <public_timo.s@silentcreek.de>
Subject: [PATCH] builddeb: Update a few outdated and hardcoded strings
Date: Mon,  5 Sep 2016 01:43:37 +0200
Message-Id: <1473032617-21914-1-git-send-email-public_timo.s@silentcreek.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Timo Sigurdsson <public_timo.s@silentcreek.de>

The builddeb script has some hardcoded references to linux version 2.6
which is ancient. Use a variable instead in order to keep in sync with
new releases and avoid the need to manually update this. In addition,
change the copyright notice to include the year 2016.

Signed-off-by: Timo Sigurdsson <public_timo.s@silentcreek.de>
---
 scripts/package/builddeb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 8ea9fd2..d85120c 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -84,6 +84,7 @@ set_debarch() {
 
 # Some variables and settings used throughout the script
 version=$KERNELRELEASE
+majorversion=$VERSION.$PATCHLEVEL
 revision=$(cat .version)
 if [ -n "$KDEB_PKGVERSION" ]; then
 	packageversion=$KDEB_PKGVERSION
@@ -265,7 +266,7 @@ This is a packacked upstream version of the Linux kernel.
 The sources may be found at most Linux ftp sites, including:
 ftp://ftp.kernel.org/pub/linux/kernel
 
-Copyright: 1991 - 2015 Linus Torvalds and others.
+Copyright: 1991 - 2016 Linus Torvalds and others.
 
 The git repository for mainline kernel development is at:
 git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
@@ -296,7 +297,7 @@ if [ "$ARCH" = "um" ]; then
 	cat <<EOF >> debian/control
 
 Package: $packagename
-Provides: linux-image, linux-image-2.6, linux-modules-$version
+Provides: linux-image, linux-image-$majorversion, linux-modules-$version
 Architecture: any
 Description: User Mode Linux kernel, version $version
  User-mode Linux is a port of the Linux kernel to its own system call
@@ -313,7 +314,7 @@ else
 	cat <<EOF >> debian/control
 
 Package: $packagename
-Provides: linux-image, linux-image-2.6, linux-modules-$version
+Provides: linux-image, linux-image-$majorversion, linux-modules-$version
 Suggests: $fwpackagename
 Architecture: any
 Description: Linux kernel, version $version
@@ -346,7 +347,7 @@ rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
 cat <<EOF >> debian/control
 
 Package: $kernel_headers_packagename
-Provides: linux-headers, linux-headers-2.6
+Provides: linux-headers, linux-headers-$majorversion
 Architecture: any
 Description: Linux kernel headers for $KERNELRELEASE on \${kernel:debarch}
  This package provides kernel header files for $KERNELRELEASE on \${kernel:debarch}
-- 
2.1.4

