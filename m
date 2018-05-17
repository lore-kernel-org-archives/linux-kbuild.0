Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:25643 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752276AbeEQGTh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 May 2018 02:19:37 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4 14/31] kconfig: expand lefthand side of assignment statement
Date: Thu, 17 May 2018 15:16:53 +0900
Message-Id: <1526537830-22606-15-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1526537830-22606-1-git-send-email-yamada.masahiro@socionext.com>
References: <1526537830-22606-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Kees Cook <keescook@chromium.org>, Emese Revfy <re.emese@gmail.com>, x86@kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

Make expands the lefthand side of assignment statements.  In fact,
Kbuild relies on it since kernel makefiles mostly look like follows:

  obj-$(CONFIG_FOO) += foo.o

Do likewise in Kconfig.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 scripts/kconfig/zconf.l | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index c68ca56b..ae33e9b 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -114,6 +114,13 @@ n	[A-Za-z0-9_-]
 		yylval.string = text;
 		return T_VARIABLE;
 	}
+	({n}|$)+	{
+		/* this token includes at least one '$' */
+		yylval.string = expand_token(yytext, yyleng);
+		if (strlen(yylval.string))
+			return T_VARIABLE;
+		free(yylval.string);
+	}
 	"="	{ BEGIN(ASSIGN_VAL); yylval.flavor = VAR_RECURSIVE; return T_ASSIGN; }
 	":="	{ BEGIN(ASSIGN_VAL); yylval.flavor = VAR_SIMPLE; return T_ASSIGN; }
 	"+="	{ BEGIN(ASSIGN_VAL); yylval.flavor = VAR_APPEND; return T_ASSIGN; }
-- 
2.7.4

