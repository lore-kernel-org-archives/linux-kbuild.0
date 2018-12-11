Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36714 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbeLKLBn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:43 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 13/27] kconfig: loosen the order of "visible" and "depends on" in menu entry
Date: Tue, 11 Dec 2018 20:00:56 +0900
Message-Id: <1544526070-16690-14-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

Currently, "visible" and "depends on", if defined in a menu entry,
must appear in that order.

The real example is in drivers/media/tuners/Kconfig:

  menu "Customize TV tuners"
          visible if <expr1>
          depends on <expr2>

... is fine, but you cannot change the property order like this:

  menu "Customize TV tuners"
          depends on <expr2>
          visible if <expr1>

Kconfig does not require a specific order of properties. In this case,
menu_add_visibility(() and menu_add_dep() are orthogonal.

Loosen this unreasonable restriction.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.y | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index eeb449b..7cc8244 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -341,7 +341,7 @@ menu: T_MENU prompt T_EOL
 	printd(DEBUG_PARSE, "%s:%d:menu\n", zconf_curname(), zconf_lineno());
 };
 
-menu_entry: menu visibility_list depends_list
+menu_entry: menu menu_option_list
 {
 	$$ = menu_add_menu();
 };
@@ -357,6 +357,12 @@ menu_end: end
 menu_stmt: menu_entry stmt_list menu_end
 ;
 
+menu_option_list:
+	  /* empty */
+	| menu_option_list visible
+	| menu_option_list depends
+;
+
 source_stmt: T_SOURCE prompt T_EOL
 {
 	printd(DEBUG_PARSE, "%s:%d:source %s\n", zconf_curname(), zconf_lineno(), $2);
@@ -414,12 +420,6 @@ depends: T_DEPENDS T_ON expr T_EOL
 };
 
 /* visibility option */
-
-visibility_list:
-	  /* empty */
-	| visibility_list visible
-;
-
 visible: T_VISIBLE if_expr T_EOL
 {
 	menu_add_visibility($2);
-- 
2.7.4
