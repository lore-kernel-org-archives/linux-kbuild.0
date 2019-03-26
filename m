Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:30443 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbfCZEDR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Mar 2019 00:03:17 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: skip parsing pre sub-make code for recursion
Date: Tue, 26 Mar 2019 13:02:19 +0900
Message-Id: <1553572939-18940-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

When Make recurses to the top Makefile with sub-make-done unset,
the code block surrounded by 'ifneq ($(sub-make-done),1) ... endif'
is parsed multiple times. This happens for in-tree building of
include/config/auto.conf, *-pkg, etc. with GNU Make 4.x.

This is a slight regression by commit 688931a5ad4e ("kbuild: skip
sub-make for in-tree build with GNU Make 4.x") in terms of performance
since that code block contains one $(shell ...) invocation.

Fix it by exporting the variable irrespective of sub-make being run.
I renamed it because GNU Make cannot properly export variables
containing hyphens. This is probably a bug of GNU Make, and the issue
in Kbuild had already been reported by commit 2bfbe7881ee0 ("kbuild:
Do not use hyphen in exported variable name").

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 41b25b2..5fe5431 100644
--- a/Makefile
+++ b/Makefile
@@ -31,7 +31,7 @@ _all:
 # descending is started. They are now explicitly listed as the
 # prepare rule.
 
-ifneq ($(sub-make-done),1)
+ifneq ($(sub_make_done),1)
 
 # Do not use make's built-in rules and variables
 # (this increases performance and avoids hard-to-debug behaviour)
@@ -155,6 +155,8 @@ need-sub-make := 1
 $(lastword $(MAKEFILE_LIST)): ;
 endif
 
+export sub_make_done := 1
+
 ifeq ($(need-sub-make),1)
 
 PHONY += $(MAKECMDGOALS) sub-make
@@ -164,12 +166,12 @@ $(filter-out _all sub-make $(CURDIR)/Makefile, $(MAKECMDGOALS)) _all: sub-make
 
 # Invoke a second make in the output directory, passing relevant variables
 sub-make:
-	$(Q)$(MAKE) sub-make-done=1 \
+	$(Q)$(MAKE) \
 	$(if $(KBUILD_OUTPUT),-C $(KBUILD_OUTPUT) KBUILD_SRC=$(CURDIR)) \
 	-f $(CURDIR)/Makefile $(filter-out _all sub-make,$(MAKECMDGOALS))
 
 endif # need-sub-make
-endif # sub-make-done
+endif # sub_make_done
 
 # We process the rest of the Makefile if this is the final invocation of make
 ifeq ($(need-sub-make),)
-- 
2.7.4
