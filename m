Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36854 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbeLKLBs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:48 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 25/27] kconfig: switch to ASSIGN_VAL state in the second lexer
Date: Tue, 11 Dec 2018 20:01:08 +0900
Message-Id: <1544526070-16690-26-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

To simplify the generated lexer, switch to the ASSIGN_VAL state in
the hand-made lexer.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.l | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index c8823a4..d462507 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -25,6 +25,7 @@ static struct {
 	int lineno;
 } current_pos;
 
+static int prev_prev_token = T_EOL;
 static int prev_token = T_EOL;
 static char *text;
 static int text_size, text_asize;
@@ -124,9 +125,9 @@ n	[A-Za-z0-9_-]
 			return T_WORD;
 		free(yylval.string);
 	}
-	"="	{ BEGIN(ASSIGN_VAL); return T_EQUAL; }
-	":="	{ BEGIN(ASSIGN_VAL); return T_COLON_EQUAL; }
-	"+="	{ BEGIN(ASSIGN_VAL); return T_PLUS_EQUAL; }
+	"="	return T_EQUAL;
+	":="	return T_COLON_EQUAL;
+	"+="	return T_PLUS_EQUAL;
 	[[:blank:]]+
 	.	warn_ignored_character(*yytext);
 	\n	{
@@ -294,6 +295,11 @@ repeat:
 	if ((prev_token == T_EOL || prev_token == T_HELPTEXT) && token == T_EOL)
 		goto repeat;
 
+	if (prev_prev_token == T_EOL && prev_token == T_WORD &&
+	    (token == T_EQUAL || token == T_COLON_EQUAL || token == T_PLUS_EQUAL))
+		BEGIN(ASSIGN_VAL);
+
+	prev_prev_token = prev_token;
 	prev_token = token;
 
 	return token;
-- 
2.7.4
