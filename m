Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42831 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757188AbYAXWD6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:58 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 55/77] kconfig: explicitly introduce expression list
Date: Thu, 24 Jan 2008 23:03:36 +0100
Message-Id: <1201212238-4369-55-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Roman Zippel <zippel@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>

From: Roman Zippel <zippel@linux-m68k.org>

Rename E_CHOICE to E_LIST to explicitly add support for expression
lists. Add a helper macro expr_list_for_each_sym to more easily iterate
over the list.

Signed-off-by: Roman Zippel <zippel@linux-m68k.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/kconfig/confdata.c |    8 ++++----
 scripts/kconfig/expr.c     |   16 ++++++++--------
 scripts/kconfig/expr.h     |    5 ++++-
 scripts/kconfig/menu.c     |    2 +-
 scripts/kconfig/symbol.c   |   13 +++++++------
 5 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 497a19e..ee5fe94 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -312,7 +312,7 @@ load:
 
 int conf_read(const char *name)
 {
-	struct symbol *sym;
+	struct symbol *sym, *choice_sym;
 	struct property *prop;
 	struct expr *e;
 	int i, flags;
@@ -353,9 +353,9 @@ int conf_read(const char *name)
 		 */
 		prop = sym_get_choice_prop(sym);
 		flags = sym->flags;
-		for (e = prop->expr; e; e = e->left.expr)
-			if (e->right.sym->visible != no)
-				flags &= e->right.sym->flags;
+		expr_list_for_each_sym(prop->expr, e, choice_sym)
+			if (choice_sym->visible != no)
+				flags &= choice_sym->flags;
 		sym->flags &= flags | ~SYMBOL_DEF_USER;
 	}
 
diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index c8793d1..13788ad 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -87,7 +87,7 @@ struct expr *expr_copy(struct expr *org)
 		break;
 	case E_AND:
 	case E_OR:
-	case E_CHOICE:
+	case E_LIST:
 		e->left.expr = expr_copy(org->left.expr);
 		e->right.expr = expr_copy(org->right.expr);
 		break;
@@ -217,7 +217,7 @@ int expr_eq(struct expr *e1, struct expr *e2)
 		expr_free(e2);
 		trans_count = old_count;
 		return res;
-	case E_CHOICE:
+	case E_LIST:
 	case E_RANGE:
 	case E_NONE:
 		/* panic */;
@@ -648,7 +648,7 @@ struct expr *expr_transform(struct expr *e)
 	case E_EQUAL:
 	case E_UNEQUAL:
 	case E_SYMBOL:
-	case E_CHOICE:
+	case E_LIST:
 		break;
 	default:
 		e->left.expr = expr_transform(e->left.expr);
@@ -932,7 +932,7 @@ struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symb
 		break;
 	case E_SYMBOL:
 		return expr_alloc_comp(type, e->left.sym, sym);
-	case E_CHOICE:
+	case E_LIST:
 	case E_RANGE:
 	case E_NONE:
 		/* panic */;
@@ -1000,9 +1000,9 @@ int expr_compare_type(enum expr_type t1, enum expr_type t2)
 		if (t2 == E_OR)
 			return 1;
 	case E_OR:
-		if (t2 == E_CHOICE)
+		if (t2 == E_LIST)
 			return 1;
-	case E_CHOICE:
+	case E_LIST:
 		if (t2 == 0)
 			return 1;
 	default:
@@ -1053,11 +1053,11 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
 		fn(data, NULL, " && ");
 		expr_print(e->right.expr, fn, data, E_AND);
 		break;
-	case E_CHOICE:
+	case E_LIST:
 		fn(data, e->right.sym, e->right.sym->name);
 		if (e->left.expr) {
 			fn(data, NULL, " ^ ");
-			expr_print(e->left.expr, fn, data, E_CHOICE);
+			expr_print(e->left.expr, fn, data, E_LIST);
 		}
 		break;
 	case E_RANGE:
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 1ee8b16..b6f922c 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -31,7 +31,7 @@ typedef enum tristate {
 } tristate;
 
 enum expr_type {
-	E_NONE, E_OR, E_AND, E_NOT, E_EQUAL, E_UNEQUAL, E_CHOICE, E_SYMBOL, E_RANGE
+	E_NONE, E_OR, E_AND, E_NOT, E_EQUAL, E_UNEQUAL, E_LIST, E_SYMBOL, E_RANGE
 };
 
 union expr_data {
@@ -48,6 +48,9 @@ struct expr {
 #define EXPR_AND(dep1, dep2)	(((dep1)<(dep2))?(dep1):(dep2))
 #define EXPR_NOT(dep)		(2-(dep))
 
+#define expr_list_for_each_sym(l, e, s) \
+	for (e = (l); e && (s = e->right.sym); e = e->left.expr)
+
 struct expr_value {
 	struct expr *expr;
 	tristate tri;
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index e9deebe..3637d10 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -331,7 +331,7 @@ void menu_finalize(struct menu *parent)
 			prop = sym_get_choice_prop(sym);
 			for (ep = &prop->expr; *ep; ep = &(*ep)->left.expr)
 				;
-			*ep = expr_alloc_one(E_CHOICE, NULL);
+			*ep = expr_alloc_one(E_LIST, NULL);
 			(*ep)->right.sym = menu->sym;
 		}
 		if (menu->list && (!menu->prompt || !menu->prompt->text)) {
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index add068c..a7dfc82 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -247,8 +247,7 @@ static struct symbol *sym_calc_choice(struct symbol *sym)
 
 	/* just get the first visible value */
 	prop = sym_get_choice_prop(sym);
-	for (e = prop->expr; e; e = e->left.expr) {
-		def_sym = e->right.sym;
+	expr_list_for_each_sym(prop->expr, e, def_sym) {
 		sym_calc_visibility(def_sym);
 		if (def_sym->visible != no)
 			return def_sym;
@@ -361,12 +360,14 @@ void sym_calc_value(struct symbol *sym)
 	}
 
 	if (sym_is_choice(sym)) {
+		struct symbol *choice_sym;
 		int flags = sym->flags & (SYMBOL_CHANGED | SYMBOL_WRITE);
+
 		prop = sym_get_choice_prop(sym);
-		for (e = prop->expr; e; e = e->left.expr) {
-			e->right.sym->flags |= flags;
+		expr_list_for_each_sym(prop->expr, e, choice_sym) {
+			choice_sym->flags |= flags;
 			if (flags & SYMBOL_CHANGED)
-				sym_set_changed(e->right.sym);
+				sym_set_changed(choice_sym);
 		}
 	}
 }
@@ -849,7 +850,7 @@ struct property *prop_alloc(enum prop_type type, struct symbol *sym)
 struct symbol *prop_get_symbol(struct property *prop)
 {
 	if (prop->expr && (prop->expr->type == E_SYMBOL ||
-			   prop->expr->type == E_CHOICE))
+			   prop->expr->type == E_LIST))
 		return prop->expr->left.sym;
 	return NULL;
 }
-- 
1.5.4.rc3.14.g44397

