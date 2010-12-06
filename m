Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:47832 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751744Ab0LFT2w (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Dec 2010 14:28:52 -0500
Received: by vws16 with SMTP id 16so2851834vws.19
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Dec 2010 11:28:52 -0800 (PST)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCHv2] kconfig: simplify select-with-unmet-direct-dependency warning
Date: Mon,  6 Dec 2010 14:27:49 -0500
Message-Id: <1291663669-13077-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>

Hi,

This is an updated version of the patch I sent in mid-September to simplify the
unmet dependency warnings.

 - Arnaud

---

This is an attempt to simplify the expressing printed by kconfig when a
symbol is selected but still has direct unmet dependency.

First, the symbol reverse dependency is split in sub-expression. Then,
each sub-expression is checked to ensure that it does not contains the
unmet dependency. This removes all the false-positive symbols which
already have the correct dependency. Finally, only the symbol doing the
"select" is printed, instead of the full dependency tree.

CC: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/expr.c      |   35 ++++++++++++++++++++++++++++++++++-
 scripts/kconfig/lkc_proto.h |    2 +-
 scripts/kconfig/symbol.c    |    6 +++++-
 3 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 330e7c0..0a56c54 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1013,7 +1013,40 @@ int expr_compare_type(enum expr_type t1, enum expr_type t2)
 #endif
 }
 
-void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken)
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
+	struct expr *e, *ret;
+
+	if (e1->type == E_OR)
+		return expr_alloc_and(
+		    expr_simplify_unmet_dep(e1->left.expr, e2),
+		    expr_simplify_unmet_dep(e1->right.expr, e2));
+
+	e = expr_alloc_and(expr_copy(e1), expr_copy(e2));
+	e = expr_eliminate_dups(e);
+	ret = (!expr_eq(e, e1)) ? e1 : NULL;
+	expr_free(e);
+	return expr_get_leftmost_symbol(ret);
+}
+
+void expr_print(const struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken)
 {
 	if (!e) {
 		fn(data, NULL, "y");
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 47fe9c3..466eb1a 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -51,4 +51,4 @@ P(prop_get_type_name,const char *,(enum prop_type type));
 
 /* expr.c */
 P(expr_compare_type,int,(enum expr_type t1, enum expr_type t2));
-P(expr_print,void,(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken));
+P(expr_print,void,(const struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken));
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 3acce4d..0c28a79 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -351,12 +351,16 @@ void sym_calc_value(struct symbol *sym)
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

