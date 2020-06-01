Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39162 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgFAF5w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:57:52 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 02/37] kbuild: refactor tagets caluculation for KBUILD_{BUILTIN,KBUILD_MODULES}
Date: Mon,  1 Jun 2020 14:56:56 +0900
Message-Id: <20200601055731.3006266-2-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>

Remove lib-target, builtin-target, modorder-target, and modtargets.

Instead, add targets-for-builtin and targets-for-modules.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ee9a817e19a3..a1f09bec8c70 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -73,19 +73,24 @@ endif
 subdir-builtin := $(sort $(filter %/built-in.a, $(real-obj-y)))
 subdir-modorder := $(sort $(filter %/modules.order, $(modorder)))
 
+targets-for-builtin := $(extra-y)
+
 ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
-lib-target := $(obj)/lib.a
+targets-for-builtin += $(obj)/lib.a
 endif
 
 ifdef need-builtin
-builtin-target := $(obj)/built-in.a
+targets-for-builtin += $(obj)/built-in.a
 endif
 
+targets-for-modules := $(obj-m)
+targets-for-modules += $(patsubst %.o, %.mod, $(obj-m))
+
 ifdef need-modorder
-modorder-target := $(obj)/modules.order
+targets-for-modules += $(obj)/modules.order
 endif
 
-mod-targets := $(patsubst %.o, %.mod, $(obj-m))
+targets += $(targets-for-builtin) $(targets-for-modules)
 
 # Linus' kernel sanity checking tool
 ifeq ($(KBUILD_CHECKSRC),1)
@@ -284,8 +289,6 @@ cmd_mod = { \
 $(obj)/%.mod: $(obj)/%.o FORCE
 	$(call if_changed,mod)
 
-targets += $(mod-targets)
-
 quiet_cmd_cc_lst_c = MKLST   $@
       cmd_cc_lst_c = $(CC) $(c_flags) -g -c -o $*.o $< && \
 		     $(CONFIG_SHELL) $(srctree)/scripts/makelst $*.o \
@@ -359,7 +362,7 @@ $(obj)/%.o: $(src)/%.S $(objtool_dep) FORCE
 	$(call if_changed_rule,as_o_S)
 
 targets += $(filter-out $(subdir-builtin), $(real-obj-y)) $(real-obj-m) $(lib-y)
-targets += $(extra-y) $(always-y) $(MAKECMDGOALS)
+targets += $(always-y) $(MAKECMDGOALS)
 
 # Linker scripts preprocessor (.lds.S -> .lds)
 # ---------------------------------------------------------------------------
@@ -396,8 +399,6 @@ quiet_cmd_ar_builtin = AR      $@
 $(obj)/built-in.a: $(real-obj-y) FORCE
 	$(call if_changed,ar_builtin)
 
-targets += $(builtin-target)
-
 #
 # Rule to create modules.order file
 #
@@ -414,8 +415,6 @@ $(obj)/modules.order: $(subdir-modorder) FORCE
 $(obj)/lib.a: $(lib-y) FORCE
 	$(call if_changed,ar)
 
-targets += $(lib-target)
-
 # NOTE:
 # Do not replace $(filter %.o,^) with $(real-prereqs). When a single object
 # module is turned into a multi object module, $^ will contain header file
@@ -478,8 +477,8 @@ endif
 
 else
 
-__build: $(if $(KBUILD_BUILTIN),$(builtin-target) $(lib-target) $(extra-y)) \
-	 $(if $(KBUILD_MODULES),$(obj-m) $(mod-targets) $(modorder-target)) \
+__build: $(if $(KBUILD_BUILTIN), $(targets-for-builtin)) \
+	 $(if $(KBUILD_MODULES), $(targets-for-modules)) \
 	 $(subdir-ym) $(always-y)
 	@:
 
-- 
2.25.1
