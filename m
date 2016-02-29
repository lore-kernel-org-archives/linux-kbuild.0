Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:26877 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755570AbcB2DsY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 28 Feb 2016 22:48:24 -0500
Content-transfer-encoding: 7BIT
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v4 4/8] kbuild: de-duplicate fixdep usage
Date: Sun, 28 Feb 2016 22:48:07 -0500
Message-id: <1456717691-28298-5-git-send-email-nicolas.pitre@linaro.org>
In-reply-to: <1456717691-28298-1-git-send-email-nicolas.pitre@linaro.org>
References: <1456717691-28298-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The generation and postprocessing of automatic dependency rules is
duplicated in rule_cc_o_c and if_changed_dep. Since this is not a
trivial one-liner action, it is now abstracted under cmd_and_fixdep
to simplify things and make future changes easier.

In the rule_cc_o_c case that means the order of some commands has been
altered, namely fixdep and related file manipulations are executed
earlier, but they didn't depend on those commands that now execute later.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
---
 scripts/Kbuild.include | 5 ++++-
 scripts/Makefile.build | 9 ++-------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 1db6d73c8d..8a257fa663 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -256,10 +256,13 @@ if_changed = $(if $(strip $(any-prereq) $(arg-check)),                       \
 # Execute the command and also postprocess generated .d dependencies file.
 if_changed_dep = $(if $(strip $(any-prereq) $(arg-check) ),                  \
 	@set -e;                                                             \
+	$(cmd_and_fixdep))
+
+cmd_and_fixdep =                                                             \
 	$(echo-cmd) $(cmd_$(1));                                             \
 	scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).tmp;\
 	rm -f $(depfile);                                                    \
-	mv -f $(dot-target).tmp $(dot-target).cmd)
+	mv -f $(dot-target).tmp $(dot-target).cmd;
 
 # Usage: $(call if_changed_rule,foo)
 # Will check if $(cmd_foo) or any of the prerequisites changed,
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index f4b4320e0d..8134ee81ad 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -243,14 +243,9 @@ endif
 
 define rule_cc_o_c
 	$(call echo-cmd,checksrc) $(cmd_checksrc)			  \
-	$(call echo-cmd,cc_o_c) $(cmd_cc_o_c);				  \
+	$(call cmd_and_fixdep,cc_o_c)					  \
 	$(cmd_modversions)						  \
-	$(call echo-cmd,record_mcount)					  \
-	$(cmd_record_mcount)						  \
-	scripts/basic/fixdep $(depfile) $@ '$(call make-cmd,cc_o_c)' >    \
-	                                              $(dot-target).tmp;  \
-	rm -f $(depfile);						  \
-	mv -f $(dot-target).tmp $(dot-target).cmd
+	$(call echo-cmd,record_mcount) $(cmd_record_mcount)
 endef
 
 # List module undefined symbols (or empty line if not enabled)
-- 
2.5.0

