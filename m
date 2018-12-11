Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36702 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbeLKLBo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:44 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 06/27] kconfig: fix ambiguous grammar in terms of new lines
Date: Tue, 11 Dec 2018 20:00:49 +0900
Message-Id: <1544526070-16690-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

This commit decreases 8 shift/reduce conflicts.

A certain amount of grammatical ambiguity comes from how to reduce
excessive T_EOL tokens.

Let's take a look at the example code below:

  1  config A
  2          bool "a"
  3
  4          depends on B
  5
  6  config B
  7          def_bool y

The line 3 is melt into "config_option_list", but the line 5 can be
either a part of "config_option_list" or "common_stmt" by itself.

Currently, the lexer converts '\n' to T_EOL verbatim. In Kconfig,
a new line is critical as a statement terminator, but new lines
in empty lines are not important since empty lines (or lines that
contain only whitespaces/comments) are just no-op.

If the lexer simply discards no-op lines, the parser will not be
bothered by excessive T_EOL tokens.

Of course, this means we are shifting the complexity from the parser
to the lexer, but it is much easier than tackling on shift/reduce
conflicts.

I introduced the second stage lexer to tweak the lexer.

Discard T_EOL if the previous token is T_EOL or T_HELPTEXT.
Two T_EOL tokens in a row is meaningless. T_HELPTEXT is a special
token that is reduced without T_EOL.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.l | 21 +++++++++++++++++++++
 scripts/kconfig/zconf.y | 18 +++---------------
 2 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index b7bc164..847ba42 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -16,6 +16,8 @@
 
 #include "lkc.h"
 
+#define YY_DECL		static int yylex1(void)
+
 #define START_STRSIZE	16
 
 static struct {
@@ -23,6 +25,7 @@ static struct {
 	int lineno;
 } current_pos;
 
+static int prev_token = T_EOL;
 static char *text;
 static int text_size, text_asize;
 
@@ -268,6 +271,24 @@ n	[A-Za-z0-9_-]
 }
 
 %%
+
+/* second stage lexer */
+int yylex(void)
+{
+	int token;
+
+repeat:
+	token = yylex1();
+
+	/* Do not pass unneeded T_EOL to the parser. */
+	if ((prev_token == T_EOL || prev_token == T_HELPTEXT) && token == T_EOL)
+		goto repeat;
+
+	prev_token = token;
+
+	return token;
+}
+
 static char *expand_token(const char *in, size_t n)
 {
 	char *out;
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index c28f1a8..02bfc62 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -31,7 +31,7 @@ struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 static struct menu *current_menu, *current_entry;
 
 %}
-%expect 29
+%expect 21
 
 %union
 {
@@ -111,9 +111,7 @@ static struct menu *current_menu, *current_entry;
 %}
 
 %%
-input: nl start | start;
-
-start: mainmenu_stmt stmt_list | stmt_list;
+input: mainmenu_stmt stmt_list | stmt_list;
 
 /* mainmenu entry */
 
@@ -141,8 +139,7 @@ option_name:
 ;
 
 common_stmt:
-	  T_EOL
-	| if_stmt
+	  if_stmt
 	| comment_stmt
 	| config_stmt
 	| menuconfig_stmt
@@ -193,7 +190,6 @@ config_option_list:
 	| config_option_list depends
 	| config_option_list help
 	| config_option_list option_error
-	| config_option_list T_EOL
 ;
 
 config_option: T_TYPE prompt_stmt_opt T_EOL
@@ -293,7 +289,6 @@ choice_option_list:
 	| choice_option_list choice_option
 	| choice_option_list depends
 	| choice_option_list help
-	| choice_option_list T_EOL
 	| choice_option_list option_error
 ;
 
@@ -443,7 +438,6 @@ help: help_start T_HELPTEXT
 depends_list:
 	  /* empty */
 	| depends_list depends
-	| depends_list T_EOL
 	| depends_list option_error
 ;
 
@@ -458,7 +452,6 @@ depends: T_DEPENDS T_ON expr T_EOL
 visibility_list:
 	  /* empty */
 	| visibility_list visible
-	| visibility_list T_EOL
 ;
 
 visible: T_VISIBLE if_expr T_EOL
@@ -484,11 +477,6 @@ end:	  T_ENDMENU T_EOL	{ $$ = $1; }
 	| T_ENDIF T_EOL		{ $$ = $1; }
 ;
 
-nl:
-	  T_EOL
-	| nl T_EOL
-;
-
 if_expr:  /* empty */			{ $$ = NULL; }
 	| T_IF expr			{ $$ = $2; }
 ;
-- 
2.7.4
