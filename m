Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36859 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbeLKLBt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:49 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 24/27] kconfig: stop associating kconf_id with yylval
Date: Tue, 11 Dec 2018 20:01:07 +0900
Message-Id: <1544526070-16690-25-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

The lexer has conventionally associated kconf_id data with yylval
to carry additional information to the parser.

No token is relying on this any more.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.l |  2 --
 scripts/kconfig/zconf.y | 41 ++++++++++++++++++++---------------------
 2 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index b715af9..c8823a4 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -111,7 +111,6 @@ n	[A-Za-z0-9_-]
 		current_pos.lineno = yylineno;
 		if (id && id->flags & TF_COMMAND) {
 			BEGIN(PARAM);
-			yylval.id = id;
 			return id->token;
 		}
 		alloc_string(yytext, yyleng);
@@ -170,7 +169,6 @@ n	[A-Za-z0-9_-]
 	{n}+	{
 		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
 		if (id && id->flags & TF_PARAM) {
-			yylval.id = id;
 			return id->token;
 		}
 		alloc_string(yytext, yyleng);
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 36cffc0..c611d70 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -40,50 +40,49 @@ static struct menu *current_menu, *current_entry;
 	struct symbol *symbol;
 	struct expr *expr;
 	struct menu *menu;
-	const struct kconf_id *id;
 	enum symbol_type type;
 	enum variable_flavor flavor;
 }
 
-%token <id>T_MAINMENU
-%token <id>T_MENU
-%token <id>T_ENDMENU
-%token <id>T_SOURCE
-%token <id>T_CHOICE
-%token <id>T_ENDCHOICE
-%token <id>T_COMMENT
-%token <id>T_CONFIG
-%token <id>T_MENUCONFIG
-%token <id>T_HELP
 %token <string> T_HELPTEXT
-%token <id>T_IF
-%token <id>T_ENDIF
-%token <id>T_DEPENDS
-%token <id>T_OPTIONAL
-%token <id>T_PROMPT
-%token <id>T_SELECT
-%token <id>T_IMPLY
-%token <id>T_RANGE
-%token <id>T_VISIBLE
-%token <id>T_ON
 %token <string> T_WORD
 %token <string> T_WORD_QUOTE
 %token T_ALLNOCONFIG_Y
 %token T_BOOL
+%token T_CHOICE
 %token T_CLOSE_PAREN
 %token T_COLON_EQUAL
+%token T_COMMENT
+%token T_CONFIG
 %token T_DEFAULT
 %token T_DEFCONFIG_LIST
 %token T_DEF_BOOL
 %token T_DEF_TRISTATE
+%token T_DEPENDS
+%token T_ENDCHOICE
+%token T_ENDIF
+%token T_ENDMENU
+%token T_HELP
 %token T_HEX
+%token T_IF
+%token T_IMPLY
 %token T_INT
+%token T_MAINMENU
+%token T_MENU
+%token T_MENUCONFIG
 %token T_MODULES
+%token T_ON
 %token T_OPEN_PAREN
 %token T_OPTION
+%token T_OPTIONAL
 %token T_PLUS_EQUAL
+%token T_PROMPT
+%token T_RANGE
+%token T_SELECT
+%token T_SOURCE
 %token T_STRING
 %token T_TRISTATE
+%token T_VISIBLE
 %token T_EOL
 %token <string> T_ASSIGN_VAL
 
-- 
2.7.4
