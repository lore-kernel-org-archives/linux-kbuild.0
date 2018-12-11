Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36636 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbeLKLBl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:41 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 11/27] kconfig: remove redundant if_block rule
Date: Tue, 11 Dec 2018 20:00:54 +0900
Message-Id: <1544526070-16690-12-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

The code block surrounded by "if" ... "endif" is stmt_list.

Remove the redundant if_block symbol entirely.

Remove "stmt_list: stmt_list end" rule as well since it would
obviously cause conflicts.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.y | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index a92f167..dcbf643 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -123,7 +123,6 @@ stmt_list:
 	| stmt_list common_stmt
 	| stmt_list choice_stmt
 	| stmt_list menu_stmt
-	| stmt_list end			{ zconf_error("unexpected end statement"); }
 	| stmt_list T_WORD error T_EOL	{ zconf_error("unknown statement \"%s\"", $2); }
 	| stmt_list error T_EOL		{ zconf_error("invalid statement"); }
 ;
@@ -330,14 +329,7 @@ if_end: end
 	}
 };
 
-if_stmt: if_entry if_block if_end
-;
-
-if_block:
-	  /* empty */
-	| if_block common_stmt
-	| if_block menu_stmt
-	| if_block choice_stmt
+if_stmt: if_entry stmt_list if_end
 ;
 
 /* menu entry */
-- 
2.7.4
