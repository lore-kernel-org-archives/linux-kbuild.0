Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42840 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758793AbYAXWEJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:09 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 76/77] kconfig: tristate choices with mixed tristate and boolean values
Date: Thu, 24 Jan 2008 23:03:57 +0100
Message-Id: <1201212238-4369-76-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jan Beulich <jbeulich@novell.com>, Roman Zippel <zippel@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>

From: Jan Beulich <jbeulich@novell.com>

Change kconfig behavior so that mixing bool and tristate config
settings in a choice is possible and has the desired effect of offering
just the tristate options individually if the choice gets set to M, and
a normal boolean selection if the choice gets set to Y.

Also fix scripts/kconfig/conf's handling of children of choice values -
there may be more than one immediate child, and all of them need to be
processed.

Signed-off-by: Jan Beulich <jbeulich@novell.com>
Cc: "Roman Zippel" <zippel@linux-m68k.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/kconfig/conf.c |    4 ++--
 scripts/kconfig/expr.c |   10 ++++++++--
 scripts/kconfig/menu.c |   38 +++++++++++++++++++++++++++++++++++---
 3 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index d1a0368..fda6313 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -400,9 +400,9 @@ static int conf_choice(struct menu *menu)
 			continue;
 		}
 		sym_set_choice_value(sym, child->sym);
-		if (child->list) {
+		for (child = child->list; child; child = child->next) {
 			indent += 2;
-			conf(child->list);
+			conf(child);
 			indent -= 2;
 		}
 		return 1;
diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 13788ad..579ece4 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1034,12 +1034,18 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
 		expr_print(e->left.expr, fn, data, E_NOT);
 		break;
 	case E_EQUAL:
-		fn(data, e->left.sym, e->left.sym->name);
+		if (e->left.sym->name)
+			fn(data, e->left.sym, e->left.sym->name);
+		else
+			fn(data, NULL, "<choice>");
 		fn(data, NULL, "=");
 		fn(data, e->right.sym, e->right.sym->name);
 		break;
 	case E_UNEQUAL:
-		fn(data, e->left.sym, e->left.sym->name);
+		if (e->left.sym->name)
+			fn(data, e->left.sym, e->left.sym->name);
+		else
+			fn(data, NULL, "<choice>");
 		fn(data, NULL, "!=");
 		fn(data, e->right.sym, e->right.sym->name);
 		break;
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index e6ef171..fdad173 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -242,9 +242,11 @@ void menu_finalize(struct menu *parent)
 			for (menu = parent->list; menu; menu = menu->next) {
 				if (menu->sym) {
 					current_entry = parent;
-					menu_set_type(menu->sym->type);
+					if (sym->type == S_UNKNOWN)
+						menu_set_type(menu->sym->type);
 					current_entry = menu;
-					menu_set_type(sym->type);
+					if (menu->sym->type == S_UNKNOWN)
+						menu_set_type(sym->type);
 					break;
 				}
 			}
@@ -329,7 +331,37 @@ void menu_finalize(struct menu *parent)
 					    "values not supported");
 			}
 			current_entry = menu;
-			menu_set_type(sym->type);
+			if (menu->sym->type == S_UNKNOWN)
+				menu_set_type(sym->type);
+			/* Non-tristate choice values of tristate choices must
+			 * depend on the choice being set to Y. The choice
+			 * values' dependencies were propagated to their
+			 * properties above, so the change here must be re-
+			 * propagated. */
+			if (sym->type == S_TRISTATE && menu->sym->type != S_TRISTATE) {
+				basedep = expr_alloc_comp(E_EQUAL, sym, &symbol_yes);
+				basedep = expr_alloc_and(basedep, menu->dep);
+				basedep = expr_eliminate_dups(basedep);
+				menu->dep = basedep;
+				for (prop = menu->sym->prop; prop; prop = prop->next) {
+					if (prop->menu != menu)
+						continue;
+					dep = expr_alloc_and(expr_copy(basedep),
+							     prop->visible.expr);
+					dep = expr_eliminate_dups(dep);
+					dep = expr_trans_bool(dep);
+					prop->visible.expr = dep;
+					if (prop->type == P_SELECT) {
+						struct symbol *es = prop_get_symbol(prop);
+						dep2 = expr_alloc_symbol(menu->sym);
+						dep = expr_alloc_and(dep2,
+								     expr_copy(dep));
+						dep = expr_alloc_or(es->rev_dep.expr, dep);
+						dep = expr_eliminate_dups(dep);
+						es->rev_dep.expr = dep;
+					}
+				}
+			}
 			menu_add_symbol(P_CHOICE, sym, NULL);
 			prop = sym_get_choice_prop(sym);
 			for (ep = &prop->expr; *ep; ep = &(*ep)->left.expr)
-- 
1.5.4.rc3.14.g44397

