Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:50079 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754547AbbFTOsl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 20 Jun 2015 10:48:41 -0400
From: Karsten Merker <merker@debian.org>
Subject: [PATCH] kbuild: builddeb: Include dtbs in the Debian package built by "make deb-pkg"
Date: Sat, 20 Jun 2015 16:48:09 +0200
Message-Id: <1434811689-6923-1-git-send-email-merker@debian.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Karsten Merker <merker@debian.org>

Native Debian kernel packages include any dtbs that were generated
during the kernel build process in /usr/lib/${packagename}.
Do the same for Debian packages built by scripts/package/builddeb
(executed by the "deb-pkg" target).

Signed-off-by: Karsten Merker <merker@debian.org>
---
 scripts/package/builddeb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 88dbf23..944b560 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -143,6 +143,11 @@ else
 	cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_path"
 fi
 
+# If dtbs have been built for this arch, include them in the package
+if [ -d "arch/$ARCH/boot/dts" ]; then
+  find "arch/$ARCH/boot/dts" -iname '*.dtb' -exec sh -c "mkdir -p '$tmpdir/usr/lib/$packagename'; cp '{}' '$tmpdir/usr/lib/$packagename/'" \;
+fi
+
 if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 	INSTALL_MOD_PATH="$tmpdir" $MAKE KBUILD_SRC= modules_install
 	rm -f "$tmpdir/lib/modules/$version/build"
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
