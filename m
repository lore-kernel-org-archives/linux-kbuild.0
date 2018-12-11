Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36642 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbeLKLBl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:41 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 04/27] kconfig: remove unneeded pattern matching to whitespaces
Date: Tue, 11 Dec 2018 20:00:47 +0900
Message-Id: <1544526070-16690-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

Whitespaces are consumed in the COMMAND state anyway.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.l | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index c2f577d..709b774 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -88,12 +88,6 @@ n	[A-Za-z0-9_-]
 	return T_EOL;
 }
 [ \t]*#.*
-
-
-[ \t]+	{
-	BEGIN(COMMAND);
-}
-
 .	{
 	unput(yytext[0]);
 	BEGIN(COMMAND);
-- 
2.7.4
