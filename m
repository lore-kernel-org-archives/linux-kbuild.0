Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:57972 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbeLEL3L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Dec 2018 06:29:11 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] kbuild: refactor Makefile.asm-generic
Date: Wed,  5 Dec 2018 20:28:04 +0900
Message-Id: <1544009286-15705-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

 - Use conventional $(MAKE) $(asm-generic)=<dir> style
   for directory descending

 - Remove unneeded FORCE since "all" is a phony target

 - Remove unneeded "_dummy :=" assignment

 - Skip $(shell mkdir ...) when headers exist in the directory

 - Misc cleanups

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile                     |  8 ++++----
 scripts/Makefile.asm-generic | 37 +++++++++++++++++++------------------
 2 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/Makefile b/Makefile
index ab38eb2..3af0379 100644
--- a/Makefile
+++ b/Makefile
@@ -1122,13 +1122,13 @@ prepare0: archprepare
 prepare: prepare0 prepare-objtool
 
 # Support for using generic headers in asm-generic
+asm-generic := -f $(srctree)/scripts/Makefile.asm-generic obj
+
 PHONY += asm-generic uapi-asm-generic
 asm-generic: uapi-asm-generic
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.asm-generic \
-	            src=asm obj=arch/$(SRCARCH)/include/generated/asm
+	$(Q)$(MAKE) $(asm-generic)=arch/$(SRCARCH)/include/generated/asm
 uapi-asm-generic:
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.asm-generic \
-	            src=uapi/asm obj=arch/$(SRCARCH)/include/generated/uapi/asm
+	$(Q)$(MAKE) $(asm-generic)=arch/$(SRCARCH)/include/generated/uapi/asm
 
 PHONY += prepare-objtool
 prepare-objtool: $(objtool_target)
diff --git a/scripts/Makefile.asm-generic b/scripts/Makefile.asm-generic
index 32ad8e9..760323e 100644
--- a/scripts/Makefile.asm-generic
+++ b/scripts/Makefile.asm-generic
@@ -2,41 +2,42 @@
 # include/asm-generic contains a lot of files that are used
 # verbatim by several architectures.
 #
-# This Makefile reads the file arch/$(SRCARCH)/include/$(src)/Kbuild
+# This Makefile reads the file arch/$(SRCARCH)/include/(uapi/)/asm/Kbuild
 # and for each file listed in this file with generic-y creates
-# a small wrapper file in $(obj) (arch/$(SRCARCH)/include/generated/$(src))
+# a small wrapper file in arch/$(SRCARCH)/include/generated/(uapi/)/asm.
 
 PHONY := all
 all:
 
-kbuild-file := $(srctree)/arch/$(SRCARCH)/include/$(src)/Kbuild
--include $(kbuild-file)
+src := $(subst /generated,,$(obj))
+-include $(src)/Kbuild
 
 include scripts/Kbuild.include
 
-# Create output directory if not already present
-_dummy := $(shell [ -d $(obj) ] || mkdir -p $(obj))
+generic-y   := $(addprefix $(obj)/, $(generic-y))
+generated-y := $(addprefix $(obj)/, $(generated-y))
 
-# Stale wrappers when the corresponding files are removed from generic-y
-# need removing.
-generated-y   := $(generic-y) $(generated-y)
-all-files     := $(patsubst %, $(obj)/%, $(generated-y))
-old-headers   := $(wildcard $(obj)/*.h)
-unwanted      := $(filter-out $(all-files),$(old-headers))
+# Remove stale wrappers when the corresponding files are removed from generic-y
+old-headers := $(wildcard $(obj)/*.h)
+unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
 
 quiet_cmd_wrap = WRAP    $@
-cmd_wrap = echo "\#include <asm-generic/$*.h>" >$@
+      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
 
 quiet_cmd_remove = REMOVE  $(unwanted)
-cmd_remove = rm -f $(unwanted)
+      cmd_remove = rm -f $(unwanted)
 
-all: $(patsubst %, $(obj)/%, $(generic-y)) FORCE
-	$(if $(unwanted),$(call cmd,remove),)
+all: $(generic-y)
+	$(if $(unwanted),$(call cmd,remove))
 	@:
 
 $(obj)/%.h:
 	$(call cmd,wrap)
 
-PHONY += FORCE
+# Create output directory. Skip it if at least one old header exists
+# since we know the output directory already exists.
+ifeq ($(old-headers),)
+$(shell mkdir -p $(obj))
+endif
+
 .PHONY: $(PHONY)
-FORCE: ;
-- 
2.7.4
