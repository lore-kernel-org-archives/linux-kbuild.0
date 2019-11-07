Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:63494 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729985AbfKGPJ5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Nov 2019 10:09:57 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kbuild: rename any-prereq to newer-prereqs
Date: Fri,  8 Nov 2019 00:09:45 +0900
Message-Id: <20191107150945.4513-2-yamada.masahiro@socionext.com>
In-Reply-To: <20191107150945.4513-1-yamada.masahiro@socionext.com>
References: <20191107150945.4513-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

GNU Make manual says:

  $?
      The names of all the prerequisites that are newer than the target,
      with spaces between them.

To reflect this, rename any-prereq to newer-prereqs, which is clearer
and more intuitive.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index b3a1189ec3d9..79713bd48a1e 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -210,17 +210,17 @@ endif
 # (needed for the shell)
 make-cmd = $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(cmd_$(1)))))
 
-# Find any prerequisites that is newer than target or that does not exist.
+# Find any prerequisites that are newer than target or that do not exist.
 # PHONY targets skipped in both cases.
-any-prereq = $(filter-out $(PHONY),$?)
+newer-prereqs = $(filter-out $(PHONY),$?)
 
 # Execute command if command has changed or prerequisite(s) are updated.
-if_changed = $(if $(any-prereq)$(cmd-check),                                 \
+if_changed = $(if $(newer-prereqs)$(cmd-check),                              \
 	$(cmd);                                                              \
 	printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
 
 # Execute the command and also postprocess generated .d dependencies file.
-if_changed_dep = $(if $(any-prereq)$(cmd-check),$(cmd_and_fixdep),@:)
+if_changed_dep = $(if $(newer-prereqs)$(cmd-check),$(cmd_and_fixdep),@:)
 
 cmd_and_fixdep =                                                             \
 	$(cmd);                                                              \
@@ -230,7 +230,7 @@ cmd_and_fixdep =                                                             \
 # Usage: $(call if_changed_rule,foo)
 # Will check if $(cmd_foo) or any of the prerequisites changed,
 # and if so will execute $(rule_foo).
-if_changed_rule = $(if $(any-prereq)$(cmd-check),$(rule_$(1)),@:)
+if_changed_rule = $(if $(newer-prereqs)$(cmd-check),$(rule_$(1)),@:)
 
 ###
 # why - tell why a target got built
@@ -255,7 +255,7 @@ ifeq ($(KBUILD_VERBOSE),2)
 why =                                                                        \
     $(if $(filter $@, $(PHONY)),- due to target is PHONY,                    \
         $(if $(wildcard $@),                                                 \
-            $(if $(any-prereq),- due to: $(any-prereq),                      \
+            $(if $(newer-prereqs),- due to: $(newer-prereqs),                \
                 $(if $(cmd-check),                                           \
                     $(if $(cmd_$@),- due to command line change,             \
                         $(if $(filter $@, $(targets)),                       \
-- 
2.17.1
