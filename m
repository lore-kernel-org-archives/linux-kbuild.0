Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:50182 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751189AbdJHRvP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Oct 2017 13:51:15 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH] kconfig: Document important expression functions
Date: Sun,  8 Oct 2017 19:50:55 +0200
Message-Id: <1507485055-24507-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, michal.lkml@markovi.net, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, JBeulich@suse.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

Many of these functions are quite the head scratchers if you don't know
what they're trying to do. Document them.

Also make it clear which functions rewrite expressions in-place and
which return new expressions. This prevents memory errors.

No functional changes. Only comments added.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/expr.c | 106 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index cbf4996..5965ecd 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -138,8 +138,18 @@ static int trans_count;
 #define e1 (*ep1)
 #define e2 (*ep2)
 
+/*
+ * expr_eliminate_eq() helper.
+ *
+ * Walks the two expression trees given in 'ep1' and 'ep2'. Any node that does
+ * not have type 'type' (E_OR/E_AND) is considered a leaf, and is compared
+ * against all other leaves. Two equal leaves are both replaced with either 'y'
+ * or 'n' as appropriate for 'type', to be eliminated later.
+ */
 static void __expr_eliminate_eq(enum expr_type type, struct expr **ep1, struct expr **ep2)
 {
+	/* Recurse down to leaves */
+
 	if (e1->type == type) {
 		__expr_eliminate_eq(type, &e1->left.expr, &e2);
 		__expr_eliminate_eq(type, &e1->right.expr, &e2);
@@ -150,12 +160,18 @@ static void __expr_eliminate_eq(enum expr_type type, struct expr **ep1, struct e
 		__expr_eliminate_eq(type, &e1, &e2->right.expr);
 		return;
 	}
+
+	/* e1 and e2 are leaves. Compare them. */
+
 	if (e1->type == E_SYMBOL && e2->type == E_SYMBOL &&
 	    e1->left.sym == e2->left.sym &&
 	    (e1->left.sym == &symbol_yes || e1->left.sym == &symbol_no))
 		return;
 	if (!expr_eq(e1, e2))
 		return;
+
+	/* e1 and e2 are equal leaves. Prepare them for elimination. */
+
 	trans_count++;
 	expr_free(e1); expr_free(e2);
 	switch (type) {
@@ -172,6 +188,35 @@ static void __expr_eliminate_eq(enum expr_type type, struct expr **ep1, struct e
 	}
 }
 
+/*
+ * Rewrites the expressions 'ep1' and 'ep2' to remove operands common to both.
+ * Example reductions:
+ *
+ *	ep1: A && B           ->  ep1: y
+ *	ep2: A && B && C      ->  ep2: C
+ *
+ *	ep1: A || B           ->  ep1: n
+ *	ep2: A || B || C      ->  ep2: C
+ *
+ *	ep1: A && (B && FOO)  ->  ep1: FOO
+ *	ep2: (BAR && B) && A  ->  ep2: BAR
+ *
+ *	ep1: A && (B || C)    ->  ep1: y
+ *	ep2: (C || B) && A    ->  ep2: y
+ *
+ * Comparisons are done between all operands at the same "level" of && or ||.
+ * For example, in the expression 'e1 && (e2 || e3) && (e4 || e5)', the
+ * following operands will be compared:
+ *
+ *	- 'e1', 'e2 || e3', and 'e4 || e5', against each other
+ *	- e2 against e3
+ *	- e4 against e5
+ *
+ * Parentheses are irrelevant within a single level. 'e1 && (e2 && e3)' and
+ * '(e1 && e2) && e3' are both a single level.
+ *
+ * See __expr_eliminate_eq() as well.
+ */
 void expr_eliminate_eq(struct expr **ep1, struct expr **ep2)
 {
 	if (!e1 || !e2)
@@ -197,6 +242,12 @@ void expr_eliminate_eq(struct expr **ep1, struct expr **ep2)
 #undef e1
 #undef e2
 
+/*
+ * Returns true if 'e1' and 'e2' are equal, after minor simplification. Two
+ * &&/|| expressions are considered equal if every operand in one expression
+ * equals some operand in the other (operands do not need to appear in the same
+ * order), recursively.
+ */
 static int expr_eq(struct expr *e1, struct expr *e2)
 {
 	int res, old_count;
@@ -243,6 +294,17 @@ static int expr_eq(struct expr *e1, struct expr *e2)
 	return 0;
 }
 
+/*
+ * Recursively performs the following simplifications in-place (as well as the
+ * corresponding simplifications with swapped operands):
+ *
+ *	expr && n  ->  n
+ *	expr && y  ->  expr
+ *	expr || n  ->  expr
+ *	expr || y  ->  y
+ *
+ * Returns the optimized expression.
+ */
 static struct expr *expr_eliminate_yn(struct expr *e)
 {
 	struct expr *tmp;
@@ -516,12 +578,21 @@ static struct expr *expr_join_and(struct expr *e1, struct expr *e2)
 	return NULL;
 }
 
+/*
+ * expr_eliminate_dups() helper.
+ *
+ * Walks the two expression trees given in 'ep1' and 'ep2'. Any node that does
+ * not have type 'type' (E_OR/E_AND) is considered a leaf, and is compared
+ * against all other leaves to look for simplifications.
+ */
 static void expr_eliminate_dups1(enum expr_type type, struct expr **ep1, struct expr **ep2)
 {
 #define e1 (*ep1)
 #define e2 (*ep2)
 	struct expr *tmp;
 
+	/* Recurse down to leaves */
+
 	if (e1->type == type) {
 		expr_eliminate_dups1(type, &e1->left.expr, &e2);
 		expr_eliminate_dups1(type, &e1->right.expr, &e2);
@@ -532,6 +603,9 @@ static void expr_eliminate_dups1(enum expr_type type, struct expr **ep1, struct
 		expr_eliminate_dups1(type, &e1, &e2->right.expr);
 		return;
 	}
+
+	/* e1 and e2 are leaves. Compare and process them. */
+
 	if (e1 == e2)
 		return;
 
@@ -568,6 +642,17 @@ static void expr_eliminate_dups1(enum expr_type type, struct expr **ep1, struct
 #undef e2
 }
 
+/*
+ * Rewrites 'e' in-place to remove ("join") duplicate and other redundant
+ * operands.
+ *
+ * Example simplifications:
+ *
+ *	A || B || A    ->  A || B
+ *	A && B && A=y  ->  A=y && B
+ *
+ * Returns the deduplicated expression.
+ */
 struct expr *expr_eliminate_dups(struct expr *e)
 {
 	int oldcount;
@@ -584,6 +669,7 @@ struct expr *expr_eliminate_dups(struct expr *e)
 			;
 		}
 		if (!trans_count)
+			/* No simplifications done in this pass. We're done */
 			break;
 		e = expr_eliminate_yn(e);
 	}
@@ -591,6 +677,12 @@ struct expr *expr_eliminate_dups(struct expr *e)
 	return e;
 }
 
+/*
+ * Performs various simplifications involving logical operators and
+ * comparisons.
+ *
+ * Allocates and returns a new expression.
+ */
 struct expr *expr_transform(struct expr *e)
 {
 	struct expr *tmp;
@@ -805,6 +897,20 @@ bool expr_depends_symbol(struct expr *dep, struct symbol *sym)
  	return false;
 }
 
+/*
+ * Inserts explicit comparisons of type 'type' to symbol 'sym' into the
+ * expression 'e'.
+ *
+ * Examples transformations for type == E_UNEQUAL, sym == &symbol_no:
+ *
+ *	A              ->  A!=n
+ *	!A             ->  A=n
+ *	A && B         ->  !(A=n || B=n)
+ *	A || B         ->  !(A=n && B=n)
+ *	A && (B || C)  ->  !(A=n || (B=n && C=n))
+ *
+ * Allocates and returns a new expression.
+ */
 struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symbol *sym)
 {
 	struct expr *e1, *e2;
-- 
2.7.4

