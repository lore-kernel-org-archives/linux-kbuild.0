Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:36160 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750765AbbDBL1u (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Apr 2015 07:27:50 -0400
Received: by labe2 with SMTP id e2so57795260lab.3
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2015 04:27:49 -0700 (PDT)
From: riku.voipio@linaro.org
Subject: [PATCH 1/4] deb-pkg: Add automatic support for armhf architecture
Date: Thu,  2 Apr 2015 14:27:27 +0300
Message-Id: <834bd55c0de686780eb15f9a06b13f7fb560e9a8.1427968988.git.riku.voipio@linaro.org>
In-Reply-To: <cover.1427968988.git.riku.voipio@linaro.org>
References: <cover.1427968988.git.riku.voipio@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz, debian-kernel@lists.debian.org
Cc: Ben Hutchings <ben@decadent.org.uk>, debian-arm@lists.debian.org

From: Ben Hutchings <ben@decadent.org.uk>

The Debian armhf architecture uses the ARM EABI hard-float variant,
whereas armel uses the soft-float variant.  If the compiler used
to compile the kernel uses the __ARM_PCS_VFP ABI, the compiler
targets armhf architecture.

v3 by Riku: Use gcc define instead of CONFIG_VFP

Cc: debian-arm@lists.debian.org
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 scripts/package/builddeb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 88dbf23..146b74f 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -45,7 +45,16 @@ create_package() {
 	arm64)
 		debarch=arm64 ;;
 	arm*)
-		debarch=arm$(grep -q CONFIG_AEABI=y $KCONFIG_CONFIG && echo el || true) ;;
+		if grep -q CONFIG_AEABI=y $KCONFIG_CONFIG; then
+			if $CC -dM -E - < /dev/null|grep -q __ARM_PCS_VFP; then
+				debarch=armhf
+			else
+				debarch=armel
+			fi
+		else
+			debarch=arm
+		fi
+		;;
 	*)
 		echo "" >&2
 		echo "** ** **  WARNING  ** ** **" >&2
-- 
2.1.4

