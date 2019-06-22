Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:55074 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbfFVQHN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Jun 2019 12:07:13 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/3] kbuild: save $(strip ...) for calling if_changed and friends
Date: Sun, 23 Jun 2019 01:07:05 +0900
Message-Id: <20190622160705.17071-3-yamada.masahiro@socionext.com>
In-Reply-To: <20190622160705.17071-1-yamada.masahiro@socionext.com>
References: <20190622160705.17071-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The string returned by $(filter-out ...) does not contain any leading
or trailing spaces.

With the previous commit, 'any-prereq' no longer contains any
excessive spaces.

Nor does 'cmd-check' since it expands to a $(filter-out ...) call.

So, only the space that matters is the one between 'any-prereq'
and 'cmd-check'.

By removing it from the code, we can save $(strip ...) evaluation.
This refactoring is possible because $(any-prereq)$(cmd-check) is only
passed to the first argument of $(if ...), so we are only interested
in whether it is empty or not.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 0fa93f6de0b0..0e57a9524003 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -234,12 +234,12 @@ make-cmd = $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(cmd_$(1))))
 any-prereq = $(filter-out $(PHONY),$?)$(filter-out $(PHONY) $(wildcard $^),$^)
 
 # Execute command if command has changed or prerequisite(s) are updated.
-if_changed = $(if $(strip $(any-prereq) $(cmd-check)),                       \
+if_changed = $(if $(any-prereq)$(cmd-check),                                 \
 	$(cmd);                                                              \
 	printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
 
 # Execute the command and also postprocess generated .d dependencies file.
-if_changed_dep = $(if $(strip $(any-prereq) $(cmd-check)),$(cmd_and_fixdep),@:)
+if_changed_dep = $(if $(any-prereq)$(cmd-check),$(cmd_and_fixdep),@:)
 
 cmd_and_fixdep =                                                             \
 	$(cmd);                                                              \
@@ -249,7 +249,7 @@ cmd_and_fixdep =                                                             \
 # Usage: $(call if_changed_rule,foo)
 # Will check if $(cmd_foo) or any of the prerequisites changed,
 # and if so will execute $(rule_foo).
-if_changed_rule = $(if $(strip $(any-prereq) $(cmd-check)),$(rule_$(1)),@:)
+if_changed_rule = $(if $(any-prereq)$(cmd-check),$(rule_$(1)),@:)
 
 ###
 # why - tell why a target got built
-- 
2.17.1
