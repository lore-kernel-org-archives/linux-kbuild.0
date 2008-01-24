Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42827 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757483AbYAXWD5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:57 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 52/77] kconfig: gettext support for lxdialog
Date: Thu, 24 Jan 2008 23:03:33 +0100
Message-Id: <1201212238-4369-52-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: EGRY Gabor <gaboregry1@t-online.hu>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>

From: EGRY Gabor <gaboregry1@t-online.hu>

Gettext support for lxdialog.

Signed-off-by: Egry Gabor <gaboregry1@t-online.hu>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
---
 scripts/kconfig/POTFILES.in          |    6 ++++++
 scripts/kconfig/lxdialog/checklist.c |    4 ++--
 scripts/kconfig/lxdialog/dialog.h    |    6 ++++++
 scripts/kconfig/lxdialog/inputbox.c  |    4 ++--
 scripts/kconfig/lxdialog/menubox.c   |    6 +++---
 scripts/kconfig/lxdialog/textbox.c   |    2 +-
 scripts/kconfig/lxdialog/yesno.c     |    4 ++--
 7 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/POTFILES.in b/scripts/kconfig/POTFILES.in
index 19d0e63..9674573 100644
--- a/scripts/kconfig/POTFILES.in
+++ b/scripts/kconfig/POTFILES.in
@@ -1,3 +1,9 @@
+scripts/kconfig/lxdialog/checklist.c
+scripts/kconfig/lxdialog/inputbox.c
+scripts/kconfig/lxdialog/menubox.c
+scripts/kconfig/lxdialog/textbox.c
+scripts/kconfig/lxdialog/util.c
+scripts/kconfig/lxdialog/yesno.c
 scripts/kconfig/mconf.c
 scripts/kconfig/conf.c
 scripts/kconfig/confdata.c
diff --git a/scripts/kconfig/lxdialog/checklist.c b/scripts/kconfig/lxdialog/checklist.c
index cf69708..b2a878c 100644
--- a/scripts/kconfig/lxdialog/checklist.c
+++ b/scripts/kconfig/lxdialog/checklist.c
@@ -97,8 +97,8 @@ static void print_buttons(WINDOW * dialog, int height, int width, int selected)
 	int x = width / 2 - 11;
 	int y = height - 2;
 
-	print_button(dialog, "Select", y, x, selected == 0);
-	print_button(dialog, " Help ", y, x + 14, selected == 1);
+	print_button(dialog, gettext("Select"), y, x, selected == 0);
+	print_button(dialog, gettext(" Help "), y, x + 14, selected == 1);
 
 	wmove(dialog, y, x + 1 + 14 * selected);
 	wrefresh(dialog);
diff --git a/scripts/kconfig/lxdialog/dialog.h b/scripts/kconfig/lxdialog/dialog.h
index c4ad37f..b5211fc 100644
--- a/scripts/kconfig/lxdialog/dialog.h
+++ b/scripts/kconfig/lxdialog/dialog.h
@@ -26,6 +26,12 @@
 #include <string.h>
 #include <stdbool.h>
 
+#ifndef KBUILD_NO_NLS
+# include <libintl.h>
+#else
+# define gettext(Msgid) ((const char *) (Msgid))
+#endif
+
 #ifdef __sun__
 #define CURS_MACROS
 #endif
diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
index 05e7206..4946bd0 100644
--- a/scripts/kconfig/lxdialog/inputbox.c
+++ b/scripts/kconfig/lxdialog/inputbox.c
@@ -31,8 +31,8 @@ static void print_buttons(WINDOW * dialog, int height, int width, int selected)
 	int x = width / 2 - 11;
 	int y = height - 2;
 
-	print_button(dialog, "  Ok  ", y, x, selected == 0);
-	print_button(dialog, " Help ", y, x + 14, selected == 1);
+	print_button(dialog, gettext("  Ok  "), y, x, selected == 0);
+	print_button(dialog, gettext(" Help "), y, x + 14, selected == 1);
 
 	wmove(dialog, y, x + 1 + 14 * selected);
 	wrefresh(dialog);
diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/lxdialog/menubox.c
index 0d83159..fa9d633 100644
--- a/scripts/kconfig/lxdialog/menubox.c
+++ b/scripts/kconfig/lxdialog/menubox.c
@@ -157,9 +157,9 @@ static void print_buttons(WINDOW * win, int height, int width, int selected)
 	int x = width / 2 - 16;
 	int y = height - 2;
 
-	print_button(win, "Select", y, x, selected == 0);
-	print_button(win, " Exit ", y, x + 12, selected == 1);
-	print_button(win, " Help ", y, x + 24, selected == 2);
+	print_button(win, gettext("Select"), y, x, selected == 0);
+	print_button(win, gettext(" Exit "), y, x + 12, selected == 1);
+	print_button(win, gettext(" Help "), y, x + 24, selected == 2);
 
 	wmove(win, y, x + 1 + 12 * selected);
 	wrefresh(win);
diff --git a/scripts/kconfig/lxdialog/textbox.c b/scripts/kconfig/lxdialog/textbox.c
index fabfc1a..c704712 100644
--- a/scripts/kconfig/lxdialog/textbox.c
+++ b/scripts/kconfig/lxdialog/textbox.c
@@ -114,7 +114,7 @@ do_resize:
 
 	print_title(dialog, title, width);
 
-	print_button(dialog, " Exit ", height - 2, width / 2 - 4, TRUE);
+	print_button(dialog, gettext(" Exit "), height - 2, width / 2 - 4, TRUE);
 	wnoutrefresh(dialog);
 	getyx(dialog, cur_y, cur_x);	/* Save cursor position */
 
diff --git a/scripts/kconfig/lxdialog/yesno.c b/scripts/kconfig/lxdialog/yesno.c
index ee0a04e..4e6e809 100644
--- a/scripts/kconfig/lxdialog/yesno.c
+++ b/scripts/kconfig/lxdialog/yesno.c
@@ -29,8 +29,8 @@ static void print_buttons(WINDOW * dialog, int height, int width, int selected)
 	int x = width / 2 - 10;
 	int y = height - 2;
 
-	print_button(dialog, " Yes ", y, x, selected == 0);
-	print_button(dialog, "  No  ", y, x + 13, selected == 1);
+	print_button(dialog, gettext(" Yes "), y, x, selected == 0);
+	print_button(dialog, gettext("  No  "), y, x + 13, selected == 1);
 
 	wmove(dialog, y, x + 1 + 13 * selected);
 	wrefresh(dialog);
-- 
1.5.4.rc3.14.g44397

