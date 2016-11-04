Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tartarus.angband.pl ([89.206.35.136]:40012 "EHLO
        tartarus.angband.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934707AbcKDQOX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Nov 2016 12:14:23 -0400
From: Adam Borowski <kilobyte@angband.pl>
Date: Fri,  4 Nov 2016 17:14:07 +0100
Message-Id: <20161104161407.10354-1-kilobyte@angband.pl>
Subject: [PATCH] builddeb: fix cross-building to arm64 producing host-arch debs
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
Cc: Adam Borowski <kilobyte@angband.pl>

Both Debian and kernel archs are "arm64" but UTS_MACHINE and gcc say
"aarch64".

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
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

