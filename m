Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:55520 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755116Ab3EQK22 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 May 2013 06:28:28 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH] mconf: mark empty menus/menuconfigs different form non-empty ones
Date: Fri, 17 May 2013 12:28:12 +0200
Message-Id: <1368786492-23751-2-git-send-email-dirk@gouders.net>
In-Reply-To: <1368786492-23751-1-git-send-email-dirk@gouders.net>
References: <20130516230404.GB19534@free.fr>
 <1368786492-23751-1-git-send-email-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

Submenus are sometimes empty and it would be nice if there is
be somethying that notifies us that we should not expect any
content _before_ we enter a submenu.

A new function menu_is_empty() was introduced and empty menus and
menuconfigs are now marked by "----" as opposed to non-empty
ones that are marked by "--->".

This scheme was suggested by "Yann E. MORIN" <yann.morin.1998@free.fr>.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 scripts/kconfig/mconf.c | 20 ++++++++++++++------
 scripts/kconfig/menu.c  | 16 ++++++++++++++++
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index ccb71ae..80b289c 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -48,7 +48,7 @@ static const char mconf_readme[] = N_(
 "----------\n"
 "o  Use the Up/Down arrow keys (cursor keys) to highlight the item\n"
 "   you wish to change or submenu wish to select and press <Enter>.\n"
-"   Submenus are designated by \"--->\".\n"
+"   Submenus are designated by \"--->\", empty ones by \"----\".\n"
 "\n"
 "   Shortcut: Press the option's highlighted letter (hotkey).\n"
 "             Pressing a hotkey more than once will sequence\n"
@@ -176,7 +176,7 @@ static const char mconf_readme[] = N_(
 "\n"),
 menu_instructions[] = N_(
 	"Arrow keys navigate the menu.  "
-	"<Enter> selects submenus --->.  "
+	"<Enter> selects submenus ---> (or empty submenus ----).  "
 	"Highlighted letters are hotkeys.  "
 	"Pressing <Y> includes, <N> excludes, <M> modularizes features.  "
 	"Press <Esc><Esc> to exit, <?> for Help, </> for Search.  "
@@ -497,9 +497,14 @@ static void build_conf(struct menu *menu)
 					item_make("%s%*c%s",
 						  menu->data ? "-->" : "++>",
 						  indent + 1, ' ', prompt);
-				} else
-					item_make("   %*c%s  --->", indent + 1, ' ', prompt);
-
+				} else {
+					if (menu_is_empty(menu))
+						item_make("   %*c%s  ----",
+							  indent + 1, ' ', prompt);
+					else
+						item_make("   %*c%s  --->",
+							  indent + 1, ' ', prompt);
+				}
 				item_set_tag('m');
 				item_set_data(menu);
 				if (single_menu_mode && menu->data)
@@ -630,7 +635,10 @@ static void build_conf(struct menu *menu)
 			  (sym_has_value(sym) || !sym_is_changable(sym)) ?
 			  "" : _(" (NEW)"));
 		if (menu->prompt->type == P_MENU) {
-			item_add_str("  --->");
+			if (menu_is_empty(menu))
+				item_add_str("  ----");
+			else
+				item_add_str("  --->");
 			return;
 		}
 	}
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index b5c7d90..6d11c8f 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -430,6 +430,22 @@ bool menu_has_prompt(struct menu *menu)
 	return true;
 }
 
+/*
+ * Determine if a menu is empty.
+ * A menu is considered empty if it contains no or only
+ * invisible entries.
+ */
+bool menu_is_empty(struct menu *menu)
+{
+	struct menu *child;
+
+	for (child = menu->list; child; child = child->next) {
+		if (menu_is_visible(child))
+			return(false);
+	}
+	return(true);
+}
+
 bool menu_is_visible(struct menu *menu)
 {
 	struct menu *child;
-- 
1.8.2.1

