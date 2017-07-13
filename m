Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([59.151.112.132]:53029 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750846AbdGMJdy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Jul 2017 05:33:54 -0400
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: [PATCH] kbuild: trivial cleanup on the comments
Date: Thu, 13 Jul 2017 17:37:51 +0800
Message-ID: <1499938671-13376-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, mmarek@suse.com

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 scripts/Kbuild.include | 7 +++----
 scripts/basic/Makefile | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 61f87a9..f0a4ada 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -85,8 +85,8 @@ TMPOUT := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/)
 
 # try-run
 # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
-# Exit code chooses option. "$$TMP" is can be used as temporary file and
-# is automatically cleaned up.
+# Exit code chooses option. "$$TMP" serves as temporary file and is
+# automatically cleaned up.
 try-run = $(shell set -e;		\
 	TMP="$(TMPOUT).$$$$.tmp";	\
 	TMPO="$(TMPOUT).$$$$.o";	\
@@ -256,7 +256,6 @@ make-cmd = $(call escsq,$(subst \#,\\\#,$(subst $$,$$$$,$(cmd_$(1)))))
 any-prereq = $(filter-out $(PHONY),$?) $(filter-out $(PHONY) $(wildcard $^),$^)
 
 # Execute command if command has changed or prerequisite(s) are updated.
-#
 if_changed = $(if $(strip $(any-prereq) $(arg-check)),                       \
 	@set -e;                                                             \
 	$(echo-cmd) $(cmd_$(1));                                             \
@@ -310,7 +309,7 @@ if_changed_rule = $(if $(strip $(any-prereq) $(arg-check) ),                 \
 	$(rule_$(1)), @:)
 
 ###
-# why - tell why a a target got build
+# why - tell why a target got build
 #       enabled by make V=2
 #       Output (listed in the order they are checked):
 #          (1) - due to target is PHONY
diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
index ec10d93..edd983f 100644
--- a/scripts/basic/Makefile
+++ b/scripts/basic/Makefile
@@ -1,5 +1,5 @@
 ###
-# Makefile.basic lists the most basic programs used during the build process.
+# scripts/basic/Makefile lists the most basic programs used during the build process.
 # The programs listed herein are what are needed to do the basic stuff,
 # such as fix file dependencies.
 # This initial step is needed to avoid files to be recompiled
-- 
2.1.0



