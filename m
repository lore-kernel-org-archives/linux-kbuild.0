Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lebrac.rtp-net.org ([88.191.135.105]:49647 "EHLO
	lebrac.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751221Ab3KHIo1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Nov 2013 03:44:27 -0500
Message-Id: <20131107151746.950612598@rtp-net.org>
Date: Thu, 07 Nov 2013 16:17:34 +0100
From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: [patch 1/1] deb-pkg: Add device tree blobs to the package
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: maximilian attems <max@stro.at>, Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.cz>, Arnaud Patard <arnaud.patard@rtp-net.org>

When building a package with make deb-pkg (say, for arm), the dtb files are
not added to the package. Given that things are still evolving on arm, it
make sense to have them along with the kernel and modules.

Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
---

Index: linux-next/scripts/package/builddeb
===================================================================
--- linux-next.orig/scripts/package/builddeb	2013-11-06 12:51:49.548299578 +0100
+++ linux-next/scripts/package/builddeb	2013-11-06 12:52:24.152298055 +0100
@@ -140,6 +140,10 @@ if [ -e $KBUILD_IMAGE ]; then
 else
 	cp arch/$ARCH/boot/$KBUILD_IMAGE "$tmpdir/$installed_image_path"
 fi
+if grep -q "^CONFIG_OF=y" .config ; then
+	mkdir -p "$tmpdir/usr/lib/$packagename"
+	find arch/$ARCH -name *.dtb -exec cp {} "$tmpdir/usr/lib/$packagename" \;
+fi
 
 if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 	INSTALL_MOD_PATH="$tmpdir" $MAKE KBUILD_SRC= modules_install


