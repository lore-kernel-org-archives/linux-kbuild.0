Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f73.google.com ([209.85.166.73]:43461 "EHLO
        mail-io1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbfCMSCq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 14:02:46 -0400
Received: by mail-io1-f73.google.com with SMTP id n23so2177945ioj.10
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Mar 2019 11:02:46 -0700 (PDT)
Date: Wed, 13 Mar 2019 11:02:38 -0700
In-Reply-To: <CAKwvOd=8rAZi3ZT8qEupmS6xY2U10cKT7kPtB=gYfWsJEJ0GSQ@mail.gmail.com>
Message-Id: <20190313180239.261938-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <CAKwvOd=8rAZi3ZT8qEupmS6xY2U10cKT7kPtB=gYfWsJEJ0GSQ@mail.gmail.com>
Subject: [PATCH] lib/string.c: implement a basic bcmp
From: Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, stable@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, Arnd Bergmann <arnd@arndb.de>, James Y Knight <jyknight@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org

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
---
 lib/string.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/lib/string.c b/lib/string.c
index 38e4ca08e757..5b2377d7143f 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -866,6 +866,21 @@ __visible int memcmp(const void *cs, const void *ct, size_t count)
 EXPORT_SYMBOL(memcmp);
 #endif
 
+#ifndef __HAVE_ARCH_BCMP
+/**
+ * bcmp - Like memcmp but the return code simply indicates a non-match.
+ * @cs: One area of memory.
+ * @ct: Another area of memory.
+ * @count: The size of the areas.
+ */
+#undef bcmp
+int bcmp(const void *cs, const void *ct, size_t count)
+{
+	return memcmp(cs, ct, count);
+}
+EXPORT_SYMBOL(bcmp);
+#endif
+
 #ifndef __HAVE_ARCH_MEMSCAN
 /**
  * memscan - Find a character in an area of memory.
-- 
2.21.0.360.g471c308f928-goog
