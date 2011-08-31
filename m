Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:57185 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754881Ab1HaHxu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Aug 2011 03:53:50 -0400
Received: by iabu26 with SMTP id u26so504342iab.19
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Aug 2011 00:53:50 -0700 (PDT)
From: Cheng Renquan <crquan@gmail.com>
Subject: [PATCH V2 3/6] scripts/kconfig/nconf: dynamically alloc dialog_input_result
Date: Wed, 31 Aug 2011 00:46:10 -0700
Message-Id: <1314776773-9560-4-git-send-email-crquan@gmail.com>
In-Reply-To: <1314776773-9560-3-git-send-email-crquan@gmail.com>
References: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
 <1314776773-9560-1-git-send-email-crquan@gmail.com>
 <1314776773-9560-2-git-send-email-crquan@gmail.com>
 <1314776773-9560-3-git-send-email-crquan@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Nir Tzachar <nir.tzachar@gmail.com>, Randy Dunlap <rdunlap@xenotime.net>, c.rq541@comcast.net

To support unlimited length string config items;

No check for realloc return value keeps code simple, and to be
consistent with other existing unchecked malloc in kconfig.

Signed-off-by: Cheng Renquan <crquan@gmail.com>
Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/nconf.c     |   21 ++++++++++-----------
 scripts/kconfig/nconf.gui.c |   20 +++++++++++++++-----
 scripts/kconfig/nconf.h     |    2 +-
 3 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 39ca1f1..4248759 100644
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
+			"", &dialog_input_result, &dialog_input_result_len);
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
@@ -1371,8 +1372,8 @@ static void conf_string(struct menu *menu)
 				prompt ? _(prompt) : _("Main Menu"),
 				heading,
 				sym_get_string_value(menu->sym),
-				dialog_input_result,
-				sizeof(dialog_input_result));
+				&dialog_input_result,
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
-				dialog_input_result,
-				sizeof(dialog_input_result));
+				&dialog_input_result,
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
-				dialog_input_result,
-				sizeof(dialog_input_result));
+				&dialog_input_result,
+				&dialog_input_result_len);
 		switch (res) {
 		case 0:
 			if (!dialog_input_result[0])
diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 3ce2a7c..d64bc1c 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -356,7 +356,7 @@ int btn_dialog(WINDOW *main_window, const char *msg, int btn_num, ...)
 
 int dialog_inputbox(WINDOW *main_window,
 		const char *title, const char *prompt,
-		const char *init, char *result, int result_len)
+		const char *init, char **resultp, int *result_len)
 {
 	int prompt_lines = 0;
 	int prompt_width = 0;
@@ -367,7 +367,12 @@ int dialog_inputbox(WINDOW *main_window,
 	int i, x, y;
 	int res = -1;
 	int cursor_position = strlen(init);
+	char *result = *resultp;
 
+	if (strlen(init)+1 > *result_len) {
+		*result_len = strlen(init)+1;
+		*resultp = result = realloc(result, *result_len);
+	}
 
 	/* find the widest line of msg: */
 	prompt_lines = get_line_no(prompt);
@@ -384,7 +389,7 @@ int dialog_inputbox(WINDOW *main_window,
 	y = (LINES-(prompt_lines+4))/2;
 	x = (COLS-(prompt_width+4))/2;
 
-	strncpy(result, init, result_len);
+	strncpy(result, init, *result_len);
 
 	/* create the windows */
 	win = newwin(prompt_lines+6, prompt_width+7, y, x);
@@ -443,7 +448,7 @@ int dialog_inputbox(WINDOW *main_window,
 		case KEY_UP:
 		case KEY_RIGHT:
 			if (cursor_position < len &&
-			    cursor_position < min(result_len, prompt_width))
+			    cursor_position < min(*result_len, prompt_width))
 				cursor_position++;
 			break;
 		case KEY_DOWN:
@@ -452,8 +457,13 @@ int dialog_inputbox(WINDOW *main_window,
 				cursor_position--;
 			break;
 		default:
-			if ((isgraph(res) || isspace(res)) &&
-					len-2 < result_len) {
+			if ((isgraph(res) || isspace(res))) {
+				/* one for new char, one for '\0' */
+				if (len+2 > *result_len) {
+					*result_len = len+2;
+					*resultp = result = realloc(result,
+								*result_len);
+				}
 				/* insert the char at the proper position */
 				memmove(&result[cursor_position+1],
 						&result[cursor_position],
diff --git a/scripts/kconfig/nconf.h b/scripts/kconfig/nconf.h
index 58fbda8..0d52617 100644
--- a/scripts/kconfig/nconf.h
+++ b/scripts/kconfig/nconf.h
@@ -89,7 +89,7 @@ void fill_window(WINDOW *win, const char *text);
 int btn_dialog(WINDOW *main_window, const char *msg, int btn_num, ...);
 int dialog_inputbox(WINDOW *main_window,
 		const char *title, const char *prompt,
-		const char *init, char *result, int result_len);
+		const char *init, char **resultp, int *result_len);
 void refresh_all_windows(WINDOW *main_window);
 void show_scroll_win(WINDOW *main_window,
 		const char *title,
-- 
1.7.6

