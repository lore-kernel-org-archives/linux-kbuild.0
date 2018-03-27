Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:44598 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751838AbeC0FcA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 01:32:00 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 06/21] kconfig: remove string expansion for mainmenu after yyparse()
Date: Tue, 27 Mar 2018 14:29:20 +0900
Message-Id: <1522128575-5326-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Now that environments are expanded in the lexer, conf_parse() does
not need to explicitly expand $ARCH and $KERNELVERSION in the mainmenu.

The hack introduced by commit 0724a7c32a54 ("kconfig: Don't leak
main menus during parsing") can go away.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Simplify the patch.  Just remove the text expansion.

 scripts/kconfig/zconf.y | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 4ff4ac9..d8120c7 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -109,7 +109,7 @@ static struct menu *current_menu, *current_entry;
 %%
 input: nl start | start;
 
-start: mainmenu_stmt stmt_list | no_mainmenu_stmt stmt_list;
+start: mainmenu_stmt stmt_list | stmt_list;
 
 /* mainmenu entry */
 
@@ -118,19 +118,6 @@ mainmenu_stmt: T_MAINMENU prompt nl
 	menu_add_prompt(P_MENU, $2, NULL);
 };
 
-/* Default main menu, if there's no mainmenu entry */
-
-no_mainmenu_stmt: /* empty */
-{
-	/*
-	 * Hack: Keep the main menu title on the heap so we can safely free it
-	 * later regardless of whether it comes from the 'prompt' in
-	 * mainmenu_stmt or here
-	 */
-	menu_add_prompt(P_MENU, xstrdup("Linux Kernel Configuration"), NULL);
-};
-
-
 stmt_list:
 	  /* empty */
 	| stmt_list common_stmt
@@ -528,7 +515,6 @@ word_opt: /* empty */			{ $$ = NULL; }
 
 void conf_parse(const char *name)
 {
-	const char *tmp;
 	struct symbol *sym;
 	int i;
 
@@ -544,10 +530,10 @@ void conf_parse(const char *name)
 	if (!modules_sym)
 		modules_sym = sym_find( "n" );
 
-	tmp = rootmenu.prompt->text;
-	rootmenu.prompt->text = _(rootmenu.prompt->text);
-	rootmenu.prompt->text = expand_string_value(rootmenu.prompt->text);
-	free((char*)tmp);
+	if (!menu_has_prompt(&rootmenu)) {
+		current_entry = &rootmenu;
+		menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
+	}
 
 	menu_finalize(&rootmenu);
 	for_all_symbols(i, sym) {
-- 
2.7.4

