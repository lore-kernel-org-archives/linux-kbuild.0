Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:55058 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752715AbdK0Vec (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:32 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 16/21] lto: Add __noreorder and mark initcalls __noreorder
Date: Mon, 27 Nov 2017 13:34:18 -0800
Message-Id: <20171127213423.27218-17-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

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
 include/linux/compiler-gcc.h   | 5 +++++
 include/linux/compiler_types.h | 3 +++
 include/linux/init.h           | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index 2272ded07496..0d562baeb379 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -324,6 +324,11 @@
 #define __no_sanitize_address
 #endif
 
+#if __GNUC__ >= 5
+/* Avoid reordering a top level statement */
+#define __noreorder    __attribute__((no_reorder))
+#endif
+
 /*
  * A trick to suppress uninitialized variable warning without generating any
  * code
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 6b79a9bba9a7..fe4604603f5e 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -260,6 +260,9 @@ struct ftrace_likely_data {
 #define __assume_aligned(a, ...)
 #endif
 
+#ifndef __noreorder
+#define __noreorder
+#endif
 
 /* Are two types/vars the same type (ignoring qualifiers)? */
 #ifndef __same_type
diff --git a/include/linux/init.h b/include/linux/init.h
index ea1b31101d9e..abf1980367b7 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -161,7 +161,7 @@ extern bool initcall_debug;
  */
 
 #define __define_initcall(fn, id) \
-	static initcall_t __initcall_##fn##id __used \
+	static initcall_t __initcall_##fn##id __used __noreorder \
 	__attribute__((__section__(".initcall" #id ".init"))) = fn;
 
 /*
-- 
2.13.6

