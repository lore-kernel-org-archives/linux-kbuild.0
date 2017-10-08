Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:49719 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753259AbdJHRMP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Oct 2017 13:12:15 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 1/6] kconfig: Don't leak symbol names during parsing
Date: Sun,  8 Oct 2017 19:11:18 +0200
Message-Id: <1507482683-22651-2-git-send-email-ulfalizer@gmail.com>
In-Reply-To: <1507482683-22651-1-git-send-email-ulfalizer@gmail.com>
References: <1507482683-22651-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, michal.lkml@markovi.net, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, walch.martin@web.de, JBeulich@suse.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

Prior to this fix, zconf.y did not free symbol names from zconf.l in
these contexts:

	- After T_CONFIG ('config LEAKED')
	- After T_MENUCONFIG ('menuconfig LEAKED')
	- After T_SELECT ('select LEAKED')
	- After T_IMPLY ('imply LEAKED')
	- After T_DEFAULT in a choice ('default LEAKED')

All of these come in the form of T_WORD tokens, which always have their
associated string allocated on the heap in zconf.l and need to be freed.

Fix by introducing a new nonterminal 'nonconst_symbol' which takes a
T_WORD, fetches the symbol, and then frees the T_WORD string. The
already existing 'symbol' nonterminal works the same way but also
accepts T_WORD_QUOTE, corresponding to a constant symbol. T_WORD_QUOTE
should not be accepted in any of the contexts above, so the 'symbol'
nonterminal can't be reused here.

Fetching the symbol in 'nonconst_symbol' also removes a bunch of
sym_lookup() calls from actions.

Summary from Valgrind on 'menuconfig' (ARCH=x86) before the fix:

	LEAK SUMMARY:
	   definitely lost: 711,571 bytes in 37,756 blocks
	   ...

Summary after the fix:

	LEAK SUMMARY:
	   definitely lost: 387,504 bytes in 15,545 blocks
           ...

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/zconf.y | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index c8f396c..f201241 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -85,6 +85,7 @@ static struct menu *current_menu, *current_entry;
 %nonassoc T_NOT
 
 %type <string> prompt
+%type <symbol> nonconst_symbol
 %type <symbol> symbol
 %type <expr> expr
 %type <expr> if_expr
@@ -145,12 +146,11 @@ option_error:
 
 /* config/menuconfig entry */
 
-config_entry_start: T_CONFIG T_WORD T_EOL
+config_entry_start: T_CONFIG nonconst_symbol T_EOL
 {
-	struct symbol *sym = sym_lookup($2, 0);
-	sym->flags |= SYMBOL_OPTIONAL;
-	menu_add_entry(sym);
-	printd(DEBUG_PARSE, "%s:%d:config %s\n", zconf_curname(), zconf_lineno(), $2);
+	$2->flags |= SYMBOL_OPTIONAL;
+	menu_add_entry($2);
+	printd(DEBUG_PARSE, "%s:%d:config %s\n", zconf_curname(), zconf_lineno(), $2->name);
 };
 
 config_stmt: config_entry_start config_option_list
@@ -159,12 +159,11 @@ config_stmt: config_entry_start config_option_list
 	printd(DEBUG_PARSE, "%s:%d:endconfig\n", zconf_curname(), zconf_lineno());
 };
 
-menuconfig_entry_start: T_MENUCONFIG T_WORD T_EOL
+menuconfig_entry_start: T_MENUCONFIG nonconst_symbol T_EOL
 {
-	struct symbol *sym = sym_lookup($2, 0);
-	sym->flags |= SYMBOL_OPTIONAL;
-	menu_add_entry(sym);
-	printd(DEBUG_PARSE, "%s:%d:menuconfig %s\n", zconf_curname(), zconf_lineno(), $2);
+	$2->flags |= SYMBOL_OPTIONAL;
+	menu_add_entry($2);
+	printd(DEBUG_PARSE, "%s:%d:menuconfig %s\n", zconf_curname(), zconf_lineno(), $2->name);
 };
 
 menuconfig_stmt: menuconfig_entry_start config_option_list
@@ -211,15 +210,15 @@ config_option: T_DEFAULT expr if_expr T_EOL
 		$1->stype);
 };
 
-config_option: T_SELECT T_WORD if_expr T_EOL
+config_option: T_SELECT nonconst_symbol if_expr T_EOL
 {
-	menu_add_symbol(P_SELECT, sym_lookup($2, 0), $3);
+	menu_add_symbol(P_SELECT, $2, $3);
 	printd(DEBUG_PARSE, "%s:%d:select\n", zconf_curname(), zconf_lineno());
 };
 
-config_option: T_IMPLY T_WORD if_expr T_EOL
+config_option: T_IMPLY nonconst_symbol if_expr T_EOL
 {
-	menu_add_symbol(P_IMPLY, sym_lookup($2, 0), $3);
+	menu_add_symbol(P_IMPLY, $2, $3);
 	printd(DEBUG_PARSE, "%s:%d:imply\n", zconf_curname(), zconf_lineno());
 };
 
@@ -308,10 +307,10 @@ choice_option: T_OPTIONAL T_EOL
 	printd(DEBUG_PARSE, "%s:%d:optional\n", zconf_curname(), zconf_lineno());
 };
 
-choice_option: T_DEFAULT T_WORD if_expr T_EOL
+choice_option: T_DEFAULT nonconst_symbol if_expr T_EOL
 {
 	if ($1->stype == S_UNKNOWN) {
-		menu_add_symbol(P_DEFAULT, sym_lookup($2, 0), $3);
+		menu_add_symbol(P_DEFAULT, $2, $3);
 		printd(DEBUG_PARSE, "%s:%d:default\n",
 			zconf_curname(), zconf_lineno());
 	} else
@@ -491,7 +490,10 @@ expr:	  symbol				{ $$ = expr_alloc_symbol($1); }
 	| expr T_AND expr			{ $$ = expr_alloc_two(E_AND, $1, $3); }
 ;
 
-symbol:	  T_WORD	{ $$ = sym_lookup($1, 0); free($1); }
+/* For symbol definitions, selects, etc., where quotes are not accepted */
+nonconst_symbol: T_WORD { $$ = sym_lookup($1, 0); free($1); };
+
+symbol:	  nonconst_symbol
 	| T_WORD_QUOTE	{ $$ = sym_lookup($1, SYMBOL_CONST); free($1); }
 ;
 
-- 
2.7.4

