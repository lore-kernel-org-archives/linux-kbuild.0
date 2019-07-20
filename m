Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:52415 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbfGTQ1u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 Jul 2019 12:27:50 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] kbuild: make bison create C file and header in a single pattern rule
Date: Sun, 21 Jul 2019 01:27:39 +0900
Message-Id: <20190720162740.4292-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190720162740.4292-1-yamada.masahiro@socionext.com>
References: <20190720162740.4292-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

We generally expect bison to create not only a C file, but also a
header, which will be included from the lexer.

Currently, Kbuild generates them in separate rules. So, for instance,
when building Kconfig, you will notice bison is invoked twice:

  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.h
  HOSTCC  scripts/kconfig/lexer.lex.o
  YACC    scripts/kconfig/parser.tab.c
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTLD  scripts/kconfig/conf

Make handles such cases nicely in pattern rules [1]. Merge the two
rules so that one invokcation of bison can generate both of them.

  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTLD  scripts/kconfig/conf

[1] Pattern rule

GNU Make manual says:
"Pattern rules may have more than one target. Unlike normal rules,
this does not act as many different rules with the same prerequisites
and recipe. If a pattern rule has multiple targets, make knows that
the rule's recipe is responsible for making all of the targets. The
recipe is executed only once to make all the targets. When searching
for a pattern rule to match a target, the target patterns of a rule
other than the one that matches the target in need of a rule are
incidental: make worries only about giving a recipe and prerequisites
to the file presently in question. However, when this file's recipe is
run, the other targets are marked as having been updated themselves."

https://www.gnu.org/software/make/manual/html_node/Pattern-Intro.html

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.lib | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 8625e9b4572c..6c4a2332f6d6 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -199,18 +199,12 @@ $(obj)/%.lex.c: $(src)/%.l FORCE
 
 # YACC
 # ---------------------------------------------------------------------------
-quiet_cmd_bison = YACC    $@
-      cmd_bison = $(YACC) -o$@ -t -l $<
+quiet_cmd_bison = YACC    $(basename $@).[ch]
+      cmd_bison = $(YACC) -o $(basename $@).c --defines=$(basename $@).h -t -l $<
 
-$(obj)/%.tab.c: $(src)/%.y FORCE
+$(obj)/%.tab.c $(obj)/%.tab.h: $(src)/%.y FORCE
 	$(call if_changed,bison)
 
-quiet_cmd_bison_h = YACC    $@
-      cmd_bison_h = $(YACC) -o/dev/null --defines=$@ -t -l $<
-
-$(obj)/%.tab.h: $(src)/%.y FORCE
-	$(call if_changed,bison_h)
-
 # Shipped files
 # ===========================================================================
 
-- 
2.17.1
