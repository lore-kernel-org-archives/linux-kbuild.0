Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:36179 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750765AbbDBL1w (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Apr 2015 07:27:52 -0400
Received: by labe2 with SMTP id e2so57795817lab.3
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2015 04:27:51 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH 3/4] builddeb: simplify directory creation
Date: Thu,  2 Apr 2015 14:27:29 +0300
Message-Id: <7afba8dbcecde56aaaa93d7ae38e6bd960380696.1427968988.git.riku.voipio@linaro.org>
In-Reply-To: <cover.1427968988.git.riku.voipio@linaro.org>
References: <cover.1427968988.git.riku.voipio@linaro.org>
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
 scripts/package/builddeb | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 147264e..36185d6 100755
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
@@ -118,25 +120,13 @@ BUILD_DEBUG="$(grep -s '^CONFIG_DEBUG_INFO=y' $KCONFIG_CONFIG || true)"
 
 # Setup the directory structure
 rm -rf "$tmpdir" "$fwdir" "$kernel_headers_dir" "$libc_headers_dir" "$dbg_dir"
-mkdir -m 755 -p "$tmpdir/DEBIAN"
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
@@ -194,6 +184,7 @@ if grep -q '^CONFIG_BLK_DEV_INITRD=y' $KCONFIG_CONFIG; then
 else
 	want_initrd=No
 fi
+mkdir -m 755 -p "$tmpdir/DEBIAN"
 for script in postinst postrm preinst prerm ; do
 	mkdir -p "$tmpdir$debhookdir/$script.d"
 	cat <<EOF > "$tmpdir/DEBIAN/$script"
-- 
2.1.4

