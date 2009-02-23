Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ti-out-0910.google.com ([209.85.142.184]:26146 "EHLO
	ti-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755344AbZBWPKY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Feb 2009 10:10:24 -0500
From: Cheng Renquan <crquan@gmail.com>
Subject: [PATCH 3/6] [KBUILD] menuconfig improvements
Date: Mon, 23 Feb 2009 23:10:01 +0800
Message-Id: <1235401804-8136-4-git-send-email-crquan@gmail.com>
In-Reply-To: <1235401804-8136-3-git-send-email-crquan@gmail.com>
References: <1235401804-8136-1-git-send-email-crquan@gmail.com>
 <1235401804-8136-2-git-send-email-crquan@gmail.com>
 <1235401804-8136-3-git-send-email-crquan@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, cr_quan@163.com

The removed functions are moved into menu.c for sharing with
gconfig & xconfig & config.

Signed-off-by: Cheng Renquan <crquan@gmail.com>
---
 scripts/kconfig/mconf.c |   78 ++---------------------------------------------
 1 files changed, 3 insertions(+), 75 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 6841e95..51ee1f8 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -199,8 +199,6 @@ inputbox_instructions_string[] = N_(
 setmod_text[] = N_(
 	"This feature depends on another which has been configured as a module.\n"
 	"As a result, this feature will be built as a module."),
-nohelp_text[] = N_(
-	"There is no help available for this kernel option.\n"),
 load_config_text[] = N_(
 	"Enter the name of the configuration file you wish to load.  "
 	"Accept the name shown to restore the configuration you "
@@ -284,66 +282,6 @@ static void show_textbox(const char *title, const char *text, int r, int c);
 static void show_helptext(const char *title, const char *text);
 static void show_help(struct menu *menu);
 
-static void get_prompt_str(struct gstr *r, struct property *prop)
-{
-	int i, j;
-	struct menu *submenu[8], *menu;
-
-	str_printf(r, _("Prompt: %s\n"), _(prop->text));
-	str_printf(r, _("  Defined at %s:%d\n"), prop->menu->file->name,
-		prop->menu->lineno);
-	if (!expr_is_yes(prop->visible.expr)) {
-		str_append(r, _("  Depends on: "));
-		expr_gstr_print(prop->visible.expr, r);
-		str_append(r, "\n");
-	}
-	menu = prop->menu->parent;
-	for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent)
-		submenu[i++] = menu;
-	if (i > 0) {
-		str_printf(r, _("  Location:\n"));
-		for (j = 4; --i >= 0; j += 2) {
-			menu = submenu[i];
-			str_printf(r, "%*c-> %s", j, ' ', _(menu_get_prompt(menu)));
-			if (menu->sym) {
-				str_printf(r, " (%s [=%s])", menu->sym->name ?
-					menu->sym->name : _("<choice>"),
-					sym_get_string_value(menu->sym));
-			}
-			str_append(r, "\n");
-		}
-	}
-}
-
-static void get_symbol_str(struct gstr *r, struct symbol *sym)
-{
-	bool hit;
-	struct property *prop;
-
-	if (sym && sym->name)
-		str_printf(r, "Symbol: %s [=%s]\n", sym->name,
-		                                    sym_get_string_value(sym));
-	for_all_prompts(sym, prop)
-		get_prompt_str(r, prop);
-	hit = false;
-	for_all_properties(sym, prop, P_SELECT) {
-		if (!hit) {
-			str_append(r, "  Selects: ");
-			hit = true;
-		} else
-			str_printf(r, " && ");
-		expr_gstr_print(prop->expr, r);
-	}
-	if (hit)
-		str_append(r, "\n");
-	if (sym->rev_dep.expr) {
-		str_append(r, _("  Selected by: "));
-		expr_gstr_print(sym->rev_dep.expr, r);
-		str_append(r, "\n");
-	}
-	str_append(r, "\n\n");
-}
-
 static struct gstr get_relations_str(struct symbol **sym_arr)
 {
 	struct symbol *sym;
@@ -699,19 +637,9 @@ static void show_helptext(const char *title, const char *text)
 static void show_help(struct menu *menu)
 {
 	struct gstr help = str_new();
-	struct symbol *sym = menu->sym;
-
-	if (menu_has_help(menu))
-	{
-		if (sym->name) {
-			str_printf(&help, "CONFIG_%s:\n\n", sym->name);
-			str_append(&help, _(menu_get_help(menu)));
-			str_append(&help, "\n");
-		}
-	} else {
-		str_append(&help, nohelp_text);
-	}
-	get_symbol_str(&help, sym);
+
+	menu_get_ext_help(menu, &help);
+
 	show_helptext(_(menu_get_prompt(menu)), str_get(&help));
 	str_free(&help);
 }
-- 
1.6.0.6

