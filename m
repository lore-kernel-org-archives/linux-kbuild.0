Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36643 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbeLKLBl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:41 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 14/27] kconfig: rename depends_list to comment_option_list
Date: Tue, 11 Dec 2018 20:00:57 +0900
Message-Id: <1544526070-16690-15-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

Now the comment_stmt is the only user of depends_list. Rename it to
comment_option_list

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.y | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 7cc8244..7a4bc58 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -379,7 +379,12 @@ comment: T_COMMENT prompt T_EOL
 	printd(DEBUG_PARSE, "%s:%d:comment\n", zconf_curname(), zconf_lineno());
 };
 
-comment_stmt: comment depends_list
+comment_stmt: comment comment_option_list
+;
+
+comment_option_list:
+	  /* empty */
+	| comment_option_list depends
 ;
 
 /* help option */
@@ -408,11 +413,6 @@ help: help_start T_HELPTEXT
 
 /* depends option */
 
-depends_list:
-	  /* empty */
-	| depends_list depends
-;
-
 depends: T_DEPENDS T_ON expr T_EOL
 {
 	menu_add_dep($3);
-- 
2.7.4
