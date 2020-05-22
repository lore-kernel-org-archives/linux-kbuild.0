Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:37246 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727085AbgEVCA1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 22:00:27 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 4/5] kbuild: rename subdir-obj-y to subdir-builtin
Date: Fri, 22 May 2020 11:00:01 +0900
Message-Id: <20200522020002.504506-4-masahiroy@kernel.org>
In-Reply-To: <20200522020002.504506-1-masahiroy@kernel.org>
References: <20200522020002.504506-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

I think subdir-builtin is clearer.

While I was here, I made its build rule explicit.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ee283efc1b45..323264607b9f 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -69,7 +69,8 @@ endif
 
 # ===========================================================================
 
-subdir-obj-y := $(filter %/built-in.a, $(real-obj-y))
+# subdir-builtin may contain duplications. Use $(sort ...)
+subdir-builtin := $(sort $(filter %/built-in.a, $(real-obj-y)))
 
 ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
 lib-target := $(obj)/lib.a
@@ -356,7 +357,7 @@ endif
 $(obj)/%.o: $(src)/%.S $(objtool_dep) FORCE
 	$(call if_changed_rule,as_o_S)
 
-targets += $(filter-out $(subdir-obj-y), $(real-obj-y)) $(real-obj-m) $(lib-y)
+targets += $(filter-out $(subdir-builtin), $(real-obj-y)) $(real-obj-m) $(lib-y)
 targets += $(extra-y) $(always-y) $(MAKECMDGOALS)
 
 # Linker scripts preprocessor (.lds.S -> .lds)
@@ -381,7 +382,7 @@ $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
 # ---------------------------------------------------------------------------
 
 # To build objects in subdirs, we need to descend into the directories
-$(obj)/%/built-in.a: $(obj)/% ;
+$(subdir-builtin): $(obj)/%/built-in.a: $(obj)/% ;
 
 #
 # Rule to compile a set of .o files into one .a file (without symbol table)
@@ -489,7 +490,7 @@ PHONY += $(subdir-ym)
 $(subdir-ym):
 	$(Q)$(MAKE) $(build)=$@ \
 	$(if $(filter $@/, $(KBUILD_SINGLE_TARGETS)),single-build=) \
-	need-builtin=$(if $(filter $@/built-in.a, $(subdir-obj-y)),1) \
+	need-builtin=$(if $(filter $@/built-in.a, $(subdir-builtin)),1) \
 	need-modorder=$(if $(need-modorder),$(if $(filter $@/modules.order, $(modorder)),1))
 
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
-- 
2.25.1
