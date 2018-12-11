Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36637 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbeLKLBl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:41 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 07/27] kconfig: clean up EOF handling in the lexer
Date: Tue, 11 Dec 2018 20:00:50 +0900
Message-Id: <1544526070-16690-8-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

A new file should always start in the INITIAL state.

When the lexer bumps into EOF, the lexer must get back to the INITIAL
state anyway. Remove the redundant <<EOF>> pattern in the PARAM state.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.l | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 847ba42..9038e97 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -178,9 +178,6 @@ n	[A-Za-z0-9_-]
 	\\\n	;
 	[[:blank:]]+
 	.	warn_ignored_character(*yytext);
-	<<EOF>> {
-		BEGIN(INITIAL);
-	}
 }
 
 <STRING>{
@@ -262,6 +259,8 @@ n	[A-Za-z0-9_-]
 }
 
 <<EOF>>	{
+	BEGIN(INITIAL);
+
 	if (current_file) {
 		zconf_endfile();
 		return T_EOL;
-- 
2.7.4
