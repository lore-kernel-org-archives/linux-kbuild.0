Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:32921 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754720AbeF2MJQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Jun 2018 08:09:16 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH v3 1/1] kconfig: expr_print(): print constant symbols within quotes
Date: Fri, 29 Jun 2018 14:08:52 +0200
Message-Id: <20180629120852.20416-2-dirk@gouders.net>
In-Reply-To: <20180629120852.20416-1-dirk@gouders.net>
References: <20180629120852.20416-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Dirk Gouders <dirk@gouders.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Motivation for this commit was the problem that xfwrite() uses
assert() to ensure it does not operate on empty strings.  This caused
aborts when the dependency for an empty default string was printed.

A possibility to fix this issue would be to print all string
constants in quotes which has the positive effect that empty
strings have a length of 2 and do not trigger aborts.

But currently, constant symbols are typeless, so this patch implements
a fix by identifying all constant symbols by the symbol flag
SYMBOL_CONST and printing their names within quotes.

Note:

The symbols y, m and n are statically defined as constants in symbol.c
and hence also printed within quotes.  Kconfig files contain a mixture
of those symbols specified within and without quotes and we cannot
reproduce that after parsing.

Also, the kconfig language allows for (semantically meant) constant
string, int and hex symbols to be specified within quotes or without,
which is OK as long as there is no other symbol that is something
other than the constant symbol was meant to be; the following
Kconfig file tries to illustrate this:

config a
       int "Meant to have default 5..."
       default 5

config 5
       int "but this symbol plays games."
       default "7"

This implementation reproduces exactly the described mixture from the
Kconfig files, thus original data.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
Changes in V3: Do the described handling for all parts of expressions.
---
 scripts/kconfig/expr.c | 57 ++++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 27 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index e1a39e90841d..380e98ef4de8 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1137,10 +1137,28 @@ static int expr_compare_type(enum expr_type t1, enum expr_type t2)
 	return 0;
 }
 
+static void sym_print_name(void (*fn)(void *, struct symbol *, const char *),
+			   void *data, struct symbol *sym) {
+	const char *quoted;
+
+	if (sym->name)
+		/*
+		 * Print constant symbols within quotes
+		 */
+		if (sym->flags & SYMBOL_CONST) {
+			quoted = sym_escape_string_value(sym->name);
+			fn(data, sym, quoted);
+			free((void*)quoted);
+		} else
+			fn(data, sym, sym->name);
+	else
+		fn(data, NULL, "<choice>");
+}
 void expr_print(struct expr *e,
 		void (*fn)(void *, struct symbol *, const char *),
 		void *data, int prevtoken)
 {
+
 	if (!e) {
 		fn(data, NULL, "y");
 		return;
@@ -1150,48 +1168,33 @@ void expr_print(struct expr *e,
 		fn(data, NULL, "(");
 	switch (e->type) {
 	case E_SYMBOL:
-		if (e->left.sym->name)
-			fn(data, e->left.sym, e->left.sym->name);
-		else
-			fn(data, NULL, "<choice>");
+		sym_print_name(fn, data, e->left.sym);
 		break;
 	case E_NOT:
 		fn(data, NULL, "!");
 		expr_print(e->left.expr, fn, data, E_NOT);
 		break;
 	case E_EQUAL:
-		if (e->left.sym->name)
-			fn(data, e->left.sym, e->left.sym->name);
-		else
-			fn(data, NULL, "<choice>");
+		sym_print_name(fn, data, e->left.sym);
 		fn(data, NULL, "=");
-		fn(data, e->right.sym, e->right.sym->name);
+		sym_print_name(fn, data, e->right.sym);
 		break;
 	case E_LEQ:
 	case E_LTH:
-		if (e->left.sym->name)
-			fn(data, e->left.sym, e->left.sym->name);
-		else
-			fn(data, NULL, "<choice>");
+		sym_print_name(fn, data, e->left.sym);
 		fn(data, NULL, e->type == E_LEQ ? "<=" : "<");
-		fn(data, e->right.sym, e->right.sym->name);
+		sym_print_name(fn, data, e->right.sym);
 		break;
 	case E_GEQ:
 	case E_GTH:
-		if (e->left.sym->name)
-			fn(data, e->left.sym, e->left.sym->name);
-		else
-			fn(data, NULL, "<choice>");
+		sym_print_name(fn, data, e->left.sym);
 		fn(data, NULL, e->type == E_GEQ ? ">=" : ">");
-		fn(data, e->right.sym, e->right.sym->name);
+		sym_print_name(fn, data, e->right.sym);
 		break;
 	case E_UNEQUAL:
-		if (e->left.sym->name)
-			fn(data, e->left.sym, e->left.sym->name);
-		else
-			fn(data, NULL, "<choice>");
+		sym_print_name(fn, data, e->left.sym);
 		fn(data, NULL, "!=");
-		fn(data, e->right.sym, e->right.sym->name);
+		sym_print_name(fn, data, e->right.sym);
 		break;
 	case E_OR:
 		expr_print(e->left.expr, fn, data, E_OR);
@@ -1204,7 +1207,7 @@ void expr_print(struct expr *e,
 		expr_print(e->right.expr, fn, data, E_AND);
 		break;
 	case E_LIST:
-		fn(data, e->right.sym, e->right.sym->name);
+		sym_print_name(fn, data, e->right.sym);
 		if (e->left.expr) {
 			fn(data, NULL, " ^ ");
 			expr_print(e->left.expr, fn, data, E_LIST);
@@ -1212,9 +1215,9 @@ void expr_print(struct expr *e,
 		break;
 	case E_RANGE:
 		fn(data, NULL, "[");
-		fn(data, e->left.sym, e->left.sym->name);
+		sym_print_name(fn, data, e->left.sym);
 		fn(data, NULL, " ");
-		fn(data, e->right.sym, e->right.sym->name);
+		sym_print_name(fn, data, e->right.sym);
 		fn(data, NULL, "]");
 		break;
 	default:
-- 
2.16.1

