Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36704 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726588AbeLKLBn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:43 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 18/27] kconfig: use specific tokens instead of T_ASSIGN for assignments
Date: Tue, 11 Dec 2018 20:01:01 +0900
Message-Id: <1544526070-16690-19-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

Currently, the lexer returns T_ASSIGN for all of =, :=, and +=
associating yylval with the flavor.

I want to make the generated lexer as simple as possible. So, the
lexer should convert keywords to tokens without thinking about the
meaning.

   =  ->  T_EQUAL
  :=  ->  T_COLON_EQUAL
  +=  ->  T_PLUS_EQUAL

Unfortunately, Kconfig uses = instead of == for the equal operator.
So, both assignment and comparison use T_EQUAL. The parser can still
distinguish them from the context.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.l |  6 +++---
 scripts/kconfig/zconf.y | 12 ++++++++++--
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 0265502..981b5f8 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -125,9 +125,9 @@ n	[A-Za-z0-9_-]
 			return T_VARIABLE;
 		free(yylval.string);
 	}
-	"="	{ BEGIN(ASSIGN_VAL); yylval.flavor = VAR_RECURSIVE; return T_ASSIGN; }
-	":="	{ BEGIN(ASSIGN_VAL); yylval.flavor = VAR_SIMPLE; return T_ASSIGN; }
-	"+="	{ BEGIN(ASSIGN_VAL); yylval.flavor = VAR_APPEND; return T_ASSIGN; }
+	"="	{ BEGIN(ASSIGN_VAL); return T_EQUAL; }
+	":="	{ BEGIN(ASSIGN_VAL); return T_COLON_EQUAL; }
+	"+="	{ BEGIN(ASSIGN_VAL); return T_PLUS_EQUAL; }
 	[[:blank:]]+
 	.	warn_ignored_character(*yytext);
 	\n	{
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 8db9189..97f86e2 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -70,6 +70,7 @@ static struct menu *current_menu, *current_entry;
 %token T_ALLNOCONFIG_Y
 %token T_BOOL
 %token T_CLOSE_PAREN
+%token T_COLON_EQUAL
 %token T_DEFAULT
 %token T_DEFCONFIG_LIST
 %token T_DEF_BOOL
@@ -79,11 +80,11 @@ static struct menu *current_menu, *current_entry;
 %token T_MODULES
 %token T_OPEN_PAREN
 %token T_OPTION
+%token T_PLUS_EQUAL
 %token T_STRING
 %token T_TRISTATE
 %token T_EOL
 %token <string> T_VARIABLE
-%token <flavor> T_ASSIGN
 %token <string> T_ASSIGN_VAL
 
 %left T_OR
@@ -101,6 +102,7 @@ static struct menu *current_menu, *current_entry;
 %type <id> end
 %type <menu> if_entry menu_entry choice_entry
 %type <string> word_opt assign_val
+%type <flavor> assign_op
 
 %destructor {
 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
@@ -478,7 +480,13 @@ word_opt: /* empty */			{ $$ = NULL; }
 
 /* assignment statement */
 
-assignment_stmt:  T_VARIABLE T_ASSIGN assign_val T_EOL	{ variable_add($1, $3, $2); free($1); free($3); }
+assignment_stmt:  T_VARIABLE assign_op assign_val T_EOL	{ variable_add($1, $3, $2); free($1); free($3); }
+
+assign_op:
+	  T_EQUAL	{ $$ = VAR_RECURSIVE; }
+	| T_COLON_EQUAL	{ $$ = VAR_SIMPLE; }
+	| T_PLUS_EQUAL	{ $$ = VAR_APPEND; }
+;
 
 assign_val:
 	/* empty */		{ $$ = xstrdup(""); };
-- 
2.7.4
