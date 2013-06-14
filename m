Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:65529 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751640Ab3FNJrQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jun 2013 05:47:16 -0400
Received: by mail-wi0-f177.google.com with SMTP id ey16so101025wid.16
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Jun 2013 02:47:15 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
Subject: [PATCH v5 3/4] deb-pkg: fix installed image path on parisc, mips and powerpc
Date: Fri, 14 Jun 2013 11:46:56 +0200
Message-Id: <1371203217-19572-4-git-send-email-anisse@astier.eu>
In-Reply-To: <1371203217-19572-1-git-send-email-anisse@astier.eu>
References: <1371203217-19572-1-git-send-email-anisse@astier.eu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com, Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, Anisse Astier <anisse@astier.eu>

Signed-off-by: Anisse Astier <anisse@astier.eu>
Reviewed-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/package/builddeb | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 7c5703a..0dbada8 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -89,6 +89,20 @@ if [ "$ARCH" = "um" ] ; then
 	packagename=user-mode-linux-$version
 fi
 
+# Not all arches have the same installed path in debian
+# XXX: have each arch Makefile export a variable of the canonical image install
+# path instead
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
 BUILD_DEBUG="$(grep -s '^CONFIG_DEBUG_INFO=y' $KCONFIG_CONFIG || true)"
 
 # Setup the directory structure
@@ -116,16 +130,15 @@ if [ "$ARCH" = "um" ] ; then
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
 
 if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
-- 
1.8.3.rc1

