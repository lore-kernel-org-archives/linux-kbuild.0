Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:38416 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757059Ab3EGPrp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 May 2013 11:47:45 -0400
Received: by mail-wg0-f45.google.com with SMTP id l18so814076wgh.24
        for <linux-kbuild@vger.kernel.org>; Tue, 07 May 2013 08:47:44 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
Subject: [PATCH v4 1/4] deb-pkg: use KCONFIG_CONFIG instead of .config file directly
Date: Tue,  7 May 2013 17:46:48 +0200
Message-Id: <1367941611-12223-2-git-send-email-anisse@astier.eu>
In-Reply-To: <1367941611-12223-1-git-send-email-anisse@astier.eu>
References: <1367941611-12223-1-git-send-email-anisse@astier.eu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, Anisse Astier <anisse@astier.eu>, Ben Hutchings <bhutchings@solarflare.com>, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com

Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 scripts/package/builddeb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index acb8650..2d84671 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -41,9 +41,9 @@ create_package() {
 	parisc*)
 		debarch=hppa ;;
 	mips*)
-		debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y .config && echo el) ;;
+		debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $objtree/$KCONFIG_CONFIG && echo el) ;;
 	arm*)
-		debarch=arm$(grep -q CONFIG_AEABI=y .config && echo el) ;;
+		debarch=arm$(grep -q CONFIG_AEABI=y $objtree/$KCONFIG_CONFIG && echo el) ;;
 	*)
 		echo "" >&2
 		echo "** ** **  WARNING  ** ** **" >&2
@@ -106,12 +106,12 @@ fi
 if [ "$ARCH" = "um" ] ; then
 	$MAKE linux
 	cp System.map "$tmpdir/usr/lib/uml/modules/$version/System.map"
-	cp .config "$tmpdir/usr/share/doc/$packagename/config"
+	cp $KCONFIG_CONFIG "$tmpdir/usr/share/doc/$packagename/config"
 	gzip "$tmpdir/usr/share/doc/$packagename/config"
 	cp $KBUILD_IMAGE "$tmpdir/usr/bin/linux-$version"
 else 
 	cp System.map "$tmpdir/boot/System.map-$version"
-	cp .config "$tmpdir/boot/config-$version"
+	cp $KCONFIG_CONFIG "$tmpdir/boot/config-$version"
 	# Not all arches include the boot path in KBUILD_IMAGE
 	if [ -e $KBUILD_IMAGE ]; then
 		cp $KBUILD_IMAGE "$tmpdir/boot/vmlinuz-$version"
@@ -120,7 +120,7 @@ else
 	fi
 fi
 
-if grep -q '^CONFIG_MODULES=y' .config ; then
+if grep -q '^CONFIG_MODULES=y' $objtree/$KCONFIG_CONFIG ; then
 	INSTALL_MOD_PATH="$tmpdir" $MAKE KBUILD_SRC= modules_install
 	rm -f "$tmpdir/lib/modules/$version/build"
 	rm -f "$tmpdir/lib/modules/$version/source"
@@ -245,7 +245,7 @@ fi
 # Build header package
 (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
 (cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$objtree/debian/hdrsrcfiles")
-(cd $objtree; find arch/$SRCARCH/include .config Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
+(cd $objtree; find arch/$SRCARCH/include $KCONFIG_CONFIG Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
 destdir=$kernel_headers_dir/usr/src/linux-headers-$version
 mkdir -p "$destdir"
 (cd $srctree; tar -c -f - -T "$objtree/debian/hdrsrcfiles") | (cd $destdir; tar -xf -)
-- 
1.8.3.rc1

