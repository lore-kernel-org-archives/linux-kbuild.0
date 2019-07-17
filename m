Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:62963 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfGQGS0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 02:18:26 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 01/12] kbuild: do not create empty modules.order in the prepare stage
Date: Wed, 17 Jul 2019 15:17:49 +0900
Message-Id: <20190717061800.10018-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190717061800.10018-1-yamada.masahiro@socionext.com>
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Joe Lawrence <joe.lawrence@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Currently, $(objtree)/modules.order is touched in two places.

In the 'prepare0' rule, scripts/Makefile.build creates an empty
modules.order while processing 'obj=.'

In the 'modules' rule, the top-level Makefile overwrites it with
the correct list of modules.

While this might be a good side-effect that modules.order is made
empty every time (probably this is not intended functionality),
I personally do not like this behavior.

Create modules.order only when it is sensible to do so.

This avoids creating the following pointless files:

  scripts/basic/modules.order
  scripts/dtc/modules.order
  scripts/gcc-plugins/modules.order
  scripts/genksyms/modules.order
  scripts/mod/modules.order
  scripts/modules.order
  scripts/selinux/genheaders/modules.order
  scripts/selinux/mdp/modules.order
  scripts/selinux/modules.order

Going forward, $(objtree)/modules.order lists the modules that
was built in the last successful build.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2:
  - inverted the logic "preparing" -> need-modorder

 Makefile               | 4 ++--
 scripts/Makefile.build | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index e43285786102..b74a6e9cefc8 100644
--- a/Makefile
+++ b/Makefile
@@ -1072,7 +1072,7 @@ $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
 
 PHONY += $(vmlinux-dirs)
 $(vmlinux-dirs): prepare
-	$(Q)$(MAKE) $(build)=$@ need-builtin=1
+	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1
 
 filechk_kernel.release = \
 	echo "$(KERNELVERSION)$$($(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
@@ -1616,7 +1616,7 @@ $(objtree)/Module.symvers:
 module-dirs := $(addprefix _module_,$(KBUILD_EXTMOD))
 PHONY += $(module-dirs) modules
 $(module-dirs): prepare $(objtree)/Module.symvers
-	$(Q)$(MAKE) $(build)=$(patsubst _module_%,%,$@)
+	$(Q)$(MAKE) $(build)=$(patsubst _module_%,%,$@) need-modorder=1
 
 modules: $(module-dirs)
 	@$(kecho) '  Building modules, stage 2.';
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 5829ccbc7dd0..631bb89524de 100644
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
