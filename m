Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36706 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbeLKLBo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:44 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 19/27] kconfig: use T_WORD instead of T_VARIABLE for variables
Date: Tue, 11 Dec 2018 20:01:02 +0900
Message-Id: <1544526070-16690-20-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

There is no grammatical ambiguity by using T_WORD for variables.
The parser can distinguish variables from symbols from the context.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.l | 4 ++--
 scripts/kconfig/zconf.y | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 981b5f8..defb722 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -116,13 +116,13 @@ n	[A-Za-z0-9_-]
 		}
 		alloc_string(yytext, yyleng);
 		yylval.string = text;
-		return T_VARIABLE;
+		return T_WORD;
 	}
 	({n}|$)+	{
 		/* this token includes at least one '$' */
 		yylval.string = expand_token(yytext, yyleng);
 		if (strlen(yylval.string))
-			return T_VARIABLE;
+			return T_WORD;
 		free(yylval.string);
 	}
 	"="	{ BEGIN(ASSIGN_VAL); return T_EQUAL; }
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 97f86e2..3c44d67 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -84,7 +84,6 @@ static struct menu *current_menu, *current_entry;
 %token T_STRING
 %token T_TRISTATE
 %token T_EOL
-%token <string> T_VARIABLE
 %token <string> T_ASSIGN_VAL
 
 %left T_OR
@@ -480,7 +479,7 @@ word_opt: /* empty */			{ $$ = NULL; }
 
 /* assignment statement */
 
-assignment_stmt:  T_VARIABLE assign_op assign_val T_EOL	{ variable_add($1, $3, $2); free($1); free($3); }
+assignment_stmt:  T_WORD assign_op assign_val T_EOL	{ variable_add($1, $3, $2); free($1); free($3); }
 
 assign_op:
 	  T_EQUAL	{ $$ = VAR_RECURSIVE; }
-- 
2.7.4
