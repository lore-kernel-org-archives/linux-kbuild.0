Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:55493 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751741AbeBRUsS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Feb 2018 15:48:18 -0500
Received: by mail-wm0-f66.google.com with SMTP id q83so2314467wme.5
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Feb 2018 12:48:17 -0800 (PST)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: [PATCH v4 2/3] kconfig: Prepare for printing reverse dependencies in groups
Date: Sun, 18 Feb 2018 21:47:14 +0100
Message-Id: <7b2504452d3c7abb2090df45147fd43c825c14cc.1518985888.git.erosca@de.adit-jv.com>
In-Reply-To: <cover.1518985888.git.erosca@de.adit-jv.com>
References: <cover.1518985888.git.erosca@de.adit-jv.com>
In-Reply-To: <cover.1518985888.git.erosca@de.adit-jv.com>
References: <cover.1518985888.git.erosca@de.adit-jv.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Ulf Magnusson <ulfalizer@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>, Eugeniu Rosca <rosca.eugeniu@gmail.com>, linux-kbuild@vger.kernel.org

From: Eugeniu Rosca <erosca@de.adit-jv.com>

Currently, reverse dependencies are printed like [1]. Prepare the ground
for printing them like [2]. No functional change is intended in this
patch.

[1] Current pattern for printing reverse dependencies:
  Selected by:
  - EXPR_A_Y /* evaluates to =y */
  - EXPR_B_N /* evaluates to =n */
  - EXPR_C_Y /* evaluates to =y */
  - EXPR_D_M /* evaluates to =m */
  - EXPR_E_N /* evaluates to =n */

[2] Upcoming pattern for printing reverse dependencies:
  Selected by [y]:
  - EXPR_A_Y
  - EXPR_C_Y
  Selected by [m]:
  - EXPR_D_M
  Selected by [n]:
  - EXPR_B_N
  - EXPR_E_N

Suggested-by: Ulf Magnusson <ulfalizer@gmail.com>
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/expr.c | 34 +++++++++++++++++++++++-----------
 scripts/kconfig/expr.h |  7 ++++++-
 scripts/kconfig/menu.c |  4 ++--
 3 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index b89baed7f15c..66b435bca80c 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1189,7 +1189,12 @@ expr_print_newline(struct expr *e,
 	expr_print(e, fn, data, prevtoken);
 }
 
-static void __expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken, bool revdep)
+static void
+__expr_print(struct expr *e,
+	     void (*fn)(void *, struct symbol *, const char *),
+	     void *data,
+	     int prevtoken,
+	     enum print_type type)
 {
 	if (!e) {
 		fn(data, NULL, "y");
@@ -1201,10 +1206,14 @@ static void __expr_print(struct expr *e, void (*fn)(void *, struct symbol *, con
 	switch (e->type) {
 	case E_SYMBOL:
 		if (e->left.sym->name)
-			if (!revdep)
+			switch (type) {
+			case PRINT_NORMAL:
 				fn(data, e->left.sym, e->left.sym->name);
-			else
+				break;
+			case PRINT_REVDEP_ALL:
 				expr_print_newline(e, fn, data, E_OR);
+				break;
+			}
 		else
 			fn(data, NULL, "<choice>");
 		break;
@@ -1247,18 +1256,21 @@ static void __expr_print(struct expr *e, void (*fn)(void *, struct symbol *, con
 		fn(data, e->right.sym, e->right.sym->name);
 		break;
 	case E_OR:
-		__expr_print(e->left.expr, fn, data, E_OR, revdep);
-		if (!revdep)
+		__expr_print(e->left.expr, fn, data, E_OR, type);
+		if (type == PRINT_NORMAL)
 			fn(data, NULL, " || ");
-		__expr_print(e->right.expr, fn, data, E_OR, revdep);
+		__expr_print(e->right.expr, fn, data, E_OR, type);
 		break;
 	case E_AND:
-		if (!revdep) {
+		switch (type) {
+		case PRINT_NORMAL:
 			expr_print(e->left.expr, fn, data, E_AND);
 			fn(data, NULL, " && ");
 			expr_print(e->right.expr, fn, data, E_AND);
-		} else {
+			break;
+		case PRINT_REVDEP_ALL:
 			expr_print_newline(e, fn, data, E_OR);
+			break;
 		}
 		break;
 	case E_LIST:
@@ -1289,7 +1301,7 @@ static void __expr_print(struct expr *e, void (*fn)(void *, struct symbol *, con
 
 void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken)
 {
-	__expr_print(e, fn, data, prevtoken, false);
+	__expr_print(e, fn, data, prevtoken, PRINT_NORMAL);
 }
 
 static void expr_print_file_helper(void *data, struct symbol *sym, const char *str)
@@ -1342,7 +1354,7 @@ void expr_gstr_print(struct expr *e, struct gstr *gs)
  * line with a minus. This makes expressions much easier to read.
  * Suitable for reverse dependency expressions.
  */
-void expr_gstr_print_revdep(struct expr *e, struct gstr *gs)
+void expr_gstr_print_revdep(struct expr *e, struct gstr *gs, enum print_type t)
 {
-	__expr_print(e, expr_print_gstr_helper, gs, E_NONE, true);
+	__expr_print(e, expr_print_gstr_helper, gs, E_NONE, t);
 }
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index c16e82e302a2..21cb67c15091 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -34,6 +34,11 @@ enum expr_type {
 	E_LIST, E_SYMBOL, E_RANGE
 };
 
+enum print_type {
+	PRINT_NORMAL,
+	PRINT_REVDEP_ALL,
+};
+
 union expr_data {
 	struct expr *expr;
 	struct symbol *sym;
@@ -310,7 +315,7 @@ struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2);
 void expr_fprint(struct expr *e, FILE *out);
 struct gstr; /* forward */
 void expr_gstr_print(struct expr *e, struct gstr *gs);
-void expr_gstr_print_revdep(struct expr *e, struct gstr *gs);
+void expr_gstr_print_revdep(struct expr *e, struct gstr *gs, enum print_type t);
 
 static inline int expr_is_yes(struct expr *e)
 {
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 99222855544c..5b8edba105f2 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -828,14 +828,14 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
 	get_symbol_props_str(r, sym, P_SELECT, _("  Selects: "));
 	if (sym->rev_dep.expr) {
 		str_append(r, _("  Selected by: "));
-		expr_gstr_print_revdep(sym->rev_dep.expr, r);
+		expr_gstr_print_revdep(sym->rev_dep.expr, r, PRINT_REVDEP_ALL);
 		str_append(r, "\n");
 	}
 
 	get_symbol_props_str(r, sym, P_IMPLY, _("  Implies: "));
 	if (sym->implied.expr) {
 		str_append(r, _("  Implied by: "));
-		expr_gstr_print_revdep(sym->implied.expr, r);
+		expr_gstr_print_revdep(sym->implied.expr, r, PRINT_REVDEP_ALL);
 		str_append(r, "\n");
 	}
 
-- 
2.16.1

