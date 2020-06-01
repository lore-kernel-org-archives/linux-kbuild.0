Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:40021 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 15/37] modpost: print symbol dump file as the build target in short log
Date: Mon,  1 Jun 2020 14:57:09 +0900
Message-Id: <20200601055731.3006266-15-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>

The symbol dump *.symvers is the output of modpost. Print it in
the short log.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index b017085dc91a..8d000987b201 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -44,25 +44,26 @@ include include/config/auto.conf
 include scripts/Kbuild.include
 
 kernelsymfile := $(objtree)/Module.symvers
-modulesymfile := $(KBUILD_EXTMOD)/Module.symvers
 
 MODPOST = scripts/mod/modpost								\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
 	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
-	$(if $(KBUILD_EXTMOD),-i,-o) $(kernelsymfile)					\
+	$(if $(KBUILD_EXTMOD),-i $(kernelsymfile))					\
 	$(if $(KBUILD_EXTMOD),$(addprefix -i ,$(KBUILD_EXTRA_SYMBOLS)))			\
-	$(if $(KBUILD_EXTMOD),-o $(modulesymfile))					\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
-	$(if $(KBUILD_MODPOST_WARN),-w)
+	$(if $(KBUILD_MODPOST_WARN),-w) \
+	-o $@
 
 ifdef MODPOST_VMLINUX
 
-quiet_cmd_modpost = MODPOST vmlinux.o
-      cmd_modpost = $(MODPOST) vmlinux.o
+quiet_cmd_modpost = MODPOST $@
+      cmd_modpost = $(MODPOST) $<
 
-__modpost:
+Module.symvers: vmlinux.o
 	$(call cmd,modpost)
 
+__modpost: Module.symvers
+
 else
 
 MODPOST += -s \
@@ -70,6 +71,8 @@ MODPOST += -s \
 
 ifeq ($(KBUILD_EXTMOD),)
 MODPOST += $(wildcard vmlinux)
+output-symdump := Module.symvers
+
 else
 
 # set src + obj - they may be used in the modules's Makefile
@@ -83,6 +86,8 @@ include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
 # modpost option for external modules
 MODPOST += -e
 
+output-symdump := $(KBUILD_EXTMOD)/Module.symvers
+
 endif
 
 # modpost options for modules (both in-kernel and external)
@@ -93,20 +98,22 @@ ifneq ($(findstring i,$(filter-out --%,$(MAKEFLAGS))),)
 MODPOST += -n
 endif
 
-# find all modules listed in modules.order
-modules := $(sort $(shell cat $(MODORDER)))
-
-# Read out modules.order instead of expanding $(modules) to pass in modpost.
+# Read out modules.order to pass in modpost.
 # Otherwise, allmodconfig would fail with "Argument list too long".
-quiet_cmd_modpost = MODPOST $(words $(modules)) modules
+quiet_cmd_modpost = MODPOST $@
       cmd_modpost = sed 's/ko$$/o/' $(MODORDER) | $(MODPOST) -T -
 
-__modpost:
+$(output-symdump): FORCE
 	$(call cmd,modpost)
+
+__modpost: $(output-symdump)
 ifneq ($(KBUILD_MODPOST_NOFINAL),1)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal
 endif
 
+PHONY += FORCE
+FORCE:
+
 endif
 
 .PHONY: $(PHONY)
-- 
2.25.1
