Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:32887 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161313AbcKAB4j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 Oct 2016 21:56:39 -0400
Received: by mail-pf0-f194.google.com with SMTP id a136so6781164pfa.0
        for <linux-kbuild@vger.kernel.org>; Mon, 31 Oct 2016 18:56:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 2/2] kbuild: keep data tables through dead code elimination
Date: Tue,  1 Nov 2016 12:56:14 +1100
Message-Id: <20161101015614.1546-3-npiggin@gmail.com>
In-Reply-To: <20161101015614.1546-1-npiggin@gmail.com>
References: <20161101015614.1546-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>

When CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is enabled we must ensure
that we still keep various programatically-accessed tables.

[npiggin: Fold Paul's patches into one, and add a few more tables.
 diff symbol tables of allyesconfig with/without -gc-sections shows up
 lost tables quite easily.]

Signed-off-by: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/asm-generic/vmlinux.lds.h | 68 +++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 3074796..5372775 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -114,7 +114,7 @@
 #ifdef CONFIG_KPROBES
 #define KPROBE_BLACKLIST()	. = ALIGN(8);				      \
 				VMLINUX_SYMBOL(__start_kprobe_blacklist) = .; \
-				*(_kprobe_blacklist)			      \
+				KEEP(*(_kprobe_blacklist))		      \
 				VMLINUX_SYMBOL(__stop_kprobe_blacklist) = .;
 #else
 #define KPROBE_BLACKLIST()
@@ -123,10 +123,10 @@
 #ifdef CONFIG_EVENT_TRACING
 #define FTRACE_EVENTS()	. = ALIGN(8);					\
 			VMLINUX_SYMBOL(__start_ftrace_events) = .;	\
-			*(_ftrace_events)				\
+			KEEP(*(_ftrace_events))				\
 			VMLINUX_SYMBOL(__stop_ftrace_events) = .;	\
 			VMLINUX_SYMBOL(__start_ftrace_enum_maps) = .;	\
-			*(_ftrace_enum_map)				\
+			KEEP(*(_ftrace_enum_map))			\
 			VMLINUX_SYMBOL(__stop_ftrace_enum_maps) = .;
 #else
 #define FTRACE_EVENTS()
@@ -134,10 +134,10 @@
 
 #ifdef CONFIG_TRACING
 #define TRACE_PRINTKS() VMLINUX_SYMBOL(__start___trace_bprintk_fmt) = .;      \
-			 *(__trace_printk_fmt) /* Trace_printk fmt' pointer */ \
+			 KEEP(*(__trace_printk_fmt)) /* Trace_printk fmt' pointer */ \
 			 VMLINUX_SYMBOL(__stop___trace_bprintk_fmt) = .;
 #define TRACEPOINT_STR() VMLINUX_SYMBOL(__start___tracepoint_str) = .;	\
-			 *(__tracepoint_str) /* Trace_printk fmt' pointer */ \
+			 KEEP(*(__tracepoint_str)) /* Trace_printk fmt' pointer */ \
 			 VMLINUX_SYMBOL(__stop___tracepoint_str) = .;
 #else
 #define TRACE_PRINTKS()
@@ -147,7 +147,7 @@
 #ifdef CONFIG_FTRACE_SYSCALLS
 #define TRACE_SYSCALLS() . = ALIGN(8);					\
 			 VMLINUX_SYMBOL(__start_syscalls_metadata) = .;	\
-			 *(__syscalls_metadata)				\
+			 KEEP(*(__syscalls_metadata))			\
 			 VMLINUX_SYMBOL(__stop_syscalls_metadata) = .;
 #else
 #define TRACE_SYSCALLS()
@@ -156,7 +156,7 @@
 #ifdef CONFIG_SERIAL_EARLYCON
 #define EARLYCON_TABLE() STRUCT_ALIGN();			\
 			 VMLINUX_SYMBOL(__earlycon_table) = .;	\
-			 *(__earlycon_table)			\
+			 KEEP(*(__earlycon_table))		\
 			 VMLINUX_SYMBOL(__earlycon_table_end) = .;
 #else
 #define EARLYCON_TABLE()
@@ -169,8 +169,8 @@
 #define _OF_TABLE_1(name)						\
 	. = ALIGN(8);							\
 	VMLINUX_SYMBOL(__##name##_of_table) = .;			\
-	*(__##name##_of_table)						\
-	*(__##name##_of_table_end)
+	KEEP(*(__##name##_of_table))					\
+	KEEP(*(__##name##_of_table_end))
 
 #define CLKSRC_OF_TABLES()	OF_TABLE(CONFIG_CLKSRC_OF, clksrc)
 #define IRQCHIP_OF_MATCH_TABLE() OF_TABLE(CONFIG_IRQCHIP, irqchip)
@@ -184,7 +184,7 @@
 #define ACPI_PROBE_TABLE(name)						\
 	. = ALIGN(8);							\
 	VMLINUX_SYMBOL(__##name##_acpi_probe_table) = .;		\
-	*(__##name##_acpi_probe_table)					\
+	KEEP(*(__##name##_acpi_probe_table))				\
 	VMLINUX_SYMBOL(__##name##_acpi_probe_table_end) = .;
 #else
 #define ACPI_PROBE_TABLE(name)
@@ -193,7 +193,7 @@
 #define KERNEL_DTB()							\
 	STRUCT_ALIGN();							\
 	VMLINUX_SYMBOL(__dtb_start) = .;				\
-	*(.dtb.init.rodata)						\
+	KEEP(*(.dtb.init.rodata))					\
 	VMLINUX_SYMBOL(__dtb_end) = .;
 
 /*
@@ -214,11 +214,11 @@
 	/* implement dynamic printk debug */				\
 	. = ALIGN(8);                                                   \
 	VMLINUX_SYMBOL(__start___jump_table) = .;                       \
-	*(__jump_table)                                                 \
+	KEEP(*(__jump_table))                                           \
 	VMLINUX_SYMBOL(__stop___jump_table) = .;                        \
 	. = ALIGN(8);							\
 	VMLINUX_SYMBOL(__start___verbose) = .;                          \
-	*(__verbose)                                                    \
+	KEEP(*(__verbose))                                              \
 	VMLINUX_SYMBOL(__stop___verbose) = .;				\
 	LIKELY_PROFILE()		       				\
 	BRANCH_PROFILE()						\
@@ -271,10 +271,10 @@
 		VMLINUX_SYMBOL(__start_rodata) = .;			\
 		*(.rodata) *(.rodata.*)					\
 		RO_AFTER_INIT_DATA	/* Read only after init */	\
-		*(__vermagic)		/* Kernel version magic */	\
+		KEEP(*(__vermagic))	/* Kernel version magic */	\
 		. = ALIGN(8);						\
 		VMLINUX_SYMBOL(__start___tracepoints_ptrs) = .;		\
-		*(__tracepoints_ptrs)	/* Tracepoints: pointer array */\
+		KEEP(*(__tracepoints_ptrs)) /* Tracepoints: pointer array */ \
 		VMLINUX_SYMBOL(__stop___tracepoints_ptrs) = .;		\
 		*(__tracepoints_strings)/* Tracepoints: strings */	\
 	}								\
@@ -288,35 +288,35 @@
 	/* PCI quirks */						\
 	.pci_fixup        : AT(ADDR(.pci_fixup) - LOAD_OFFSET) {	\
 		VMLINUX_SYMBOL(__start_pci_fixups_early) = .;		\
-		*(.pci_fixup_early)					\
+		KEEP(*(.pci_fixup_early))				\
 		VMLINUX_SYMBOL(__end_pci_fixups_early) = .;		\
 		VMLINUX_SYMBOL(__start_pci_fixups_header) = .;		\
-		*(.pci_fixup_header)					\
+		KEEP(*(.pci_fixup_header))				\
 		VMLINUX_SYMBOL(__end_pci_fixups_header) = .;		\
 		VMLINUX_SYMBOL(__start_pci_fixups_final) = .;		\
-		*(.pci_fixup_final)					\
+		KEEP(*(.pci_fixup_final))				\
 		VMLINUX_SYMBOL(__end_pci_fixups_final) = .;		\
 		VMLINUX_SYMBOL(__start_pci_fixups_enable) = .;		\
-		*(.pci_fixup_enable)					\
+		KEEP(*(.pci_fixup_enable))				\
 		VMLINUX_SYMBOL(__end_pci_fixups_enable) = .;		\
 		VMLINUX_SYMBOL(__start_pci_fixups_resume) = .;		\
-		*(.pci_fixup_resume)					\
+		KEEP(*(.pci_fixup_resume))				\
 		VMLINUX_SYMBOL(__end_pci_fixups_resume) = .;		\
 		VMLINUX_SYMBOL(__start_pci_fixups_resume_early) = .;	\
-		*(.pci_fixup_resume_early)				\
+		KEEP(*(.pci_fixup_resume_early))			\
 		VMLINUX_SYMBOL(__end_pci_fixups_resume_early) = .;	\
 		VMLINUX_SYMBOL(__start_pci_fixups_suspend) = .;		\
-		*(.pci_fixup_suspend)					\
+		KEEP(*(.pci_fixup_suspend))				\
 		VMLINUX_SYMBOL(__end_pci_fixups_suspend) = .;		\
 		VMLINUX_SYMBOL(__start_pci_fixups_suspend_late) = .;	\
-		*(.pci_fixup_suspend_late)				\
+		KEEP(*(.pci_fixup_suspend_late))			\
 		VMLINUX_SYMBOL(__end_pci_fixups_suspend_late) = .;	\
 	}								\
 									\
 	/* Built-in firmware blobs */					\
 	.builtin_fw        : AT(ADDR(.builtin_fw) - LOAD_OFFSET) {	\
 		VMLINUX_SYMBOL(__start_builtin_fw) = .;			\
-		*(.builtin_fw)						\
+		KEEP(*(.builtin_fw))					\
 		VMLINUX_SYMBOL(__end_builtin_fw) = .;			\
 	}								\
 									\
@@ -394,7 +394,7 @@
 									\
 	/* Kernel symbol table: strings */				\
         __ksymtab_strings : AT(ADDR(__ksymtab_strings) - LOAD_OFFSET) {	\
-		KEEP(*(__ksymtab_strings))				\
+		*(__ksymtab_strings)					\
 	}								\
 									\
 	/* __*init sections */						\
@@ -407,14 +407,14 @@
 	/* Built-in module parameters. */				\
 	__param : AT(ADDR(__param) - LOAD_OFFSET) {			\
 		VMLINUX_SYMBOL(__start___param) = .;			\
-		*(__param)						\
+		KEEP(*(__param))					\
 		VMLINUX_SYMBOL(__stop___param) = .;			\
 	}								\
 									\
 	/* Built-in module versions. */					\
 	__modver : AT(ADDR(__modver) - LOAD_OFFSET) {			\
 		VMLINUX_SYMBOL(__start___modver) = .;			\
-		*(__modver)						\
+		KEEP(*(__modver))					\
 		VMLINUX_SYMBOL(__stop___modver) = .;			\
 		. = ALIGN((align));					\
 		VMLINUX_SYMBOL(__end_rodata) = .;			\
@@ -517,7 +517,7 @@
 	. = ALIGN(align);						\
 	__ex_table : AT(ADDR(__ex_table) - LOAD_OFFSET) {		\
 		VMLINUX_SYMBOL(__start___ex_table) = .;			\
-		*(__ex_table)						\
+		KEEP(*(__ex_table))					\
 		VMLINUX_SYMBOL(__stop___ex_table) = .;			\
 	}
 
@@ -533,9 +533,9 @@
 #ifdef CONFIG_CONSTRUCTORS
 #define KERNEL_CTORS()	. = ALIGN(8);			   \
 			VMLINUX_SYMBOL(__ctors_start) = .; \
-			*(.ctors)			   \
-			*(SORT(.init_array.*))		   \
-			*(.init_array)			   \
+			KEEP(*(.ctors))			   \
+			KEEP(*(SORT(.init_array.*)))	   \
+			KEEP(*(.init_array))		   \
 			VMLINUX_SYMBOL(__ctors_end) = .;
 #else
 #define KERNEL_CTORS()
@@ -659,7 +659,7 @@
 	. = ALIGN(8);							\
 	__bug_table : AT(ADDR(__bug_table) - LOAD_OFFSET) {		\
 		VMLINUX_SYMBOL(__start___bug_table) = .;		\
-		*(__bug_table)						\
+		KEEP(*(__bug_table))					\
 		VMLINUX_SYMBOL(__stop___bug_table) = .;			\
 	}
 #else
@@ -671,7 +671,7 @@
 	. = ALIGN(4);							\
 	.tracedata : AT(ADDR(.tracedata) - LOAD_OFFSET) {		\
 		VMLINUX_SYMBOL(__tracedata_start) = .;			\
-		*(.tracedata)						\
+		KEEP(*(.tracedata))					\
 		VMLINUX_SYMBOL(__tracedata_end) = .;			\
 	}
 #else
@@ -688,7 +688,7 @@
 #define INIT_SETUP(initsetup_align)					\
 		. = ALIGN(initsetup_align);				\
 		VMLINUX_SYMBOL(__setup_start) = .;			\
-		*(.init.setup)						\
+		KEEP(*(.init.setup))					\
 		VMLINUX_SYMBOL(__setup_end) = .;
 
 #define INIT_CALLS_LEVEL(level)						\
-- 
2.9.3

