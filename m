Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:34107 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933207AbdCaNJr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Mar 2017 09:09:47 -0400
Received: by mail-lf0-f51.google.com with SMTP id z15so43592431lfd.1
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Mar 2017 06:09:46 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH v2 1/3] builddeb: Update a few outdated and hardcoded strings
Date: Fri, 31 Mar 2017 16:09:39 +0300
Message-Id: <20170331130941.5250-2-riku.voipio@linaro.org>
In-Reply-To: <20170331130941.5250-1-riku.voipio@linaro.org>
References: <20170331130941.5250-1-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.com
Cc: yamada.masahiro@socionext.com, debian-kernel@lists.debian.org, Riku Voipio <riku.voipio@linaro.org>, Timo Sigurdsson <public_timo.s@silentcreek.de>

From: Riku Voipio <riku.voipio@linaro.org>

The builddeb script has some hardcoded references to Linux version 2.6
which is ancient. Drop Provides as the virtual packages provided are not
useful anymore. Leave the Provides for linux-kernel-headers, as someone
might still be referring to it.

While at it, updated copyright date and drop Standards-Version:

Cc: Timo Sigurdsson <public_timo.s@silentcreek.de>
Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
v2: Drop Standards-Version: instead of updating as suggested by Ben
---
 scripts/package/builddeb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f04e91f0845d..c0107f581c5d 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -260,7 +260,7 @@ This is a packacked upstream version of the Linux kernel.
 The sources may be found at most Linux ftp sites, including:
 ftp://ftp.kernel.org/pub/linux/kernel
 
-Copyright: 1991 - 2015 Linus Torvalds and others.
+Copyright: 1991 - 2017 Linus Torvalds and others.
 
 The git repository for mainline kernel development is at:
 git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
@@ -283,7 +283,6 @@ Section: kernel
 Priority: optional
 Maintainer: $maintainer
 Build-Depends: $build_depends
-Standards-Version: 3.8.4
 Homepage: http://www.kernel.org/
 EOF
 
@@ -291,7 +290,6 @@ if [ "$ARCH" = "um" ]; then
 	cat <<EOF >> debian/control
 
 Package: $packagename
-Provides: linux-image, linux-image-2.6, linux-modules-$version
 Architecture: any
 Description: User Mode Linux kernel, version $version
  User-mode Linux is a port of the Linux kernel to its own system call
@@ -308,7 +306,6 @@ else
 	cat <<EOF >> debian/control
 
 Package: $packagename
-Provides: linux-image, linux-image-2.6, linux-modules-$version
 Suggests: $fwpackagename
 Architecture: any
 Description: Linux kernel, version $version
@@ -341,7 +338,6 @@ rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
 cat <<EOF >> debian/control
 
 Package: $kernel_headers_packagename
-Provides: linux-headers, linux-headers-2.6
 Architecture: any
 Description: Linux kernel headers for $KERNELRELEASE on \${kernel:debarch}
  This package provides kernel header files for $KERNELRELEASE on \${kernel:debarch}
@@ -399,7 +395,6 @@ if [ -n "$BUILD_DEBUG" ] ; then
 
 Package: $dbg_packagename
 Section: debug
-Provides: linux-debug, linux-debug-$version
 Architecture: any
 Description: Linux kernel debugging symbols for $version
  This package will come in handy if you need to debug the kernel. It provides
-- 
2.11.0

