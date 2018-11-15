Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:52245 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728519AbeKOSgO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 13:36:14 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/8] kbuild: remove redundant 'set -e' from filechk_* defines
Date: Thu, 15 Nov 2018 17:27:08 +0900
Message-Id: <1542270435-11181-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1542270435-11181-1-git-send-email-yamada.masahiro@socionext.com>
References: <1542270435-11181-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Richard Weinberger <richard@nod.at>, Jeff Dike <jdike@addtoit.com>

The filechk macro in scripts/Kbuild.include already sets 'set -e'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/um/Makefile     | 2 +-
 scripts/Makefile.lib | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/um/Makefile b/arch/um/Makefile
index ab1066c..71ff3d0 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -152,7 +152,7 @@ $(HOST_DIR)/um/user-offsets.s: __headers FORCE
 	$(Q)$(MAKE) $(build)=$(HOST_DIR)/um $@
 
 define filechk_gen-asm-offsets
-        (set -e; \
+        ( \
          echo "/*"; \
          echo " * DO NOT MODIFY."; \
          echo " *"; \
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 8fe4468..ae3ae97 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -406,7 +406,7 @@ endef
 # Use filechk to avoid rebuilds when a header changes, but the resulting file
 # does not
 define filechk_offsets
-	(set -e; \
+	( \
 	 echo "#ifndef $2"; \
 	 echo "#define $2"; \
 	 echo "/*"; \
-- 
2.7.4
