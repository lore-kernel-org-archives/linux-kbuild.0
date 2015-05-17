Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:57888 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750709AbbEQCOZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 May 2015 22:14:25 -0400
From: Martin Walch <walch.martin@web.de>
Subject: [PATCH v3] Kconfig: Remove bad inference rules expr_eliminate_dups2()
Date: Sun, 17 May 2015 04:14:14 +0200
Message-ID: <6333557.fobqH0bixi@tacticalops>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

From: Martin Walch <walch.martin@web.de>

expr_eliminate_dups2() in scripts/kconfig/expr.c applies two invalid
inference rules:

(FOO || BAR) && (!FOO && !BAR) -> n
(FOO && BAR) || (!FOO || !BAR) -> y

They would be correct in propositional logic, but this is a three-valued
logic, and here it is wrong in that it changes semantics. It becomes
immediately visible when assigning the value 1 to both, FOO and BAR:

(FOO || BAR) && (!FOO && !BAR)
-> min(max(1, 1), min(2-1, 2-1)) = min(1, 1) = 1

while n evaluates to 0 and

(FOO && BAR) || (!FOO || !BAR)
-> max(min(1, 1), max(2-1, 2-1)) = max(1, 1) = 1

with y evaluating to 2.

Fix it by removing expr_eliminate_dups2() and the functions that have no
use anywhere else: expr_extract_eq_and(), expr_extract_eq_or(),
and expr_extract_eq() from scripts/kconfig/expr.c

Currently the bug is not triggered in mainline, so this patch does not
modify the configuration space there.

As a side effect, this reduces code size in expr.c by roughly 10% and
slightly improves startup time for all configuration frontends.

Signed-off-by: Martin Walch <walch.martin@web.de>
---
Version 3:
Earlier versions fixed some comments, too. Remove those bits and focus
on the logical problem.

 scripts/kconfig/expr.c | 111 -------------------------------------------------
 1 file changed, 111 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index fb0a2a2..0d7364c 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -13,9 +13,6 @@
 
 static int expr_eq(struct expr *e1, struct expr *e2);
 static struct expr *expr_eliminate_yn(struct expr *e);
-static struct expr *expr_extract_eq_and(struct expr **ep1, struct expr **ep2);
-static struct expr *expr_extract_eq_or(struct expr **ep1, struct expr **ep2);
-static void expr_extract_eq(enum expr_type type, struct expr **ep, struct expr **ep1, struct expr **ep2);
 
 struct expr *expr_alloc_symbol(struct symbol *sym)
 {
@@ -559,62 +556,6 @@ static void expr_eliminate_dups1(enum expr_type type, struct expr **ep1, struct
 #undef e2
 }
 
-static void expr_eliminate_dups2(enum expr_type type, struct expr **ep1, struct expr **ep2)
-{
-#define e1 (*ep1)
-#define e2 (*ep2)
-	struct expr *tmp, *tmp1, *tmp2;
-
-	if (e1->type == type) {
-		expr_eliminate_dups2(type, &e1->left.expr, &e2);
-		expr_eliminate_dups2(type, &e1->right.expr, &e2);
-		return;
-	}
-	if (e2->type == type) {
-		expr_eliminate_dups2(type, &e1, &e2->left.expr);
-		expr_eliminate_dups2(type, &e1, &e2->right.expr);
-	}
-	if (e1 == e2)
-		return;
-
-	switch (e1->type) {
-	case E_OR:
-		expr_eliminate_dups2(e1->type, &e1, &e1);
-		// (FOO || BAR) && (!FOO && !BAR) -> n
-		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
-		tmp2 = expr_copy(e2);
-		tmp = expr_extract_eq_and(&tmp1, &tmp2);
-		if (expr_is_yes(tmp1)) {
-			expr_free(e1);
-			e1 = expr_alloc_symbol(&symbol_no);
-			trans_count++;
-		}
-		expr_free(tmp2);
-		expr_free(tmp1);
-		expr_free(tmp);
-		break;
-	case E_AND:
-		expr_eliminate_dups2(e1->type, &e1, &e1);
-		// (FOO && BAR) || (!FOO || !BAR) -> y
-		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
-		tmp2 = expr_copy(e2);
-		tmp = expr_extract_eq_or(&tmp1, &tmp2);
-		if (expr_is_no(tmp1)) {
-			expr_free(e1);
-			e1 = expr_alloc_symbol(&symbol_yes);
-			trans_count++;
-		}
-		expr_free(tmp2);
-		expr_free(tmp1);
-		expr_free(tmp);
-		break;
-	default:
-		;
-	}
-#undef e1
-#undef e2
-}
-
 struct expr *expr_eliminate_dups(struct expr *e)
 {
 	int oldcount;
@@ -627,7 +568,6 @@ struct expr *expr_eliminate_dups(struct expr *e)
 		switch (e->type) {
 		case E_OR: case E_AND:
 			expr_eliminate_dups1(e->type, &e, &e);
-			expr_eliminate_dups2(e->type, &e, &e);
 		default:
 			;
 		}
@@ -829,57 +769,6 @@ bool expr_depends_symbol(struct expr *dep, struct symbol *sym)
  	return false;
 }
 
-static struct expr *expr_extract_eq_and(struct expr **ep1, struct expr **ep2)
-{
-	struct expr *tmp = NULL;
-	expr_extract_eq(E_AND, &tmp, ep1, ep2);
-	if (tmp) {
-		*ep1 = expr_eliminate_yn(*ep1);
-		*ep2 = expr_eliminate_yn(*ep2);
-	}
-	return tmp;
-}
-
-static struct expr *expr_extract_eq_or(struct expr **ep1, struct expr **ep2)
-{
-	struct expr *tmp = NULL;
-	expr_extract_eq(E_OR, &tmp, ep1, ep2);
-	if (tmp) {
-		*ep1 = expr_eliminate_yn(*ep1);
-		*ep2 = expr_eliminate_yn(*ep2);
-	}
-	return tmp;
-}
-
-static void expr_extract_eq(enum expr_type type, struct expr **ep, struct expr **ep1, struct expr **ep2)
-{
-#define e1 (*ep1)
-#define e2 (*ep2)
-	if (e1->type == type) {
-		expr_extract_eq(type, ep, &e1->left.expr, &e2);
-		expr_extract_eq(type, ep, &e1->right.expr, &e2);
-		return;
-	}
-	if (e2->type == type) {
-		expr_extract_eq(type, ep, ep1, &e2->left.expr);
-		expr_extract_eq(type, ep, ep1, &e2->right.expr);
-		return;
-	}
-	if (expr_eq(e1, e2)) {
-		*ep = *ep ? expr_alloc_two(type, *ep, e1) : e1;
-		expr_free(e2);
-		if (type == E_AND) {
-			e1 = expr_alloc_symbol(&symbol_yes);
-			e2 = expr_alloc_symbol(&symbol_yes);
-		} else if (type == E_OR) {
-			e1 = expr_alloc_symbol(&symbol_no);
-			e2 = expr_alloc_symbol(&symbol_no);
-		}
-	}
-#undef e1
-#undef e2
-}
-
 struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symbol *sym)
 {
 	struct expr *e1, *e2;
-- 
2.0.5

