Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:42041 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751082AbeAYJqp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jan 2018 04:46:45 -0500
Received: by mail-wm0-f65.google.com with SMTP id r71so13514597wmd.1
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jan 2018 01:46:45 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
Subject: [PATCH v6 1/1] kconfig: make "Selected by:" and "Implied by:" readable
Date: Thu, 25 Jan 2018 10:46:35 +0100
Message-Id: <20180125094635.456-1-petr.vorel@gmail.com>
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
Hi Masahiro,

thank you for your notes (accepted both) and explanations!

Changes v5->v6:
* Move first new line with dash into __expr_print().
* Remove menuconfig from patch subject.
---
 scripts/kconfig/expr.c | 28 ++++++++++++++++++++++++----
 scripts/kconfig/expr.h |  1 +
 scripts/kconfig/menu.c |  4 ++--
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index fd8a416ceab7..04fa71e058b7 100644
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
@@ -1231,9 +1231,14 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
 		fn(data, e->right.sym, e->right.sym->name);
 		break;
 	case E_OR:
-		expr_print(e->left.expr, fn, data, E_OR);
-		fn(data, NULL, " || ");
-		expr_print(e->right.expr, fn, data, E_OR);
+		if (revdep && e->left.expr->type != E_OR)
+			fn(data, NULL, "\n  - ");
+		__expr_print(e->left.expr, fn, data, E_OR, revdep);
+		if (revdep)
+			fn(data, NULL, "\n  - ");
+		else
+			fn(data, NULL, " || ");
+		__expr_print(e->right.expr, fn, data, E_OR, revdep);
 		break;
 	case E_AND:
 		expr_print(e->left.expr, fn, data, E_AND);
@@ -1266,6 +1271,11 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
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
@@ -1310,3 +1320,13 @@ void expr_gstr_print(struct expr *e, struct gstr *gs)
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
index d365fc9513c5..99222855544c 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -828,14 +828,14 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
 	get_symbol_props_str(r, sym, P_SELECT, _("  Selects: "));
 	if (sym->rev_dep.expr) {
 		str_append(r, _("  Selected by: "));
-		expr_gstr_print(sym->rev_dep.expr, r);
+		expr_gstr_print_revdep(sym->rev_dep.expr, r);
 		str_append(r, "\n");
 	}
 
 	get_symbol_props_str(r, sym, P_IMPLY, _("  Implies: "));
 	if (sym->implied.expr) {
 		str_append(r, _("  Implied by: "));
-		expr_gstr_print(sym->implied.expr, r);
+		expr_gstr_print_revdep(sym->implied.expr, r);
 		str_append(r, "\n");
 	}
 
-- 
2.16.0

