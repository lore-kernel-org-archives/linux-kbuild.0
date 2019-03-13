Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0131.hostedemail.com ([216.40.44.131]:44343 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726125AbfCMVNa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 17:13:30 -0400
Date: Wed, 13 Mar 2019 17:03:57 -0400
In-Reply-To: <20190313203741.142380-1-ndesaulniers@google.com>
References: <20190313161221.41797313@gandalf.local.home> <20190313203741.142380-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Re: [PATCH v3] lib/string.c: implement a basic bcmp
From: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <7549EE7E-4172-467D-815A-63664A33D410@goodmis.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>, akpm@linux-foundation.org
Cc: clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, stable@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, Arnd Bergmann <arnd@arndb.de>, James Y Knight <jyknight@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, Namhyung Kim <namhyung@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org



On March 13, 2019 4:37:37 PM EDT, Nick Desaulniers <ndesaulniers@google.com> wrote:
>A recent optimization in Clang (r355672) lowers comparisons of the
>return value of memcmp against zero to comparisons of the return value
>of bcmp against zero.  This helps some platforms that implement bcmp
>more efficiently than memcmp. glibc simply aliases bcmp to memcmp, but
>an optimized implementation is in the works.
>
>This results in linkage failures for all targets with Clang due to the
>undefined symbol.  For now, just implement bcmp as a tailcail to memcmp
>to unbreak the build.  This routine can be further optimized in the
>future.
>
>Other ideas discussed:
>* A weak alias was discussed, but breaks for architectures that define
>their own implementations of memcmp since aliases to declarations are
>not permitted (only definitions).  Arch-specific memcmp implementations
>typically declare memcmp in C headers, but implement them in assembly.
>* -ffreestanding also is used sporadically throughout the kernel.
>* -fno-builtin-bcmp doesn't work when doing LTO.
>
>Link: https://bugs.llvm.org/show_bug.cgi?id=41035
>Link: https://code.woboq.org/userspace/glibc/string/memcmp.c.html#bcmp
>Link:
>https://github.com/llvm/llvm-project/commit/8e16d73346f8091461319a7dfc4ddd18eedcff13
>Link: https://github.com/ClangBuiltLinux/linux/issues/416
>Cc: stable@vger.kernel.org
>Reported-by: Nathan Chancellor <natechancellor@gmail.com>
>Reported-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
>Suggested-by: Arnd Bergmann <arnd@arndb.de>
>Suggested-by: James Y Knight <jyknight@google.com>
>Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
>Suggested-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
>Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
>---
>Changes V2 -> V3:
>* Adjust comment as per Steven to Rasmus' sugguestion.
>* Pick up Steven's Ack.
>Changes V1 -> V2:
>* Add declaration to include/linux/string.h.
>* Reword comment above bcmp.
>
> include/linux/string.h |  3 +++
> lib/string.c           | 15 +++++++++++++++
> 2 files changed, 18 insertions(+)
>
>diff --git a/include/linux/string.h b/include/linux/string.h
>index 7927b875f80c..6ab0a6fa512e 100644
>--- a/include/linux/string.h
>+++ b/include/linux/string.h
>@@ -150,6 +150,9 @@ extern void * memscan(void *,int,__kernel_size_t);
> #ifndef __HAVE_ARCH_MEMCMP
> extern int memcmp(const void *,const void *,__kernel_size_t);
> #endif
>+#ifndef __HAVE_ARCH_BCMP
>+extern int bcmp(const void *,const void *,__kernel_size_t);
>+#endif
> #ifndef __HAVE_ARCH_MEMCHR
> extern void * memchr(const void *,int,__kernel_size_t);
> #endif
>diff --git a/lib/string.c b/lib/string.c
>index 38e4ca08e757..48a43a42d3f2 100644
>--- a/lib/string.c
>+++ b/lib/string.c
>@@ -866,6 +866,21 @@ __visible int memcmp(const void *cs, const void
>*ct, size_t count)
> EXPORT_SYMBOL(memcmp);
> #endif
> 
>+#ifndef __HAVE_ARCH_BCMP
>+/**
>+ * bcmp - returns 0 if and only if the buffers have identical
>contents.
>+ * @cs: One area of memory.
>+ * @ct: Another area of memory.
>+ * @count: The size of the areas.

Where's the rest of the comment that I gave my ack to?

-- Steve

>+ */
>+#undef bcmp
>+int bcmp(const void *cs, const void *ct, size_t count)
>+{
>+	return memcmp(cs, ct, count);
>+}
>+EXPORT_SYMBOL(bcmp);
>+#endif
>+
> #ifndef __HAVE_ARCH_MEMSCAN
> /**
>  * memscan - Find a character in an area of memory.

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity and top posting.
