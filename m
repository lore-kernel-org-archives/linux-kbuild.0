Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([59.151.112.132]:18509 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751326AbdFWH2C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Jun 2017 03:28:02 -0400
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: [PATCH] kbuild: improve comments on KBUILD_SRC
Date: Fri, 23 Jun 2017 15:31:02 +0800
Message-ID: <1498203062-13090-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Original comments is confusing on "OBJ directory", make it clear.

Bonus: move comments close to what it want to comment.
Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 57df756..81c0df9 100644
--- a/Makefile
+++ b/Makefile
@@ -113,8 +113,9 @@ export quiet Q KBUILD_VERBOSE
 # The O= assignment takes precedence over the KBUILD_OUTPUT environment
 # variable.
 
-# KBUILD_SRC is set on invocation of make in OBJ directory
-# KBUILD_SRC is not intended to be used by the regular user (for now)
+# KBUILD_SRC is not intended to be used by the regular user (for now),
+# it is set on invocation of make in KBUILD_OUTPUT directory, i.e., it
+# is set on using "make O=dir/to/store/output/files/"
 ifeq ($(KBUILD_SRC),)
 
 # OK, Make called in directory where kernel src resides
@@ -135,7 +136,6 @@ ifneq ($(words $(subst :, ,$(CURDIR))), 1)
 endif
 
 ifneq ($(KBUILD_OUTPUT),)
-# Invoke a second make in the output directory, passing relevant variables
 # check that the output directory actually exists
 saved-output := $(KBUILD_OUTPUT)
 KBUILD_OUTPUT := $(shell mkdir -p $(KBUILD_OUTPUT) && cd $(KBUILD_OUTPUT) \
@@ -148,6 +148,7 @@ PHONY += $(MAKECMDGOALS) sub-make
 $(filter-out _all sub-make $(CURDIR)/Makefile, $(MAKECMDGOALS)) _all: sub-make
 	@:
 
+# Invoke a second make in the output directory, passing relevant variables
 sub-make:
 	$(Q)$(MAKE) -C $(KBUILD_OUTPUT) KBUILD_SRC=$(CURDIR) \
 	-f $(CURDIR)/Makefile $(filter-out _all sub-make,$(MAKECMDGOALS))
-- 
2.1.0



