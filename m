Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:59785 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbeLRF0b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Dec 2018 00:26:31 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: fix false positive warning/error about missing libelf
Date: Tue, 18 Dec 2018 14:25:41 +0900
Message-Id: <1545110741-10761-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Bernd Edlinger <bernd.edlinger@hotmail.de>, Qian Cai <cai@lca.pw>, Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

For the same reason as commit 25896d073d8a ("x86/build: Fix compiler
support check for CONFIG_RETPOLINE"), you cannot put this $(error ...)
into the parse stage of the top Makefile.

Perhaps I'd propose a more sophisticated solution later, but this is
the best I can do for now.

Link: https://lkml.org/lkml/2017/12/25/211
Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Reported-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
Reported-by: Qian Cai <cai@lca.pw>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 56d5270..d45856f 100644
--- a/Makefile
+++ b/Makefile
@@ -962,11 +962,6 @@ ifdef CONFIG_STACK_VALIDATION
   ifeq ($(has_libelf),1)
     objtool_target := tools/objtool FORCE
   else
-    ifdef CONFIG_UNWINDER_ORC
-      $(error "Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel")
-    else
-      $(warning "Cannot use CONFIG_STACK_VALIDATION=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel")
-    endif
     SKIP_STACK_VALIDATION := 1
     export SKIP_STACK_VALIDATION
   endif
@@ -1125,6 +1120,14 @@ uapi-asm-generic:
 
 PHONY += prepare-objtool
 prepare-objtool: $(objtool_target)
+ifeq ($(SKIP_STACK_VALIDATION),1)
+ifdef CONFIG_UNWINDER_ORC
+	@echo "error: Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel" >&2
+	@false
+else
+	@echo "warning: Cannot use CONFIG_STACK_VALIDATION=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel" >&2
+endif
+endif
 
 # Generate some files
 # ---------------------------------------------------------------------------
-- 
2.7.4
