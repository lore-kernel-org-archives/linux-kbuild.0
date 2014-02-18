Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:12903 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755979AbaBRO3r (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 09:29:47 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 03/20] lto: Make asmlinkage __visible
Date: Tue, 18 Feb 2014 15:28:41 +0100
Message-Id: <1392733738-8290-4-git-send-email-andi@firstfloor.org>
In-Reply-To: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
References: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: sam@ravnborg.org, x86@kernel.org, linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

With LTO the compiler needs to know which function can be
called from assembler, otherwise it would optimize
those functions away. We use the existing asmlinkage
for this, which is already used widely.

Note this causes warnings for static asmlinkage, which
is used in some places. These can be later cleaned up.
static asmlinkage usually makes no sense.

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

