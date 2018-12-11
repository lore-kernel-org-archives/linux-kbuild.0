Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36638 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbeLKLBm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:42 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 05/27] kconfig: refactor pattern matching in STRING state
Date: Tue, 11 Dec 2018 20:00:48 +0900
Message-Id: <1544526070-16690-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

Here, similar matching patters are duplicated in order to look ahead
the '\n' character. If the next character is '\n', the lexer returns
T_WORD_QUOTE because it must be prepared to return T_EOL at the next
match.

Use unput('\n') trick to reduce the code duplication.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.l | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 709b774..b7bc164 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -182,19 +182,9 @@ n	[A-Za-z0-9_-]
 
 <STRING>{
 	"$".*	append_expanded_string(yytext);
-	[^$'"\\\n]+/\n	{
-		append_string(yytext, yyleng);
-		yylval.string = text;
-		return T_WORD_QUOTE;
-	}
 	[^$'"\\\n]+	{
 		append_string(yytext, yyleng);
 	}
-	\\.?/\n	{
-		append_string(yytext + 1, yyleng - 1);
-		yylval.string = text;
-		return T_WORD_QUOTE;
-	}
 	\\.?	{
 		append_string(yytext + 1, yyleng - 1);
 	}
@@ -210,8 +200,10 @@ n	[A-Za-z0-9_-]
 		fprintf(stderr,
 			"%s:%d:warning: multi-line strings not supported\n",
 			zconf_curname(), zconf_lineno());
+		unput('\n');
 		BEGIN(INITIAL);
-		return T_EOL;
+		yylval.string = text;
+		return T_WORD_QUOTE;
 	}
 	<<EOF>>	{
 		BEGIN(INITIAL);
-- 
2.7.4
