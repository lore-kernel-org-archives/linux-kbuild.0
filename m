Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:34638 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754806Ab1H2X56 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Aug 2011 19:57:58 -0400
Received: by gya6 with SMTP id 6so5229544gya.19
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Aug 2011 16:57:58 -0700 (PDT)
From: Cheng Renquan <crquan@gmail.com>
Subject: [PATCH 3/5] scripts/kconfig/nconf: dynamically alloc dialog_input_result
Date: Mon, 29 Aug 2011 16:56:02 -0700
Message-Id: <1314662164-8565-3-git-send-email-crquan@gmail.com>
In-Reply-To: <1314662164-8565-2-git-send-email-crquan@gmail.com>
References: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
 <1314662164-8565-1-git-send-email-crquan@gmail.com>
 <1314662164-8565-2-git-send-email-crquan@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Nir Tzachar <nir.tzachar@gmail.com>, Randy Dunlap <rdunlap@xenotime.net>, c.rq541@comcast.net

to support unlimited length string config items;

Signed-off-by: Cheng Renquan <crquan@gmail.com>
---
 scripts/kconfig/nconf.c     |   24 ++++++++++++++++--------
 scripts/kconfig/nconf.gui.c |   25 ++++++++++++++++++++-----
 scripts/kconfig/nconf.h     |    2 +-
 3 files changed, 37 insertions(+), 14 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 39ca1f1..ee37358 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -280,6 +280,9 @@ static int global_exit;
 /* the currently selected button */
 const char *current_instructions = menu_instructions;
 
+static char *dialog_input_result;
+static int dialog_input_result_len;
+
 static void conf(struct menu *menu);
 static void conf_choice(struct menu *menu);
 static void conf_string(struct menu *menu);
@@ -695,7 +698,6 @@ static void search_conf(void)
 {
 	struct symbol **sym_arr;
 	struct gstr res;
-	char dialog_input_result[100];
 	char *dialog_input;
 	int dres;
 again:
@@ -703,7 +705,7 @@ again:
 			_("Search Configuration Parameter"),
 			_("Enter " CONFIG_ " (sub)string to search for "
 				"(with or without \"" CONFIG_ "\")"),
-			"", dialog_input_result, 99);
+			"", dialog_input_result, &dialog_input_result_len);
 	switch (dres) {
 	case 0:
 		break;
@@ -1348,7 +1350,6 @@ static void conf_choice(struct menu *menu)
 static void conf_string(struct menu *menu)
 {
 	const char *prompt = menu_get_prompt(menu);
-	char dialog_input_result[256];
 
 	while (1) {
 		int res;
@@ -1372,7 +1373,7 @@ static void conf_string(struct menu *menu)
 				heading,
 				sym_get_string_value(menu->sym),
 				dialog_input_result,
-				sizeof(dialog_input_result));
+				&dialog_input_result_len);
 		switch (res) {
 		case 0:
 			if (sym_set_string_value(menu->sym,
@@ -1392,14 +1393,13 @@ static void conf_string(struct menu *menu)
 
 static void conf_load(void)
 {
-	char dialog_input_result[256];
 	while (1) {
 		int res;
 		res = dialog_inputbox(main_window,
 				NULL, load_config_text,
 				filename,
 				dialog_input_result,
-				sizeof(dialog_input_result));
+				&dialog_input_result_len);
 		switch (res) {
 		case 0:
 			if (!dialog_input_result[0])
@@ -1424,14 +1424,13 @@ static void conf_load(void)
 
 static void conf_save(void)
 {
-	char dialog_input_result[256];
 	while (1) {
 		int res;
 		res = dialog_inputbox(main_window,
 				NULL, save_config_text,
 				filename,
 				dialog_input_result,
-				sizeof(dialog_input_result));
+				&dialog_input_result_len);
 		switch (res) {
 		case 0:
 			if (!dialog_input_result[0])
@@ -1488,6 +1487,15 @@ int main(int ac, char **av)
 			single_menu_mode = 1;
 	}
 
+	/* initially alloc 2048 bytes for dialog_input_result */
+	dialog_input_result_len = 2048;
+	dialog_input_result = malloc(dialog_input_result_len);
+	if (!dialog_input_result) {
+		fprintf(stderr, "Not enough memory for dialog_input_result(%d)\n",
+			dialog_input_result_len);
+		exit(1);
+	}
+
 	/* Initialize curses */
 	initscr();
 	/* set color theme */
diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 3ce2a7c..bc482ad 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -356,7 +356,7 @@ int btn_dialog(WINDOW *main_window, const char *msg, int btn_num, ...)
 
 int dialog_inputbox(WINDOW *main_window,
 		const char *title, const char *prompt,
-		const char *init, char *result, int result_len)
+		const char *init, char *result, int *result_len)
 {
 	int prompt_lines = 0;
 	int prompt_width = 0;
@@ -368,6 +368,14 @@ int dialog_inputbox(WINDOW *main_window,
 	int res = -1;
 	int cursor_position = strlen(init);
 
+	if (strlen(init) > *result_len) {
+		do {
+			*result_len *= 2;
+		} while (strlen(init) > *result_len);
+		result = realloc(result, *result_len);
+		/* here didn't check result, if it's NULL,
+		   just let it silently fail (SegFault) */
+	}
 
 	/* find the widest line of msg: */
 	prompt_lines = get_line_no(prompt);
@@ -384,7 +392,7 @@ int dialog_inputbox(WINDOW *main_window,
 	y = (LINES-(prompt_lines+4))/2;
 	x = (COLS-(prompt_width+4))/2;
 
-	strncpy(result, init, result_len);
+	strncpy(result, init, *result_len);
 
 	/* create the windows */
 	win = newwin(prompt_lines+6, prompt_width+7, y, x);
@@ -443,7 +451,7 @@ int dialog_inputbox(WINDOW *main_window,
 		case KEY_UP:
 		case KEY_RIGHT:
 			if (cursor_position < len &&
-			    cursor_position < min(result_len, prompt_width))
+			    cursor_position < min(*result_len, prompt_width))
 				cursor_position++;
 			break;
 		case KEY_DOWN:
@@ -452,8 +460,15 @@ int dialog_inputbox(WINDOW *main_window,
 				cursor_position--;
 			break;
 		default:
-			if ((isgraph(res) || isspace(res)) &&
-					len-2 < result_len) {
+			if ((isgraph(res) || isspace(res))) {
+				/* one for new char, one for '\0' */
+				if (len+2 > *result_len) {
+					do {
+						*result_len *= 2;
+					} while (len+2 > *result_len);
+					result = realloc(result, *result_len);
+					/* silently fail in the same way above */
+				}
 				/* insert the char at the proper position */
 				memmove(&result[cursor_position+1],
 						&result[cursor_position],
diff --git a/scripts/kconfig/nconf.h b/scripts/kconfig/nconf.h
index 58fbda8..98b2c23 100644
--- a/scripts/kconfig/nconf.h
+++ b/scripts/kconfig/nconf.h
@@ -89,7 +89,7 @@ void fill_window(WINDOW *win, const char *text);
 int btn_dialog(WINDOW *main_window, const char *msg, int btn_num, ...);
 int dialog_inputbox(WINDOW *main_window,
 		const char *title, const char *prompt,
-		const char *init, char *result, int result_len);
+		const char *init, char *result, int *result_len);
 void refresh_all_windows(WINDOW *main_window);
 void show_scroll_win(WINDOW *main_window,
 		const char *title,
-- 
1.7.6

