Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36866 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbeLKLBt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:49 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 27/27] kconfig: remove keyword lookup table entirely
Date: Tue, 11 Dec 2018 20:01:10 +0900
Message-Id: <1544526070-16690-28-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

Commit 7a88488bbc23 ("[PATCH] kconfig: use gperf for kconfig keywords")
introduced gperf for the keyword lookup.

Then, commit bb3290d91695 ("Remove gperf usage from toolchain") killed
the gperf use. As a result, the linear keyword search was left.

If we do not use gperf, there is no reason to have the separate table
of the keywords. Move all keywords back to the lexer.

I also refactored the lexer to remove the COMMAND and PARAM states.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/kconf_id.c |  49 ---------------
 scripts/kconfig/lkc.h      |   9 ---
 scripts/kconfig/zconf.l    | 153 ++++++++++++++++++++-------------------------
 scripts/kconfig/zconf.y    |   5 --
 4 files changed, 69 insertions(+), 147 deletions(-)
 delete mode 100644 scripts/kconfig/kconf_id.c

diff --git a/scripts/kconfig/kconf_id.c b/scripts/kconfig/kconf_id.c
deleted file mode 100644
index f8b222c..0000000
--- a/scripts/kconfig/kconf_id.c
+++ /dev/null
@@ -1,49 +0,0 @@
-
-static struct kconf_id kconf_id_array[] = {
-	{ "mainmenu",		T_MAINMENU,		TF_COMMAND },
-	{ "menu",		T_MENU,			TF_COMMAND },
-	{ "endmenu",		T_ENDMENU,		TF_COMMAND },
-	{ "source",		T_SOURCE,		TF_COMMAND },
-	{ "choice",		T_CHOICE,		TF_COMMAND },
-	{ "endchoice",		T_ENDCHOICE,		TF_COMMAND },
-	{ "comment",		T_COMMENT,		TF_COMMAND },
-	{ "config",		T_CONFIG,		TF_COMMAND },
-	{ "menuconfig",		T_MENUCONFIG,		TF_COMMAND },
-	{ "help",		T_HELP,			TF_COMMAND },
-	{ "---help---",		T_HELP,			TF_COMMAND },
-	{ "if",			T_IF,			TF_COMMAND|TF_PARAM },
-	{ "endif",		T_ENDIF,		TF_COMMAND },
-	{ "depends",		T_DEPENDS,		TF_COMMAND },
-	{ "optional",		T_OPTIONAL,		TF_COMMAND },
-	{ "default",		T_DEFAULT,		TF_COMMAND },
-	{ "def_bool",		T_DEF_BOOL,		TF_COMMAND },
-	{ "def_tristate",	T_DEF_TRISTATE,		TF_COMMAND },
-	{ "prompt",		T_PROMPT,		TF_COMMAND },
-	{ "bool",		T_BOOL,			TF_COMMAND },
-	{ "tristate",		T_TRISTATE,		TF_COMMAND },
-	{ "int",		T_INT,			TF_COMMAND },
-	{ "hex",		T_HEX,			TF_COMMAND },
-	{ "string",		T_STRING,		TF_COMMAND },
-	{ "select",		T_SELECT,		TF_COMMAND },
-	{ "imply",		T_IMPLY,		TF_COMMAND },
-	{ "range",		T_RANGE,		TF_COMMAND },
-	{ "visible",		T_VISIBLE,		TF_COMMAND },
-	{ "option",		T_OPTION,		TF_COMMAND },
-	{ "on",			T_ON,			TF_PARAM },
-};
-
-#define KCONF_ID_ARRAY_SIZE (sizeof(kconf_id_array)/sizeof(struct kconf_id))
-
-static const struct kconf_id *kconf_id_lookup(register const char *str, register unsigned int len)
-{
-	int i;
-
-	for (i = 0; i < KCONF_ID_ARRAY_SIZE; i++) {
-		struct kconf_id *id = kconf_id_array+i;
-		int l = strlen(id->name);
-
-		if (len == l && !memcmp(str, id->name, len))
-			return id;
-	}
-	return NULL;
-}
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 5f4880a..ff6b3e4 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -30,9 +30,6 @@ static inline const char *CONFIG_prefix(void)
 #undef CONFIG_
 #define CONFIG_ CONFIG_prefix()
 
-#define TF_COMMAND	0x0001
-#define TF_PARAM	0x0002
-
 enum conf_def_mode {
 	def_default,
 	def_yes,
@@ -41,12 +38,6 @@ enum conf_def_mode {
 	def_random
 };
 
-struct kconf_id {
-	const char *name;
-	int token;
-	unsigned int flags;
-};
-
 extern int yylineno;
 void zconfdump(FILE *out);
 void zconf_starthelp(void);
diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index f0734abe..690108f 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -1,6 +1,6 @@
 %option nostdinit noyywrap never-interactive full ecs
 %option 8bit nodefault yylineno
-%x COMMAND HELP STRING PARAM ASSIGN_VAL
+%x ASSIGN_VAL HELP STRING
 %{
 /*
  * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
@@ -94,45 +94,73 @@ n	[A-Za-z0-9_-]
 	int str = 0;
 	int ts, i;
 
-[ \t]*#.*\n	|
-[ \t]*\n	{
-	return T_EOL;
-}
-[ \t]*#.*
-.	{
-	unput(yytext[0]);
-	BEGIN(COMMAND);
-}
-
-
-<COMMAND>{
-	{n}+	{
-		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
-		if (id && id->flags & TF_COMMAND) {
-			BEGIN(PARAM);
-			return id->token;
-		}
-		alloc_string(yytext, yyleng);
-		yylval.string = text;
-		return T_WORD;
-	}
-	({n}|$)+	{
-		/* this token includes at least one '$' */
-		yylval.string = expand_token(yytext, yyleng);
-		if (strlen(yylval.string))
-			return T_WORD;
-		free(yylval.string);
-	}
-	"="	return T_EQUAL;
-	":="	return T_COLON_EQUAL;
-	"+="	return T_PLUS_EQUAL;
-	[[:blank:]]+
-	.	warn_ignored_character(*yytext);
-	\n	{
-		BEGIN(INITIAL);
-		return T_EOL;
-	}
-}
+#.*			/* ignore comment */
+[ \t]*			/* whitespaces */
+\\\n			/* escaped new line */
+\n			return T_EOL;
+"allnoconfig_y"		return T_ALLNOCONFIG_Y;
+"bool"			return T_BOOL;
+"choice"		return T_CHOICE;
+"comment"		return T_COMMENT;
+"config"		return T_CONFIG;
+"default"		return T_DEFAULT;
+"def_bool"		return T_DEF_BOOL;
+"defconfig_list"	return T_DEFCONFIG_LIST;
+"def_tristate"		return T_DEF_TRISTATE;
+"depends"		return T_DEPENDS;
+"endchoice"		return T_ENDCHOICE;
+"endif"			return T_ENDIF;
+"endmenu"		return T_ENDMENU;
+"help"|"---help---"	return T_HELP;
+"hex"			return T_HEX;
+"if"			return T_IF;
+"imply"			return T_IMPLY;
+"int"			return T_INT;
+"mainmenu"		return T_MAINMENU;
+"menuconfig"		return T_MENUCONFIG;
+"menu"			return T_MENU;
+"modules"		return T_MODULES;
+"on"			return T_ON;
+"optional"		return T_OPTIONAL;
+"option"		return T_OPTION;
+"prompt"		return T_PROMPT;
+"range"			return T_RANGE;
+"select"		return T_SELECT;
+"source"		return T_SOURCE;
+"string"		return T_STRING;
+"tristate"		return T_TRISTATE;
+"visible"		return T_VISIBLE;
+"||"			return T_OR;
+"&&"			return T_AND;
+"="			return T_EQUAL;
+"!="			return T_UNEQUAL;
+"<"			return T_LESS;
+"<="			return T_LESS_EQUAL;
+">"			return T_GREATER;
+">="			return T_GREATER_EQUAL;
+"!"			return T_NOT;
+"("			return T_OPEN_PAREN;
+")"			return T_CLOSE_PAREN;
+":="			return T_COLON_EQUAL;
+"+="			return T_PLUS_EQUAL;
+\"|\'			{
+				str = yytext[0];
+				new_string();
+				BEGIN(STRING);
+			}
+{n}+			{
+				alloc_string(yytext, yyleng);
+				yylval.string = text;
+				return T_WORD;
+			}
+({n}|$)+		{
+				/* this token includes at least one '$' */
+				yylval.string = expand_token(yytext, yyleng);
+				if (strlen(yylval.string))
+					return T_WORD;
+				free(yylval.string);
+			}
+.			warn_ignored_character(*yytext);
 
 <ASSIGN_VAL>{
 	[^[:blank:]\n]+.*	{
@@ -144,49 +172,6 @@ n	[A-Za-z0-9_-]
 	.
 }
 
-<PARAM>{
-	"modules"		return T_MODULES;
-	"defconfig_list"	return T_DEFCONFIG_LIST;
-	"allnoconfig_y"		return T_ALLNOCONFIG_Y;
-	"&&"	return T_AND;
-	"||"	return T_OR;
-	"("	return T_OPEN_PAREN;
-	")"	return T_CLOSE_PAREN;
-	"!"	return T_NOT;
-	"="	return T_EQUAL;
-	"!="	return T_UNEQUAL;
-	"<="	return T_LESS_EQUAL;
-	">="	return T_GREATER_EQUAL;
-	"<"	return T_LESS;
-	">"	return T_GREATER;
-	\"|\'	{
-		str = yytext[0];
-		new_string();
-		BEGIN(STRING);
-	}
-	\n	BEGIN(INITIAL); return T_EOL;
-	{n}+	{
-		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
-		if (id && id->flags & TF_PARAM) {
-			return id->token;
-		}
-		alloc_string(yytext, yyleng);
-		yylval.string = text;
-		return T_WORD;
-	}
-	({n}|$)+	{
-		/* this token includes at least one '$' */
-		yylval.string = expand_token(yytext, yyleng);
-		if (strlen(yylval.string))
-			return T_WORD;
-		free(yylval.string);
-	}
-	#.*	/* comment */
-	\\\n	;
-	[[:blank:]]+
-	.	warn_ignored_character(*yytext);
-}
-
 <STRING>{
 	"$".*	append_expanded_string(yytext);
 	[^$'"\\\n]+	{
@@ -197,7 +182,7 @@ n	[A-Za-z0-9_-]
 	}
 	\'|\"	{
 		if (str == yytext[0]) {
-			BEGIN(PARAM);
+			BEGIN(INITIAL);
 			yylval.string = text;
 			return T_WORD_QUOTE;
 		} else
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index c611d70..35c373d 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -110,11 +110,6 @@ static struct menu *current_menu, *current_entry;
 		menu_end_menu();
 } if_entry menu_entry choice_entry
 
-%{
-/* Include kconf_id.c here so it can see the token constants. */
-#include "kconf_id.c"
-%}
-
 %%
 input: mainmenu_stmt stmt_list | stmt_list;
 
-- 
2.7.4
