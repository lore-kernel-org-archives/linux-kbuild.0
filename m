Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f202.google.com ([209.85.222.202]:53097 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbfCMVNm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 17:13:42 -0400
Received: by mail-qk1-f202.google.com with SMTP id k21so2803645qkg.19
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Mar 2019 14:13:41 -0700 (PDT)
Date: Wed, 13 Mar 2019 14:13:31 -0700
In-Reply-To: <7549EE7E-4172-467D-815A-63664A33D410@goodmis.org>
Message-Id: <20190313211335.165605-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <7549EE7E-4172-467D-815A-63664A33D410@goodmis.org>
Subject: [PATCH v4] lib/string.c: implement a basic bcmp
From: Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, stable@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, Arnd Bergmann <arnd@arndb.de>, James Y Knight <jyknight@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steven Rostedt <rostedt@goodmis.org>, Namhyung Kim <namhyung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org

A recent optimization in Clang (r355672) lowers comparisons of the
return value of memcmp against zero to comparisons of the return value
of bcmp against zero.  This helps some platforms that implement bcmp
more efficiently than memcmp. glibc simply aliases bcmp to memcmp, but
an optimized implementation is in the works.

This results in linkage failures for all targets with Clang due to the
undefined symbol.  For now, just implement bcmp as a tailcail to memcmp
to unbreak the build.  This routine can be further optimized in the
future.

Other ideas discussed:
* A weak alias was discussed, but breaks for architectures that define
their own implementations of memcmp since aliases to declarations are
not permitted (only definitions).  Arch-specific memcmp implementations
typically declare memcmp in C headers, but implement them in assembly.
* -ffreestanding also is used sporadically throughout the kernel.
* -fno-builtin-bcmp doesn't work when doing LTO.

Link: https://bugs.llvm.org/show_bug.cgi?id=41035
Link: https://code.woboq.org/userspace/glibc/string/memcmp.c.html#bcmp
Link: https://github.com/llvm/llvm-project/commit/8e16d73346f8091461319a7dfc4ddd18eedcff13
Link: https://github.com/ClangBuiltLinux/linux/issues/416
Cc: stable@vger.kernel.org
Reported-by: Nathan Chancellor <natechancellor@gmail.com>
Reported-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: James Y Knight <jyknight@google.com>
Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Suggested-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
Changes V3 -> V4:
* Include the entirety of Rasmus' sugguestion, as per Steven.
* Change formal parameter identifiers to match the comment.
Changes V2 -> V3:
* Adjust comment as per Steven to Rasmus' sugguestion.
* Pick up Steven's Ack.
Changes V1 -> V2:
* Add declaration to include/linux/string.h.
* Reword comment above bcmp.

 include/linux/string.h |  3 +++
 lib/string.c           | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index 7927b875f80c..6ab0a6fa512e 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -150,6 +150,9 @@ extern void * memscan(void *,int,__kernel_size_t);
 #ifndef __HAVE_ARCH_MEMCMP
 extern int memcmp(const void *,const void *,__kernel_size_t);
 #endif
+#ifndef __HAVE_ARCH_BCMP
+extern int bcmp(const void *,const void *,__kernel_size_t);
+#endif
 #ifndef __HAVE_ARCH_MEMCHR
 extern void * memchr(const void *,int,__kernel_size_t);
 #endif
diff --git a/lib/string.c b/lib/string.c
index 38e4ca08e757..3ab861c1a857 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -866,6 +866,26 @@ __visible int memcmp(const void *cs, const void *ct, size_t count)
 EXPORT_SYMBOL(memcmp);
 #endif
 
+#ifndef __HAVE_ARCH_BCMP
+/**
+ * bcmp - returns 0 if and only if the buffers have identical contents.
+ * @a: pointer to first buffer.
+ * @b: pointer to second buffer.
+ * @len: size of buffers.
+ *
+ * The sign or magnitude of a non-zero return value has no particular
+ * meaning, and architectures may implement their own more efficient bcmp(). So
+ * while this particular implementation is a simple (tail) call to memcmp, do
+ * not rely on anything but whether the return value is zero or non-zero.
+ */
+#undef bcmp
+int bcmp(const void *a, const void *b, size_t len)
+{
+	return memcmp(a, b, len);
+}
+EXPORT_SYMBOL(bcmp);
+#endif
+
 #ifndef __HAVE_ARCH_MEMSCAN
 /**
  * memscan - Find a character in an area of memory.
-- 
2.21.0.360.g471c308f928-goog
