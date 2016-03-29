Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from alt13.smtp-out.videotron.ca ([135.19.0.26]:15237 "EHLO
	alt12.smtp-out.videotron.ca" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754332AbcC2UpK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Mar 2016 16:45:10 -0400
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v7 4/8] kbuild: de-duplicate fixdep usage
Date: Tue, 29 Mar 2016 16:44:38 -0400
Message-Id: <1459284282-6676-5-git-send-email-nicolas.pitre@linaro.org>
In-Reply-To: <1459284282-6676-1-git-send-email-nicolas.pitre@linaro.org>
References: <1459284282-6676-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The generation and postprocessing of automatic dependency rules is
duplicated in rule_cc_o_c, rule_as_o_S and if_changed_dep. Since
this is not a trivial one-liner action, it is now abstracted under
cmd_and_fixdep to simplify things and make future changes in this area
easier.

In the rule_cc_o_c and rule_as_o_S cases that means the order of some
commands has been altered, namely fixdep and related file manipulations
are executed earlier, but they didn't depend on those commands that now
execute later.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
---
 scripts/Kbuild.include |  5 ++++-
 scripts/Makefile.build | 19 +++++--------------
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index b2ab2a92a3..80ca538bfb 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -256,10 +256,13 @@ if_changed = $(if $(strip $(any-prereq) $(arg-check)),                       \
 # Execute the command and also postprocess generated .d dependencies file.
 if_changed_dep = $(if $(strip $(any-prereq) $(arg-check) ),                  \
 	@set -e;                                                             \
+	$(cmd_and_fixdep), @:)
+
+cmd_and_fixdep =                                                             \
 	$(echo-cmd) $(cmd_$(1));                                             \
 	scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).tmp;\
 	rm -f $(depfile);                                                    \
-	mv -f $(dot-target).tmp $(dot-target).cmd, @:)
+	mv -f $(dot-target).tmp $(dot-target).cmd;
 
 # Usage: $(call if_changed_rule,foo)
 # Will check if $(cmd_foo) or any of the prerequisites changed,
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 74556e5e4e..12821d9eae 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -266,24 +266,15 @@ endif # CONFIG_STACK_VALIDATION
 
 define rule_cc_o_c
 	$(call echo-cmd,checksrc) $(cmd_checksrc)			  \
-	$(call echo-cmd,cc_o_c) $(cmd_cc_o_c);				  \
+	$(call cmd_and_fixdep,cc_o_c)					  \
 	$(cmd_modversions)						  \
-	$(cmd_objtool)						  \
-	$(call echo-cmd,record_mcount)					  \
-	$(cmd_record_mcount)						  \
-	scripts/basic/fixdep $(depfile) $@ '$(call make-cmd,cc_o_c)' >    \
-	                                              $(dot-target).tmp;  \
-	rm -f $(depfile);						  \
-	mv -f $(dot-target).tmp $(dot-target).cmd
+	$(cmd_objtool)						          \
+	$(call echo-cmd,record_mcount) $(cmd_record_mcount)
 endef
 
 define rule_as_o_S
-	$(call echo-cmd,as_o_S) $(cmd_as_o_S);				  \
-	$(cmd_objtool)						  \
-	scripts/basic/fixdep $(depfile) $@ '$(call make-cmd,as_o_S)' >    \
-	                                              $(dot-target).tmp;  \
-	rm -f $(depfile);						  \
-	mv -f $(dot-target).tmp $(dot-target).cmd
+	$(call cmd_and_fixdep,as_o_S)					  \
+	$(cmd_objtool)
 endef
 
 # List module undefined symbols (or empty line if not enabled)
-- 
2.5.5

