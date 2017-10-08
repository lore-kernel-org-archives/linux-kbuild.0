Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:55324 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753259AbdJHRMU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Oct 2017 13:12:20 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 4/6] Kconfig: Don't leak main menus during parsing
Date: Sun,  8 Oct 2017 19:11:21 +0200
Message-Id: <1507482683-22651-5-git-send-email-ulfalizer@gmail.com>
In-Reply-To: <1507482683-22651-1-git-send-email-ulfalizer@gmail.com>
References: <1507482683-22651-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, michal.lkml@markovi.net, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, walch.martin@web.de, JBeulich@suse.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

If a 'mainmenu' entry appeared in the Kconfig files, two things would
leak:

	- The 'struct property' allocated for the default "Linux Kernel
	  Configuration" prompt.

	- The string for the T_WORD/T_WORD_QUOTE prompt after the
	  T_MAINMENU token, allocated on the heap in zconf.l.

To fix it, introduce a new 'no_mainmenu_stmt' nonterminal that matches
if there's no 'mainmenu' and adds the default prompt. That means the
prompt only gets allocated once regardless of whether there's a
'mainmenu' statement or not, and managing it becomes simple.

Summary from Valgrind on 'menuconfig' (ARCH=x86) before the fix:

	LEAK SUMMARY:
	   definitely lost: 344,568 bytes in 14,352 blocks
	   ...

Summary after the fix:

	LEAK SUMMARY:
	   definitely lost: 344,440 bytes in 14,350 blocks
	   ...

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/zconf.y | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index ea6ae16..468ab03 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -109,7 +109,27 @@ static struct menu *current_menu, *current_entry;
 %%
 input: nl start | start;
 
-start: mainmenu_stmt stmt_list | stmt_list;
+start: mainmenu_stmt stmt_list | no_mainmenu_stmt stmt_list;
+
+/* mainmenu entry */
+
+mainmenu_stmt: T_MAINMENU prompt nl
+{
+	menu_add_prompt(P_MENU, $2, NULL);
+};
+
+/* Default main menu, if there's no mainmenu entry */
+
+no_mainmenu_stmt: /* empty */
+{
+	/*
+	 * Hack: Keep the main menu title on the heap so we can safely free it
+	 * later regardless of whether it comes from the 'prompt' in
+	 * mainmenu_stmt or here
+	 */
+	menu_add_prompt(P_MENU, strdup("Linux Kernel Configuration"), NULL);
+};
+
 
 stmt_list:
 	  /* empty */
@@ -352,13 +372,6 @@ if_block:
 	| if_block choice_stmt
 ;
 
-/* mainmenu entry */
-
-mainmenu_stmt: T_MAINMENU prompt nl
-{
-	menu_add_prompt(P_MENU, $2, NULL);
-};
-
 /* menu entry */
 
 menu: T_MENU prompt T_EOL
@@ -507,6 +520,7 @@ word_opt: /* empty */			{ $$ = NULL; }
 
 void conf_parse(const char *name)
 {
+	const char *tmp;
 	struct symbol *sym;
 	int i;
 
@@ -514,7 +528,6 @@ void conf_parse(const char *name)
 
 	sym_init();
 	_menu_init();
-	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
 
 	if (getenv("ZCONF_DEBUG"))
 		zconfdebug = 1;
@@ -524,8 +537,10 @@ void conf_parse(const char *name)
 	if (!modules_sym)
 		modules_sym = sym_find( "n" );
 
+	tmp = rootmenu.prompt->text;
 	rootmenu.prompt->text = _(rootmenu.prompt->text);
 	rootmenu.prompt->text = sym_expand_string_value(rootmenu.prompt->text);
+	free((char*)tmp);
 
 	menu_finalize(&rootmenu);
 	for_all_symbols(i, sym) {
-- 
2.7.4

