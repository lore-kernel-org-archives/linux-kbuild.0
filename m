Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42856 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758990AbYAXWDx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:53 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 46/77] kconfig: whitespace removing
Date: Thu, 24 Jan 2008 23:03:27 +0100
Message-Id: <1201212238-4369-46-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: EGRY Gabor <gaboregry1@t-online.hu>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>

From: EGRY Gabor <gaboregry1@t-online.hu>

This patch removes the unnecessary whitespaces from
end of help lines of Kconfig files.

Signed-off-by: Egry Gabor <gaboregry1@t-online.hu>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
---
 scripts/kconfig/lex.zconf.c_shipped |    5 +++++
 scripts/kconfig/zconf.l             |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/lex.zconf.c_shipped b/scripts/kconfig/lex.zconf.c_shipped
index a065d5a..bed0f4e 100644
--- a/scripts/kconfig/lex.zconf.c_shipped
+++ b/scripts/kconfig/lex.zconf.c_shipped
@@ -1275,6 +1275,11 @@ YY_RULE_SETUP
 case 32:
 YY_RULE_SETUP
 {
+		while (zconfleng) {
+			if ((zconftext[zconfleng-1] != ' ') && (zconftext[zconfleng-1] != '\t'))
+				break;
+			zconfleng--;
+		}
 		append_string(zconftext, zconfleng);
 		if (!first_ts)
 			first_ts = last_ts;
diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 187d38c..4cea5c8 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -217,6 +217,11 @@ n	[A-Za-z0-9_]
 		append_string("\n", 1);
 	}
 	[^ \t\n].* {
+		while (yyleng) {
+			if ((yytext[yyleng-1] != ' ') && (yytext[yyleng-1] != '\t'))
+				break;
+			yyleng--;
+		}
 		append_string(yytext, yyleng);
 		if (!first_ts)
 			first_ts = last_ts;
-- 
1.5.4.rc3.14.g44397

