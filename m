Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:50788 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728757AbeKOSf1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 13:35:27 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 7/8] kbuild: refactor if_changed and if_changed_dep
Date: Thu, 15 Nov 2018 17:27:14 +0900
Message-Id: <1542270435-11181-8-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1542270435-11181-1-git-send-email-yamada.masahiro@socionext.com>
References: <1542270435-11181-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

'@set -e; $(echo-cmd) $(cmd_$(1)' can be replaced with '$(cmd)'.
More cleanups.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 9 +++------
 scripts/Makefile.build | 4 ++--
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 5e47bf6..e4b77ef7 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -251,17 +251,14 @@ any-prereq = $(filter-out $(PHONY),$?) $(filter-out $(PHONY) $(wildcard $^),$^)
 
 # Execute command if command has changed or prerequisite(s) are updated.
 if_changed = $(if $(strip $(any-prereq) $(arg-check)),                       \
-	@set -e;                                                             \
-	$(echo-cmd) $(cmd_$(1));                                             \
+	$(cmd);                                                              \
 	printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
 
 # Execute the command and also postprocess generated .d dependencies file.
-if_changed_dep = $(if $(strip $(any-prereq) $(arg-check) ),                  \
-	@set -e;                                                             \
-	$(cmd_and_fixdep), @:)
+if_changed_dep = $(if $(strip $(any-prereq) $(arg-check)), $(cmd_and_fixdep), @:)
 
 cmd_and_fixdep =                                                             \
-	$(echo-cmd) $(cmd_$(1));                                             \
+	$(cmd);                                                              \
 	scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).tmp;\
 	rm -f $(depfile);                                                    \
 	mv -f $(dot-target).tmp $(dot-target).cmd;
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 78e647f..0f28df2 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -264,7 +264,7 @@ endif
 
 define rule_cc_o_c
 	$(call cmd,checksrc)
-	@$(call cmd_and_fixdep,cc_o_c)
+	$(call cmd_and_fixdep,cc_o_c)
 	$(call cmd,gen_ksymdeps)
 	$(call cmd,checkdoc)
 	$(call cmd,objtool)
@@ -273,7 +273,7 @@ define rule_cc_o_c
 endef
 
 define rule_as_o_S
-	@$(call cmd_and_fixdep,as_o_S)
+	$(call cmd_and_fixdep,as_o_S)
 	$(call cmd,gen_ksymdeps)
 	$(call cmd,objtool)
 	$(call cmd,modversions_S)
-- 
2.7.4
