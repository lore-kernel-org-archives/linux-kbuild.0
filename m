Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36853 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbeLKLBs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:48 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 26/27] kconfig: update current_pos in the second lexer
Date: Tue, 11 Dec 2018 20:01:09 +0900
Message-Id: <1544526070-16690-27-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

To simplify the generated lexer, let the hand-made lexer update the
file name and line number for the parser.

I tested this with DEBUG_PARSE, and confirmed the same file names
and line numbers were dumped.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.l | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index d462507..f0734abe 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -108,8 +108,6 @@ n	[A-Za-z0-9_-]
 <COMMAND>{
 	{n}+	{
 		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
-		current_pos.file = current_file;
-		current_pos.lineno = yylineno;
 		if (id && id->flags & TF_COMMAND) {
 			BEGIN(PARAM);
 			return id->token;
@@ -291,9 +289,21 @@ int yylex(void)
 repeat:
 	token = yylex1();
 
-	/* Do not pass unneeded T_EOL to the parser. */
-	if ((prev_token == T_EOL || prev_token == T_HELPTEXT) && token == T_EOL)
-		goto repeat;
+	if (prev_token == T_EOL || prev_token == T_HELPTEXT) {
+		if (token == T_EOL) {
+			/* Do not pass unneeded T_EOL to the parser. */
+			goto repeat;
+		} else {
+			/*
+			 * For the parser, update file/lineno at the first token
+			 * of each statement. Generally, \n is a statement
+			 * terminator in Kconfig, but it is not always true
+			 * because \n could be escaped by a backslash.
+			 */
+			current_pos.file = current_file;
+			current_pos.lineno = yylineno;
+		}
+	}
 
 	if (prev_prev_token == T_EOL && prev_token == T_WORD &&
 	    (token == T_EQUAL || token == T_COLON_EQUAL || token == T_PLUS_EQUAL))
-- 
2.7.4
