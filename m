Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:12903 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755977AbaBRO3r (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 09:29:47 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 04/20] lto, workaround: Add workaround for initcall reordering
Date: Tue, 18 Feb 2014 15:28:42 +0100
Message-Id: <1392733738-8290-5-git-send-email-andi@firstfloor.org>
In-Reply-To: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
References: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: sam@ravnborg.org, x86@kernel.org, linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

Work around a LTO gcc problem: when there is no reference to a variable
in a module it will be moved to the end of the program. This causes
reordering of initcalls which the kernel does not like.
Add a dummy reference function to avoid this. The function is
deleted by the linker.

This replaces a previous much slower workaround.

Thanks to Honza Hubicka for suggesting this technique.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 include/linux/init.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/linux/init.h b/include/linux/init.h
index e168880..a3ba270 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -163,6 +163,23 @@ extern bool initcall_debug;
 
 #ifndef __ASSEMBLY__
 
+#ifdef CONFIG_LTO
+/* Work around a LTO gcc problem: when there is no reference to a variable
+ * in a module it will be moved to the end of the program. This causes
+ * reordering of initcalls which the kernel does not like.
+ * Add a dummy reference function to avoid this. The function is
+ * deleted by the linker.
+ */
+#define LTO_REFERENCE_INITCALL(x) \
+	; /* yes this is needed */			\
+	static __used __exit void *reference_##x(void)	\
+	{						\
+		return &x;				\
+	}
+#else
+#define LTO_REFERENCE_INITCALL(x)
+#endif
+
 /* initcalls are now grouped by functionality into separate 
  * subsections. Ordering inside the subsections is determined
  * by link order. 
@@ -175,7 +192,8 @@ extern bool initcall_debug;
 
 #define __define_initcall(fn, id) \
 	static initcall_t __initcall_##fn##id __used \
-	__attribute__((__section__(".initcall" #id ".init"))) = fn
+	__attribute__((__section__(".initcall" #id ".init"))) = fn; \
+	LTO_REFERENCE_INITCALL(__initcall_##fn##id)
 
 /*
  * Early initcalls run before initializing SMP.
-- 
1.8.5.2

