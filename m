Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:17232 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727261AbgCXIvL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 04:51:11 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 09/16] x86: replace arch macros from compiler with CONFIG_X86_{32,64}
Date: Tue, 24 Mar 2020 17:48:14 +0900
Message-Id: <20200324084821.29944-10-masahiroy@kernel.org>
In-Reply-To: <20200324084821.29944-1-masahiroy@kernel.org>
References: <20200324084821.29944-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Linus Torvalds <torvalds@linux-foundation.org>, Kees Cook <keescook@chromium.org>, clang-built-linux@googlegroups.com, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>

If the intention is to check i386/x86_64 excluding UML, testing
CONFIG_X86_{32,64} is simpler.

The reason for checking __i386__ / __x86_64__ was perhaps because
lib/raid6/algos.c is built not only for the kernel but also for
testing the library code from userspace.

However, lib/raid6/test/Makefile passes -DCONFIG_X86_{32,64} for
this case. So, I do not see a reason to not use CONFIG option here.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---

 kernel/signal.c   | 2 +-
 lib/raid6/algos.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index 5b2396350dd1..db557e1629e5 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1246,7 +1246,7 @@ static void print_fatal_signal(int signr)
 	struct pt_regs *regs = signal_pt_regs();
 	pr_info("potentially unexpected fatal signal %d.\n", signr);
 
-#if defined(__i386__) && !defined(__arch_um__)
+#ifdef CONFIG_X86_32
 	pr_info("code at %08lx: ", regs->ip);
 	{
 		int i;
diff --git a/lib/raid6/algos.c b/lib/raid6/algos.c
index df08664d3432..b5a02326cfb7 100644
--- a/lib/raid6/algos.c
+++ b/lib/raid6/algos.c
@@ -29,7 +29,7 @@ struct raid6_calls raid6_call;
 EXPORT_SYMBOL_GPL(raid6_call);
 
 const struct raid6_calls * const raid6_algos[] = {
-#if defined(__i386__) && !defined(__arch_um__)
+#ifdef CONFIG_X86_32
 #ifdef CONFIG_AS_AVX512
 	&raid6_avx512x2,
 	&raid6_avx512x1,
@@ -45,7 +45,7 @@ const struct raid6_calls * const raid6_algos[] = {
 	&raid6_mmxx2,
 	&raid6_mmxx1,
 #endif
-#if defined(__x86_64__) && !defined(__arch_um__)
+#ifdef CONFIG_X86_64
 #ifdef CONFIG_AS_AVX512
 	&raid6_avx512x4,
 	&raid6_avx512x2,
-- 
2.17.1
