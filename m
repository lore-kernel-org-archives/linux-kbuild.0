Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-il1-f196.google.com ([209.85.166.196]:42595 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728864AbfJ1QCx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Oct 2019 12:02:53 -0400
From: Ethan Sommer <e5ten.arch@gmail.com>
Subject: [PATCH] kbuild: support byacc as alternative YACC to bison
Date: Mon, 28 Oct 2019 11:56:37 -0400
Message-Id: <20191028155639.30330-1-e5ten.arch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Ethan Sommer <e5ten.arch@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nathan Chancellor <natechancellor@gmail.com>, Sedat Dilek <sedat.dilek@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Switches to a more portable set of flags for generating the same file
names instead of the bison-specific --defines, uses the more portable -V
instead of --version, and explicitly defines YYSTYPE in lex.l, which
bison implicitly defines if not present but byacc does not.

Signed-off-by: Ethan Sommer <e5ten.arch@gmail.com>
---
 scripts/Makefile.host     | 2 +-
 scripts/genksyms/Makefile | 2 +-
 scripts/genksyms/lex.l    | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 4c51c95d40f4..64e98e1d4825 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -11,7 +11,7 @@ $(obj)/%.lex.c: $(src)/%.l FORCE
 # YACC
 # ---------------------------------------------------------------------------
 quiet_cmd_bison = YACC    $(basename $@).[ch]
-      cmd_bison = $(YACC) -o $(basename $@).c --defines=$(basename $@).h -t -l $<
+      cmd_bison = $(YACC) -b $(basename $(basename $@)) -d -t -l $<
 
 $(obj)/%.tab.c $(obj)/%.tab.h: $(src)/%.y FORCE
 	$(call if_changed,bison)
diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index 78629f515e78..397c2dc8182b 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -15,7 +15,7 @@ genksyms-objs	:= genksyms.o parse.tab.o lex.lex.o
 ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
 
 quiet_cmd_bison_no_warn = $(quiet_cmd_bison)
-      cmd_bison_no_warn = $(YACC) --version >/dev/null; \
+      cmd_bison_no_warn = $(YACC) -V >/dev/null; \
 			  $(cmd_bison) 2>/dev/null
 
 $(obj)/pars%.tab.c $(obj)/pars%.tab.h: $(src)/pars%.y FORCE
diff --git a/scripts/genksyms/lex.l b/scripts/genksyms/lex.l
index e265c5d96861..0580c088527f 100644
--- a/scripts/genksyms/lex.l
+++ b/scripts/genksyms/lex.l
@@ -19,6 +19,8 @@
 #include "genksyms.h"
 #include "parse.tab.h"
 
+extern YYSTYPE yylval;
+
 /* We've got a two-level lexer here.  We let flex do basic tokenization
    and then we categorize those basic tokens in the second stage.  */
 #define YY_DECL		static int yylex1(void)
-- 
2.23.0
