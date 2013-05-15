Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:50963 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759019Ab3EOOGE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 May 2013 10:06:04 -0400
Received: from mx10.gouders.net (localhost [127.0.0.1])
	by mx10.gouders.net (8.14.6/8.14.5) with ESMTP id r4FE62hv031998
	for <linux-kbuild@vger.kernel.org>; Wed, 15 May 2013 16:06:02 +0200
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH] mconf: suppress empty submenus
Date: Wed, 15 May 2013 16:05:38 +0200
Message-Id: <1368626738-31911-2-git-send-email-dirk@gouders.net>
In-Reply-To: <1368626738-31911-1-git-send-email-dirk@gouders.net>
References: <1368626738-31911-1-git-send-email-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Empty submenus are at least annoying but could also cause
irritation.

In general they can be suppressed by the kconfig-language but there
might be cases when this becomes challenging.

mconf has a function menu_is_visible() that was almost able
to identify empty submenus.  This function has been modified.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 scripts/kconfig/mconf.c |  5 +++
 scripts/kconfig/menu.c  | 88 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 387dc8d..ed7f214 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -22,6 +22,8 @@
 #include "lkc.h"
 #include "lxdialog/dialog.h"
 
+void debug_print_visibles(struct menu *menu);
+
 static const char mconf_readme[] = N_(
 "Overview\n"
 "--------\n"
@@ -1025,6 +1027,9 @@ int main(int ac, char **av)
 
 	set_config_filename(conf_get_configname());
 	conf_set_message_callback(conf_message_callback);
+
+	debug_print_visibles(&rootmenu);
+
 	do {
 		conf(&rootmenu, NULL);
 		res = handle_exit();
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index b5c7d90..c854e5f 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -430,6 +430,94 @@ bool menu_has_prompt(struct menu *menu)
 	return true;
 }
 
+void debug_print_visibles(struct menu *menu);
+bool menu_is_visible_new(struct menu *menu);
+
+void debug_print_visibles(struct menu *menu)
+{
+	int diff;
+
+	for (; menu; menu = menu->next) {
+		if (menu->prompt) {
+			if ((diff = (menu_is_visible_new(menu) - menu_is_visible(menu))))
+				fprintf(stderr, "%s is now %s\n", menu->prompt->text,
+					diff > 0 ? "visible" : "invisible");
+			if (menu->list) {
+				debug_print_visibles(menu->list);
+			}
+		} else {
+			/*
+			 * Check if there are menu entries without a
+			 * prompt but with a list.
+			*/
+			assert(!menu->list);
+		}
+	}
+}
+
+bool menu_is_visible_new(struct menu *menu)
+{
+	struct menu *child;
+	struct symbol *sym;
+	tristate visible;
+
+	/* If there is no prompt there nothing to visualize */
+	if (!menu->prompt)
+		return false;
+
+	/*
+	 * If the menu entry has an associated visibility expression
+	 * that evaluates to no, then it beats anything else.
+	 */
+	if (menu->visibility) {
+		if (expr_calc_value(menu->visibility) == no)
+			return no;
+	}
+
+	/* Check the prompt's visibility. */
+	sym = menu->sym;
+	if (sym) {
+		sym_calc_value(sym);
+		visible = menu->prompt->visible.tri;
+	} else
+		visible = menu->prompt->visible.tri = expr_calc_value(menu->prompt->visible.expr);
+
+	/*
+	 * If we are not a menu or we are a menu but also a symbol and
+	 * the calculated visibility is other than no, we're done.
+	 */
+	if ((menu->prompt->type != P_MENU || sym) && visible != no) return true;
+
+	/*
+	 * Now, we are probably a visible menue (and no symbol) but
+	 * still have to find out if there is anything visible beneath
+	 * us.  If not, we want to be invisible.
+	 *
+	 * Or, we are an invisible symbol and want to be visible if
+	 * there is something visible beneath us.
+	 */
+
+	/*
+	 * If we are an invisible symbol, we're done.
+	 */
+	if (sym && sym_get_tristate_value(menu->sym) == no)
+		return false;
+
+	/*
+	 * If we find a visible child, we also want to be visible.
+	 * Otherwise we are invisible.
+	 */
+	for (child = menu->list; child; child = child->next) {
+		if (menu_is_visible(child)) {
+			if (sym)
+				sym->flags |= SYMBOL_DEF_USER;
+			return true;
+		}
+	}
+
+	return false;
+}
+
 bool menu_is_visible(struct menu *menu)
 {
 	struct menu *child;
-- 
1.8.2.1

