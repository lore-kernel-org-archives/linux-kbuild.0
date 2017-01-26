Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:49215 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752358AbdAZHYK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Jan 2017 02:24:10 -0500
From: Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: [PATCH] Kbuild: fix file name in comment about extra gcc checks
Date: Thu, 26 Jan 2017 16:24:18 +0900
Message-id: <1485415458-31256-1-git-send-email-sw0312.kim@samsung.com>
References: <CGME20170126072407epcas5p2cd2014507bab754c1a225b89686c5134@epcas5p2.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sw0312.kim@samsung.com

Extra gcc checks like W=1 were moved to scripts/Makefile.exrawarn,
so the file name in comment needs to be fixed.

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 0988400..dbaada3 100644
--- a/Makefile
+++ b/Makefile
@@ -705,7 +705,7 @@ KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
 else
 
 # These warnings generated too much noise in a regular build.
-# Use make W=1 to enable them (see scripts/Makefile.build)
+# Use make W=1 to enable them (see scripts/Makefile.extrawarn)
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
 endif
-- 
1.7.4.1

