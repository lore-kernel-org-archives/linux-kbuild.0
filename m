Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36640 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbeLKLBl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:41 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 12/27] kconfig: remove redundant menu_block rule
Date: Tue, 11 Dec 2018 20:00:55 +0900
Message-Id: <1544526070-16690-13-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

The code block surrounded by "menu" ... "endmenu" is stmt_list.

Remove the redundant menu_block symbol entirely.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.y | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index dcbf643..eeb449b 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -354,14 +354,7 @@ menu_end: end
 	}
 };
 
-menu_stmt: menu_entry menu_block menu_end
-;
-
-menu_block:
-	  /* empty */
-	| menu_block common_stmt
-	| menu_block menu_stmt
-	| menu_block choice_stmt
+menu_stmt: menu_entry stmt_list menu_end
 ;
 
 source_stmt: T_SOURCE prompt T_EOL
-- 
2.7.4
