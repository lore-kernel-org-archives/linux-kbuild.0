Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:35074 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750858AbaBHICG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 8 Feb 2014 03:02:06 -0500
From: Andi Kleen <ak@linux.intel.com>
Subject: [PATCH 03/17] lto: Make asmlinkage __visible
Date: Sat,  8 Feb 2014 09:01:07 +0100
Message-Id: <1391846481-31491-3-git-send-email-ak@linux.intel.com>
In-Reply-To: <1391846481-31491-1-git-send-email-ak@linux.intel.com>
References: <1391846481-31491-1-git-send-email-ak@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, x86@kernel.org, Andi Kleen <ak@linux.intel.com>

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 include/linux/linkage.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/linkage.h b/include/linux/linkage.h
index a6a42dd..34a513a 100644
--- a/include/linux/linkage.h
+++ b/include/linux/linkage.h
@@ -12,9 +12,9 @@
 #endif
 
 #ifdef __cplusplus
-#define CPP_ASMLINKAGE extern "C"
+#define CPP_ASMLINKAGE extern "C" __visible
 #else
-#define CPP_ASMLINKAGE
+#define CPP_ASMLINKAGE __visible
 #endif
 
 #ifndef asmlinkage
-- 
1.8.5.2

