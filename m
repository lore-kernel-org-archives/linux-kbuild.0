Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:58411 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754628AbaDLRPn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Apr 2014 13:15:43 -0400
Received: by mail-la0-f48.google.com with SMTP id gf5so4386813lab.7
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Apr 2014 10:15:41 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [PATCH] deb-pkg: install device tree blobs in linux-image package
Date: Sat, 12 Apr 2014 20:15:31 +0300
Message-Id: <1397322931-16688-1-git-send-email-fathi.boudra@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, Ben Hutchings <ben@decadent.org.uk>, Maximilian Attems <maks@debian.org>, Fathi Boudra <fathi.boudra@linaro.org>

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 scripts/package/builddeb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index f46e4dd..24cb3b1 100644
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -165,6 +165,11 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 	fi
 fi
 
+if grep -q '^CONFIG_OF=y' $KCONFIG_CONFIG ; then
+	mkdir -p "$tmpdir/boot/dtb/$version"
+	INSTALL_DTBS_PATH="$tmpdir/boot/dtb/$version" $MAKE KBUILD_SRC= dtbs_install
+fi
+
 if [ "$ARCH" != "um" ]; then
 	$MAKE headers_check KBUILD_SRC=
 	$MAKE headers_install KBUILD_SRC= INSTALL_HDR_PATH="$libc_headers_dir/usr"
-- 
1.9.1

