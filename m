Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:45475 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726337AbfAXKsV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Jan 2019 05:48:21 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kconfig: rename zconf.l to lexer.l
Date: Thu, 24 Jan 2019 19:47:29 +0900
Message-Id: <1548326850-13660-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Use a more logcal name.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/Makefile             | 6 +++---
 scripts/kconfig/{zconf.l => lexer.l} | 0
 scripts/kconfig/lkc.h                | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename scripts/kconfig/{zconf.l => lexer.l} (100%)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 1819735..9278519 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -143,10 +143,10 @@ help:
 
 # ===========================================================================
 # object files used by all kconfig flavours
-common-objs	:= confdata.o expr.o symbol.o preprocess.o zconf.lex.o zconf.tab.o
+common-objs	:= confdata.o expr.o lexer.lex.o preprocess.o symbol.o zconf.tab.o
 
-$(obj)/zconf.lex.o: $(obj)/zconf.tab.h
-HOSTCFLAGS_zconf.lex.o	:= -I$(src)
+$(obj)/lexer.lex.o: $(obj)/zconf.tab.h
+HOSTCFLAGS_lexer.lex.o	:= -I$(src)
 HOSTCFLAGS_zconf.tab.o	:= -I$(src)
 
 # conf: Used for defconfig, oldconfig and related targets
diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/lexer.l
similarity index 100%
rename from scripts/kconfig/zconf.l
rename to scripts/kconfig/lexer.l
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 531ff7c..d871539 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -90,7 +90,7 @@ void *xrealloc(void *p, size_t size);
 char *xstrdup(const char *s);
 char *xstrndup(const char *s, size_t n);
 
-/* zconf.l */
+/* lexer.l */
 int yylex(void);
 
 struct gstr {
-- 
2.7.4
