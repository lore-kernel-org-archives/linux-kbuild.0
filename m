Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38656 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751762AbdCJCBF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Mar 2017 21:01:05 -0500
From: Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: [RESEND][PATCH] Kbuild: fix file name in comment about extra gcc checks
Date: Fri, 10 Mar 2017 11:01:00 +0900
Message-id: <1489111260-5458-1-git-send-email-sw0312.kim@samsung.com>
References: <CGME20170310020057epcas5p228e45982244ea0d7fd1e36a0620d0768@epcas5p2.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org
Cc: sw0312.kim@samsung.com

Extra gcc checks like W=1 were moved to scripts/Makefile.exrawarn,
so the file name in comment needs to be fixed.

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 165cf97..faa9d26 100644
--- a/Makefile
+++ b/Makefile
@@ -707,7 +707,7 @@ KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
 else
 
 # These warnings generated too much noise in a regular build.
-# Use make W=1 to enable them (see scripts/Makefile.build)
+# Use make W=1 to enable them (see scripts/Makefile.extrawarn)
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
 endif
-- 
1.7.4.1

