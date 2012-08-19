Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:64945 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753990Ab2HSC5q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Aug 2012 22:57:46 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 55/74] lto, workaround: Add workaround for initcall reordering
Date: Sat, 18 Aug 2012 19:56:51 -0700
Message-Id: <1345345030-22211-56-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

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
 include/linux/init.h |   20 +++++++++++++++++++-
 1 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/include/linux/init.h b/include/linux/init.h
index c2f06b3..e425800 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -176,6 +176,23 @@ extern bool initcall_debug;
 
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
+	static __used __exit void *reference_##x(void) 	\
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
@@ -188,7 +205,8 @@ extern bool initcall_debug;
 
 #define __define_initcall(level,fn,id) \
 	static initcall_t __initcall_##fn##id __used \
-	__attribute__((__section__(".initcall" level ".init"))) = fn
+	__attribute__((__section__(".initcall" level ".init"))) = fn \
+	LTO_REFERENCE_INITCALL(__initcall_##fn##id)
 
 /*
  * Early initcalls run before initializing SMP.
-- 
1.7.7.6

