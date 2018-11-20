Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:34012 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbeKTLdM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Nov 2018 06:33:12 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 8/9] kbuild: refactor if_changed and if_changed_dep
Date: Tue, 20 Nov 2018 10:05:29 +0900
Message-Id: <1542675930-21114-9-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1542675930-21114-1-git-send-email-yamada.masahiro@socionext.com>
References: <1542675930-21114-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

'@set -e; $(echo-cmd) $(cmd_$(1)' can be replaced with '$(cmd)'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/Kbuild.include | 9 +++------
 scripts/Makefile.build | 4 ++--
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 79c4875..33aacca 100644
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
 	scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).cmd;\
 	rm -f $(depfile)
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ffd2fe4..3bad2aa 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -261,7 +261,7 @@ endif
 
 define rule_cc_o_c
 	$(call cmd,checksrc)
-	@$(call cmd_and_fixdep,cc_o_c)
+	$(call cmd_and_fixdep,cc_o_c)
 	$(call cmd,gen_ksymdeps)
 	$(call cmd,checkdoc)
 	$(call cmd,objtool)
@@ -270,7 +270,7 @@ define rule_cc_o_c
 endef
 
 define rule_as_o_S
-	@$(call cmd_and_fixdep,as_o_S)
+	$(call cmd_and_fixdep,as_o_S)
 	$(call cmd,gen_ksymdeps)
 	$(call cmd,objtool)
 	$(call cmd,modversions_S)
-- 
2.7.4
