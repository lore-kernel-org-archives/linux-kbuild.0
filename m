Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:34110 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753631AbbE1JLV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 May 2015 05:11:21 -0400
Received: by lbcmx3 with SMTP id mx3so23950485lbc.1
        for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2015 02:11:20 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH 1/2] deb-pkg: simplify directory creation
Date: Thu, 28 May 2015 12:11:14 +0300
Message-Id: <1432804275-13187-2-git-send-email-riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz, debian-kernel@lists.debian.org
Cc: Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

Every package needs /usr/share/doc/$package_name and
DEBIAN directory, so create them as part of create_package
function.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 scripts/package/builddeb | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index d30116b..0ccd7ee 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -15,6 +15,8 @@ set -e
 create_package() {
 	local pname="$1" pdir="$2"
 
+	mkdir -m 755 -p "$pdir/DEBIAN"
+	mkdir -p "$pdir/usr/share/doc/$pname"
 	cp debian/copyright "$pdir/usr/share/doc/$pname/"
 	cp debian/changelog "$pdir/usr/share/doc/$pname/changelog.Debian"
 	gzip -9 "$pdir/usr/share/doc/$pname/changelog.Debian"
@@ -114,24 +116,13 @@ BUILD_DEBUG="$(grep -s '^CONFIG_DEBUG_INFO=y' $KCONFIG_CONFIG || true)"
 # Setup the directory structure
 rm -rf "$tmpdir" "$fwdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir"
 mkdir -m 755 -p "$tmpdir/DEBIAN"
-mkdir -p  "$tmpdir/lib" "$tmpdir/boot" "$tmpdir/usr/share/doc/$packagename"
-mkdir -m 755 -p "$fwdir/DEBIAN"
-mkdir -p "$fwdir/lib/firmware/$version/" "$fwdir/usr/share/doc/$fwpackagename"
-mkdir -m 755 -p "$libc_headers_dir/DEBIAN"
-mkdir -p "$libc_headers_dir/usr/share/doc/$libc_headers_packagename"
-mkdir -m 755 -p "$kernel_headers_dir/DEBIAN"
-mkdir -p "$kernel_headers_dir/usr/share/doc/$kernel_headers_packagename"
+mkdir -p "$tmpdir/lib" "$tmpdir/boot"
+mkdir -p "$fwdir/lib/firmware/$version/"
 mkdir -p "$kernel_headers_dir/lib/modules/$version/"
-if [ "$ARCH" = "um" ] ; then
-	mkdir -p "$tmpdir/usr/lib/uml/modules/$version" "$tmpdir/usr/bin"
-fi
-if [ -n "$BUILD_DEBUG" ] ; then
-	mkdir -p "$dbg_dir/usr/share/doc/$dbg_packagename"
-	mkdir -m 755 -p "$dbg_dir/DEBIAN"
-fi
 
 # Build and install the kernel
 if [ "$ARCH" = "um" ] ; then
+	mkdir -p "$tmpdir/usr/lib/uml/modules/$version" "$tmpdir/usr/bin" "$tmpdir/usr/share/doc/$packagename"
 	$MAKE linux
 	cp System.map "$tmpdir/usr/lib/uml/modules/$version/System.map"
 	cp $KCONFIG_CONFIG "$tmpdir/usr/share/doc/$packagename/config"
-- 
2.1.4

