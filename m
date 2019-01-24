Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:45474 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfAXKsV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Jan 2019 05:48:21 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kconfig: rename zconf.y to parser.y
Date: Thu, 24 Jan 2019 19:47:30 +0900
Message-Id: <1548326850-13660-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1548326850-13660-1-git-send-email-yamada.masahiro@socionext.com>
References: <1548326850-13660-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Use a more logical name.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/Makefile              | 7 ++++---
 scripts/kconfig/expr.h                | 2 +-
 scripts/kconfig/lexer.l               | 2 +-
 scripts/kconfig/{zconf.y => parser.y} | 0
 4 files changed, 6 insertions(+), 5 deletions(-)
 rename scripts/kconfig/{zconf.y => parser.y} (100%)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 9278519..7c5dc31 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -143,11 +143,12 @@ help:
 
 # ===========================================================================
 # object files used by all kconfig flavours
-common-objs	:= confdata.o expr.o lexer.lex.o preprocess.o symbol.o zconf.tab.o
+common-objs	:= confdata.o expr.o lexer.lex.o parser.tab.o preprocess.o \
+		   symbol.o
 
-$(obj)/lexer.lex.o: $(obj)/zconf.tab.h
+$(obj)/lexer.lex.o: $(obj)/parser.tab.h
 HOSTCFLAGS_lexer.lex.o	:= -I$(src)
-HOSTCFLAGS_zconf.tab.o	:= -I$(src)
+HOSTCFLAGS_parser.tab.o	:= -I$(src)
 
 # conf: Used for defconfig, oldconfig and related targets
 hostprogs-y	+= conf
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 999edb6..8dde65bc 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -172,7 +172,7 @@ struct symbol {
  *         int "BAZ Value"
  *         range 1..255
  *
- * Please, also check zconf.y:print_symbol() when modifying the
+ * Please, also check parser.y:print_symbol() when modifying the
  * list of property types!
  */
 enum prop_type {
diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index b2d0a3b..c9df1c8 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -15,7 +15,7 @@
 #include <unistd.h>
 
 #include "lkc.h"
-#include "zconf.tab.h"
+#include "parser.tab.h"
 
 #define YY_DECL		static int yylex1(void)
 
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/parser.y
similarity index 100%
rename from scripts/kconfig/zconf.y
rename to scripts/kconfig/parser.y
-- 
2.7.4
