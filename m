Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lebrac.rtp-net.org ([195.154.106.105]:34774 "EHLO
	lebrac.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752499AbbANMs1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Jan 2015 07:48:27 -0500
Message-Id: <20150114123658.185884720@rtp-net.org>
Date: Wed, 14 Jan 2015 13:32:02 +0100
From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: [PATCHv2 1/1] deb-pkg: Add device tree blobs to the package
References: <20150114123201.434698327@rtp-net.org>
Content-Disposition: inline; filename=builddeb-install-dtbs-if-needed.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: maximilian attems <max@stro.at>, Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.cz>

When building a package with make deb-pkg (say, for arm), the dtb files are
not added to the package. Given that things are still evolving on arm, it
make sense to have them along with the kernel and modules.

v2: make use of dtbs_install

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
---

Index: linux-next/scripts/package/builddeb
===================================================================
--- linux-next.orig/scripts/package/builddeb	2015-01-14 13:04:45.845922441 +0100
+++ linux-next/scripts/package/builddeb	2015-01-14 13:19:26.121883720 +0100
@@ -143,6 +143,10 @@ else
 	cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_path"
 fi
 
+if grep -q "^CONFIG_OF=y" .config ; then
+	make INSTALL_DTBS_PATH="$tmpdir/usr/lib/$packagename" dtbs_install
+fi
+
 if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 	INSTALL_MOD_PATH="$tmpdir" $MAKE KBUILD_SRC= modules_install
 	rm -f "$tmpdir/lib/modules/$version/build"


