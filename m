Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:45959 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726641AbgBSAEj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Feb 2020 19:04:39 -0500
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc/Makefile: Mark phony targets as PHONY
Date: Wed, 19 Feb 2020 11:04:34 +1100
Message-Id: <20200219000434.15872-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linuxppc-dev@ozlabs.org
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org

Some of our phony targets are not marked as such. This can lead to
confusing errors, eg:

  $ make clean
  $ touch install
  $ make install
  make: 'install' is up to date.
  $

Fix it by adding them to the PHONY variable which is marked phony in
the top-level Makefile, or in scripts/Makefile.build for the boot
Makefile.

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile      | 6 ++++++
 arch/powerpc/boot/Makefile | 2 ++
 2 files changed, 8 insertions(+)

v2: Use PHONY variable in boot/Makefile as well.

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index f35730548e42..cbe5ca4f0ee5 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -298,6 +298,7 @@ $(BOOT_TARGETS2): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(patsubst %,$(boot)/%,$@)
 
 
+PHONY += bootwrapper_install
 bootwrapper_install:
 	$(Q)$(MAKE) $(build)=$(boot) $(patsubst %,$(boot)/%,$@)
 
@@ -403,9 +404,11 @@ define archhelp
   @echo '  (minus the .dts extension).'
 endef
 
+PHONY += install
 install:
 	$(Q)$(MAKE) $(build)=$(boot) install
 
+PHONY += vdso_install
 vdso_install:
 ifdef CONFIG_PPC64
 	$(Q)$(MAKE) $(build)=arch/$(ARCH)/kernel/vdso64 $@
@@ -425,6 +428,7 @@ archprepare: checkbin
 ifdef CONFIG_STACKPROTECTOR
 prepare: stack_protector_prepare
 
+PHONY += stack_protector_prepare
 stack_protector_prepare: prepare0
 ifdef CONFIG_PPC64
 	$(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "PACA_CANARY") print $$3;}' include/generated/asm-offsets.h))
@@ -436,10 +440,12 @@ endif
 ifdef CONFIG_SMP
 prepare: task_cpu_prepare
 
+PHONY += task_cpu_prepare
 task_cpu_prepare: prepare0
 	$(eval KBUILD_CFLAGS += -D_TASK_CPU=$(shell awk '{if ($$2 == "TASK_CPU") print $$3;}' include/generated/asm-offsets.h))
 endif
 
+PHONY += checkbin
 # Check toolchain versions:
 # - gcc-4.6 is the minimum kernel-wide version so nothing required.
 checkbin:
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 0556bf4fc9e9..c53a1b8bba8b 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -445,6 +445,8 @@ install: $(CONFIGURE) $(addprefix $(obj)/, $(image-y))
 zInstall: $(CONFIGURE) $(addprefix $(obj)/, $(image-y))
 	sh -x $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" vmlinux System.map "$(INSTALL_PATH)" $^
 
+PHONY += install zInstall
+
 # anything not in $(targets)
 clean-files += $(image-) $(initrd-) cuImage.* dtbImage.* treeImage.* \
 	zImage zImage.initrd zImage.chrp zImage.coff zImage.holly \
-- 
2.21.1
