Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:19417 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727704AbeHIJM0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Aug 2018 05:12:26 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kconfig: fix the rule of mainmenu_stmt symbol
Date: Thu,  9 Aug 2018 15:47:06 +0900
Message-Id: <1533797226-6547-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The rule of mainmenu_stmt does not have debug print of zconf_lineno(),
but if it had, it would print a wrong line number for the same reason
as commit b2d00d7c61c8 ("kconfig: fix line numbers for if-entries in
menu tree").

The mainmenu_stmt does not need to eat following empty lines because
they are reduced to common_stmt.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.y | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 4b68272..95a4fd3 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -31,7 +31,7 @@ struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 static struct menu *current_menu, *current_entry;
 
 %}
-%expect 31
+%expect 30
 
 %union
 {
@@ -117,7 +117,7 @@ start: mainmenu_stmt stmt_list | stmt_list;
 
 /* mainmenu entry */
 
-mainmenu_stmt: T_MAINMENU prompt nl
+mainmenu_stmt: T_MAINMENU prompt T_EOL
 {
 	menu_add_prompt(P_MENU, $2, NULL);
 };
-- 
2.7.4

