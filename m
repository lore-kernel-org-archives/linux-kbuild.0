Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:37245 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbgEVCA1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 22:00:27 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 5/5] kbuild: make modules.order rule consistent with built-in.a
Date: Fri, 22 May 2020 11:00:02 +0900
Message-Id: <20200522020002.504506-5-masahiroy@kernel.org>
In-Reply-To: <20200522020002.504506-1-masahiroy@kernel.org>
References: <20200522020002.504506-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

built-in.a contains the built-in object paths from the current and sub
directories.

module.order collects the module paths from the current and sub
directories.

Make their build rules look more symmetrical.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 10 ++++++----
 scripts/Makefile.lib   |  2 ++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 323264607b9f..ee9a817e19a3 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -69,8 +69,9 @@ endif
 
 # ===========================================================================
 
-# subdir-builtin may contain duplications. Use $(sort ...)
+# subdir-builtin and subdir-modorder may contain duplications. Use $(sort ...)
 subdir-builtin := $(sort $(filter %/built-in.a, $(real-obj-y)))
+subdir-modorder := $(sort $(filter %/modules.order, $(modorder)))
 
 ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
 lib-target := $(obj)/lib.a
@@ -383,6 +384,7 @@ $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
 
 # To build objects in subdirs, we need to descend into the directories
 $(subdir-builtin): $(obj)/%/built-in.a: $(obj)/% ;
+$(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
 
 #
 # Rule to compile a set of .o files into one .a file (without symbol table)
@@ -401,9 +403,9 @@ targets += $(builtin-target)
 #
 # Create commands to either record .ko file or cat modules.order from
 # a subdirectory
-$(modorder-target): $(subdir-ym) FORCE
+$(obj)/modules.order: $(subdir-modorder) FORCE
 	$(Q){ $(foreach m, $(modorder), \
-	$(if $(filter %/modules.order, $m), cat $m, echo $m);) :; } \
+	$(if $(filter $^, $m), cat $m, echo $m);) :; } \
 	| $(AWK) '!x[$$0]++' - > $@
 
 #
@@ -491,7 +493,7 @@ $(subdir-ym):
 	$(Q)$(MAKE) $(build)=$@ \
 	$(if $(filter $@/, $(KBUILD_SINGLE_TARGETS)),single-build=) \
 	need-builtin=$(if $(filter $@/built-in.a, $(subdir-builtin)),1) \
-	need-modorder=$(if $(need-modorder),$(if $(filter $@/modules.order, $(modorder)),1))
+	need-modorder=$(if $(filter $@/modules.order, $(subdir-modorder)),1)
 
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index a41a4bbd20e2..0d931cc0df94 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -35,7 +35,9 @@ lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
 # Determine modorder.
 # Unfortunately, we don't have information about ordering between -y
 # and -m subdirs.  Just put -y's first.
+ifdef need-modorder
 modorder	:= $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
+endif
 
 # Handle objects in subdirs
 # ---------------------------------------------------------------------------
-- 
2.25.1
