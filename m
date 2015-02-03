Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lebrac.rtp-net.org ([195.154.106.105]:35680 "EHLO
	lebrac.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753698AbbBCMTj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Feb 2015 07:19:39 -0500
Message-Id: <20150203121648.046396044@rtp-net.org>
Date: Tue, 03 Feb 2015 13:16:33 +0100
From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: [PATCHv4 1/1] deb-pkg: Add device tree blobs to the package
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

v4: Use $KCONFIG_CONFIG
v3: handle with OF but without dtbs_install.
    Use $MAKE ... as done everywhere else in the script
v2: make use of dtbs_install

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
---

Index: linux-next/scripts/package/builddeb
===================================================================
--- linux-next.orig/scripts/package/builddeb	2015-01-14 13:04:45.845922441 +0100
+++ linux-next/scripts/package/builddeb	2015-01-28 09:25:15.298796403 +0100
@@ -143,6 +143,13 @@ else
 	cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_path"
 fi
 
+if grep -q "^CONFIG_OF=y" $KCONFIG_CONFIG ; then
+	# Only some architectures with OF support have this target
+	if grep -q dtbs_install "${srctree}/arch/$SRCARCH/Makefile"; then
+		$MAKE KBUILD_SRC= INSTALL_DTBS_PATH="$tmpdir/usr/lib/$packagename" dtbs_install
+	fi
+fi
+
 if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 	INSTALL_MOD_PATH="$tmpdir" $MAKE KBUILD_SRC= modules_install
 	rm -f "$tmpdir/lib/modules/$version/build"


