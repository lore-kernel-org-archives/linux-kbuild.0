Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:36589 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbfLQEDK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:03:10 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: warn nested choice
Date: Tue, 17 Dec 2019 13:02:45 +0900
Message-Id: <20191217040245.24441-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

If you create a 'choice' inside another 'choice', I do not know how
it should work.

I applied this patch onto v5.5-rc1, and I see one warning:

  drivers/usb/gadget/legacy/Kconfig:458: warning: nested choice. previous choice entry is drivers/usb/gadget/Kconfig:486

This is because entire drivers/usb/gadget/legacy/Kconfig is in the
choice context.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/parser.y | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index b3eff9613cf8..86e75ea74731 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -30,6 +30,9 @@ struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 
 static struct menu *current_menu, *current_entry;
 
+/* while in the choice block, this points to the location of the choice entry */
+static struct menu *current_choice_menu;
+
 %}
 
 %union
@@ -239,6 +242,14 @@ choice: T_CHOICE word_opt T_EOL
 	menu_add_entry(sym);
 	menu_add_expr(P_CHOICE, NULL, NULL);
 	free($2);
+
+	if (current_choice_menu)
+		zconfprint("warning: nested choice. previous choice entry is %s:%d",
+			   current_choice_menu->file->name,
+			   current_choice_menu->lineno);
+
+	current_choice_menu = current_entry;
+
 	printd(DEBUG_PARSE, "%s:%d:choice\n", zconf_curname(), zconf_lineno());
 };
 
@@ -439,7 +450,7 @@ prompt:	  T_WORD
 ;
 
 end:	  T_ENDMENU T_EOL	{ $$ = "menu"; }
-	| T_ENDCHOICE T_EOL	{ $$ = "choice"; }
+	| T_ENDCHOICE T_EOL	{ $$ = "choice"; current_choice_menu = NULL; }
 	| T_ENDIF T_EOL		{ $$ = "if"; }
 ;
 
-- 
2.17.1
