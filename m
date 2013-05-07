Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:45987 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757712Ab3EGPrr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 May 2013 11:47:47 -0400
Received: by mail-we0-f181.google.com with SMTP id q55so688437wes.40
        for <linux-kbuild@vger.kernel.org>; Tue, 07 May 2013 08:47:46 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
Subject: [PATCH v4 3/4] deb-pkg: fix installed image path on parisc, mips and powerpc
Date: Tue,  7 May 2013 17:46:50 +0200
Message-Id: <1367941611-12223-4-git-send-email-anisse@astier.eu>
In-Reply-To: <1367941611-12223-1-git-send-email-anisse@astier.eu>
References: <1367941611-12223-1-git-send-email-anisse@astier.eu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, Anisse Astier <anisse@astier.eu>, Ben Hutchings <bhutchings@solarflare.com>, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com

Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 scripts/package/builddeb | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 797484b..73bb551 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -89,6 +89,18 @@ if [ "$ARCH" = "um" ] ; then
 	packagename=user-mode-linux-$version
 fi
 
+# Not all arches have the same installed path in debian
+case $ARCH in
+um)
+	installed_image_path="usr/bin/linux-$version"
+	;;
+parisc|mips|powerpc)
+	installed_image_path="boot/vmlinux-$version"
+	;;
+*)
+	installed_image_path="boot/vmlinuz-$version"
+esac
+
 BUILD_DEBUG="$(grep -s '^CONFIG_DEBUG_INFO=y' $objtree/$KCONFIG_CONFIG || true)"
 
 # Setup the directory structure
@@ -116,16 +128,15 @@ if [ "$ARCH" = "um" ] ; then
 	cp System.map "$tmpdir/usr/lib/uml/modules/$version/System.map"
 	cp $KCONFIG_CONFIG "$tmpdir/usr/share/doc/$packagename/config"
 	gzip "$tmpdir/usr/share/doc/$packagename/config"
-	cp $KBUILD_IMAGE "$tmpdir/usr/bin/linux-$version"
 else 
 	cp System.map "$tmpdir/boot/System.map-$version"
 	cp $KCONFIG_CONFIG "$tmpdir/boot/config-$version"
-	# Not all arches include the boot path in KBUILD_IMAGE
-	if [ -e $KBUILD_IMAGE ]; then
-		cp $KBUILD_IMAGE "$tmpdir/boot/vmlinuz-$version"
-	else
-		cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/boot/vmlinuz-$version"
-	fi
+fi
+# Not all arches include the boot path in KBUILD_IMAGE
+if [ -e $KBUILD_IMAGE ]; then
+	cp $KBUILD_IMAGE "$tmpdir/$installed_image_path"
+else
+	cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_path"
 fi
 
 if grep -q '^CONFIG_MODULES=y' $objtree/$KCONFIG_CONFIG ; then
-- 
1.8.3.rc1

