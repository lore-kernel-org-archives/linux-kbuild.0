Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:38632 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753089AbbDHNUM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Apr 2015 09:20:12 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH] lto: Add __noreorder and mark initcalls __noreorder
Date: Wed,  8 Apr 2015 06:17:38 -0700
Message-Id: <1428499058-8322-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: akpm@linux-foundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

gcc 5 has a new no_reorder attribute that prevents top level
reordering only for that symbol.

Kernels don't like any reordering of initcalls between files, as several
initcalls depend on each other. LTO previously needed to use
-fno-toplevel-reordering to prevent boot failures.

Add a __noreorder wrapper for the no_reorder attribute and use
it for initcalls.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 include/linux/compiler-gcc5.h | 3 +++
 include/linux/compiler.h      | 4 ++++
 include/linux/init.h          | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/linux/compiler-gcc5.h b/include/linux/compiler-gcc5.h
index efee493..9004c00 100644
--- a/include/linux/compiler-gcc5.h
+++ b/include/linux/compiler-gcc5.h
@@ -42,6 +42,9 @@
 /* Mark a function definition as prohibited from being cloned. */
 #define __noclone	__attribute__((__noclone__))
 
+/* Avoid reordering a top level statement */
+#define __noreorder	__attribute__((no_reorder))
+
 /*
  * Tell the optimizer that something else uses this function or variable.
  */
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 1b45e4a..ac639a1 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -334,6 +334,10 @@ static __always_inline void __write_once_size(volatile void *p, void *res, int s
 #define noinline
 #endif
 
+#ifndef __noreorder
+#define __noreorder		/* unimplemented */
+#endif
+
 /*
  * Rather then using noinline to prevent stack consumption, use
  * noinline_for_stack instead.  For documentation reasons.
diff --git a/include/linux/init.h b/include/linux/init.h
index 2df8e8d..a0a1244 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -191,7 +191,7 @@ extern bool initcall_debug;
  */
 
 #define __define_initcall(fn, id) \
-	static initcall_t __initcall_##fn##id __used \
+	static initcall_t __initcall_##fn##id __used __noreorder \
 	__attribute__((__section__(".initcall" #id ".init"))) = fn; \
 	LTO_REFERENCE_INITCALL(__initcall_##fn##id)
 
-- 
2.3.3

