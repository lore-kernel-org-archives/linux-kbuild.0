Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:45104 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755137AbaGILg1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Jul 2014 07:36:27 -0400
From: Andrey Ryabinin <a.ryabinin@samsung.com>
Subject: [RFC/PATCH RESEND -next 03/21] x86: add kasan hooks fort
 memcpy/memmove/memset functions
Date: Wed, 09 Jul 2014 15:29:57 +0400
Message-id: <1404905415-9046-4-git-send-email-a.ryabinin@samsung.com>
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
 arch/x86/include/asm/string_32.h | 28 ++++++++++++++++++++++++++++
 arch/x86/include/asm/string_64.h | 24 ++++++++++++++++++++++++
 arch/x86/lib/Makefile            |  2 ++
 3 files changed, 54 insertions(+)

diff --git a/arch/x86/include/asm/string_32.h b/arch/x86/include/asm/string_32.h
index 3d3e835..a86615a 100644
--- a/arch/x86/include/asm/string_32.h
+++ b/arch/x86/include/asm/string_32.h
@@ -321,6 +321,32 @@ void *__constant_c_and_count_memset(void *s, unsigned long pattern,
 	 : __memset_generic((s), (c), (count)))
 
 #define __HAVE_ARCH_MEMSET
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
+ * In rare circumstances you may need to use the original functions,
+ * in such case put #undef KASAN_HOOKS before includes.
+ */
+
+#undef memcpy
+void *kasan_memset(void *ptr, int val, size_t len);
+void *kasan_memcpy(void *dst, const void *src, size_t len);
+void *kasan_memmove(void *dst, const void *src, size_t len);
+
+#define memcpy(dst, src, len) kasan_memcpy((dst), (src), (len))
+#define memset(ptr, val, len) kasan_memset((ptr), (val), (len))
+#define memmove(dst, src, len) kasan_memmove((dst), (src), (len))
+
+#else /* CONFIG_KASAN && KASAN_HOOKS */
+
 #if (__GNUC__ >= 4)
 #define memset(s, c, count) __builtin_memset(s, c, count)
 #else
@@ -331,6 +357,8 @@ void *__constant_c_and_count_memset(void *s, unsigned long pattern,
 	 : __memset((s), (c), (count)))
 #endif
 
+#endif /* CONFIG_KASAN && KASAN_HOOKS */
+
 /*
  * find the first occurrence of byte 'c', or 1 past the area if none
  */
diff --git a/arch/x86/include/asm/string_64.h b/arch/x86/include/asm/string_64.h
index 19e2c46..2af2dbe 100644
--- a/arch/x86/include/asm/string_64.h
+++ b/arch/x86/include/asm/string_64.h
@@ -63,6 +63,30 @@ char *strcpy(char *dest, const char *src);
 char *strcat(char *dest, const char *src);
 int strcmp(const char *cs, const char *ct);
 
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
+ * In rare circumstances you may need to use the original functions,
+ * in such case put #undef KASAN_HOOKS before includes.
+ */
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
 #endif /* __KERNEL__ */
 
 #endif /* _ASM_X86_STRING_64_H */
diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index 4d4f96a..d82bc35 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -2,6 +2,8 @@
 # Makefile for x86 specific library files.
 #
 
+KASAN_SANITIZE_memcpy_32.o := n
+
 inat_tables_script = $(srctree)/arch/x86/tools/gen-insn-attr-x86.awk
 inat_tables_maps = $(srctree)/arch/x86/lib/x86-opcode-map.txt
 quiet_cmd_inat_tables = GEN     $@
-- 
1.8.5.5

