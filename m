Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:63169 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755596AbaGILg4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Jul 2014 07:36:56 -0400
From: Andrey Ryabinin <a.ryabinin@samsung.com>
Subject: [RFC/PATCH RESEND -next 17/21] arm: add kasan hooks fort
 memcpy/memmove/memset functions
Date: Wed, 09 Jul 2014 15:30:11 +0400
Message-id: <1404905415-9046-18-git-send-email-a.ryabinin@samsung.com>
In-reply-to: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com>
References: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Dmitry Vyukov <dvyukov@google.com>, Konstantin Serebryany <kcc@google.com>, Alexey Preobrazhensky <preobr@google.com>, Andrey Konovalov <adech.fo@gmail.com>, Yuri Gribov <tetra2005@gmail.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Sasha Levin <sasha.levin@oracle.com>, Michal Marek <mmarek@suse.cz>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org, Andrey Ryabinin <a.ryabinin@samsung.com>

Since functions memset, memmove, memcpy are written in assembly,
compiler can't instrument memory accesses inside them.

This patch replaces these functions with our own instrumented
functions (kasan_mem*) for CONFIG_KASAN = y

In rare circumstances you may need to use the original functions,
in such case put #undef KASAN_HOOKS before includes.

Signed-off-by: Andrey Ryabinin <a.ryabinin@samsung.com>
---
 arch/arm/include/asm/string.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/include/asm/string.h b/arch/arm/include/asm/string.h
index cf4f3aa..3cbe47f 100644
--- a/arch/arm/include/asm/string.h
+++ b/arch/arm/include/asm/string.h
@@ -38,4 +38,34 @@ extern void __memzero(void *ptr, __kernel_size_t n);
 		(__p);							\
 	})
 
+
+#if defined(CONFIG_KASAN) && defined(KASAN_HOOKS)
+
+/*
+ * Since some of the following functions (memset, memmove, memcpy)
+ * are written in assembly, compiler can't instrument memory accesses
+ * inside them.
+ *
+ * To solve this issue we replace these functions with our own instrumented
+ * functions (kasan_mem*)
+ *
+ * In case if any of mem*() fucntions are written in C we use our instrumented
+ * functions for perfomance reasons. It's should be faster to check whole
+ * accessed memory range at once, then do a lot of checks at each memory access.
+ *
+ * In rare circumstances you may need to use the original functions,
+ * in such case #undef KASAN_HOOKS before includes.
+ */
+#undef memset
+
+void *kasan_memset(void *ptr, int val, size_t len);
+void *kasan_memcpy(void *dst, const void *src, size_t len);
+void *kasan_memmove(void *dst, const void *src, size_t len);
+
+#define memcpy(dst, src, len) kasan_memcpy((dst), (src), (len))
+#define memset(ptr, val, len) kasan_memset((ptr), (val), (len))
+#define memmove(dst, src, len) kasan_memmove((dst), (src), (len))
+
+#endif /* CONFIG_KASAN && KASAN_HOOKS */
+
 #endif
-- 
1.8.5.5

