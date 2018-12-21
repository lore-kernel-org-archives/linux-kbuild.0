Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:38271 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387770AbeLUId3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Dec 2018 03:33:29 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/5] kconfig: split the lexer out of zconf.y
Date: Fri, 21 Dec 2018 17:33:05 +0900
Message-Id: <1545381188-514-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1545381188-514-1-git-send-email-yamada.masahiro@socionext.com>
References: <1545381188-514-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Compile zconf.lex.c independently of the other files.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/Makefile | 8 ++------
 scripts/kconfig/lkc.h    | 3 +++
 scripts/kconfig/zconf.l  | 1 +
 scripts/kconfig/zconf.y  | 2 --
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index d3bd687..65cdf8c 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -143,11 +143,9 @@ help:
 
 # ===========================================================================
 # object files used by all kconfig flavours
-common-objs	:= confdata.o expr.o symbol.o preprocess.o zconf.tab.o
+common-objs	:= confdata.o expr.o symbol.o preprocess.o zconf.lex.o zconf.tab.o
 
-targets		+= zconf.lex.c
-
-# generated files seem to need this to find local include files
+$(obj)/zconf.lex.o: $(obj)/zconf.tab.h
 HOSTCFLAGS_zconf.lex.o	:= -I$(src)
 HOSTCFLAGS_zconf.tab.o	:= -I$(src)
 
@@ -202,8 +200,6 @@ HOSTCFLAGS_gconf.o  = $(shell . $(obj)/.gconf-cfg && echo $$cflags)
 
 $(obj)/gconf.o: $(obj)/.gconf-cfg
 
-$(obj)/zconf.tab.o: $(obj)/zconf.lex.c
-
 # check if necessary packages are available, and configure build flags
 define filechk_conf_cfg
 	$(CONFIG_SHELL) $<
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 160a931..531ff7c 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -90,6 +90,9 @@ void *xrealloc(void *p, size_t size);
 char *xstrdup(const char *s);
 char *xstrndup(const char *s, size_t n);
 
+/* zconf.l */
+int yylex(void);
+
 struct gstr {
 	size_t len;
 	char  *s;
diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 960e6c6..a9a83eb 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -15,6 +15,7 @@
 #include <unistd.h>
 
 #include "lkc.h"
+#include "zconf.tab.h"
 
 #define YY_DECL		static int yylex1(void)
 
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 32be913..07719a7 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -20,7 +20,6 @@
 
 int cdebug = PRINTD;
 
-int yylex(void);
 static void yyerror(const char *err);
 static void zconfprint(const char *err, ...);
 static void zconf_error(const char *err, ...);
@@ -728,6 +727,5 @@ void zconfdump(FILE *out)
 	}
 }
 
-#include "zconf.lex.c"
 #include "util.c"
 #include "menu.c"
-- 
2.7.4
