Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42830 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758913AbYAXWDw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:52 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 35/77] kconfig: make kconfig MinGW friendly
Date: Thu, 24 Jan 2008 23:03:16 +0100
Message-Id: <1201212238-4369-35-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ladislav Michl <ladis@linux-mips.org>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>

From: Ladislav Michl <ladis@linux-mips.org>

Kconfig is powerfull tool. So powerfull that more and more software
projects are using it for configuration. So instead of fixing some of
them one by one, lets fix it in kernel and wait for sync.

This work was originaly done for PTXdist - GPL licensed build system for
userlands and cross-compilers, but it will not hurt kernel kconfig
either. PTXdist menuconfig now works on Windows linked with PDCurses and
compiled using MinGW - there is no termios and signals.

* Do not include <sys/wait.h> and <signal.h> (comes from times when
  lxdialog was separate process)
* Do not mess with termios directly and let curses tell screen size.
  Comment to commit c8dc68ad0fbd934e78e913b8a8d7b45945db4930 says
  check for screen size could be removed later, but because it didn't
  happen for more than year I left it here as well.
* Save cursor position added by Sam

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
---
 scripts/kconfig/lxdialog/dialog.h |    5 +--
 scripts/kconfig/lxdialog/util.c   |   32 +++++++++++++-------
 scripts/kconfig/mconf.c           |   61 +++++-------------------------------
 3 files changed, 32 insertions(+), 66 deletions(-)

diff --git a/scripts/kconfig/lxdialog/dialog.h b/scripts/kconfig/lxdialog/dialog.h
index 7e17eba..c4ad37f 100644
--- a/scripts/kconfig/lxdialog/dialog.h
+++ b/scripts/kconfig/lxdialog/dialog.h
@@ -187,10 +187,9 @@ int item_is_tag(char tag);
 int on_key_esc(WINDOW *win);
 int on_key_resize(void);
 
-void init_dialog(const char *backtitle);
+int init_dialog(const char *backtitle);
 void set_dialog_backtitle(const char *backtitle);
-void reset_dialog(void);
-void end_dialog(void);
+void end_dialog(int x, int y);
 void attr_clear(WINDOW * win, int height, int width, chtype attr);
 void dialog_clear(void);
 void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x);
diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
index a1bddef..86d95cc 100644
--- a/scripts/kconfig/lxdialog/util.c
+++ b/scripts/kconfig/lxdialog/util.c
@@ -266,31 +266,41 @@ void dialog_clear(void)
 /*
  * Do some initialization for dialog
  */
-void init_dialog(const char *backtitle)
+int init_dialog(const char *backtitle)
 {
-	dlg.backtitle = backtitle;
-	color_setup(getenv("MENUCONFIG_COLOR"));
-}
+	int height, width;
+
+	initscr();		/* Init curses */
+	getmaxyx(stdscr, height, width);
+	if (height < 19 || width < 80) {
+		endwin();
+		return -ERRDISPLAYTOOSMALL;
+	}
 
-void set_dialog_backtitle(const char *backtitle)
-{
 	dlg.backtitle = backtitle;
-}
+	color_setup(getenv("MENUCONFIG_COLOR"));
 
-void reset_dialog(void)
-{
-	initscr();		/* Init curses */
 	keypad(stdscr, TRUE);
 	cbreak();
 	noecho();
 	dialog_clear();
+
+	return 0;
+}
+
+void set_dialog_backtitle(const char *backtitle)
+{
+	dlg.backtitle = backtitle;
 }
 
 /*
  * End using dialog functions.
  */
-void end_dialog(void)
+void end_dialog(int x, int y)
 {
+	/* move cursor back to original position */
+	move(y, x);
+	refresh();
 	endwin();
 }
 
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 47e226f..ee9ed30 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -8,17 +8,13 @@
  * i18n, 2005, Arnaldo Carvalho de Melo <acme@conectiva.com.br>
  */
 
-#include <sys/ioctl.h>
-#include <sys/wait.h>
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <limits.h>
-#include <signal.h>
 #include <stdarg.h>
 #include <stdlib.h>
 #include <string.h>
-#include <termios.h>
 #include <unistd.h>
 #include <locale.h>
 
@@ -275,8 +271,6 @@ search_help[] = N_(
 	"\n");
 
 static int indent;
-static struct termios ios_org;
-static int rows = 0, cols = 0;
 static struct menu *current_menu;
 static int child_count;
 static int single_menu_mode;
@@ -290,41 +284,6 @@ static void show_textbox(const char *title, const char *text, int r, int c);
 static void show_helptext(const char *title, const char *text);
 static void show_help(struct menu *menu);
 
-static void init_wsize(void)
-{
-	struct winsize ws;
-	char *env;
-
-	if (!ioctl(STDIN_FILENO, TIOCGWINSZ, &ws)) {
-		rows = ws.ws_row;
-		cols = ws.ws_col;
-	}
-
-	if (!rows) {
-		env = getenv("LINES");
-		if (env)
-			rows = atoi(env);
-		if (!rows)
-			rows = 24;
-	}
-	if (!cols) {
-		env = getenv("COLUMNS");
-		if (env)
-			cols = atoi(env);
-		if (!cols)
-			cols = 80;
-	}
-
-	if (rows < 19 || cols < 80) {
-		fprintf(stderr, N_("Your display is too small to run Menuconfig!\n"));
-		fprintf(stderr, N_("It must be at least 19 lines by 80 columns.\n"));
-		exit(1);
-	}
-
-	rows -= 4;
-	cols -= 5;
-}
-
 static void get_prompt_str(struct gstr *r, struct property *prop)
 {
 	int i, j;
@@ -900,13 +859,9 @@ static void conf_save(void)
 	}
 }
 
-static void conf_cleanup(void)
-{
-	tcsetattr(1, TCSAFLUSH, &ios_org);
-}
-
 int main(int ac, char **av)
 {
+	int saved_x, saved_y;
 	char *mode;
 	int res;
 
@@ -923,11 +878,13 @@ int main(int ac, char **av)
 			single_menu_mode = 1;
 	}
 
-	tcgetattr(1, &ios_org);
-	atexit(conf_cleanup);
-	init_wsize();
-	reset_dialog();
-	init_dialog(NULL);
+	getyx(stdscr, saved_y, saved_x);
+	if (init_dialog(NULL)) {
+		fprintf(stderr, N_("Your display is too small to run Menuconfig!\n"));
+		fprintf(stderr, N_("It must be at least 19 lines by 80 columns.\n"));
+		return 1;
+	}
+
 	set_config_filename(conf_get_configname());
 	do {
 		conf(&rootmenu);
@@ -941,7 +898,7 @@ int main(int ac, char **av)
 		else
 			res = -1;
 	} while (res == KEY_ESC);
-	end_dialog();
+	end_dialog(saved_x, saved_y);
 
 	switch (res) {
 	case 0:
-- 
1.5.4.rc3.14.g44397

