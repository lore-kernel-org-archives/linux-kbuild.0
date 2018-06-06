Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:41111 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752310AbeFFWKE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Jun 2018 18:10:04 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [RFC 1/1] Emacs-like isearch for mconf.
Date: Wed,  6 Jun 2018 23:58:55 +0200
Message-Id: <20180606215855.12889-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Dirk Gouders <dirk@gouders.net>

---
 scripts/kconfig/lxdialog/dialog.h  |   5 ++
 scripts/kconfig/lxdialog/menubox.c | 140 ++++++++++++++++++++++++++++++++++++-
 scripts/kconfig/lxdialog/util.c    |   1 +
 3 files changed, 145 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/lxdialog/dialog.h b/scripts/kconfig/lxdialog/dialog.h
index fcffd5b41fb0..6b40a0f06b87 100644
--- a/scripts/kconfig/lxdialog/dialog.h
+++ b/scripts/kconfig/lxdialog/dialog.h
@@ -56,6 +56,8 @@
 #define TR(params) _tracef params
 
 #define KEY_ESC 27
+#define KEY_CTRL_S 19
+#define KEY_ENTR 10
 #define TAB 9
 #define MAX_LEN 2048
 #define BUF_SIZE (10*1024)
@@ -244,6 +246,9 @@ int dialog_checklist(const char *title, const char *prompt, int height,
 		     int width, int list_height);
 int dialog_inputbox(const char *title, const char *prompt, int height,
 		    int width, const char *init);
+int do_isearch(char *str, int choice, int scroll);
+void dialog_isearch(WINDOW *menu, WINDOW *dialog, int *choice, int max_choice,
+		   int box_x, int box_y, int menu_height, int *scroll);
 
 /*
  * This is the base for fictitious keys, which activate
diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/lxdialog/menubox.c
index 11ae9ad7ac7b..531fd7364dd3 100644
--- a/scripts/kconfig/lxdialog/menubox.c
+++ b/scripts/kconfig/lxdialog/menubox.c
@@ -56,8 +56,13 @@
  * fscanf would read in 'scroll', and eventually that value would get used.
  */
 
+#include <string.h>
 #include "dialog.h"
 
+#define ISEARCH_LEN 32
+#define ISEARCH_INDICATOR_LEN (ISEARCH_LEN + 8)
+static char isearch_str[ISEARCH_LEN] = "";
+
 static int menu_width, item_x;
 
 /*
@@ -105,6 +110,32 @@ do {									\
 	do_print_item(menu, item_str(), choice, selected, !item_is_tag(':')); \
 } while (0)
 
+
+/*
+* Print the isearch indicator.
+*/
+static void print_isearch(WINDOW * win, int y, int x, int height, bool isearch)
+{
+	unsigned char i = 0;
+
+	wmove(win, y, x);
+
+	y = y + height + 1;
+	wmove(win, y, x);
+
+	if (isearch) {
+		wattrset(win, dlg.button_key_inactive.atr);
+		waddstr(win, "isearch: ");
+		waddstr(win, isearch_str);
+		i = ISEARCH_INDICATOR_LEN - strlen(isearch_str);
+	}
+
+	wattrset(win, dlg.menubox_border.atr);
+
+	for ( ; i < ISEARCH_INDICATOR_LEN; i++ )
+		waddch(win, ACS_HLINE);
+}
+
 /*
  * Print the scroll indicators.
  */
@@ -178,6 +209,110 @@ static void do_scroll(WINDOW *win, int *scroll, int n)
 	wrefresh(win);
 }
 
+/*
+ * Incremental search for text in dialog menu entries.
+ * The search operates as a ring search, continuing at the top after
+ * the last entry has been visited.
+ */
+int do_isearch(char *str, int choice, int scroll)
+{
+	int i;
+
+	for (i = 0; i < item_count(); i++) {
+		item_set((choice + scroll + i)%item_count());
+		if (strcasestr(item_str(), str))
+			break;
+	}
+
+	return (choice + scroll + i)%item_count();
+}
+
+/*
+ * Incremental search in dialog menu
+ *
+ * This function is executed after CTRL-S has been pressed and it
+ * navigates to and highlights menu entries that match the string
+ * formed by subsequently entered characters.  To find further matches
+ * of an entered string, CTRL-S has to be entered instead of further
+ * characters.
+ *
+ * Subsequently pressing just CTRL-S keys results in searches for empty
+ * strings (any line matches) and thus results in navigating through
+ * the menu, line by line.
+ *
+ * Incremental search is terminated by pressing either ESC or ENTER.
+ */
+void dialog_isearch(WINDOW *menu, WINDOW *dialog, int *choice, int max_choice,
+		   int box_x, int box_y, int menu_height, int *scroll)
+{
+	int i;
+	int key = KEY_CTRL_S;
+
+	while (key != KEY_ESC) {
+		key = wgetch(menu);
+
+		if ((key == KEY_ESC || key == KEY_ENTR)) {
+			isearch_str[0] = '\0';
+			print_isearch(dialog, box_y, box_x + item_x + 5, menu_height, false);
+			print_arrows(dialog, item_count(), *scroll,
+				     box_y, box_x + item_x + 1, menu_height);
+			print_item(*scroll + *choice, *choice, true);
+			return;
+		}
+
+		if (key == KEY_CTRL_S) {
+			/* Remove highligt of current item */
+			print_item(*scroll + *choice, *choice, FALSE);
+			*choice += 1;
+			i = do_isearch(isearch_str, *choice, *scroll);
+		} else {
+			if ( key == KEY_BACKSPACE && isearch_str[0] ) {
+				isearch_str[i = (strlen(isearch_str) - 1)] = '\0';
+			} else {
+				if ( isalnum(key) || key == ' ') {
+					if (strlen(isearch_str) < ISEARCH_LEN - 1) {
+						isearch_str[i = strlen(isearch_str)] = key;
+						isearch_str[i+1] = '\0';
+					} else
+						continue;
+				}
+			}
+			/* Remove highligt of current item */
+			print_item(*scroll + *choice, *choice, FALSE);
+			i = do_isearch(isearch_str, *choice, *scroll);
+		}
+		i -= *scroll;
+
+		if (i >= max_choice)
+			/*
+			 * Handle matches below the currently visible menu entries.
+			 */
+			while (i >= max_choice) {
+				do_scroll(menu, scroll, 1);
+				i--;
+				print_item(max_choice + *scroll - 1, max_choice - 1, false);
+			}
+		else if (i < *scroll)
+			/*
+			 * Handle matches higher in the menu (ring search).
+			 */
+			while (i < *scroll) {
+				do_scroll(menu, scroll, -1);
+				i++;
+				print_item(*scroll, 0, false);
+			}
+		*choice = i;
+
+		print_item(*scroll + *choice, *choice, TRUE);
+		print_isearch(dialog, box_y, box_x + item_x + 5, menu_height, true);
+		print_arrows(dialog, item_count(), *scroll,
+			     box_y, box_x + item_x + 1, menu_height);
+
+		wnoutrefresh(dialog);
+		wrefresh(menu);
+	}
+}
+
 /*
  * Display a menu for choosing among a number of options
  */
@@ -282,6 +417,10 @@ int dialog_menu(const char *title, const char *prompt,
 	while (key != KEY_ESC) {
 		key = wgetch(menu);
 
+		if (key == KEY_CTRL_S)
+			dialog_isearch(menu, dialog, &choice, max_choice,
+				       box_x, box_y, menu_height, &scroll);
+
 		if (key < 256 && isalpha(key))
 			key = tolower(key);
 
@@ -366,7 +505,6 @@ int dialog_menu(const char *title, const char *prompt,
 
 			wnoutrefresh(dialog);
 			wrefresh(menu);
-
 			continue;	/* wait for another key press */
 		}
 
diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
index f7abdeb92af0..5ce49d9992b2 100644
--- a/scripts/kconfig/lxdialog/util.c
+++ b/scripts/kconfig/lxdialog/util.c
@@ -332,6 +332,7 @@ int init_dialog(const char *backtitle)
 
 	keypad(stdscr, TRUE);
 	cbreak();
+	raw();			/* Enable CTRL-sequences*/
 	noecho();
 	dialog_clear();
 
-- 
2.16.4

