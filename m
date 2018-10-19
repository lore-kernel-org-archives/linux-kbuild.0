Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35463 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbeJSUzh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Oct 2018 16:55:37 -0400
From: Du Changbin <changbin.du@gmail.com>
Subject: [PATCH v2 2/4] kernel hacking: new config NO_AUTO_INLINE to disable compiler auto-inline optimizations
Date: Fri, 19 Oct 2018 12:49:19 +0000
Message-Id: <20181019124921.13780-3-changbin.du@gmail.com>
In-Reply-To: <20181019124921.13780-1-changbin.du@gmail.com>
References: <20181019124921.13780-1-changbin.du@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net, tglx@linutronix.de, mingo@redhat.com, linux@armlinux.org.uk, akpm@linux-foundation.org
Cc: rostedt@goodmis.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sparse@vger.kernel.org, robin.murphy@arm.com, Du Changbin <changbin.du@gmail.com>

This patch add a new kernel hacking option NO_AUTO_INLINE. Selecting
this option will prevent the compiler from optimizing the kernel by
auto-inlining functions not marked with the inline keyword.

With this option, only functions explicitly marked with "inline" will
be inlined. This will allow the function tracer to trace more functions
because it only traces functions that the compiler has not inlined.

Signed-off-by: Du Changbin <changbin.du@gmail.com>
Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 Makefile          |  6 ++++++
 lib/Kconfig.debug | 17 +++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Makefile b/Makefile
index e8b599b4dcde..757d6507cb5c 100644
--- a/Makefile
+++ b/Makefile
@@ -749,6 +749,12 @@ KBUILD_CFLAGS 	+= $(call cc-option, -femit-struct-debug-baseonly) \
 		   $(call cc-option,-fno-var-tracking)
 endif
 
+ifdef CONFIG_NO_AUTO_INLINE
+KBUILD_CFLAGS   += $(call cc-option, -fno-inline-functions) \
+		   $(call cc-option, -fno-inline-small-functions) \
+		   $(call cc-option, -fno-inline-functions-called-once)
+endif
+
 ifdef CONFIG_FUNCTION_TRACER
 ifdef CONFIG_FTRACE_MCOUNT_RECORD
   # gcc 5 supports generating the mcount tables directly
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 4966c4fbe7f7..c7c28ee01dfc 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -211,6 +211,23 @@ config GDB_SCRIPTS
 	  instance. See Documentation/dev-tools/gdb-kernel-debugging.rst
 	  for further details.
 
+config NO_AUTO_INLINE
+	bool "Disable compiler auto-inline optimizations"
+	help
+	  This will prevent the compiler from optimizing the kernel by
+	  auto-inlining functions not marked with the inline keyword.
+	  With this option, only functions explicitly marked with
+	  "inline" will be inlined. This will allow the function tracer
+	  to trace more functions because it only traces functions that
+	  the compiler has not inlined.
+
+	  Enabling this function can help debugging a kernel if using
+	  the function tracer. But it can also change how the kernel
+	  works, because inlining functions may change the timing,
+	  which could make it difficult while debugging race conditions.
+
+	  If unsure, select N.
+
 config ENABLE_MUST_CHECK
 	bool "Enable __must_check logic"
 	default y
-- 
2.17.1
