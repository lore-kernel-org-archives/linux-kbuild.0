Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gagarine.paulk.fr ([109.190.93.129]:61080 "EHLO
	gagarine.paulk.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753339AbcCZSh3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Mar 2016 14:37:29 -0400
From: Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH] kconfig: Add localdefconfig helper
Date: Sat, 26 Mar 2016 19:31:27 +0100
Message-Id: <1459017087-11640-1-git-send-email-contact@paulk.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>, Paul Kocialkowski <contact@paulk.fr>

This introduces a localdefconfig make target to specify out-of-tree default
configs. The out-of-tree default target is selected by defining
KBUILD_LOCALDEFCONFIG in the make command line.

The intent of this change is to easily allow using default configs that are not
part of the kernel source (e.g. for a specific device or use case), without ever
touching the kernel source tree.

This is somewhat equivalent to copying the default config to the output .config
and running olddefconfig. However, it seems better to make this part of the
kernel helpers since this use case is likely to be needed widely. In addition,
it keeps all the path handling logic inside the Makefiles, as opposed to
delegating some of it to a wrapper script or such, when copying the default
configuration to .config.

Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
---
 Makefile                 | 2 +-
 scripts/kconfig/Makefile | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ed69074..0c2d209 100644
--- a/Makefile
+++ b/Makefile
@@ -529,7 +529,7 @@ ifeq ($(config-targets),1)
 # KBUILD_DEFCONFIG may point out an alternative default configuration
 # used for 'make defconfig'
 include arch/$(SRCARCH)/Makefile
-export KBUILD_DEFCONFIG KBUILD_KCONFIG
+export KBUILD_DEFCONFIG KBUILD_LOCALDEFCONFIG KBUILD_KCONFIG
 
 config: scripts_basic outputmakefile FORCE
 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index ebced77..6fff25d 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -106,6 +106,14 @@ else
 endif
 endif
 
+localdefconfig: $(obj)/conf
+ifeq ($(KBUILD_LOCALDEFCONFIG),)
+	$(Q)$< $(silent) $(Kconfig)
+else
+	@$(kecho) "*** Default configuration is based on '$(KBUILD_LOCALDEFCONFIG)'"
+	$(Q)$< $(silent) --defconfig=$(KBUILD_LOCALDEFCONFIG) $(Kconfig)
+endif
+
 %_defconfig: $(obj)/conf
 	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)
 
@@ -148,6 +156,7 @@ help:
 	@echo  '  alldefconfig    - New config with all symbols set to default'
 	@echo  '  randconfig	  - New config with random answer to all options'
 	@echo  '  listnewconfig   - List new options'
+	@echo  '  localdefconfig  - New config with defaults from KBUILD_LOCALDEFCONFIG'
 	@echo  '  olddefconfig	  - Same as silentoldconfig but sets new symbols to their'
 	@echo  '                    default value'
 	@echo  '  kvmconfig	  - Enable additional options for kvm guest kernel support'
-- 
2.7.4

