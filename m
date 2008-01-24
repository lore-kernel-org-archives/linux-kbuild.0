Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37436 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756048AbYAXWEB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:01 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 37/77] kconfig: rename E_OR & friends to avoid name clash
Date: Thu, 24 Jan 2008 23:03:18 +0100
Message-Id: <1201212238-4369-37-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>

We had macros named the same as a set of enumeration values.
It is legal code but very confusing to read - so rename
the macros from E_* to EXPR_*

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
---
 scripts/kconfig/confdata.c |    2 +-
 scripts/kconfig/expr.c     |    6 +++---
 scripts/kconfig/expr.h     |    6 +++---
 scripts/kconfig/symbol.c   |    6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 2eccefb..497a19e 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -300,7 +300,7 @@ load:
 				cs->def[def].val = sym;
 				break;
 			}
-			cs->def[def].tri = E_OR(cs->def[def].tri, sym->def[def].tri);
+			cs->def[def].tri = EXPR_OR(cs->def[def].tri, sym->def[def].tri);
 		}
 	}
 	fclose(in);
diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 6f98dbf..c8793d1 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -955,14 +955,14 @@ tristate expr_calc_value(struct expr *e)
 	case E_AND:
 		val1 = expr_calc_value(e->left.expr);
 		val2 = expr_calc_value(e->right.expr);
-		return E_AND(val1, val2);
+		return EXPR_AND(val1, val2);
 	case E_OR:
 		val1 = expr_calc_value(e->left.expr);
 		val2 = expr_calc_value(e->right.expr);
-		return E_OR(val1, val2);
+		return EXPR_OR(val1, val2);
 	case E_NOT:
 		val1 = expr_calc_value(e->left.expr);
-		return E_NOT(val1);
+		return EXPR_NOT(val1);
 	case E_EQUAL:
 		sym_calc_value(e->left.sym);
 		sym_calc_value(e->right.sym);
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index a195986..b788997 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -45,9 +45,9 @@ struct expr {
 	union expr_data left, right;
 };
 
-#define E_OR(dep1, dep2)	(((dep1)>(dep2))?(dep1):(dep2))
-#define E_AND(dep1, dep2)	(((dep1)<(dep2))?(dep1):(dep2))
-#define E_NOT(dep)		(2-(dep))
+#define EXPR_OR(dep1, dep2)	(((dep1)>(dep2))?(dep1):(dep2))
+#define EXPR_AND(dep1, dep2)	(((dep1)<(dep2))?(dep1):(dep2))
+#define EXPR_NOT(dep)		(2-(dep))
 
 struct expr_value {
 	struct expr *expr;
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index c35dcc5..add068c 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -199,7 +199,7 @@ static void sym_calc_visibility(struct symbol *sym)
 	tri = no;
 	for_all_prompts(sym, prop) {
 		prop->visible.tri = expr_calc_value(prop->visible.expr);
-		tri = E_OR(tri, prop->visible.tri);
+		tri = EXPR_OR(tri, prop->visible.tri);
 	}
 	if (tri == mod && (sym->type != S_TRISTATE || modules_val == no))
 		tri = yes;
@@ -303,7 +303,7 @@ void sym_calc_value(struct symbol *sym)
 		if (sym_is_choice_value(sym) && sym->visible == yes) {
 			prop = sym_get_choice_prop(sym);
 			newval.tri = (prop_get_symbol(prop)->curr.val == sym) ? yes : no;
-		} else if (E_OR(sym->visible, sym->rev_dep.tri) != no) {
+		} else if (EXPR_OR(sym->visible, sym->rev_dep.tri) != no) {
 			sym->flags |= SYMBOL_WRITE;
 			if (sym_has_value(sym))
 				newval.tri = sym->def[S_DEF_USER].tri;
@@ -312,7 +312,7 @@ void sym_calc_value(struct symbol *sym)
 				if (prop)
 					newval.tri = expr_calc_value(prop->expr);
 			}
-			newval.tri = E_OR(E_AND(newval.tri, sym->visible), sym->rev_dep.tri);
+			newval.tri = EXPR_OR(EXPR_AND(newval.tri, sym->visible), sym->rev_dep.tri);
 		} else if (!sym_is_choice(sym)) {
 			prop = sym_get_default_prop(sym);
 			if (prop) {
-- 
1.5.4.rc3.14.g44397

