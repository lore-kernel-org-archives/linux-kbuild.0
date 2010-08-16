Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:63818 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751627Ab0HPE2q (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 00:28:46 -0400
Received: by gxk23 with SMTP id 23so1750426gxk.19
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Aug 2010 21:28:45 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 1/4] kbuild: don't assign `stdout' and `stderr'
Date: Mon, 16 Aug 2010 00:19:03 -0400
Message-Id: <1281932346-19067-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>, Nir Tzachar <nir.tzachar@gmail.com>

These may not be modifiable, as per C99 comment:

section 7.19.5.4, note 232:
"
The primary use of the freopen function is to change the file associated with a
standard text stream (stderr, stdin, or stdout), as those identifiers need not
be modifiable lvalues to which the value returned by the fopen function may be
assigned.
"

Use a duplicate of stdout as ncurses' output terminal, then redirect it
to /dev/null for conf_write().

This fixes nconf.c build on NetBSD.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
CC: Nir Tzachar <nir.tzachar@gmail.com>
---
 scripts/kconfig/nconf.c |   46 +++++++++++++++++++++-------------------------
 1 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 2ba71bc..e08a064 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -709,25 +709,6 @@ static const char *set_config_filename(const char *config_filename)
 	return menu_backtitle;
 }
 
-/* command = 0 is supress, 1 is restore */
-static void supress_stdout(int command)
-{
-	static FILE *org_stdout;
-	static FILE *org_stderr;
-
-	if (command == 0) {
-		org_stdout = stdout;
-		org_stderr = stderr;
-		stdout = fopen("/dev/null", "a");
-		stderr = fopen("/dev/null", "a");
-	} else {
-		fclose(stdout);
-		fclose(stderr);
-		stdout = org_stdout;
-		stderr = org_stderr;
-	}
-}
-
 /* return = 0 means we are successful.
  * -1 means go on doing what you were doing
  */
@@ -753,9 +734,7 @@ static int do_exit(void)
 	/* if we got here, the user really wants to exit */
 	switch (res) {
 	case 0:
-		supress_stdout(0);
 		res = conf_write(filename);
-		supress_stdout(1);
 		if (res)
 			btn_dialog(
 				main_window,
@@ -1449,9 +1428,7 @@ static void conf_save(void)
 		case 0:
 			if (!dialog_input_result[0])
 				return;
-			supress_stdout(0);
 			res = conf_write(dialog_input_result);
-			supress_stdout(1);
 			if (!res) {
 				char buf[1024];
 				sprintf(buf, "%s %s",
@@ -1495,6 +1472,8 @@ void setup_windows(void)
 int main(int ac, char **av)
 {
 	char *mode;
+	FILE *fp;
+	int fd;
 
 	setlocale(LC_ALL, "");
 	bindtextdomain(PACKAGE, LOCALEDIR);
@@ -1509,8 +1488,25 @@ int main(int ac, char **av)
 			single_menu_mode = 1;
 	}
 
+	/* Duplicate stdout before redirecting it */
+	fd = dup(STDOUT_FILENO);
+	if (fd < 0) {
+		perror("dup");
+		return 1;
+	}
+
+	fp = fdopen(fd, "a");
+	if (fp == NULL) {
+		perror("fdopen");
+		return 1;
+	}
+
+	freopen("/dev/null", "a", stdout);
+	freopen("/dev/null", "a", stderr);
+
 	/* Initialize curses */
-	initscr();
+	newterm(NULL, fp, stdin);
+
 	/* set color theme */
 	set_colors();
 
@@ -1521,7 +1517,7 @@ int main(int ac, char **av)
 
 	if (COLS < 75 || LINES < 20) {
 		endwin();
-		printf("Your terminal should have at "
+		fprintf(fp, "Your terminal should have at "
 			"least 20 lines and 75 columns\n");
 		return 1;
 	}
-- 
1.7.2.30.gc37d7.dirty

