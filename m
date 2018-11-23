Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:48170 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730451AbeKWPeU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Nov 2018 10:34:20 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kbuild: make 'scripts' depend on 'prepare0'
Date: Fri, 23 Nov 2018 13:51:26 +0900
Message-Id: <1542948687-7326-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Before start descending, Kbuild needs to run 'prepare' and 'scripts',
which were orthogonal to each other prior to this commit.

Let's consider 'scripts' is a part of the preparation. This will allow
more cleanups.

Move 'scripts' to the prerequisite of 'prepare0', which starts compiling
target *.c files.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/Makefile b/Makefile
index 36f3f0e..cee4cec 100644
--- a/Makefile
+++ b/Makefile
@@ -1062,7 +1062,7 @@ $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
 # Error messages still appears in the original language
 
 PHONY += $(vmlinux-dirs)
-$(vmlinux-dirs): prepare scripts
+$(vmlinux-dirs): prepare
 	$(Q)$(MAKE) $(build)=$@ need-builtin=1
 
 define filechk_kernel.release
@@ -1114,7 +1114,7 @@ macroprepare: prepare1 archmacros
 
 archprepare: archheaders archscripts macroprepare scripts_basic
 
-prepare0: archprepare gcc-plugins
+prepare0: scripts archprepare gcc-plugins
 	$(Q)$(MAKE) $(build)=scripts/mod
 	$(Q)$(MAKE) $(build)=.
 
@@ -1286,7 +1286,7 @@ modules.builtin: $(vmlinux-dirs:%=%/modules.builtin)
 
 # Target to prepare building external modules
 PHONY += modules_prepare
-modules_prepare: prepare scripts
+modules_prepare: prepare
 
 # Target to install modules
 PHONY += modules_install
@@ -1604,11 +1604,9 @@ help:
 	@echo  '  clean           - remove generated files in module directory only'
 	@echo  ''
 
-# Dummies...
-PHONY += prepare scripts
+PHONY += prepare
 prepare:
 	$(cmd_crmodverdir)
-scripts: ;
 endif # KBUILD_EXTMOD
 
 clean: $(clean-dirs)
@@ -1712,33 +1710,33 @@ else
         target-dir = $(if $(KBUILD_EXTMOD),$(dir $<),$(dir $@))
 endif
 
-%.s: %.c prepare scripts FORCE
+%.s: %.c prepare FORCE
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
-%.i: %.c prepare scripts FORCE
+%.i: %.c prepare FORCE
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
-%.o: %.c prepare scripts FORCE
+%.o: %.c prepare FORCE
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
-%.lst: %.c prepare scripts FORCE
+%.lst: %.c prepare FORCE
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
-%.s: %.S prepare scripts FORCE
+%.s: %.S prepare FORCE
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
-%.o: %.S prepare scripts FORCE
+%.o: %.S prepare FORCE
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
-%.symtypes: %.c prepare scripts FORCE
+%.symtypes: %.c prepare FORCE
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
-%.ll: %.c prepare scripts FORCE
+%.ll: %.c prepare FORCE
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
 
 # Modules
-/: prepare scripts FORCE
+/: prepare FORCE
 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
 	$(build)=$(build-dir)
 # Make sure the latest headers are built for Documentation
 Documentation/ samples/: headers_install
-%/: prepare scripts FORCE
+%/: prepare FORCE
 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
 	$(build)=$(build-dir)
-%.ko: prepare scripts FORCE
+%.ko: prepare FORCE
 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1)   \
 	$(build)=$(build-dir) $(@:.ko=.o)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
-- 
2.7.4
