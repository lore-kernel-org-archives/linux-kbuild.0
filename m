Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:35626 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750733AbdAXJpv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Jan 2017 04:45:51 -0500
Received: by mail-lf0-f48.google.com with SMTP id n124so107456362lfd.2
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Jan 2017 01:45:50 -0800 (PST)
From: riku.voipio@linaro.org
Subject: [PATCH v3 1/3] builddeb: Update a few outdated and hardcoded strings
Date: Tue, 24 Jan 2017 11:45:41 +0200
Message-Id: <20170124094541.28361-1-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: debian-kernel@lists.debian.org, Riku Voipio <riku.voipio@linaro.org>, Timo Sigurdsson <public_timo.s@silentcreek.de>, Ben Hutchings <ben@decadent.org.uk>

From: Riku Voipio <riku.voipio@linaro.org>

The builddeb script has some hardcoded references to Linux version 2.6
which is ancient. Drop Provides as the virtual packages provided are not
useful anymore. Leave the Provides for linux-kernel-headers, as someone
might still be referring to it.

While at it, updated copyright date and drop Standards-Version field.

Cc: Timo Sigurdsson <public_timo.s@silentcreek.de>
Cc: Ben Hutchings <ben@decadent.org.uk> 
Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
v3: Drop Standards-Version instead of updating it.
---
 scripts/package/builddeb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 3c575cd07888..6075392616de 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -265,7 +265,7 @@ This is a packacked upstream version of the Linux kernel.
 The sources may be found at most Linux ftp sites, including:
 ftp://ftp.kernel.org/pub/linux/kernel
 
-Copyright: 1991 - 2015 Linus Torvalds and others.
+Copyright: 1991 - 2017 Linus Torvalds and others.
 
 The git repository for mainline kernel development is at:
 git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
@@ -288,7 +288,6 @@ Section: kernel
 Priority: optional
 Maintainer: $maintainer
 Build-Depends: $build_depends
-Standards-Version: 3.8.4
 Homepage: http://www.kernel.org/
 EOF
 
@@ -296,7 +295,6 @@ if [ "$ARCH" = "um" ]; then
 	cat <<EOF >> debian/control
 
 Package: $packagename
-Provides: linux-image, linux-image-2.6, linux-modules-$version
 Architecture: any
 Description: User Mode Linux kernel, version $version
  User-mode Linux is a port of the Linux kernel to its own system call
@@ -313,7 +311,6 @@ else
 	cat <<EOF >> debian/control
 
 Package: $packagename
-Provides: linux-image, linux-image-2.6, linux-modules-$version
 Suggests: $fwpackagename
 Architecture: any
 Description: Linux kernel, version $version
@@ -346,7 +343,6 @@ rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
 cat <<EOF >> debian/control
 
 Package: $kernel_headers_packagename
-Provides: linux-headers, linux-headers-2.6
 Architecture: any
 Description: Linux kernel headers for $KERNELRELEASE on \${kernel:debarch}
  This package provides kernel header files for $KERNELRELEASE on \${kernel:debarch}
@@ -404,7 +400,6 @@ if [ -n "$BUILD_DEBUG" ] ; then
 
 Package: $dbg_packagename
 Section: debug
-Provides: linux-debug, linux-debug-$version
 Architecture: any
 Description: Linux kernel debugging symbols for $version
  This package will come in handy if you need to debug the kernel. It provides
-- 
2.11.0

