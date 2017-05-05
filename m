Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46472 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751335AbdEEMWD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 May 2017 08:22:03 -0400
From: Jiri Slaby <jslaby@suse.cz>
Subject: [PATCH 1/7] DWARF: add option to preserve unwind info
Date: Fri,  5 May 2017 14:21:54 +0200
Message-Id: <20170505122200.31436-1-jslaby@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: torvalds@linux-foundation.org, live-patching@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kbuild@vger.kernel.org

It may be useful for some tools like gdb or latencytop. So we introduce
CONFIG_UNWIND_INFO. This information is also used by the DWARF unwinder in the
next patches.

In particular, we enable asynchronous unwind tables -- the out-of-band DWARF
info proper. And we also let the linker to generate an index for a fast binary
lookup (eh-frame-hdr).

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org
Cc: linux-kbuild@vger.kernel.org
---
 Makefile                      |  5 +++++
 arch/x86/Makefile             |  2 ++
 arch/x86/entry/calling.h      | 13 +++++++++++++
 arch/x86/kernel/vmlinux.lds.S |  2 ++
 lib/Kconfig.debug             | 10 ++++++++++
 5 files changed, 32 insertions(+)

diff --git a/Makefile b/Makefile
index 23cc5d65172b..0eabd1300c69 100644
--- a/Makefile
+++ b/Makefile
@@ -739,6 +739,11 @@ endif
 
 KBUILD_CFLAGS   += $(call cc-option, -fno-var-tracking-assignments)
 
+ifdef CONFIG_UNWIND_INFO
+KBUILD_CFLAGS	+= -fasynchronous-unwind-tables
+LDFLAGS_vmlinux	+= --eh-frame-hdr
+endif
+
 ifdef CONFIG_DEBUG_INFO
 ifdef CONFIG_DEBUG_INFO_SPLIT
 KBUILD_CFLAGS   += $(call cc-option, -gsplit-dwarf, -g)
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 4430dd489620..a4ab13b383cb 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -212,7 +212,9 @@ KBUILD_CFLAGS += -pipe
 # Workaround for a gcc prelease that unfortunately was shipped in a suse release
 KBUILD_CFLAGS += -Wno-sign-compare
 #
+ifneq ($(CONFIG_UNWIND_INFO),y)
 KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
+endif
 
 KBUILD_CFLAGS += $(mflags-y)
 KBUILD_AFLAGS += $(mflags-y)
diff --git a/arch/x86/entry/calling.h b/arch/x86/entry/calling.h
index 05ed3d393da7..fd2334ee62fd 100644
--- a/arch/x86/entry/calling.h
+++ b/arch/x86/entry/calling.h
@@ -48,6 +48,19 @@ For 32-bit we have the following conventions - kernel is built with
 
 */
 
+#if !defined(CONFIG_UNWIND_INFO) && defined(CONFIG_AS_CFI_SECTIONS) \
+	&& defined(__ASSEMBLY__)
+	/*
+	 * Emit CFI data in .debug_frame sections, not .eh_frame sections.
+	 * The latter we currently just discard since we don't do DWARF
+	 * unwinding at runtime.  So only the offline DWARF information is
+	 * useful to anyone.  Note we should not use this directive if this
+	 * file is used in the vDSO assembly, or if vmlinux.lds.S gets
+	 * changed so it doesn't discard .eh_frame.
+	 */
+	.cfi_sections .debug_frame
+#endif
+
 #ifdef CONFIG_X86_64
 
 /*
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index c8a3b61be0aa..7dfe103d4fae 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -345,7 +345,9 @@ SECTIONS
 	/* Sections to be discarded */
 	DISCARDS
 	/DISCARD/ : {
+#ifndef CONFIG_UNWIND_INFO
 		*(.eh_frame)
+#endif
 	}
 }
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index e4587ebe52c7..e90125b6498e 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -45,6 +45,16 @@ config MESSAGE_LOGLEVEL_DEFAULT
 	  by default. To change that, use loglevel=<x> in the kernel bootargs,
 	  or pick a different CONSOLE_LOGLEVEL_DEFAULT configuration value.
 
+config UNWIND_INFO
+	bool "Compile the kernel with frame unwind information"
+	depends on !IA64 && !PARISC && !ARM
+	depends on !MODULES || !(MIPS || PPC || SUPERH || V850)
+	help
+	  If you say Y here the resulting kernel image will be slightly larger
+	  but not slower, and it will give very useful debugging information.
+	  If you don't debug the kernel, you can say N, but we may not be able
+	  to solve problems without frame unwind information or frame pointers.
+
 config BOOT_PRINTK_DELAY
 	bool "Delay each boot printk message by N milliseconds"
 	depends on DEBUG_KERNEL && PRINTK && GENERIC_CALIBRATE_DELAY
-- 
2.12.2

