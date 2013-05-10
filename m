Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:39718 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753078Ab3EJNaE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 10 May 2013 09:30:04 -0400
Received: from localhost ([193.175.198.193])
	by mx10.gouders.net (8.14.6/8.14.5) with ESMTP id r4ACxZ4H017089
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-kbuild@vger.kernel.org>; Fri, 10 May 2013 14:59:36 +0200
From: Dirk Gouders <dirk.gouders@w-hs.de>
Subject: [RFC] mconf: make extensive use of ncurses' variables LINES and COLS.
Date: Fri, 10 May 2013 14:59:30 +0200
Message-ID: <gid2szuh1p.fsf@karga.hank.lab>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

--=-=-=
Content-Type: text/plain

This (again) is a rather cosmetic change that I could not resist,
while checking how to make print_autowrap() handle height-conflicts
and also reading ncurses documentation.

Dirk


--=-=-=
Content-Type: text/plain
Content-Disposition: inline;
 filename=0001-mconf-make-extensive-use-of-ncurses-variables-LINES-.patch
Content-Description: Patch

From 882aa6595cbb2683a43bf24f1b9741263641ec9b Mon Sep 17 00:00:00 2001
From: Dirk Gouders <dirk@gouders.net>
Date: Fri, 10 May 2013 12:26:23 +0200
Subject: [PATCH] mconf: make extensive use of ncurses' variables LINES and
 COLS.

The manual page of ncurses states that the variables LINES and COLS
are initialized by initscr().  So, in init_dialog() there is no need
to use local variables `height' and `width' and initialize them using
function calls.

Further, in other functions' `do_resize' cases getmaxx(stdscr)/COLS and
getmaxy(stdscr)/LINES were used in mixture; the function calls were
replaced with the respective variables.

Finally, to be consequent, show_help() used getmaxx(stdscr) which has
been replaced by COLS.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 scripts/kconfig/lxdialog/checklist.c | 4 ++--
 scripts/kconfig/lxdialog/inputbox.c  | 4 ++--
 scripts/kconfig/lxdialog/menubox.c   | 4 ++--
 scripts/kconfig/lxdialog/textbox.c   | 4 +++-
 scripts/kconfig/lxdialog/util.c      | 5 +----
 scripts/kconfig/lxdialog/yesno.c     | 4 ++--
 scripts/kconfig/mconf.c              | 2 +-
 7 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/scripts/kconfig/lxdialog/checklist.c b/scripts/kconfig/lxdialog/checklist.c
index a2eb80f..fd3f5c5 100644
--- a/scripts/kconfig/lxdialog/checklist.c
+++ b/scripts/kconfig/lxdialog/checklist.c
@@ -132,9 +132,9 @@ int dialog_checklist(const char *title, const char *prompt, int height,
 	}
 
 do_resize:
-	if (getmaxy(stdscr) < (height + 6))
+	if (LINES < (height + 6))
 		return -ERRDISPLAYTOOSMALL;
-	if (getmaxx(stdscr) < (width + 6))
+	if (COLS < (width + 6))
 		return -ERRDISPLAYTOOSMALL;
 
 	max_choice = MIN(list_height, item_count());
diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
index 21404a0..bc5d17d 100644
--- a/scripts/kconfig/lxdialog/inputbox.c
+++ b/scripts/kconfig/lxdialog/inputbox.c
@@ -56,9 +56,9 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
 		strcpy(instr, init);
 
 do_resize:
-	if (getmaxy(stdscr) <= (height - 2))
+	if (LINES <= (height - 2))
 		return -ERRDISPLAYTOOSMALL;
-	if (getmaxx(stdscr) <= (width - 2))
+	if (COLS <= (width - 2))
 		return -ERRDISPLAYTOOSMALL;
 
 	/* center dialog box on screen */
diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/lxdialog/menubox.c
index 48d382e..a3ad1b5 100644
--- a/scripts/kconfig/lxdialog/menubox.c
+++ b/scripts/kconfig/lxdialog/menubox.c
@@ -191,8 +191,8 @@ int dialog_menu(const char *title, const char *prompt,
 	WINDOW *dialog, *menu;
 
 do_resize:
-	height = getmaxy(stdscr);
-	width = getmaxx(stdscr);
+	height = LINES;
+	width = COLS;
 	if (height < 15 || width < 65)
 		return -ERRDISPLAYTOOSMALL;
 
diff --git a/scripts/kconfig/lxdialog/textbox.c b/scripts/kconfig/lxdialog/textbox.c
index a48bb93..b6a004d 100644
--- a/scripts/kconfig/lxdialog/textbox.c
+++ b/scripts/kconfig/lxdialog/textbox.c
@@ -79,7 +79,9 @@ int dialog_textbox(const char *title, char *tbuf, int initial_height,
 		hscroll = *_hscroll;
 
 do_resize:
-	getmaxyx(stdscr, height, width);
+	height = LINES;
+	width = COLS;
+
 	if (height < 8 || width < 8)
 		return -ERRDISPLAYTOOSMALL;
 	if (initial_height != 0)
diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
index cfee00c..8ea7ef2 100644
--- a/scripts/kconfig/lxdialog/util.c
+++ b/scripts/kconfig/lxdialog/util.c
@@ -309,15 +309,12 @@ void dialog_clear(void)
  */
 int init_dialog(const char *backtitle)
 {
-	int height, width;
-
 	initscr();		/* Init curses */
 
 	/* Get current cursor position for signal handler in mconf.c */
 	getyx(stdscr, saved_y, saved_x);
 
-	getmaxyx(stdscr, height, width);
-	if (height < 19 || width < 80) {
+	if (LINES < 19 || COLS < 80) {
 		endwin();
 		return -ERRDISPLAYTOOSMALL;
 	}
diff --git a/scripts/kconfig/lxdialog/yesno.c b/scripts/kconfig/lxdialog/yesno.c
index 4e6e809..e3e9be8 100644
--- a/scripts/kconfig/lxdialog/yesno.c
+++ b/scripts/kconfig/lxdialog/yesno.c
@@ -45,9 +45,9 @@ int dialog_yesno(const char *title, const char *prompt, int height, int width)
 	WINDOW *dialog;
 
 do_resize:
-	if (getmaxy(stdscr) < (height + 4))
+	if (LINES < (height + 4))
 		return -ERRDISPLAYTOOSMALL;
-	if (getmaxx(stdscr) < (width + 4))
+	if (COLS < (width + 4))
 		return -ERRDISPLAYTOOSMALL;
 
 	/* center dialog box on screen */
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index a258b8c..9a30a85 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -787,7 +787,7 @@ static void show_help(struct menu *menu)
 {
 	struct gstr help = str_new();
 
-	help.max_width = getmaxx(stdscr) - 10;
+	help.max_width = COLS - 10;
 	menu_get_ext_help(menu, &help);
 
 	show_helptext(_(menu_get_prompt(menu)), str_get(&help));
-- 
1.8.2.1


--=-=-=--
