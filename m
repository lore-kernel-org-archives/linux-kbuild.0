Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:40630 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758953AbdKOVep (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 16:34:45 -0500
Received: by mail-io0-f196.google.com with SMTP id 71so3090176ior.7
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Nov 2017 13:34:44 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 02/18] kbuild: fix LD_DEAD_CODE_DATA_ELIMINATION with GNU gold
Date: Wed, 15 Nov 2017 13:34:12 -0800
Message-Id: <20171115213428.22559-3-samitolvanen@google.com>
In-Reply-To: <20171115213428.22559-1-samitolvanen@google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>

Don't remove .head.text or .exitcall.exit when linking with --gc-sections,
and include .init.text.* in .init.text and .init.rodata.* in .init.rodata.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/asm-generic/vmlinux.lds.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index bdcd1caae092..ce0244780988 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -512,7 +512,7 @@
 		VMLINUX_SYMBOL(__softirqentry_text_end) = .;
 
 /* Section used for early init (in .S files) */
-#define HEAD_TEXT  *(.head.text)
+#define HEAD_TEXT  KEEP(*(.head.text))
 
 #define HEAD_TEXT_SECTION							\
 	.head.text : AT(ADDR(.head.text) - LOAD_OFFSET) {		\
@@ -557,7 +557,7 @@
 	MEM_DISCARD(init.data)						\
 	KERNEL_CTORS()							\
 	MCOUNT_REC()							\
-	*(.init.rodata)							\
+	*(.init.rodata .init.rodata.*)					\
 	FTRACE_EVENTS()							\
 	TRACE_SYSCALLS()						\
 	KPROBE_BLACKLIST()						\
@@ -576,7 +576,7 @@
 	EARLYCON_TABLE()
 
 #define INIT_TEXT							\
-	*(.init.text)							\
+	*(.init.text .init.text.*)					\
 	*(.text.startup)						\
 	MEM_DISCARD(init.text)
 
@@ -593,7 +593,7 @@
 	MEM_DISCARD(exit.text)
 
 #define EXIT_CALL							\
-	*(.exitcall.exit)
+	KEEP(*(.exitcall.exit))
 
 /*
  * bss (Block Started by Symbol) - uninitialized data
-- 
2.15.0.448.gf294e3d99a-goog

