Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:38561 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751878AbdK3XjL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 18:39:11 -0500
Received: by mail-it0-f65.google.com with SMTP id r6so508470itr.3
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2017 15:39:11 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 1/7] kbuild: fix LD_DEAD_CODE_DATA_ELIMINATION
Date: Thu, 30 Nov 2017 15:38:59 -0800
Message-Id: <20171130233905.130602-2-samitolvanen@google.com>
In-Reply-To: <20171130233905.130602-1-samitolvanen@google.com>
References: <20171129234442.655-1-samitolvanen@google.com>
 <20171130233905.130602-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Nicholas Piggin <npiggin@gmail.com>
Cc: Sami Tolvanen <samitolvanen@google.com>

Don't remove .head.text or .exitcall.exit when linking with --gc-sections,
and include .init.text.* in .init.text and .init.rodata.* in .init.rodata.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/asm-generic/vmlinux.lds.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index ee8b707d9fa9..eb4199c12bd2 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -515,7 +515,7 @@
 		VMLINUX_SYMBOL(__softirqentry_text_end) = .;
 
 /* Section used for early init (in .S files) */
-#define HEAD_TEXT  *(.head.text)
+#define HEAD_TEXT  KEEP(*(.head.text))
 
 #define HEAD_TEXT_SECTION							\
 	.head.text : AT(ADDR(.head.text) - LOAD_OFFSET) {		\
@@ -560,7 +560,7 @@
 	MEM_DISCARD(init.data)						\
 	KERNEL_CTORS()							\
 	MCOUNT_REC()							\
-	*(.init.rodata)							\
+	*(.init.rodata .init.rodata.*)					\
 	FTRACE_EVENTS()							\
 	TRACE_SYSCALLS()						\
 	KPROBE_BLACKLIST()						\
@@ -579,7 +579,7 @@
 	EARLYCON_TABLE()
 
 #define INIT_TEXT							\
-	*(.init.text)							\
+	*(.init.text .init.text.*)					\
 	*(.text.startup)						\
 	MEM_DISCARD(init.text)
 
@@ -596,7 +596,7 @@
 	MEM_DISCARD(exit.text)
 
 #define EXIT_CALL							\
-	*(.exitcall.exit)
+	KEEP(*(.exitcall.exit))
 
 /*
  * bss (Block Started by Symbol) - uninitialized data
-- 
2.15.0.531.g2ccb3012c9-goog

