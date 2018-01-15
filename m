Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:37457 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750740AbeAOXJo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jan 2018 18:09:44 -0500
Received: by mail-wm0-f65.google.com with SMTP id v71so4980655wmv.2
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jan 2018 15:09:44 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
Subject: [PATCH v4 1/1] kconfig: menuconfig make "Selected by:" and "Depends on:" readable
Date: Tue, 16 Jan 2018 00:09:30 +0100
Message-Id: <20180115230930.8723-1-petr.vorel@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Masahiro Yamada <yamada.masahiro@socionext.com>

rev_dep expressions can get rather unwieldy, especially if a symbol is
selected by more than a handful of other symbols. I.e. it's possible to
have near endless expressions like:
   A && B && !C || D || F && (G || H) || [...]

Chop these expressions into actually readable chunks:
   - A && B && !C
   - D
   - F && (G || H)
   - [...]

I.e. transform the top level OR tokens into newlines and prepend each
line with a minus. This makes the "Selected by:" blurb much easier to
read. For consistency the same is done for "Depends on:" although the
problem isn't that bad for it. This is done only if there is more than
one top level OR.

This also prevents trimming too long lines.

Based on idea from Paul Bolle.

Reported-by: Paul Bolle <pebolle@tiscali.nl>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Tested on search USB and General setup -> Kernel compression mode (Gzip) -> Help.

Changes v3->v4:
* Add split also for "Depends on:". This is done for consistency (reported
  by Masahiro Yamada). I didn't consider other symbols which call expr_gstr_print()
  as reasonable candidates (i.e. "Implies:" and "Range : ").
* Add new line and hyphen only when there are more top level OR than one.
---
 scripts/kconfig/expr.c | 16 +++++++++++++---
 scripts/kconfig/menu.c |  4 ++++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index cbf4996dd9c1..4b4309b59349 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1070,6 +1070,8 @@ struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2)
 	return expr_get_leftmost_symbol(ret);
 }
 
+static int print_level = 0;
+
 void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken)
 {
 	if (!e) {
@@ -1077,8 +1079,11 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
 		return;
 	}
 
-	if (expr_compare_type(prevtoken, e->type) > 0)
+	if (expr_compare_type(prevtoken, e->type) > 0) {
+		print_level++;
 		fn(data, NULL, "(");
+	}
+
 	switch (e->type) {
 	case E_SYMBOL:
 		if (e->left.sym->name)
@@ -1126,7 +1131,10 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
 		break;
 	case E_OR:
 		expr_print(e->left.expr, fn, data, E_OR);
-		fn(data, NULL, " || ");
+		if (print_level == 0)
+			fn(data, NULL, "\n  - ");
+		else
+			fn(data, NULL, " || ");
 		expr_print(e->right.expr, fn, data, E_OR);
 		break;
 	case E_AND:
@@ -1156,8 +1164,10 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
 		break;
 	  }
 	}
-	if (expr_compare_type(prevtoken, e->type) > 0)
+	if (expr_compare_type(prevtoken, e->type) > 0) {
+		print_level--;
 		fn(data, NULL, ")");
+	}
 }
 
 static void expr_print_file_helper(void *data, struct symbol *sym, const char *str)
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index e9357931b47d..579ed9df1409 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -668,6 +668,8 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
 			prop->menu->lineno);
 		if (!expr_is_yes(prop->visible.expr)) {
 			str_append(r, _("  Depends on: "));
+			if (prop->visible.expr->type == E_OR)
+				str_append(r, "\n  - ");
 			expr_gstr_print(prop->visible.expr, r);
 			str_append(r, "\n");
 		}
@@ -676,6 +678,8 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
 	get_symbol_props_str(r, sym, P_SELECT, _("  Selects: "));
 	if (sym->rev_dep.expr) {
 		str_append(r, _("  Selected by: "));
+		if (sym->rev_dep.expr->type == E_OR)
+			str_append(r, "\n  - ");
 		expr_gstr_print(sym->rev_dep.expr, r);
 		str_append(r, "\n");
 	}
-- 
2.15.1

