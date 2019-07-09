Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:59393 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbfGIHPI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 03:15:08 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 01/11] kbuild: do not create empty modules.order in the prepare stage
Date: Tue,  9 Jul 2019 16:14:19 +0900
Message-Id: <20190709071419.17150-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nico@fluxnic.net>, Masahiro Yamada <yamada.masahiro@socionext.com>

Currently, $(objtree)/modules.order is touched in two places.

In the 'prepare0' rule, scripts/Makefile.build creates an empty
modules.order while processing 'obj=.'

In the 'modules' rule, the top-level Makefile overwrites it with
the correct list of modules.

While this might be a good side-effect that modules.order is made
empty every time (probably this is not intended functionality),
I personally do not like this behavior.

Create modules.order only when it is sensible to do so.

Going forward, $(objtree)/modules.order lists the modules that
was built in the last successful build.

This also avoids creating pointless files:

  scripts/basic/modules.order
  scripts/dtc/modules.order
  scripts/gcc-plugins/modules.order
  scripts/genksyms/modules.order
  scripts/mod/modules.order
  scripts/modules.order
  scripts/selinux/genheaders/modules.order
  scripts/selinux/mdp/modules.order
  scripts/selinux/modules.order

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - inverted the logic "preparing" -> need-modorder
 

 Makefile               | 4 ++--
 scripts/Makefile.build | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 5c75ea7177f6..d8421d245f75 100644
--- a/Makefile
+++ b/Makefile
@@ -1076,7 +1076,7 @@ $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
 
 PHONY += $(vmlinux-dirs)
 $(vmlinux-dirs): prepare
-	$(Q)$(MAKE) $(build)=$@ need-builtin=1
+	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1
 
 filechk_kernel.release = \
 	echo "$(KERNELVERSION)$$($(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
@@ -1611,7 +1611,7 @@ $(objtree)/Module.symvers:
 module-dirs := $(addprefix _module_,$(KBUILD_EXTMOD))
 PHONY += $(module-dirs) modules
 $(module-dirs): prepare $(objtree)/Module.symvers
-	$(Q)$(MAKE) $(build)=$(patsubst _module_%,%,$@)
+	$(Q)$(MAKE) $(build)=$(patsubst _module_%,%,$@) need-modorder=1
 
 modules: $(module-dirs)
 	@$(kecho) '  Building modules, stage 2.';
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 776842b7e6a3..e9b3d88257dd 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -63,7 +63,7 @@ ifneq ($(strip $(real-obj-y) $(need-builtin)),)
 builtin-target := $(obj)/built-in.a
 endif
 
-ifdef CONFIG_MODULES
+ifeq ($(CONFIG_MODULES)$(need-modorder),y1)
 modorder-target := $(obj)/modules.order
 endif
 
-- 
2.17.1
