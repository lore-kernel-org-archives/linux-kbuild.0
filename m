Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:50048 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933094AbdEWBpA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 May 2017 21:45:00 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kconfig: fix sparse warnings in nconfig
Message-ID: <c3e8b332-3e13-3483-e893-c0aed498fbe9@infradead.org>
Date: Mon, 22 May 2017 18:44:57 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter <dan.carpenter@oracle.com>, Masahiro Yamada <yamada.masahiro@socionext.com>

From: Randy Dunlap <rdunlap@infradead.org>

Fix sparse warnings in scripts/kconfig/nconf* ('make nconfig'):

../scripts/kconfig/nconf.c:1071:32: warning: Using plain integer as NULL pointer
../scripts/kconfig/nconf.c:1238:30: warning: Using plain integer as NULL pointer
../scripts/kconfig/nconf.c:511:51: warning: Using plain integer as NULL pointer
../scripts/kconfig/nconf.c:1460:6: warning: symbol 'setup_windows' was not declared. Should it be static?
../scripts/kconfig/nconf.c:274:12: warning: symbol 'current_instructions' was not declared. Should it be static?
../scripts/kconfig/nconf.c:308:22: warning: symbol 'function_keys' was not declared. Should it be static?
../scripts/kconfig/nconf.gui.c:132:17: warning: non-ANSI function declaration of function 'set_colors'
../scripts/kconfig/nconf.gui.c:195:24: warning: Using plain integer as NULL pointer

nconf.gui.o before/after files are the same.
nconf.o before/after files are the same until the 'static' function
declarations are added.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 scripts/kconfig/nconf.c     |   12 ++++++------
 scripts/kconfig/nconf.gui.c |    4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

--- lnx-411.orig/scripts/kconfig/nconf.gui.c
+++ lnx-411/scripts/kconfig/nconf.gui.c
@@ -129,7 +129,7 @@ static void no_colors_theme(void)
 	mkattrn(FUNCTION_TEXT, A_REVERSE);
 }
 
-void set_colors()
+void set_colors(void)
 {
 	start_color();
 	use_default_colors();
@@ -192,7 +192,7 @@ const char *get_line(const char *text, i
 	int lines = 0;
 
 	if (!text)
-		return 0;
+		return NULL;
 
 	for (i = 0; text[i] != '\0' && lines < line_no; i++)
 		if (text[i] == '\n')
--- lnx-411.orig/scripts/kconfig/nconf.c
+++ lnx-411/scripts/kconfig/nconf.c
@@ -271,7 +271,7 @@ static struct mitem k_menu_items[MAX_MEN
 static int items_num;
 static int global_exit;
 /* the currently selected button */
-const char *current_instructions = menu_instructions;
+static const char *current_instructions = menu_instructions;
 
 static char *dialog_input_result;
 static int dialog_input_result_len;
@@ -305,7 +305,7 @@ struct function_keys {
 };
 
 static const int function_keys_num = 9;
-struct function_keys function_keys[] = {
+static struct function_keys function_keys[] = {
 	{
 		.key_str = "F1",
 		.func = "Help",
@@ -508,7 +508,7 @@ static int get_mext_match(const char *ma
 	index = (index + items_num) % items_num;
 	while (true) {
 		char *str = k_menu_items[index].str;
-		if (strcasestr(str, match_str) != 0)
+		if (strcasestr(str, match_str) != NULL)
 			return index;
 		if (flag == FIND_NEXT_MATCH_UP ||
 		    flag == MATCH_TINKER_PATTERN_UP)
@@ -1068,7 +1068,7 @@ static int do_match(int key, struct matc
 
 static void conf(struct menu *menu)
 {
-	struct menu *submenu = 0;
+	struct menu *submenu = NULL;
 	const char *prompt = menu_get_prompt(menu);
 	struct symbol *sym;
 	int res;
@@ -1235,7 +1235,7 @@ static void show_help(struct menu *menu)
 static void conf_choice(struct menu *menu)
 {
 	const char *prompt = _(menu_get_prompt(menu));
-	struct menu *child = 0;
+	struct menu *child = NULL;
 	struct symbol *active;
 	int selected_index = 0;
 	int last_top_row = 0;
@@ -1457,7 +1457,7 @@ static void conf_save(void)
 	}
 }
 
-void setup_windows(void)
+static void setup_windows(void)
 {
 	int lines, columns;
 


