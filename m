Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:34063 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732157AbeKTLdO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Nov 2018 06:33:14 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 7/9] kbuild: remove trailing semicolon from cmd_* passed to if_changed_rule
Date: Tue, 20 Nov 2018 10:05:28 +0900
Message-Id: <1542675930-21114-8-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1542675930-21114-1-git-send-email-yamada.masahiro@socionext.com>
References: <1542675930-21114-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

With the change of rule_cc_o_c / rule_as_o_S in the last commit, each
command is executed in a separate subshell. Rip off unneeded semicolons.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
 - Clean up cmd_and_fixdep as well

 scripts/Kbuild.include |  2 +-
 scripts/Makefile.build | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 978d72b..79c4875 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -263,7 +263,7 @@ if_changed_dep = $(if $(strip $(any-prereq) $(arg-check) ),                  \
 cmd_and_fixdep =                                                             \
 	$(echo-cmd) $(cmd_$(1));                                             \
 	scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).cmd;\
-	rm -f $(depfile);
+	rm -f $(depfile)
 
 # Usage: $(call if_changed_rule,foo)
 # Will check if $(cmd_foo) or any of the prerequisites changed,
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index e445b3e..ffd2fe4 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -75,14 +75,14 @@ __build: $(if $(KBUILD_BUILTIN),$(builtin-target) $(lib-target) $(extra-y)) \
 # Linus' kernel sanity checking tool
 ifeq ($(KBUILD_CHECKSRC),1)
   quiet_cmd_checksrc       = CHECK   $<
-        cmd_checksrc       = $(CHECK) $(CHECKFLAGS) $(c_flags) $< ;
+        cmd_checksrc       = $(CHECK) $(CHECKFLAGS) $(c_flags) $<
 else ifeq ($(KBUILD_CHECKSRC),2)
   quiet_cmd_force_checksrc = CHECK   $<
-        cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(c_flags) $< ;
+        cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(c_flags) $<
 endif
 
 ifneq ($(KBUILD_ENABLE_EXTRA_GCC_CHECKS),)
-  cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $< ;
+  cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $<
 endif
 
 # Do section mismatch analysis for each module/built-in.a
@@ -178,7 +178,7 @@ cmd_modversions_c =								\
 			-T $(@D)/.tmp_$(@F:.o=.ver);				\
 		mv -f $(@D)/.tmp_$(@F) $@;					\
 		rm -f $(@D)/.tmp_$(@F:.o=.ver);					\
-	fi;
+	fi
 endif
 
 ifdef CONFIG_FTRACE_MCOUNT_RECORD
@@ -211,7 +211,7 @@ cmd_record_mcount =						\
 	if [ "$(findstring $(CC_FLAGS_FTRACE),$(_c_flags))" =	\
 	     "$(CC_FLAGS_FTRACE)" ]; then			\
 		$(sub_cmd_record_mcount)			\
-	fi;
+	fi
 endif # CC_USING_RECORD_MCOUNT
 endif # CONFIG_FTRACE_MCOUNT_RECORD
 
@@ -241,7 +241,7 @@ endif
 # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
 cmd_objtool = $(if $(patsubst y%,, \
 	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
-	$(__objtool_obj) $(objtool_args) $@;)
+	$(__objtool_obj) $(objtool_args) $@)
 objtool_obj = $(if $(patsubst y%,, \
 	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
 	$(__objtool_obj))
@@ -256,7 +256,7 @@ objtool_dep = $(objtool_obj)					\
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
 cmd_gen_ksymdeps = \
-	$(CONFIG_SHELL) $(srctree)/scripts/gen_ksymdeps.sh $@ >> $(dot-target).cmd;
+	$(CONFIG_SHELL) $(srctree)/scripts/gen_ksymdeps.sh $@ >> $(dot-target).cmd
 endif
 
 define rule_cc_o_c
@@ -372,7 +372,7 @@ cmd_modversions_S =								\
 			-T $(@D)/.tmp_$(@F:.o=.ver);				\
 		mv -f $(@D)/.tmp_$(@F) $@;					\
 		rm -f $(@D)/.tmp_$(@F:.o=.ver);					\
-	fi;
+	fi
 endif
 endif
 
-- 
2.7.4
