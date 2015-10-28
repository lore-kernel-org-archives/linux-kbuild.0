Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:33590 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755171AbbJ1Cuq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Oct 2015 22:50:46 -0400
Received: by wijp11 with SMTP id p11so239079798wij.0
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2015 19:50:45 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
Subject: [PATCH v3] kconfig: menuconfig make "selected by:" readable
Date: Wed, 28 Oct 2015 03:50:30 +0100
Message-Id: <1446000630-30233-1-git-send-email-petr.vorel@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Paul Bolle <pebolle@tiscali.nl>

rev_dep expressions can get rather unwieldy, especially if a symbol is
selected by more than a handful of other symbols. Ie, it's possible to
have near endless expressions like:
   A && B && !C || D || F && (G || H) || [...]

Chop these expressions into actually readable chunks:
   - A && B && !C
   - D
   - F && (G || H)
   - [...]

Ie, transform the top level "||" tokens into newlines and prepend each
line with a minus. This makes the "Selected by:" blurb much easier to
read.

Cc: Paul Bolle <pebolle@tiscali.nl>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v2->v3:
* Actually Signed-off-by:
* Cleanup commit message.
Changes v1->v2:
* Rewrote Paul Bolle's original implementation: removed use of
expr_gstr_print()'s output from rev_dep_gstr_print(). I admit that
adding revdep variable and wrapper function isn't a nice solution, but
it works directly with struct expr :-).
---
 scripts/kconfig/expr.c | 36 ++++++++++++++++++++++++++++++++----
 scripts/kconfig/expr.h |  1 +
 scripts/kconfig/menu.c |  4 ++--
 3 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index cbf4996..caf89af 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1070,7 +1070,7 @@ struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2)
 	return expr_get_leftmost_symbol(ret);
 }
 
-void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken)
+static void expr_print_impl(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken, bool revdep)
 {
 	if (!e) {
 		fn(data, NULL, "y");
@@ -1125,9 +1125,12 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
 		fn(data, e->right.sym, e->right.sym->name);
 		break;
 	case E_OR:
-		expr_print(e->left.expr, fn, data, E_OR);
-		fn(data, NULL, " || ");
-		expr_print(e->right.expr, fn, data, E_OR);
+		expr_print_impl(e->left.expr, fn, data, E_OR, revdep);
+		if (revdep)
+			fn(data, NULL, "\n  - ");
+		else
+			fn(data, NULL, " || ");
+		expr_print_impl(e->right.expr, fn, data, E_OR, revdep);
 		break;
 	case E_AND:
 		expr_print(e->left.expr, fn, data, E_AND);
@@ -1160,6 +1163,11 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
 		fn(data, NULL, ")");
 }
 
+void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken)
+{
+	expr_print_impl(e, fn, data, prevtoken, false);
+}
+
 static void expr_print_file_helper(void *data, struct symbol *sym, const char *str)
 {
 	xfwrite(str, strlen(str), 1, data);
@@ -1204,3 +1212,23 @@ void expr_gstr_print(struct expr *e, struct gstr *gs)
 {
 	expr_print(e, expr_print_gstr_helper, gs, E_NONE);
 }
+
+/*
+ * rev_dep expressions can get rather unwieldy, especially if a symbol is
+ * selected by more than a handful of other symbols. Ie, it's possible to
+ * have near endless expressions like:
+ *    A && B && !C || D || F && (G || H) || [...]
+ *
+ * Chop these expressions into actually readable chunks:
+ *    - A && B && !C
+ *    - D
+ *    - F && (G || H)
+ *    - [...]
+ *
+ * Ie, transform the top level "||" tokens into newlines and prepend each line
+ * with a minus. This makes the "Selected by:" blurb much easier to read.
+ */
+void rev_dep_gstr_print(struct expr *e, struct gstr *gs)
+{
+	expr_print_impl(e, expr_print_gstr_helper, gs, E_NONE, true);
+}
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 973b6f7..f3bf88d 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -220,6 +220,7 @@ struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2);
 void expr_fprint(struct expr *e, FILE *out);
 struct gstr; /* forward */
 void expr_gstr_print(struct expr *e, struct gstr *gs);
+void rev_dep_gstr_print(struct expr *e, struct gstr *gs);
 
 static inline int expr_is_yes(struct expr *e)
 {
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index b05cc3d..b6b383e 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -661,8 +661,8 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
 		str_append(r, "\n");
 	if (sym->rev_dep.expr) {
 		str_append(r, _("  Selected by: "));
-		expr_gstr_print(sym->rev_dep.expr, r);
-		str_append(r, "\n");
+		str_append(r, "\n  - ");
+		rev_dep_gstr_print(sym->rev_dep.expr, r);
 	}
 	str_append(r, "\n\n");
 }
-- 
1.8.0

