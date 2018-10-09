Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:38211 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbeJIWXR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Oct 2018 18:23:17 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: use 'else ifeq' for checksrc to improve readability
Date: Wed, 10 Oct 2018 00:05:39 +0900
Message-Id: <1539097539-26985-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

'ifeq ... else ifeq ... endif' notation is supported by GNU Make 3.81
or later, which is the requirement for building the kernel since
commit 37d69ee30808 ("docs: bump minimal GNU Make version to 3.81").

Use it to improve the readability.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index f21b48d..7d884d8 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -73,14 +73,12 @@ __build: $(if $(KBUILD_BUILTIN),$(builtin-target) $(lib-target) $(extra-y)) \
 	@:
 
 # Linus' kernel sanity checking tool
-ifneq ($(KBUILD_CHECKSRC),0)
-  ifeq ($(KBUILD_CHECKSRC),2)
-    quiet_cmd_force_checksrc = CHECK   $<
-          cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(c_flags) $< ;
-  else
-      quiet_cmd_checksrc     = CHECK   $<
-            cmd_checksrc     = $(CHECK) $(CHECKFLAGS) $(c_flags) $< ;
-  endif
+ifeq ($(KBUILD_CHECKSRC),1)
+  quiet_cmd_checksrc       = CHECK   $<
+        cmd_checksrc       = $(CHECK) $(CHECKFLAGS) $(c_flags) $< ;
+else ifeq ($(KBUILD_CHECKSRC),2)
+  quiet_cmd_force_checksrc = CHECK   $<
+        cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(c_flags) $< ;
 endif
 
 ifneq ($(KBUILD_ENABLE_EXTRA_GCC_CHECKS),)
-- 
2.7.4
