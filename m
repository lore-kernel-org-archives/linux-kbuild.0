Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lebrac.rtp-net.org ([195.154.106.105]:53010 "EHLO
	lebrac.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756843AbbAZUaE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 Jan 2015 15:30:04 -0500
Message-Id: <20150126194149.088416391@rtp-net.org>
Date: Mon, 26 Jan 2015 20:40:59 +0100
From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: [PATCHv3 1/1] deb-pkg: Add device tree blobs to the package
References: <20150126194058.881319393@rtp-net.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline; filename=builddeb-install-dtbs-if-needed.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: maximilian attems <max@stro.at>, Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.cz>

When building a package with make deb-pkg (say, for arm), the dtb files are
not added to the package. Given that things are still evolving on arm, it
make sense to have them along with the kernel and modules.

v3: handle with OF but without dtbs_install.
    Use $MAKE ... as done everywhere else in the script
v2: make use of dtbs_install

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
---

Index: linux-next/scripts/package/builddeb
===================================================================
--- linux-next.orig/scripts/package/builddeb	2015-01-14 13:04:45.845922441 +0100
+++ linux-next/scripts/package/builddeb	2015-01-24 21:39:40.047431257 +0100
@@ -143,6 +143,13 @@ else
 	cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_path"
 fi
 
+if grep -q "^CONFIG_OF=y" .config ; then
+	# Only some architectures with OF support have this target
+	if grep -q dtbs_install "${srctree}/arch/$SRCARCH/Makefile"; then
+		$MAKE KBUILD_SRC= INSTALL_DTBS_PATH="$tmpdir/usr/lib/$packagename" dtbs_install
+	fi
+fi
+
 if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 	INSTALL_MOD_PATH="$tmpdir" $MAKE KBUILD_SRC= modules_install
 	rm -f "$tmpdir/lib/modules/$version/build"


