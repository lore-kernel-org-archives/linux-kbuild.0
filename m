Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:27327 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbeIMPcK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Sep 2018 11:32:10 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: add --include-dir flag only for out-of-tree build
Date: Thu, 13 Sep 2018 19:22:54 +0900
Message-Id: <1536834174-31857-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The --include-dir flag is used to include check-in Makefiles from
$(objtree) without prefixing $(srctree)/ the paths.  Obviously, this
is unnecessary for in-tree build.  Add the flag just before changing
the working directory.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index f8c8e12..8f563a6 100644
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
+# (this increases performance and avoids hard-to-debug behaviour);
+MAKEFLAGS += -rR
 
 # Avoid funny character set dependencies
 unexport LC_ALL
@@ -136,6 +135,9 @@ KBUILD_OUTPUT := $(shell mkdir -p $(KBUILD_OUTPUT) && cd $(KBUILD_OUTPUT) \
 $(if $(KBUILD_OUTPUT),, \
      $(error failed to create output directory "$(saved-output)"))
 
+# Look for make include files relative to root of kernel src
+MAKEFLAGS += --include-dir=$(CURDIR)
+
 PHONY += $(MAKECMDGOALS) sub-make
 
 $(filter-out _all sub-make $(CURDIR)/Makefile, $(MAKECMDGOALS)) _all: sub-make
-- 
2.7.4
