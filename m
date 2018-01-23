Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:44295 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752025AbeAWTbf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Jan 2018 14:31:35 -0500
Received: by mail-wm0-f67.google.com with SMTP id t74so4036768wme.3
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Jan 2018 11:31:34 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
Subject: [PATCH v5 1/1] kconfig: menuconfig make "Selected by:" and "Implied by:" readable
Date: Tue, 23 Jan 2018 20:31:03 +0100
Message-Id: <20180123193103.17651-1-petr.vorel@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>

Reverse dependency expressions can get rather unwieldy, especially if
a symbol is selected by more than a handful of other symbols. I.e. it's
possible to have near endless expressions like:
   A && B && !C || D || F && (G || H) || [...]

Chop these expressions into actually readable chunks:
   - A && B && !C
   - D
   - F && (G || H)
   - [...]

I.e. transform the top level OR tokens into newlines and prepend each
line with a minus. This makes the "Selected by:" and "Implied by:" blurb
much easier to read. This is done only if there is more than one top
level OR. "Depends on:" and "Range :" were deliberately left as they are.

Based on idea from Paul Bolle.

Reported-by: Paul Bolle <pebolle@tiscali.nl>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v4->v5:
* Fixed issues with "make alldefconfig". Now is change done really only
for "Selected by:" and "Implied by:" in "make menuconfig".

I tested it on various items on x86_64: Implied by: PTP_1588_CLOCK;
Selected by: USB, INPUT, NET, RT2X00_LIB_USB and on this config:

config BAR5
       bool
       default y
       imply BAZ

config FOO
       bool
       default y
       select BAR
       imply BAZ

config BAR
       bool "foo"
       depends on BAZ || QUX
       imply BAZ

config FOO2
       bool
       default y
       select BAR2

config BAR2
       bool "foo2"
       depends on BAZ || QUX || BAY || (PEV1 && PEV2)
       imply BAZ

config FOO3
       bool
       default y
       select BAR
       imply BAZ3

config BAR3
       bool "foo"
       depends on BAZ || QUX
       imply BAZ4

---
 scripts/kconfig/expr.c | 26 ++++++++++++++++++++++----
 scripts/kconfig/expr.h |  1 +
 scripts/kconfig/menu.c |  8 ++++++--
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index fd8a416ceab7..6613eae0226e 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1176,7 +1176,7 @@ struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2)
 	return expr_get_leftmost_symbol(ret);
 }
 
-void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken)
+static void __expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken, bool revdep)
 {
 	if (!e) {
 		fn(data, NULL, "y");
@@ -1231,9 +1231,12 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
 		fn(data, e->right.sym, e->right.sym->name);
 		break;
 	case E_OR:
-		expr_print(e->left.expr, fn, data, E_OR);
-		fn(data, NULL, " || ");
-		expr_print(e->right.expr, fn, data, E_OR);
+		__expr_print(e->left.expr, fn, data, E_OR, revdep);
+		if (revdep)
+			fn(data, NULL, "\n  - ");
+		else
+			fn(data, NULL, " || ");
+		__expr_print(e->right.expr, fn, data, E_OR, revdep);
 		break;
 	case E_AND:
 		expr_print(e->left.expr, fn, data, E_AND);
@@ -1266,6 +1269,11 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
 		fn(data, NULL, ")");
 }
 
+void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken)
+{
+	__expr_print(e, fn, data, prevtoken, false);
+}
+
 static void expr_print_file_helper(void *data, struct symbol *sym, const char *str)
 {
 	xfwrite(str, strlen(str), 1, data);
@@ -1310,3 +1318,13 @@ void expr_gstr_print(struct expr *e, struct gstr *gs)
 {
 	expr_print(e, expr_print_gstr_helper, gs, E_NONE);
 }
+
+/*
+ * Transform the top level "||" tokens into newlines and prepend each
+ * line with a minus. This makes expressions much easier to read.
+ * Suitable for reverse dependency expressions.
+ */
+void expr_gstr_print_revdep(struct expr *e, struct gstr *gs)
+{
+	__expr_print(e, expr_print_gstr_helper, gs, E_NONE, true);
+}
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index e7d7a5e3da68..c16e82e302a2 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -310,6 +310,7 @@ struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2);
 void expr_fprint(struct expr *e, FILE *out);
 struct gstr; /* forward */
 void expr_gstr_print(struct expr *e, struct gstr *gs);
+void expr_gstr_print_revdep(struct expr *e, struct gstr *gs);
 
 static inline int expr_is_yes(struct expr *e)
 {
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index d365fc9513c5..cee9e6a53ec3 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -828,14 +828,18 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
 	get_symbol_props_str(r, sym, P_SELECT, _("  Selects: "));
 	if (sym->rev_dep.expr) {
 		str_append(r, _("  Selected by: "));
-		expr_gstr_print(sym->rev_dep.expr, r);
+		if (sym->rev_dep.expr->type == E_OR)
+			str_append(r, "\n  - ");
+		expr_gstr_print_revdep(sym->rev_dep.expr, r);
 		str_append(r, "\n");
 	}
 
 	get_symbol_props_str(r, sym, P_IMPLY, _("  Implies: "));
 	if (sym->implied.expr) {
 		str_append(r, _("  Implied by: "));
-		expr_gstr_print(sym->implied.expr, r);
+		if (sym->implied.expr->type == E_OR)
+			str_append(r, "\n  - ");
+		expr_gstr_print_revdep(sym->implied.expr, r);
 		str_append(r, "\n");
 	}
 
-- 
2.15.1

