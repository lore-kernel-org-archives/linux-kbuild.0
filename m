Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:35555 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755294Ab3EHMaE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 May 2013 08:30:04 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: RFC: let lxdialog/util.c:print_autowrap() handle newline characters
Date: Wed, 08 May 2013 13:54:24 +0200
Message-ID: <gisj1xn0un.fsf@karga.hank.lab>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

--=-=-=
Content-Type: text/plain

Hello Michal,

this is just a cosmetical issue and probably I oversee a reason why
print_autowrap() ignores newline characters:

When I exit menuconfig with unsaved changes I get a dialog that looks
like

             Do you wish to save your new configuration ? <ESC><ESC>
             to continue.

and I thought that could look prettier (and probably should use complete
sentences).

In mconf.c, the above text is defined with a newline, so I guess the
author expected it to be processed, but the comment before
print_autowrap() clearly states that newline characters will be replaced
by spaces.  I am not sure if this is a must -- I did not find a reason
why print_autowrap() should not process newline characters and gave it a
try.

Attached is a first version of a patch.  There are other (indirect)
users of print_autowrap() but for now I just modified the text for the
exit dialog.

Dirk


--=-=-=
Content-Type: text/plain
Content-Disposition: attachment; filename=patch.txt
Content-Description: patch

From b09a6b6bb171ebc3cd0db0605a9ab32554eadb6b Mon Sep 17 00:00:00 2001
From: Dirk Gouders <dirk@gouders.net>
Date: Wed, 8 May 2013 13:04:44 +0200
Subject: [PATCH] mconf: let print_autowrap() handle newline characters.

When exiting menuconfig with unsaved changes, a dialog like the following is
shown

        Do you wish to save your new configuration ? <ESC><ESC>
        to continue.

The author of the dialog text specified a newline and probably
expected it to be processed, so let print_autowrap() handle newlines propperly.
---
 scripts/kconfig/lxdialog/util.c | 34 ++++++++++++++++++++++------------
 scripts/kconfig/mconf.c         |  8 ++++----
 2 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
index a0e97c2..d362364 100644
--- a/scripts/kconfig/lxdialog/util.c
+++ b/scripts/kconfig/lxdialog/util.c
@@ -371,27 +371,19 @@ void print_title(WINDOW *dialog, const char *title, int width)
 /*
  * Print a string of text in a window, automatically wrap around to the
  * next line if the string is too long to fit on one line. Newline
- * characters '\n' are replaced by spaces.  We start on a new line
+ * characters '\n' are propperly processed.  We start on a new line
  * if there is no room for at least 4 nonblanks following a double-space.
  */
 void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
 {
 	int newl, cur_x, cur_y;
-	int i, prompt_len, room, wlen;
-	char tempstr[MAX_LEN + 1], *word, *sp, *sp2;
+	int prompt_len, room, wlen;
+	char tempstr[MAX_LEN + 1], *word, *sp, *sp2, *newline;
 
 	strcpy(tempstr, prompt);
 
 	prompt_len = strlen(tempstr);
 
-	/*
-	 * Remove newlines
-	 */
-	for (i = 0; i < prompt_len; i++) {
-		if (tempstr[i] == '\n')
-			tempstr[i] = ' ';
-	}
-
 	if (prompt_len <= width - x * 2) {	/* If prompt is short */
 		wmove(win, y, (width - prompt_len) / 2);
 		waddstr(win, tempstr);
@@ -402,6 +394,17 @@ void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
 		word = tempstr;
 		while (word && *word) {
 			sp = strchr(word, ' ');
+			newline = strchr(word, '\n');
+
+			/* If we found a newline, then check if there are other
+			   word separators (spaces) in front of it that we must respect. */
+			if (newline) {
+				if (sp && (newline > sp))
+					newline = 0;
+				else {
+					sp = newline;
+				}
+			}
 			if (sp)
 				*sp++ = 0;
 
@@ -421,7 +424,14 @@ void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
 			wmove(win, cur_y, cur_x);
 			waddstr(win, word);
 			getyx(win, cur_y, cur_x);
-			cur_x++;
+
+			/* Move to the next line if the word separator was a newline */
+			if (newline) {
+				cur_y++;
+				cur_x = x;
+			} else
+				cur_x++;
+
 			if (sp && *sp == ' ') {
 				cur_x++;	/* double space */
 				while (*++sp == ' ') ;
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 387dc8d..4f56ec6 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -955,10 +955,10 @@ static int handle_exit(void)
 	reset_subtitle();
 	dialog_clear();
 	if (conf_get_changed())
-		res = dialog_yesno(NULL,
-				   _("Do you wish to save your new configuration ?\n"
-				     "<ESC><ESC> to continue."),
-				   6, 60);
+		res = dialog_yesno("Exit Kernel Configuration",
+				   _("Do you wish to save your new configuration?\n\n"
+				     "(Press <ESC><ESC> to continue kernel configuration.)"),
+				   8, 60);
 	else
 		res = -1;
 
-- 
1.8.2.1


--=-=-=--
