Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:52743 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728116AbfBSJd2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Feb 2019 04:33:28 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/5] scripts/gdb: delay generation of gdb constants.py
Date: Tue, 19 Feb 2019 18:33:02 +0900
Message-Id: <1550568787-18710-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org

scripts/gdb/linux/constants.py is never used in the kernel build
process. There is no good reason to create it so early.

Get it out of the 'prepare' stage.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Kbuild   | 10 ----------
 Makefile | 11 +++++++++++
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/Kbuild b/Kbuild
index 65db5be..4cebcc7 100644
--- a/Kbuild
+++ b/Kbuild
@@ -6,7 +6,6 @@
 # 2) Generate timeconst.h
 # 3) Generate asm-offsets.h (may need bounds.h and timeconst.h)
 # 4) Check for missing system calls
-# 5) Generate constants.py (may need bounds.h)
 
 #####
 # 1) Generate bounds.h
@@ -58,14 +57,5 @@ quiet_cmd_syscalls = CALL    $<
 missing-syscalls: scripts/checksyscalls.sh $(offsets-file) FORCE
 	$(call cmd,syscalls)
 
-#####
-# 5) Generate constants for Python GDB integration
-#
-
-extra-$(CONFIG_GDB_SCRIPTS) += build_constants_py
-
-build_constants_py: $(timeconst-file) $(bounds-file)
-	@$(MAKE) $(build)=scripts/gdb/linux $@
-
 # Keep these three files during make clean
 no-clean-files := $(bounds-file) $(offsets-file) $(timeconst-file)
diff --git a/Makefile b/Makefile
index 88db36b..26dbcb7 100644
--- a/Makefile
+++ b/Makefile
@@ -1513,6 +1513,17 @@ PHONY += $(DOC_TARGETS)
 $(DOC_TARGETS): scripts_basic FORCE
 	$(Q)$(MAKE) $(build)=Documentation $@
 
+# Misc
+# ---------------------------------------------------------------------------
+
+PHONY += scripts_gdb
+scripts_gdb: prepare
+	$(Q)$(MAKE) $(build)=scripts/gdb/linux build_constants_py
+
+ifdef CONFIG_GDB_SCRIPTS
+all: scripts_gdb
+endif
+
 else # KBUILD_EXTMOD
 
 ###
-- 
2.7.4
