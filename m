Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tartarus.angband.pl ([89.206.35.136]:55436 "EHLO
        tartarus.angband.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936216AbcKXB1X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Nov 2016 20:27:23 -0500
From: Adam Borowski <kilobyte@angband.pl>
Date: Thu, 24 Nov 2016 02:27:03 +0100
Message-Id: <20161124012703.15704-1-kilobyte@angband.pl>
Subject: [PATCH ping] builddeb: fix cross-building to arm64 producing host-arch debs
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Adam Borowski <kilobyte@angband.pl>

Both Debian and kernel archs are "arm64" but UTS_MACHINE and gcc say
"aarch64".  Recognizing just the latter should be enough but let's
accept both in case something regresses again or an user sets
UTS_MACHINE=arm64.

Regressed in cfa88c7: arm64: Set UTS_MACHINE in the Makefile.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
Acked-by: Riku Voipio <riku.voipio@linaro.org>
---
As 4.9 is not only a LTS, but also the kernel Debian stretch will use,
fixing this regression would be really nice.

 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 8ea9fd2..3c575cd0 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -51,7 +51,7 @@ set_debarch() {
 		debarch=hppa ;;
 	mips*)
 		debarch=mips$(grep -q CPU_LITTLE_ENDIAN=y $KCONFIG_CONFIG && echo el || true) ;;
-	arm64)
+	aarch64|arm64)
 		debarch=arm64 ;;
 	arm*)
 		if grep -q CONFIG_AEABI=y $KCONFIG_CONFIG; then
-- 
2.10.2

