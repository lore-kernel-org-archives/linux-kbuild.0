Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:50702 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728519AbeKOSfY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 13:35:24 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 6/8] kbuild: remove trailing semicolon from cmd_* passed to if_changed_rule
Date: Thu, 15 Nov 2018 17:27:13 +0900
Message-Id: <1542270435-11181-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1542270435-11181-1-git-send-email-yamada.masahiro@socionext.com>
References: <1542270435-11181-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

All commands passed into rule_cc_o_c / rule_as_o_S needed to end with
a semicolon because the old if_changed_rule implementation only
accepted a single shell command. To pass in multiple shell commands,
they must be concatenated with '; \'.

With the if_changed_rule change in the last commit, this restriction
does not exist any more. Rip off unneeded semicolons.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 5528a6a..78e647f 100644
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
@@ -258,7 +258,7 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
 cmd_gen_ksymdeps = \
 	$(CONFIG_SHELL) $(srctree)/scripts/gen_ksymdeps.sh $@ > $(dot-target).tmp; \
 	cat $(dot-target).tmp >> $(dot-target).cmd; \
-	rm -f $(dot-target).tmp;
+	rm -f $(dot-target).tmp
 
 endif
 
@@ -375,7 +375,7 @@ cmd_modversions_S =								\
 			-T $(@D)/.tmp_$(@F:.o=.ver);				\
 		mv -f $(@D)/.tmp_$(@F) $@;					\
 		rm -f $(@D)/.tmp_$(@F:.o=.ver);					\
-	fi;
+	fi
 endif
 endif
 
-- 
2.7.4
