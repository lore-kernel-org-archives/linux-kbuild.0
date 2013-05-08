Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:35565 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754309Ab3EHMgy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 May 2013 08:36:54 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: RFC: let lxdialog/util.c:print_autowrap() handle newline characters
In-Reply-To: <gisj1xn0un.fsf@karga.hank.lab> (Dirk Gouders's message of "Wed,
	08 May 2013 13:54:24 +0200")
References: <gisj1xn0un.fsf@karga.hank.lab>
Date: Wed, 08 May 2013 14:36:44 +0200
Message-ID: <giobclmyw3.fsf@karga.hank.lab>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

--=-=-=
Content-Type: text/plain

Dirk Gouders <dirk@gouders.net> writes:

> Attached is a first version of a patch.  There are other (indirect)
> users of print_autowrap() but for now I just modified the text for the
> exit dialog.

Sorry for the noise, but I noticed that my patch did not propperly
handle cases with short first words of new sentences.  While at it I
noticed that strpbrk() makes the code more readable.

Dirk


--=-=-=
Content-Type: text/plain
Content-Disposition: attachment; filename=patch.txt
Content-Description: Patch

From 490668696c253bef74e8acd2ff943f20cc4da26b Mon Sep 17 00:00:00 2001
From: Dirk Gouders <dirk@gouders.net>
Date: Wed, 8 May 2013 14:28:30 +0200
Subject: [PATCH] mconf: let print_autowrap() handle newline characters.

When exiting menuconfig with unsaved changes, a dialog like the following is
shown

        Do you wish to save your new configuration ? <ESC><ESC>
        to continue.

The author of the dialog text specified a newline and probably
expected it to be processed, so let print_autowrap() handle newlines propperly.
---
 scripts/kconfig/lxdialog/util.c | 31 +++++++++++++++++--------------
 scripts/kconfig/mconf.c         |  4 ++--
 2 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
index a0e97c2..50a3b68 100644
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
+	char tempstr[MAX_LEN + 1], *word, *sp, *sp2, *newline_separator;
 
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
@@ -401,7 +393,10 @@ void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
 		newl = 1;
 		word = tempstr;
 		while (word && *word) {
-			sp = strchr(word, ' ');
+			sp = strpbrk(word, "\n ");
+			if (sp && *sp == '\n')
+				newline_separator = sp;
+
 			if (sp)
 				*sp++ = 0;
 
@@ -413,7 +408,7 @@ void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
 			if (wlen > room ||
 			    (newl && wlen < 4 && sp
 			     && wlen + 1 + strlen(sp) > room
-			     && (!(sp2 = strchr(sp, ' '))
+			     && (!(sp2 = strpbrk(sp, "\n "))
 				 || wlen + 1 + (sp2 - sp) > room))) {
 				cur_y++;
 				cur_x = x;
@@ -421,7 +416,15 @@ void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
 			wmove(win, cur_y, cur_x);
 			waddstr(win, word);
 			getyx(win, cur_y, cur_x);
-			cur_x++;
+
+			/* Move to the next line if the word separator was a newline */
+			if (newline_separator) {
+				cur_y++;
+				cur_x = x;
+				newline_separator = 0;
+			} else
+				cur_x++;
+
 			if (sp && *sp == ' ') {
 				cur_x++;	/* double space */
 				while (*++sp == ' ') ;
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 387dc8d..a258b8c 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -956,8 +956,8 @@ static int handle_exit(void)
 	dialog_clear();
 	if (conf_get_changed())
 		res = dialog_yesno(NULL,
-				   _("Do you wish to save your new configuration ?\n"
-				     "<ESC><ESC> to continue."),
+				   _("Do you wish to save your new configuration?\n"
+				     "(Press <ESC><ESC> to continue kernel configuration.)"),
 				   6, 60);
 	else
 		res = -1;
-- 
1.8.2.1


--=-=-=--
