Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:32888 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750714AbbDBL1v (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Apr 2015 07:27:51 -0400
Received: by lbbzk7 with SMTP id zk7so40891879lbb.0
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2015 04:27:50 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH 2/4] builddeb: install dtbs
Date: Thu,  2 Apr 2015 14:27:28 +0300
Message-Id: <f5cc7f6394efe3d5404beb5588b67671dca9fb74.1427968988.git.riku.voipio@linaro.org>
In-Reply-To: <cover.1427968988.git.riku.voipio@linaro.org>
References: <cover.1427968988.git.riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz, debian-kernel@lists.debian.org
Cc: Riku Voipio <riku.voipio@linaro.org>

From: Riku Voipio <riku.voipio@linaro.org>

When kernel is built with CONFIG_OF, install all built device
tree files built. The installation location used is same as
toplevel INSTALL_DTBS_PATH.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 scripts/package/builddeb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 146b74f..147264e 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -174,6 +174,10 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
 	fi
 fi
 
+if grep -q '^CONFIG_OF=y' $KCONFIG_CONFIG ; then
+	$MAKE dtbs_install KBUILD_SRC= INSTALL_DTBS_PATH="$tmpdir/boot/dtbs/$version/"
+fi
+
 if [ "$ARCH" != "um" ]; then
 	$MAKE headers_check KBUILD_SRC=
 	$MAKE headers_install KBUILD_SRC= INSTALL_HDR_PATH="$libc_headers_dir/usr"
-- 
2.1.4

