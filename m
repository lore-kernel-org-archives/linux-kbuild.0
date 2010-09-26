Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:56173 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753593Ab0IZU0c (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 26 Sep 2010 16:26:32 -0400
Received: by iwn5 with SMTP id 5so4131295iwn.19
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Sep 2010 13:26:31 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFC] kconfig: simplify select-with-unmet-direct-dependency warning
Date: Sun, 26 Sep 2010 16:24:08 -0400
Message-Id: <1285532648-28943-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>

This is an attempt to simplify the expressing printed by kconfig when a
symbol is selected but still has direct unmet dependency.

First, the symbol reverse dependency is split in sub-expression. Then,
each sub-expression is checked to ensure that it does not contains the
unmet dependency. This removes the false-positive symbols and fixed symbol
which already have the correct dependency. Finally, only the symbol
responsible of the "select" is printed, instead of its full dependency tree.

CC: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/expr.c   |   42 ++++++++++++++++++++++++++++++++++++++++++
 scripts/kconfig/symbol.c |    6 +++++-
 2 files changed, 47 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 27e795c..49753cb 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1017,6 +1017,48 @@ int expr_compare_type(enum expr_type t1, enum expr_type t2)
 #endif
 }
 
+static inline struct expr *
+expr_get_leftmost_symbol(const struct expr *e)
+{
+
+	if (e == NULL)
+		return NULL;
+
+	while (e->type != E_SYMBOL)
+		e = e->left.expr;
+
+	return expr_copy(e);
+}
+
+/*
+ * Given expression `e1' and `e2', returns the leaf of the longest
+ * sub-expression of `e1' not containing 'e2.
+ */
+struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2)
+{
+	struct expr *ret;
+
+	switch (e1->type) {
+	case E_OR:
+		return expr_alloc_and(
+		    expr_simplify_unmet_dep(e1->left.expr, e2),
+		    expr_simplify_unmet_dep(e1->right.expr, e2));
+	case E_AND: {
+		struct expr *e;
+		e = expr_alloc_and(expr_copy(e1), expr_copy(e2));
+		e = expr_eliminate_dups(e);
+		ret = (!expr_eq(e, e1)) ? e1 : NULL;
+		expr_free(e);
+		break;
+		}
+	default:
+		ret = e1;
+		break;
+	}
+
+	return expr_get_leftmost_symbol(ret);
+}
+
 void expr_print(const struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken)
 {
 	if (!e) {
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index cd258da..ee16790 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -385,12 +385,16 @@ void sym_calc_value(struct symbol *sym)
 			}
 		calc_newval:
 			if (sym->dir_dep.tri == no && sym->rev_dep.tri != no) {
+				struct expr *e;
+				e = expr_simplify_unmet_dep(sym->rev_dep.expr,
+				    sym->dir_dep.expr);
 				fprintf(stderr, "warning: (");
-				expr_fprint(sym->rev_dep.expr, stderr);
+				expr_fprint(e, stderr);
 				fprintf(stderr, ") selects %s which has unmet direct dependencies (",
 					sym->name);
 				expr_fprint(sym->dir_dep.expr, stderr);
 				fprintf(stderr, ")\n");
+				expr_free(e);
 			}
 			newval.tri = EXPR_OR(newval.tri, sym->rev_dep.tri);
 		}
-- 
1.7.2.30.gc37d7.dirty

