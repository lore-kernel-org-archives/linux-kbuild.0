Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49419 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbfLQEOw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:14:52 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 4/8] kconfig: remove 'prompt' symbol
Date: Tue, 17 Dec 2019 13:14:19 +0900
Message-Id: <20191217041424.29285-5-masahiroy@kernel.org>
In-Reply-To: <20191217041424.29285-1-masahiroy@kernel.org>
References: <20191217041424.29285-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

Now that 'prompt' is only reduced from T_WORD_QUOTE without any action,
use T_WORD_QUOTE directly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/parser.y | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 80585f04f590..40e46996e6a5 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -93,7 +93,6 @@ static struct menu *current_choice_menu;
 %left T_LESS T_LESS_EQUAL T_GREATER T_GREATER_EQUAL
 %nonassoc T_NOT
 
-%type <string> prompt
 %type <symbol> nonconst_symbol
 %type <symbol> symbol
 %type <type> type logic_type default
@@ -116,7 +115,7 @@ input: mainmenu_stmt stmt_list | stmt_list;
 
 /* mainmenu entry */
 
-mainmenu_stmt: T_MAINMENU prompt T_EOL
+mainmenu_stmt: T_MAINMENU T_WORD_QUOTE T_EOL
 {
 	menu_add_prompt(P_MENU, $2, NULL);
 };
@@ -184,7 +183,7 @@ config_option: type prompt_stmt_opt T_EOL
 		$1);
 };
 
-config_option: T_PROMPT prompt if_expr T_EOL
+config_option: T_PROMPT T_WORD_QUOTE if_expr T_EOL
 {
 	menu_add_prompt(P_PROMPT, $2, $3);
 	printd(DEBUG_PARSE, "%s:%d:prompt\n", zconf_curname(), zconf_lineno());
@@ -276,7 +275,7 @@ choice_option_list:
 	| choice_option_list help
 ;
 
-choice_option: T_PROMPT prompt if_expr T_EOL
+choice_option: T_PROMPT T_WORD_QUOTE if_expr T_EOL
 {
 	menu_add_prompt(P_PROMPT, $2, $3);
 	printd(DEBUG_PARSE, "%s:%d:prompt\n", zconf_curname(), zconf_lineno());
@@ -345,7 +344,7 @@ if_stmt: if_entry stmt_list if_end
 
 /* menu entry */
 
-menu: T_MENU prompt T_EOL
+menu: T_MENU T_WORD_QUOTE T_EOL
 {
 	menu_add_entry(NULL);
 	menu_add_prompt(P_MENU, $2, NULL);
@@ -374,7 +373,7 @@ menu_option_list:
 	| menu_option_list depends
 ;
 
-source_stmt: T_SOURCE prompt T_EOL
+source_stmt: T_SOURCE T_WORD_QUOTE T_EOL
 {
 	printd(DEBUG_PARSE, "%s:%d:source %s\n", zconf_curname(), zconf_lineno(), $2);
 	zconf_nextfile($2);
@@ -383,7 +382,7 @@ source_stmt: T_SOURCE prompt T_EOL
 
 /* comment entry */
 
-comment: T_COMMENT prompt T_EOL
+comment: T_COMMENT T_WORD_QUOTE T_EOL
 {
 	menu_add_entry(NULL);
 	menu_add_prompt(P_COMMENT, $2, NULL);
@@ -440,13 +439,11 @@ visible: T_VISIBLE if_expr T_EOL
 
 prompt_stmt_opt:
 	  /* empty */
-	| prompt if_expr
+	| T_WORD_QUOTE if_expr
 {
 	menu_add_prompt(P_PROMPT, $1, $2);
 };
 
-prompt:	  T_WORD_QUOTE
-
 end:	  T_ENDMENU T_EOL	{ $$ = "menu"; }
 	| T_ENDCHOICE T_EOL	{ $$ = "choice"; current_choice_menu = NULL; }
 	| T_ENDIF T_EOL		{ $$ = "if"; }
-- 
2.17.1
