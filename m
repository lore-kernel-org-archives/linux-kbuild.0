Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap0.codethink.co.uk ([185.43.218.159]:33665 "EHLO
        imap0.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966049AbcKXWoB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Nov 2016 17:44:01 -0500
Message-ID: <1480025423.1860.87.camel@codethink.co.uk>
Subject: [PATCH] kconfig/nconf: Fix hang when editing symbol with a long
 prompt
From: Ben Hutchings <ben.hutchings@codethink.co.uk>
Date: Thu, 24 Nov 2016 22:10:23 +0000
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

Currently it is impossible to edit the value of a config symbol with a
prompt longer than (terminal width - 2) characters.  dialog_inputbox()
calculates a negative x-offset for the input window and newwin() fails
as this is invalid.  It also doesn't check for this failure, so it
busy-loops calling wgetch(NULL) which immediately returns -1.

The additions in the offset calculations also don't match the intended
size of the window.

Limit the window size and calculate the offset similarly to
show_scroll_win().

Cc: stable <stable@vger.kernel.org>
Fixes: 692d97c380c6 ("kconfig: new configuration interface (nconfig)")
Signed-off-by: Ben Hutchings <ben.hutchings@codethink.co.uk>
---
 scripts/kconfig/nconf.gui.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 8275f0e55106..4b2f44c20caf 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -364,12 +364,14 @@ int dialog_inputbox(WINDOW *main_window,
 	WINDOW *prompt_win;
 	WINDOW *form_win;
 	PANEL *panel;
-	int i, x, y;
+	int i, x, y, lines, columns, win_lines, win_cols;
 	int res = -1;
 	int cursor_position = strlen(init);
 	int cursor_form_win;
 	char *result = *resultp;
 
+	getmaxyx(stdscr, lines, columns);
+
 	if (strlen(init)+1 > *result_len) {
 		*result_len = strlen(init)+1;
 		*resultp = result = realloc(result, *result_len);
@@ -386,14 +388,19 @@ int dialog_inputbox(WINDOW *main_window,
 	if (title)
 		prompt_width = max(prompt_width, strlen(title));
 
+	win_lines = min(prompt_lines+6, lines-2);
+	win_cols = min(prompt_width+7, columns-2);
+	prompt_lines = max(win_lines-6, 0);
+	prompt_width = max(win_cols-7, 0);
+
 	/* place dialog in middle of screen */
-	y = (getmaxy(stdscr)-(prompt_lines+4))/2;
-	x = (getmaxx(stdscr)-(prompt_width+4))/2;
+	y = (lines-win_lines)/2;
+	x = (columns-win_cols)/2;
 
 	strncpy(result, init, *result_len);
 
 	/* create the windows */
-	win = newwin(prompt_lines+6, prompt_width+7, y, x);
+	win = newwin(win_lines, win_cols, y, x);
 	prompt_win = derwin(win, prompt_lines+1, prompt_width, 2, 2);
 	form_win = derwin(win, 1, prompt_width, prompt_lines+3, 2);
 	keypad(form_win, TRUE);
-- 
2.10.2


-- 
Ben Hutchings
Software Developer, Codethink Ltd.


