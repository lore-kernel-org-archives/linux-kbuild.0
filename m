Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ex13-edg-ou-001.vmware.com ([208.91.0.189]:15158 "EHLO
        EX13-EDG-OU-001.vmware.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726894AbeHIWoF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Aug 2018 18:44:05 -0400
From: Nadav Amit <namit@vmware.com>
Subject: [PATCH v7 02/10] Makefile: Prepare for using macros for inline asm
Date: Thu, 9 Aug 2018 13:15:45 -0700
Message-ID: <20180809201554.168804-3-namit@vmware.com>
In-Reply-To: <20180809201554.168804-1-namit@vmware.com>
References: <20180809201554.168804-1-namit@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@redhat.com>
Cc: x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Nadav Amit <namit@vmware.com>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org

Using macros for inline assembly improves both readability and
compilation decisions that are distorted by big assembly blocks that use
alternative sections. Compile macros.S and use it to assemble all C
files. Currently, only x86 will use it.

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org
Cc: linux-kbuild@vger.kernel.org
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Nadav Amit <namit@vmware.com>
---
 Makefile                 |  9 +++++++--
 arch/x86/Makefile        | 11 +++++++++--
 arch/x86/kernel/macros.S |  7 +++++++
 scripts/Kbuild.include   |  4 +++-
 scripts/mod/Makefile     |  2 ++
 5 files changed, 28 insertions(+), 5 deletions(-)
 create mode 100644 arch/x86/kernel/macros.S

diff --git a/Makefile b/Makefile
index 7a3c4548162b..39d790e74e0d 100644
--- a/Makefile
+++ b/Makefile
@@ -1051,7 +1051,7 @@ scripts: scripts_basic include/config/auto.conf include/config/tristate.conf \
 # version.h and scripts_basic is processed / created.
 
 # Listed in dependency order
-PHONY += prepare archprepare prepare0 prepare1 prepare2 prepare3
+PHONY += prepare archprepare macroprepare prepare0 prepare1 prepare2 prepare3
 
 # prepare3 is used to check if we are building in a separate output directory,
 # and if so do:
@@ -1075,7 +1075,9 @@ prepare1: prepare2 $(version_h) $(autoksyms_h) include/generated/utsrelease.h \
                    include/config/auto.conf
 	$(cmd_crmodverdir)
 
-archprepare: archheaders archscripts prepare1 scripts_basic
+macroprepare: prepare1 archmacros
+
+archprepare: archheaders archscripts macroprepare scripts_basic
 
 prepare0: archprepare gcc-plugins
 	$(Q)$(MAKE) $(build)=.
@@ -1143,6 +1145,9 @@ archheaders:
 PHONY += archscripts
 archscripts:
 
+PHONY += archmacros
+archmacros:
+
 PHONY += __headers
 __headers: $(version_h) scripts_basic uapi-asm-generic archheaders archscripts
 	$(Q)$(MAKE) $(build)=scripts build_unifdef
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index a08e82856563..a4b90ac1629b 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -235,8 +235,8 @@ ifdef CONFIG_X86_64
 LDFLAGS += $(call ld-option, -z max-page-size=0x200000)
 endif
 
-# Speed up the build
-KBUILD_CFLAGS += -pipe
+# We cannot use -pipe flag since we give an additional .s file to the compiler
+#KBUILD_CFLAGS += -pipe
 # Workaround for a gcc prelease that unfortunately was shipped in a suse release
 KBUILD_CFLAGS += -Wno-sign-compare
 #
@@ -258,6 +258,13 @@ archscripts: scripts_basic
 archheaders:
 	$(Q)$(MAKE) $(build)=arch/x86/entry/syscalls all
 
+archmacros:
+	$(Q)$(MAKE) $(build)=arch/x86/kernel arch/x86/kernel/macros.s
+
+ASM_MACRO_FLAGS = -Wa,arch/x86/kernel/macros.s
+export ASM_MACRO_FLAGS
+KBUILD_CFLAGS += $(ASM_MACRO_FLAGS)
+
 ###
 # Kernel objects
 
diff --git a/arch/x86/kernel/macros.S b/arch/x86/kernel/macros.S
new file mode 100644
index 000000000000..cfc1c7d1a6eb
--- /dev/null
+++ b/arch/x86/kernel/macros.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * This file includes headers whose assembly part includes macros which are
+ * commonly used. The macros are precompiled into assmebly file which is later
+ * assembled together with each compiled file.
+ */
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 86321f06461e..d7b7aadb6cd8 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -115,7 +115,9 @@ __cc-option = $(call try-run,\
 
 # Do not attempt to build with gcc plugins during cc-option tests.
 # (And this uses delayed resolution so the flags will be up to date.)
-CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
+# In addition, do not include the asm macros which are built later.
+CC_OPTION_FILTERED = $(GCC_PLUGINS_CFLAGS) $(ASM_MACRO_FLAGS)
+CC_OPTION_CFLAGS = $(filter-out $(CC_OPTION_FILTERED),$(KBUILD_CFLAGS))
 
 # cc-option
 # Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index 42c5d50f2bcc..a5b4af47987a 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -4,6 +4,8 @@ OBJECT_FILES_NON_STANDARD := y
 hostprogs-y	:= modpost mk_elfconfig
 always		:= $(hostprogs-y) empty.o
 
+CFLAGS_REMOVE_empty.o := $(ASM_MACRO_FLAGS)
+
 modpost-objs	:= modpost.o file2alias.o sumversion.o
 
 devicetable-offsets-file := devicetable-offsets.h
-- 
2.17.1

