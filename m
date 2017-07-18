Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([59.151.112.132]:12737 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751440AbdGRBtb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Jul 2017 21:49:31 -0400
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: [PATCH v3] kbuild: trivial cleanups on the comments
Date: Tue, 18 Jul 2017 09:53:30 +0800
Message-ID: <1500342810-21351-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, rdunlap@infradead.org

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 Makefile               | 6 +++---
 scripts/Kbuild.include | 7 +++----
 scripts/basic/Makefile | 2 +-
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 7b60fb3..2600f03 100644
--- a/Makefile
+++ b/Makefile
@@ -961,7 +961,7 @@ export KBUILD_VMLINUX_INIT := $(head-y) $(init-y)
 export KBUILD_VMLINUX_MAIN := $(core-y) $(libs-y) $(drivers-y) $(net-y) $(virt-y)
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 export LDFLAGS_vmlinux
-# used by scripts/pacmage/Makefile
+# used by scripts/package/Makefile
 export KBUILD_ALLDIRS := $(sort $(filter-out arch/%,$(vmlinux-alldirs)) arch Documentation include samples scripts tools)
 
 vmlinux-deps := $(KBUILD_LDS) $(KBUILD_VMLINUX_INIT) $(KBUILD_VMLINUX_MAIN)
@@ -989,8 +989,8 @@ include/generated/autoksyms.h: FORCE
 ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
 
 # Final link of vmlinux with optional arch pass after final link
-    cmd_link-vmlinux =                                                 \
-	$(CONFIG_SHELL) $< $(LD) $(LDFLAGS) $(LDFLAGS_vmlinux) ;       \
+cmd_link-vmlinux =                                                 \
+	$(CONFIG_SHELL) $< $(LD) $(LDFLAGS) $(LDFLAGS_vmlinux) ;    \
 	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
 
 vmlinux: scripts/link-vmlinux.sh vmlinux_prereq $(vmlinux-deps) FORCE
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 61f87a9..2e721fc 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -85,8 +85,8 @@ TMPOUT := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/)
 
 # try-run
 # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
-# Exit code chooses option. "$$TMP" is can be used as temporary file and
-# is automatically cleaned up.
+# Exit code chooses option. "$$TMP" serves as a temporary file and is
+# automatically cleaned up.
 try-run = $(shell set -e;		\
 	TMP="$(TMPOUT).$$$$.tmp";	\
 	TMPO="$(TMPOUT).$$$$.o";	\
@@ -256,7 +256,6 @@ make-cmd = $(call escsq,$(subst \#,\\\#,$(subst $$,$$$$,$(cmd_$(1)))))
 any-prereq = $(filter-out $(PHONY),$?) $(filter-out $(PHONY) $(wildcard $^),$^)
 
 # Execute command if command has changed or prerequisite(s) are updated.
-#
 if_changed = $(if $(strip $(any-prereq) $(arg-check)),                       \
 	@set -e;                                                             \
 	$(echo-cmd) $(cmd_$(1));                                             \
@@ -310,7 +309,7 @@ if_changed_rule = $(if $(strip $(any-prereq) $(arg-check) ),                 \
 	$(rule_$(1)), @:)
 
 ###
-# why - tell why a a target got build
+# why - tell why a target got built
 #       enabled by make V=2
 #       Output (listed in the order they are checked):
 #          (1) - due to target is PHONY
diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
index ec10d93..0372b33 100644
--- a/scripts/basic/Makefile
+++ b/scripts/basic/Makefile
@@ -1,5 +1,5 @@
 ###
-# Makefile.basic lists the most basic programs used during the build process.
+# This Makefile lists the most basic programs used during the build process.
 # The programs listed herein are what are needed to do the basic stuff,
 # such as fix file dependencies.
 # This initial step is needed to avoid files to be recompiled
-- 
2.1.0



