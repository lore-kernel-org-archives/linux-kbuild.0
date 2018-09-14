Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:31994 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726831AbeINLqf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Sep 2018 07:46:35 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] kbuild: add --include-dir flag only for out-of-tree build
Date: Fri, 14 Sep 2018 15:33:23 +0900
Message-Id: <1536906803-29741-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The --include-dir flag is used to include check-in Makefiles from
$(objtree) without $(srctree)/ prefix.  Obviously, this is unneeded
for in-tree build.  Add the flag just before changing the working
directory.

This becomes effective after invoking sub-make.  Add a little bit
comments about it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Add some more comments

 Makefile | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index f8c8e12..233b57d 100644
--- a/Makefile
+++ b/Makefile
@@ -15,10 +15,9 @@ NAME = Merciless Moray
 PHONY := _all
 _all:
 
-# o Do not use make's built-in rules and variables
-#   (this increases performance and avoids hard-to-debug behaviour);
-# o Look for make include files relative to root of kernel src
-MAKEFLAGS += -rR --include-dir=$(CURDIR)
+# Do not use make's built-in rules and variables
+# (this increases performance and avoids hard-to-debug behaviour)
+MAKEFLAGS += -rR
 
 # Avoid funny character set dependencies
 unexport LC_ALL
@@ -136,6 +135,13 @@ KBUILD_OUTPUT := $(shell mkdir -p $(KBUILD_OUTPUT) && cd $(KBUILD_OUTPUT) \
 $(if $(KBUILD_OUTPUT),, \
      $(error failed to create output directory "$(saved-output)"))
 
+# Look for make include files relative to root of kernel src
+#
+# This does not become effective immediately because MAKEFLAGS is re-parsed
+# once after the Makefile is read.  It is OK since we are going to invoke
+# 'sub-make' below.
+MAKEFLAGS += --include-dir=$(CURDIR)
+
 PHONY += $(MAKECMDGOALS) sub-make
 
 $(filter-out _all sub-make $(CURDIR)/Makefile, $(MAKECMDGOALS)) _all: sub-make
-- 
2.7.4
