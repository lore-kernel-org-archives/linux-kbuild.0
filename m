Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:44452 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752610Ab3ELKay (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 May 2013 06:30:54 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH v4] mconf: use function calls instead of ncurses' variables LINES and COLS
Date: Sun, 12 May 2013 12:30:49 +0200
Message-Id: <1368354649-10312-1-git-send-email-dirk@gouders.net>
In-Reply-To: <20130511205802.GD3222@free.fr>
References: <20130511205802.GD3222@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Dirk Gouders <dirk@gouders.net>

According to the documentation [1], LINES and COLS are initialized by
initscr(); it does not say anything about the behavior when windows are
resized.

Do not rely on the current implementation of ncurses that updates
these variables on resize, but use the propper function calls to get
window dimensions.

init_dialog() could make use of the variables, but for the sake of
consistency we do not change it's current use of the macro getmaxyx().

[1] ncurses(3X)

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 scripts/kconfig/lxdialog/checklist.c |  4 ++--
 scripts/kconfig/lxdialog/inputbox.c  |  4 ++--
 scripts/kconfig/lxdialog/menubox.c   |  4 ++--
 scripts/kconfig/lxdialog/textbox.c   |  4 ++--
 scripts/kconfig/lxdialog/util.c      | 13 +++++++++----
 scripts/kconfig/lxdialog/yesno.c     |  4 ++--
 6 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/scripts/kconfig/lxdialog/checklist.c b/scripts/kconfig/lxdialog/checklist.c
index a2eb80f..af8e8a6 100644
--- a/scripts/kconfig/lxdialog/checklist.c
+++ b/scripts/kconfig/lxdialog/checklist.c
@@ -140,8 +140,8 @@ do_resize:
 	max_choice = MIN(list_height, item_count());
 
 	/* center dialog box on screen */
-	x = (COLS - width) / 2;
-	y = (LINES - height) / 2;
+	x = (getmaxx(stdscr) - width) / 2;
+	y = (getmaxy(stdscr) - height) / 2;
 
 	draw_shadow(stdscr, y, x, height, width);
 
diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
index 21404a0..7a8c6b3e 100644
--- a/scripts/kconfig/lxdialog/inputbox.c
+++ b/scripts/kconfig/lxdialog/inputbox.c
@@ -62,8 +62,8 @@ do_resize:
 		return -ERRDISPLAYTOOSMALL;
 
 	/* center dialog box on screen */
-	x = (COLS - width) / 2;
-	y = (LINES - height) / 2;
+	x = (getmaxx(stdscr) - width) / 2;
+	y = (getmaxy(stdscr) - height) / 2;
 
 	draw_shadow(stdscr, y, x, height, width);
 
diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/lxdialog/menubox.c
index 48d382e..e068251 100644
--- a/scripts/kconfig/lxdialog/menubox.c
+++ b/scripts/kconfig/lxdialog/menubox.c
@@ -203,8 +203,8 @@ do_resize:
 	max_choice = MIN(menu_height, item_count());
 
 	/* center dialog box on screen */
-	x = (COLS - width) / 2;
-	y = (LINES - height) / 2;
+	x = (getmaxx(stdscr) - width) / 2;
+	y = (getmaxy(stdscr) - height) / 2;
 
 	draw_shadow(stdscr, y, x, height, width);
 
diff --git a/scripts/kconfig/lxdialog/textbox.c b/scripts/kconfig/lxdialog/textbox.c
index a48bb93..ad6e199 100644
--- a/scripts/kconfig/lxdialog/textbox.c
+++ b/scripts/kconfig/lxdialog/textbox.c
@@ -98,8 +98,8 @@ do_resize:
 			width = 0;
 
 	/* center dialog box on screen */
-	x = (COLS - width) / 2;
-	y = (LINES - height) / 2;
+	x = (getmaxx(stdscr) - width) / 2;
+	y = (getmaxy(stdscr) - height) / 2;
 
 	draw_shadow(stdscr, y, x, height, width);
 
diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
index a0e97c2..25329c1 100644
--- a/scripts/kconfig/lxdialog/util.c
+++ b/scripts/kconfig/lxdialog/util.c
@@ -254,7 +254,12 @@ void attr_clear(WINDOW * win, int height, int width, chtype attr)
 
 void dialog_clear(void)
 {
-	attr_clear(stdscr, LINES, COLS, dlg.screen.atr);
+	int lines, columns;
+
+	lines = getmaxy(stdscr);
+	columns = getmaxx(stdscr);
+
+	attr_clear(stdscr, lines, columns, dlg.screen.atr);
 	/* Display background title if it exists ... - SLH */
 	if (dlg.backtitle != NULL) {
 		int i, len = 0, skip = 0;
@@ -269,10 +274,10 @@ void dialog_clear(void)
 		}
 
 		wmove(stdscr, 1, 1);
-		if (len > COLS - 2) {
+		if (len > columns - 2) {
 			const char *ellipsis = "[...] ";
 			waddstr(stdscr, ellipsis);
-			skip = len - (COLS - 2 - strlen(ellipsis));
+			skip = len - (columns - 2 - strlen(ellipsis));
 		}
 
 		for (pos = dlg.subtitles; pos != NULL; pos = pos->next) {
@@ -298,7 +303,7 @@ void dialog_clear(void)
 				skip--;
 		}
 
-		for (i = len + 1; i < COLS - 1; i++)
+		for (i = len + 1; i < columns - 1; i++)
 			waddch(stdscr, ACS_HLINE);
 	}
 	wnoutrefresh(stdscr);
diff --git a/scripts/kconfig/lxdialog/yesno.c b/scripts/kconfig/lxdialog/yesno.c
index 4e6e809..67b7203 100644
--- a/scripts/kconfig/lxdialog/yesno.c
+++ b/scripts/kconfig/lxdialog/yesno.c
@@ -51,8 +51,8 @@ do_resize:
 		return -ERRDISPLAYTOOSMALL;
 
 	/* center dialog box on screen */
-	x = (COLS - width) / 2;
-	y = (LINES - height) / 2;
+	x = (getmaxx(stdscr) - width) / 2;
+	y = (getmaxy(stdscr) - height) / 2;
 
 	draw_shadow(stdscr, y, x, height, width);
 
-- 
1.8.2.1

