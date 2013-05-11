Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:42108 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750783Ab3EKLUL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 May 2013 07:20:11 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [RFC] mconf: make extensive use of ncurses' variables LINES and COLS.
In-Reply-To: <20130511094818.GA3222@free.fr> (Yann E. MORIN's message of "Sat,
	11 May 2013 11:48:18 +0200")
References: <gid2szuh1p.fsf@karga.hank.lab> <20130511094818.GA3222@free.fr>
Date: Sat, 11 May 2013 13:20:06 +0200
Message-ID: <gh1u9d9315.fsf@mx10.gouders.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

--=-=-=

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

> If we read the manpage strictly, the LINES and COLS are set by initsrc,
> and nothing else updates them. So the manpage does not state what
> happens when the terminal is resized. The only mention of 'COLS' in the
> man page is this paragraph:
>
>     ---8<---
>     The integer variables LINES and COLS are defined in <curses.h>
>     and will be filled in by initscr with the size of the screen.
>     ---8<---
>
> After looking at the code of ncurses, the LINES and COLS are also
> updated upon a resize. But as this is not documented, I think we should
> *not* rely on that behaviour.
>
> I believe we should use the functions, not the variables.
>
> Also note that the getmaxyx() familly are not functions, they are macros.

Thank you for your review and comments.

I changed the patch so that the variables are used (or not used)
strictly according to the documentation.  Of course, the change of
init_dialog() is not really necessary to comply with the documentation;
I will send a v3 if it shold remain unchanged.

Dirk


--=-=-=
Content-Disposition: inline;
 filename=0001-mconf-Use-ncurses-variables-LINES-and-COLS-according.patch
Content-Description: Patchv2

From 178b894e8129ae7b199c5495091dafc89c203b00 Mon Sep 17 00:00:00 2001
From: Dirk Gouders <dirk@gouders.net>
Date: Sat, 11 May 2013 12:46:12 +0200
Subject: [PATCH v2] mconf: Use ncurses' variables LINES and COLS according to the
 documentation.

According to the documentation [1], LINES and COLS are initialized by
initscr().  So, use these variables in init_dialog().

The documentation does not say anything about the behavior when
windows are resized.  Do not rely on the current implementation
of ncurses that updates these variables on resize, but use the propper
function calls to get window dimensions.

[1] ncurses(3X)
---
 scripts/kconfig/lxdialog/checklist.c | 4 ++--
 scripts/kconfig/lxdialog/inputbox.c  | 4 ++--
 scripts/kconfig/lxdialog/menubox.c   | 4 ++--
 scripts/kconfig/lxdialog/textbox.c   | 4 ++--
 scripts/kconfig/lxdialog/util.c      | 5 +----
 scripts/kconfig/lxdialog/yesno.c     | 4 ++--
 6 files changed, 11 insertions(+), 14 deletions(-)

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
index a0e97c2..9b528a2 100644
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


--=-=-=--
