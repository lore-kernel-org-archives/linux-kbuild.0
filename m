Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36861 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbeLKLBu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:50 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 22/27] kconfig: ban the use of '.' and '/' in unquoted words
Date: Tue, 11 Dec 2018 20:01:05 +0900
Message-Id: <1544526070-16690-23-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

In my understanding, special characters such as '.' and '/' are
supported in unquoted words to use bare file paths in the source
statement.

With all included file paths quoted in the previous commit, we can
drop this.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/preprocess.c | 3 +--
 scripts/kconfig/zconf.l      | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index 5ca2df7..b028a48 100644
--- a/scripts/kconfig/preprocess.c
+++ b/scripts/kconfig/preprocess.c
@@ -555,8 +555,7 @@ char *expand_string(const char *in)
 
 static bool is_end_of_token(char c)
 {
-	/* Why are '.' and '/' valid characters for symbols? */
-	return !(isalnum(c) || c == '_' || c == '-' || c == '.' || c == '/');
+	return !(isalnum(c) || c == '_' || c == '-');
 }
 
 /*
diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index defb722..b715af9 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -167,7 +167,7 @@ n	[A-Za-z0-9_-]
 		BEGIN(STRING);
 	}
 	\n	BEGIN(INITIAL); return T_EOL;
-	({n}|[/.])+	{
+	{n}+	{
 		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
 		if (id && id->flags & TF_PARAM) {
 			yylval.id = id;
@@ -177,7 +177,7 @@ n	[A-Za-z0-9_-]
 		yylval.string = text;
 		return T_WORD;
 	}
-	({n}|[/.$])+	{
+	({n}|$)+	{
 		/* this token includes at least one '$' */
 		yylval.string = expand_token(yytext, yyleng);
 		if (strlen(yylval.string))
-- 
2.7.4
