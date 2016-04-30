Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:43562 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752223AbcD3IPr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 30 Apr 2016 04:15:47 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [RFC PATCH] mconf: expand show_all_options to choices' checklist menus
Date: Sat, 30 Apr 2016 10:15:36 +0200
Message-ID: <ghd1p78qc7.fsf@quad.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Boolean choices' checklist menus are currently immune against the 'z'
key that toggles visibility of all options.

Expansion of the 'z' toggle could be of use when debugging problems
with comlex choice menus.

A new tag 'z' for dialog_items was introduced for this purpose.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 scripts/kconfig/lxdialog/checklist.c | 31 ++++++++++++++++++++++++++-----
 scripts/kconfig/mconf.c              | 11 ++++++++---
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/lxdialog/checklist.c b/scripts/kconfig/lxdialog/checklist.c
index 8d016fa..2e3bc33 100644
--- a/scripts/kconfig/lxdialog/checklist.c
+++ b/scripts/kconfig/lxdialog/checklist.c
@@ -46,7 +46,14 @@ static void print_item(WINDOW * win, int choice, int selected)
 	wattrset(win, selected ? dlg.check_selected.atr
 		 : dlg.check.atr);
 	if (!item_is_tag(':'))
-		wprintw(win, "(%c)", item_is_tag('X') ? 'X' : ' ');
+		if (item_is_tag('z'))
+			/*
+			 * inactive items visible because of
+			 * show_all_options.
+			 */
+			wprintw(win, "- -");
+		else
+			wprintw(win, "(%c)", item_is_tag('X') ? 'X' : ' ');
 
 	wattrset(win, selected ? dlg.tag_selected.atr : dlg.tag.atr);
 	mvwaddch(win, choice, item_x, list_item[0]);
@@ -296,10 +303,18 @@ do_resize:
 			item_foreach()
 				item_set_selected(0);
 			item_set(scroll + choice);
-			item_set_selected(1);
-			delwin(list);
-			delwin(dialog);
-			return button;
+			if (!item_is_tag('z') || button == 1) {
+				/*
+				  Return if selected item isn't an
+				  item only visible because of
+				  show_all options or if help was selected.
+				 */
+				item_set_selected(1);
+				delwin(list);
+				delwin(dialog);
+				return button;
+			}
+			continue;
 		case TAB:
 		case KEY_LEFT:
 		case KEY_RIGHT:
@@ -316,6 +331,12 @@ do_resize:
 		case KEY_ESC:
 			key = on_key_esc(dialog);
 			break;
+		case 'z':
+		case 'Z':
+			button = 2; /* toggle show_all_options */
+			delwin(list);
+			delwin(dialog);
+			return button;
 		case KEY_RESIZE:
 			delwin(list);
 			delwin(dialog);
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 315ce2c..e87a117 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -811,11 +811,13 @@ static void conf_choice(struct menu *menu)
 
 		current_menu = menu;
 		for (child = menu->list; child; child = child->next) {
-			if (!menu_is_visible(child))
+			if (!menu_is_visible(child) && !show_all_options)
 				continue;
-			if (child->sym)
+			if (child->sym) {
 				item_make("%s", _(menu_get_prompt(child)));
-			else {
+				if (!menu_is_visible(child))
+					item_set_tag('z');
+			} else {
 				item_make("*** %s ***", _(menu_get_prompt(child)));
 				item_set_tag(':');
 			}
@@ -850,6 +852,9 @@ static void conf_choice(struct menu *menu)
 			} else
 				show_help(menu);
 			break;
+		case 2:
+			show_all_options = !show_all_options;
+			break;
 		case KEY_ESC:
 			return;
 		case -ERRDISPLAYTOOSMALL:
-- 
2.8.1

