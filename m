Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:32956 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754119AbbATMxX convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:4:1>);
	Tue, 20 Jan 2015 07:53:23 -0500
Message-Id: <54BE5DD10200007800057065@mail.emea.novell.com>
Date: Tue, 20 Jan 2015 12:53:21 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v3 3/3] kconfig: allow use of relations other than
 (in)equality
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>, pebolle@tiscali.nl

Over the years I found it desirable to be able to use all sorts of
relations, not just (in)equality. And apparently I'm not the only one,
as there's at least one example in the tree where the programmer
assumed this would work (see DEBUG_UART_8250_WORD in
arch/arm/Kconfig.debug). Another possible use would e.g. be to fold the
two SMP/NR_CPUS prompts into one: SMP could be promptless, simply
depending on NR_CPUS > 1.

A (desirable) side effect of this change - resulting from numeric
values now necessarily being compared as numbers rather than as
strings - is that comparing hex values now works as expected: Other
than int ones (which aren't allowed to have leading zeroes), zeroes
following the 0x prefix made them compare unequal even if their values
were equal.

Question: Should "<>" and/or "==" then perhaps also be permitted?

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Drop stray debugging printf()s.
---
 scripts/kconfig/expr.c              |  167 ++++++++++-
 scripts/kconfig/expr.h              |    4 
 scripts/kconfig/symbol.c            |    4 
 scripts/kconfig/zconf.l             |    4 
 scripts/kconfig/zconf.lex.c_shipped |  291 +++++++++++--------
 scripts/kconfig/zconf.tab.c_shipped |  524 +++++++++++++++++++-----------------
 scripts/kconfig/zconf.y             |    9 
 7 files changed, 624 insertions(+), 379 deletions(-)

--- 3.19-rc5-kconfig.orig/scripts/kconfig/expr.c
+++ 3.19-rc5-kconfig/scripts/kconfig/expr.c
@@ -76,6 +76,10 @@ struct expr *expr_copy(const struct expr
 		e->left.expr = expr_copy(org->left.expr);
 		break;
 	case E_EQUAL:
+	case E_GEQ:
+	case E_GTH:
+	case E_LEQ:
+	case E_LTH:
 	case E_UNEQUAL:
 		e->left.sym = org->left.sym;
 		e->right.sym = org->right.sym;
@@ -108,6 +112,10 @@ void expr_free(struct expr *e)
 		expr_free(e->left.expr);
 		return;
 	case E_EQUAL:
+	case E_GEQ:
+	case E_GTH:
+	case E_LEQ:
+	case E_LTH:
 	case E_UNEQUAL:
 		break;
 	case E_OR:
@@ -194,6 +202,10 @@ int expr_eq(struct expr *e1, struct expr
 		return 0;
 	switch (e1->type) {
 	case E_EQUAL:
+	case E_GEQ:
+	case E_GTH:
+	case E_LEQ:
+	case E_LTH:
 	case E_UNEQUAL:
 		return e1->left.sym == e2->left.sym && e1->right.sym == e2->right.sym;
 	case E_SYMBOL:
@@ -641,6 +653,10 @@ struct expr *expr_transform(struct expr 
 		return NULL;
 	switch (e->type) {
 	case E_EQUAL:
+	case E_GEQ:
+	case E_GTH:
+	case E_LEQ:
+	case E_LTH:
 	case E_UNEQUAL:
 	case E_SYMBOL:
 	case E_LIST:
@@ -713,6 +729,22 @@ struct expr *expr_transform(struct expr 
 			e = tmp;
 			e->type = e->type == E_EQUAL ? E_UNEQUAL : E_EQUAL;
 			break;
+		case E_LEQ:
+		case E_GEQ:
+			// !a<='x' -> a>'x'
+			tmp = e->left.expr;
+			free(e);
+			e = tmp;
+			e->type = e->type == E_LEQ ? E_GTH : E_LTH;
+			break;
+		case E_LTH:
+		case E_GTH:
+			// !a<'x' -> a>='x'
+			tmp = e->left.expr;
+			free(e);
+			e = tmp;
+			e->type = e->type == E_LTH ? E_GEQ : E_LEQ;
+			break;
 		case E_OR:
 			// !(a || b) -> !a && !b
 			tmp = e->left.expr;
@@ -783,6 +815,10 @@ int expr_contains_symbol(struct expr *de
 	case E_SYMBOL:
 		return dep->left.sym == sym;
 	case E_EQUAL:
+	case E_GEQ:
+	case E_GTH:
+	case E_LEQ:
+	case E_LTH:
 	case E_UNEQUAL:
 		return dep->left.sym == sym ||
 		       dep->right.sym == sym;
@@ -908,6 +944,10 @@ struct expr *expr_trans_compare(struct e
 	case E_NOT:
 		return expr_trans_compare(e->left.expr, type == E_EQUAL ? E_UNEQUAL : E_EQUAL, sym);
 	case E_UNEQUAL:
+	case E_LTH:
+	case E_LEQ:
+	case E_GTH:
+	case E_GEQ:
 	case E_EQUAL:
 		if (type == E_EQUAL) {
 			if (sym == &symbol_yes)
@@ -935,10 +975,57 @@ struct expr *expr_trans_compare(struct e
 	return NULL;
 }
 
+enum string_value_kind {
+	k_string,
+	k_signed,
+	k_unsigned,
+	k_invalid
+};
+
+union string_value {
+	unsigned long long u;
+	signed long long s;
+};
+
+static enum string_value_kind expr_parse_string(const char *str,
+						enum symbol_type type,
+						union string_value *val)
+{
+	char *tail;
+	enum string_value_kind kind;
+
+	errno = 0;
+	switch (type) {
+	case S_BOOLEAN:
+	case S_TRISTATE:
+		return k_string;
+	case S_INT:
+		val->s = strtoll(str, &tail, 10);
+		kind = k_signed;
+		break;
+	case S_HEX:
+		val->u = strtoull(str, &tail, 16);
+		kind = k_unsigned;
+		break;
+	case S_STRING:
+	case S_UNKNOWN:
+		val->s = strtoll(str, &tail, 0);
+		kind = k_signed;
+		break;
+	default:
+		return k_invalid;
+	}
+	return !errno && !*tail && tail > str && isxdigit(tail[-1])
+	       ? kind : k_string;
+}
+
 tristate expr_calc_value(struct expr *e)
 {
 	tristate val1, val2;
 	const char *str1, *str2;
+	enum string_value_kind k1 = k_string, k2 = k_string;
+	union string_value lval = {}, rval = {};
+	int res;
 
 	if (!e)
 		return yes;
@@ -959,21 +1046,57 @@ tristate expr_calc_value(struct expr *e)
 		val1 = expr_calc_value(e->left.expr);
 		return EXPR_NOT(val1);
 	case E_EQUAL:
-		sym_calc_value(e->left.sym);
-		sym_calc_value(e->right.sym);
-		str1 = sym_get_string_value(e->left.sym);
-		str2 = sym_get_string_value(e->right.sym);
-		return !strcmp(str1, str2) ? yes : no;
+	case E_GEQ:
+	case E_GTH:
+	case E_LEQ:
+	case E_LTH:
 	case E_UNEQUAL:
-		sym_calc_value(e->left.sym);
-		sym_calc_value(e->right.sym);
-		str1 = sym_get_string_value(e->left.sym);
-		str2 = sym_get_string_value(e->right.sym);
-		return !strcmp(str1, str2) ? no : yes;
+		break;
 	default:
 		printf("expr_calc_value: %d?\n", e->type);
 		return no;
 	}
+
+	sym_calc_value(e->left.sym);
+	sym_calc_value(e->right.sym);
+	str1 = sym_get_string_value(e->left.sym);
+	str2 = sym_get_string_value(e->right.sym);
+
+	if (e->left.sym->type != S_STRING || e->right.sym->type != S_STRING) {
+		k1 = expr_parse_string(str1, e->left.sym->type, &lval);
+		k2 = expr_parse_string(str2, e->right.sym->type, &rval);
+	}
+
+	if (k1 == k_string || k2 == k_string)
+		res = strcmp(str1, str2);
+	else if (k1 == k_invalid || k2 == k_invalid) {
+		if (e->type != E_EQUAL && e->type != E_UNEQUAL) {
+			printf("Cannot compare \"%s\" and \"%s\"\n", str1, str2);
+			return no;
+		}
+		res = strcmp(str1, str2);
+	} else if (k1 == k_unsigned || k2 == k_unsigned)
+		res = (lval.u > rval.u) - (lval.u < rval.u);
+	else /* if (k1 == k_signed && k2 == k_signed) */
+		res = (lval.s > rval.s) - (lval.s < rval.s);
+
+	switch(e->type) {
+	case E_EQUAL:
+		return res ? no : yes;
+	case E_GEQ:
+		return res >= 0 ? yes : no;
+	case E_GTH:
+		return res > 0 ? yes : no;
+	case E_LEQ:
+		return res <= 0 ? yes : no;
+	case E_LTH:
+		return res < 0 ? yes : no;
+	case E_UNEQUAL:
+		return res ? yes : no;
+	default:
+		printf("expr_calc_value: relation %d?\n", e->type);
+		return no;
+	}
 }
 
 int expr_compare_type(enum expr_type t1, enum expr_type t2)
@@ -984,6 +1107,12 @@ int expr_compare_type(enum expr_type t1,
 	if (t1 == t2)
 		return 0;
 	switch (t1) {
+	case E_LEQ:
+	case E_LTH:
+	case E_GEQ:
+	case E_GTH:
+		if (t2 == E_EQUAL || t2 == E_UNEQUAL)
+			return 1;
 	case E_EQUAL:
 	case E_UNEQUAL:
 		if (t2 == E_NOT)
@@ -1078,6 +1207,24 @@ void expr_print(struct expr *e, void (*f
 		fn(data, NULL, "=");
 		fn(data, e->right.sym, e->right.sym->name);
 		break;
+	case E_LEQ:
+	case E_LTH:
+		if (e->left.sym->name)
+			fn(data, e->left.sym, e->left.sym->name);
+		else
+			fn(data, NULL, "<choice>");
+		fn(data, NULL, e->type == E_LEQ ? "<=" : "<");
+		fn(data, e->right.sym, e->right.sym->name);
+		break;
+	case E_GEQ:
+	case E_GTH:
+		if (e->left.sym->name)
+			fn(data, e->left.sym, e->left.sym->name);
+		else
+			fn(data, NULL, "<choice>");
+		fn(data, NULL, e->type == E_LEQ ? ">=" : ">");
+		fn(data, e->right.sym, e->right.sym->name);
+		break;
 	case E_UNEQUAL:
 		if (e->left.sym->name)
 			fn(data, e->left.sym, e->left.sym->name);
--- 3.19-rc5-kconfig.orig/scripts/kconfig/expr.h
+++ 3.19-rc5-kconfig/scripts/kconfig/expr.h
@@ -29,7 +29,9 @@ typedef enum tristate {
 } tristate;
 
 enum expr_type {
-	E_NONE, E_OR, E_AND, E_NOT, E_EQUAL, E_UNEQUAL, E_LIST, E_SYMBOL, E_RANGE
+	E_NONE, E_OR, E_AND, E_NOT,
+	E_EQUAL, E_UNEQUAL, E_LTH, E_LEQ, E_GTH, E_GEQ,
+	E_LIST, E_SYMBOL, E_RANGE
 };
 
 union expr_data {
--- 3.19-rc5-kconfig.orig/scripts/kconfig/symbol.c
+++ 3.19-rc5-kconfig/scripts/kconfig/symbol.c
@@ -1166,6 +1166,10 @@ static struct symbol *sym_check_expr_dep
 	case E_NOT:
 		return sym_check_expr_deps(e->left.expr);
 	case E_EQUAL:
+	case E_GEQ:
+	case E_GTH:
+	case E_LEQ:
+	case E_LTH:
 	case E_UNEQUAL:
 		sym = sym_check_deps(e->left.sym);
 		if (sym)
--- 3.19-rc5-kconfig.orig/scripts/kconfig/zconf.l
+++ 3.19-rc5-kconfig/scripts/kconfig/zconf.l
@@ -122,6 +122,10 @@ n	[A-Za-z0-9_]
 	"!"	return T_NOT;
 	"="	return T_EQUAL;
 	"!="	return T_UNEQUAL;
+	"<="	return T_LESS_EQUAL;
+	">="	return T_GREATER_EQUAL;
+	"<"	return T_LESS;
+	">"	return T_GREATER;
 	\"|\'	{
 		str = yytext[0];
 		new_string();
--- 3.19-rc5-kconfig.orig/scripts/kconfig/zconf.lex.c_shipped
+++ 3.19-rc5-kconfig/scripts/kconfig/zconf.lex.c_shipped
@@ -365,333 +365,354 @@ int zconflineno = 1;
 
 extern char *zconftext;
 #define yytext_ptr zconftext
-static yyconst flex_int16_t yy_nxt[][17] =
+static yyconst flex_int16_t yy_nxt[][19] =
     {
     {
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
-        0,    0,    0,    0,    0,    0,    0
+        0,    0,    0,    0,    0,    0,    0,    0,    0
     },
 
     {
        11,   12,   13,   14,   12,   12,   15,   12,   12,   12,
-       12,   12,   12,   12,   12,   12,   12
+       12,   12,   12,   12,   12,   12,   12,   12,   12
     },
 
     {
        11,   12,   13,   14,   12,   12,   15,   12,   12,   12,
-       12,   12,   12,   12,   12,   12,   12
+       12,   12,   12,   12,   12,   12,   12,   12,   12
     },
 
     {
        11,   16,   16,   17,   16,   16,   16,   16,   16,   16,
-       16,   16,   16,   18,   16,   16,   16
+       16,   16,   16,   18,   16,   16,   16,   16,   16
     },
 
     {
        11,   16,   16,   17,   16,   16,   16,   16,   16,   16,
-       16,   16,   16,   18,   16,   16,   16
+       16,   16,   16,   18,   16,   16,   16,   16,   16
 
     },
 
     {
        11,   19,   20,   21,   19,   19,   19,   19,   19,   19,
-       19,   19,   19,   19,   19,   19,   19
+       19,   19,   19,   19,   19,   19,   19,   19,   19
     },
 
     {
        11,   19,   20,   21,   19,   19,   19,   19,   19,   19,
-       19,   19,   19,   19,   19,   19,   19
+       19,   19,   19,   19,   19,   19,   19,   19,   19
     },
 
     {
        11,   22,   22,   23,   22,   24,   22,   22,   24,   22,
-       22,   22,   22,   22,   22,   25,   22
+       22,   22,   22,   22,   22,   22,   22,   25,   22
     },
 
     {
        11,   22,   22,   23,   22,   24,   22,   22,   24,   22,
-       22,   22,   22,   22,   22,   25,   22
+       22,   22,   22,   22,   22,   22,   22,   25,   22
     },
 
     {
        11,   26,   27,   28,   29,   30,   31,   32,   30,   33,
-       34,   35,   36,   36,   37,   38,   39
+       34,   35,   36,   36,   37,   38,   39,   40,   41
 
     },
 
     {
        11,   26,   27,   28,   29,   30,   31,   32,   30,   33,
-       34,   35,   36,   36,   37,   38,   39
+       34,   35,   36,   36,   37,   38,   39,   40,   41
     },
 
     {
       -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
-      -11,  -11,  -11,  -11,  -11,  -11,  -11
+      -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11
     },
 
     {
        11,  -12,  -12,  -12,  -12,  -12,  -12,  -12,  -12,  -12,
-      -12,  -12,  -12,  -12,  -12,  -12,  -12
+      -12,  -12,  -12,  -12,  -12,  -12,  -12,  -12,  -12
     },
 
     {
-       11,  -13,   40,   41,  -13,  -13,   42,  -13,  -13,  -13,
-      -13,  -13,  -13,  -13,  -13,  -13,  -13
+       11,  -13,   42,   43,  -13,  -13,   44,  -13,  -13,  -13,
+      -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13
     },
 
     {
        11,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
-      -14,  -14,  -14,  -14,  -14,  -14,  -14
+      -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14
 
     },
 
     {
-       11,   43,   43,   44,   43,   43,   43,   43,   43,   43,
-       43,   43,   43,   43,   43,   43,   43
+       11,   45,   45,   46,   45,   45,   45,   45,   45,   45,
+       45,   45,   45,   45,   45,   45,   45,   45,   45
     },
 
     {
        11,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
-      -16,  -16,  -16,  -16,  -16,  -16,  -16
+      -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16
     },
 
     {
        11,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
-      -17,  -17,  -17,  -17,  -17,  -17,  -17
+      -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17
     },
 
     {
        11,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
-      -18,  -18,  -18,   45,  -18,  -18,  -18
+      -18,  -18,  -18,   47,  -18,  -18,  -18,  -18,  -18
     },
 
     {
-       11,   46,   46,  -19,   46,   46,   46,   46,   46,   46,
-       46,   46,   46,   46,   46,   46,   46
+       11,   48,   48,  -19,   48,   48,   48,   48,   48,   48,
+       48,   48,   48,   48,   48,   48,   48,   48,   48
 
     },
 
     {
-       11,  -20,   47,   48,  -20,  -20,  -20,  -20,  -20,  -20,
-      -20,  -20,  -20,  -20,  -20,  -20,  -20
+       11,  -20,   49,   50,  -20,  -20,  -20,  -20,  -20,  -20,
+      -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20
     },
 
     {
-       11,   49,  -21,  -21,   49,   49,   49,   49,   49,   49,
-       49,   49,   49,   49,   49,   49,   49
+       11,   51,  -21,  -21,   51,   51,   51,   51,   51,   51,
+       51,   51,   51,   51,   51,   51,   51,   51,   51
     },
 
     {
-       11,   50,   50,   51,   50,  -22,   50,   50,  -22,   50,
-       50,   50,   50,   50,   50,  -22,   50
+       11,   52,   52,   53,   52,  -22,   52,   52,  -22,   52,
+       52,   52,   52,   52,   52,   52,   52,  -22,   52
     },
 
     {
        11,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
-      -23,  -23,  -23,  -23,  -23,  -23,  -23
+      -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23
     },
 
     {
        11,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
-      -24,  -24,  -24,  -24,  -24,  -24,  -24
+      -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24
 
     },
 
     {
-       11,   52,   52,   53,   52,   52,   52,   52,   52,   52,
-       52,   52,   52,   52,   52,   52,   52
+       11,   54,   54,   55,   54,   54,   54,   54,   54,   54,
+       54,   54,   54,   54,   54,   54,   54,   54,   54
     },
 
     {
        11,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
-      -26,  -26,  -26,  -26,  -26,  -26,  -26
+      -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26
     },
 
     {
-       11,  -27,   54,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
-      -27,  -27,  -27,  -27,  -27,  -27,  -27
+       11,  -27,   56,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
+      -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27
     },
 
     {
        11,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
-      -28,  -28,  -28,  -28,  -28,  -28,  -28
+      -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28
     },
 
     {
        11,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,
-      -29,  -29,  -29,  -29,   55,  -29,  -29
+      -29,  -29,  -29,  -29,  -29,   57,  -29,  -29,  -29
 
     },
 
     {
        11,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
-      -30,  -30,  -30,  -30,  -30,  -30,  -30
+      -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30
     },
 
     {
-       11,   56,   56,  -31,   56,   56,   56,   56,   56,   56,
-       56,   56,   56,   56,   56,   56,   56
+       11,   58,   58,  -31,   58,   58,   58,   58,   58,   58,
+       58,   58,   58,   58,   58,   58,   58,   58,   58
     },
 
     {
-       11,  -32,  -32,  -32,  -32,  -32,  -32,   57,  -32,  -32,
-      -32,  -32,  -32,  -32,  -32,  -32,  -32
+       11,  -32,  -32,  -32,  -32,  -32,  -32,   59,  -32,  -32,
+      -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32
     },
 
     {
        11,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,
-      -33,  -33,  -33,  -33,  -33,  -33,  -33
+      -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33
     },
 
     {
        11,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
-      -34,  -34,  -34,  -34,  -34,  -34,  -34
+      -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34
 
     },
 
     {
        11,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
-      -35,   58,   59,   59,  -35,  -35,  -35
+      -35,   60,   61,   61,  -35,  -35,  -35,  -35,  -35
     },
 
     {
        11,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,
-      -36,   59,   59,   59,  -36,  -36,  -36
+      -36,   61,   61,   61,  -36,  -36,  -36,  -36,  -36
     },
 
     {
        11,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
-      -37,  -37,  -37,  -37,  -37,  -37,  -37
+      -37,  -37,  -37,  -37,  -37,   62,  -37,  -37,  -37
     },
 
     {
-       11,  -38,  -38,   60,  -38,  -38,  -38,  -38,  -38,  -38,
-      -38,  -38,  -38,  -38,  -38,  -38,  -38
+       11,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
+      -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38
     },
 
     {
        11,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
-      -39,  -39,  -39,  -39,  -39,  -39,   61
+      -39,  -39,  -39,  -39,  -39,   63,  -39,  -39,  -39
 
     },
 
     {
-       11,  -40,   40,   41,  -40,  -40,   42,  -40,  -40,  -40,
-      -40,  -40,  -40,  -40,  -40,  -40,  -40
+       11,  -40,  -40,   64,  -40,  -40,  -40,  -40,  -40,  -40,
+      -40,  -40,  -40,  -40,  -40,  -40,  -40,  -40,  -40
     },
 
     {
        11,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
-      -41,  -41,  -41,  -41,  -41,  -41,  -41
+      -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,   65
     },
 
     {
-       11,   43,   43,   44,   43,   43,   43,   43,   43,   43,
-       43,   43,   43,   43,   43,   43,   43
+       11,  -42,   42,   43,  -42,  -42,   44,  -42,  -42,  -42,
+      -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42
     },
 
     {
-       11,   43,   43,   44,   43,   43,   43,   43,   43,   43,
-       43,   43,   43,   43,   43,   43,   43
+       11,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
+      -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43
     },
 
     {
-       11,  -44,  -44,  -44,  -44,  -44,  -44,  -44,  -44,  -44,
-      -44,  -44,  -44,  -44,  -44,  -44,  -44
+       11,   45,   45,   46,   45,   45,   45,   45,   45,   45,
+       45,   45,   45,   45,   45,   45,   45,   45,   45
 
     },
 
     {
-       11,  -45,  -45,  -45,  -45,  -45,  -45,  -45,  -45,  -45,
-      -45,  -45,  -45,   45,  -45,  -45,  -45
+       11,   45,   45,   46,   45,   45,   45,   45,   45,   45,
+       45,   45,   45,   45,   45,   45,   45,   45,   45
     },
 
     {
-       11,   46,   46,  -46,   46,   46,   46,   46,   46,   46,
-       46,   46,   46,   46,   46,   46,   46
+       11,  -46,  -46,  -46,  -46,  -46,  -46,  -46,  -46,  -46,
+      -46,  -46,  -46,  -46,  -46,  -46,  -46,  -46,  -46
     },
 
     {
-       11,  -47,   47,   48,  -47,  -47,  -47,  -47,  -47,  -47,
-      -47,  -47,  -47,  -47,  -47,  -47,  -47
+       11,  -47,  -47,  -47,  -47,  -47,  -47,  -47,  -47,  -47,
+      -47,  -47,  -47,   47,  -47,  -47,  -47,  -47,  -47
     },
 
     {
-       11,   49,  -48,  -48,   49,   49,   49,   49,   49,   49,
-       49,   49,   49,   49,   49,   49,   49
+       11,   48,   48,  -48,   48,   48,   48,   48,   48,   48,
+       48,   48,   48,   48,   48,   48,   48,   48,   48
     },
 
     {
-       11,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
-      -49,  -49,  -49,  -49,  -49,  -49,  -49
+       11,  -49,   49,   50,  -49,  -49,  -49,  -49,  -49,  -49,
+      -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49
 
     },
 
     {
-       11,   50,   50,   51,   50,  -50,   50,   50,  -50,   50,
-       50,   50,   50,   50,   50,  -50,   50
+       11,   51,  -50,  -50,   51,   51,   51,   51,   51,   51,
+       51,   51,   51,   51,   51,   51,   51,   51,   51
     },
 
     {
        11,  -51,  -51,  -51,  -51,  -51,  -51,  -51,  -51,  -51,
-      -51,  -51,  -51,  -51,  -51,  -51,  -51
+      -51,  -51,  -51,  -51,  -51,  -51,  -51,  -51,  -51
     },
 
     {
-       11,  -52,  -52,   53,  -52,  -52,  -52,  -52,  -52,  -52,
-      -52,  -52,  -52,  -52,  -52,  -52,  -52
+       11,   52,   52,   53,   52,  -52,   52,   52,  -52,   52,
+       52,   52,   52,   52,   52,   52,   52,  -52,   52
     },
 
     {
        11,  -53,  -53,  -53,  -53,  -53,  -53,  -53,  -53,  -53,
-      -53,  -53,  -53,  -53,  -53,  -53,  -53
+      -53,  -53,  -53,  -53,  -53,  -53,  -53,  -53,  -53
     },
 
     {
-       11,  -54,   54,  -54,  -54,  -54,  -54,  -54,  -54,  -54,
-      -54,  -54,  -54,  -54,  -54,  -54,  -54
+       11,  -54,  -54,   55,  -54,  -54,  -54,  -54,  -54,  -54,
+      -54,  -54,  -54,  -54,  -54,  -54,  -54,  -54,  -54
 
     },
 
     {
        11,  -55,  -55,  -55,  -55,  -55,  -55,  -55,  -55,  -55,
-      -55,  -55,  -55,  -55,  -55,  -55,  -55
+      -55,  -55,  -55,  -55,  -55,  -55,  -55,  -55,  -55
     },
 
     {
-       11,   56,   56,  -56,   56,   56,   56,   56,   56,   56,
-       56,   56,   56,   56,   56,   56,   56
+       11,  -56,   56,  -56,  -56,  -56,  -56,  -56,  -56,  -56,
+      -56,  -56,  -56,  -56,  -56,  -56,  -56,  -56,  -56
     },
 
     {
        11,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
-      -57,  -57,  -57,  -57,  -57,  -57,  -57
+      -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57
     },
 
     {
-       11,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
-      -58,   62,   59,   59,  -58,  -58,  -58
+       11,   58,   58,  -58,   58,   58,   58,   58,   58,   58,
+       58,   58,   58,   58,   58,   58,   58,   58,   58
     },
 
     {
        11,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
-      -59,   59,   59,   59,  -59,  -59,  -59
+      -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59
 
     },
 
     {
        11,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
-      -60,  -60,  -60,  -60,  -60,  -60,  -60
+      -60,   66,   61,   61,  -60,  -60,  -60,  -60,  -60
     },
 
     {
        11,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
-      -61,  -61,  -61,  -61,  -61,  -61,  -61
+      -61,   61,   61,   61,  -61,  -61,  -61,  -61,  -61
     },
 
     {
        11,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
-      -62,   59,   59,   59,  -62,  -62,  -62
+      -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62
+    },
+
+    {
+       11,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
+      -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63
+    },
+
+    {
+       11,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
+      -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64
+
+    },
+
+    {
+       11,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
+      -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65
+    },
+
+    {
+       11,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,
+      -66,   61,   61,   61,  -66,  -66,  -66,  -66,  -66
     },
 
     } ;
@@ -711,8 +732,8 @@ static void yy_fatal_error (yyconst char
 	*yy_cp = '\0'; \
 	(yy_c_buf_p) = yy_cp;
 
-#define YY_NUM_RULES 34
-#define YY_END_OF_BUFFER 35
+#define YY_NUM_RULES 38
+#define YY_END_OF_BUFFER 39
 /* This struct is not used in this scanner,
    but its presence is necessary. */
 struct yy_trans_info
@@ -720,15 +741,15 @@ struct yy_trans_info
 	flex_int32_t yy_verify;
 	flex_int32_t yy_nxt;
 	};
-static yyconst flex_int16_t yy_accept[63] =
+static yyconst flex_int16_t yy_accept[67] =
     {   0,
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
-       35,    5,    4,    2,    3,    7,    8,    6,   33,   30,
-       32,   25,   29,   28,   27,   23,   22,   17,   13,   16,
-       20,   23,   11,   12,   19,   19,   14,   23,   23,    4,
-        2,    3,    3,    1,    6,   33,   30,   32,   31,   25,
-       24,   27,   26,   22,   15,   20,    9,   19,   19,   21,
-       10,   18
+       39,    5,    4,    2,    3,    7,    8,    6,   37,   34,
+       36,   29,   33,   32,   31,   27,   26,   21,   13,   20,
+       24,   27,   11,   12,   23,   23,   18,   14,   19,   27,
+       27,    4,    2,    3,    3,    1,    6,   37,   34,   36,
+       35,   29,   28,   31,   30,   26,   15,   24,    9,   23,
+       23,   16,   17,   25,   10,   22
     } ;
 
 static yyconst flex_int32_t yy_ec[256] =
@@ -738,15 +759,15 @@ static yyconst flex_int32_t yy_ec[256] =
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    2,    4,    5,    6,    1,    1,    7,    8,    9,
        10,    1,    1,    1,   11,   12,   12,   13,   13,   13,
-       13,   13,   13,   13,   13,   13,   13,    1,    1,    1,
-       14,    1,    1,    1,   13,   13,   13,   13,   13,   13,
+       13,   13,   13,   13,   13,   13,   13,    1,    1,   14,
+       15,   16,    1,    1,   13,   13,   13,   13,   13,   13,
        13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
        13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
-        1,   15,    1,    1,   13,    1,   13,   13,   13,   13,
+        1,   17,    1,    1,   13,    1,   13,   13,   13,   13,
 
        13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
        13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
-       13,   13,    1,   16,    1,    1,    1,    1,    1,    1,
+       13,   13,    1,   18,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
@@ -1153,22 +1174,38 @@ return T_UNEQUAL;
 	YY_BREAK
 case 16:
 YY_RULE_SETUP
+return T_LESS_EQUAL;
+	YY_BREAK
+case 17:
+YY_RULE_SETUP
+return T_GREATER_EQUAL;
+	YY_BREAK
+case 18:
+YY_RULE_SETUP
+return T_LESS;
+	YY_BREAK
+case 19:
+YY_RULE_SETUP
+return T_GREATER;
+	YY_BREAK
+case 20:
+YY_RULE_SETUP
 {
 		str = zconftext[0];
 		new_string();
 		BEGIN(STRING);
 	}
 	YY_BREAK
-case 17:
-/* rule 17 can match eol */
+case 21:
+/* rule 21 can match eol */
 YY_RULE_SETUP
 BEGIN(INITIAL); current_file->lineno++; return T_EOL;
 	YY_BREAK
-case 18:
+case 22:
 YY_RULE_SETUP
 /* ignore */
 	YY_BREAK
-case 19:
+case 23:
 YY_RULE_SETUP
 {
 		const struct kconf_id *id = kconf_id_lookup(zconftext, zconfleng);
@@ -1181,20 +1218,20 @@ YY_RULE_SETUP
 		return T_WORD;
 	}
 	YY_BREAK
-case 20:
+case 24:
 YY_RULE_SETUP
 /* comment */
 	YY_BREAK
-case 21:
-/* rule 21 can match eol */
+case 25:
+/* rule 25 can match eol */
 YY_RULE_SETUP
 current_file->lineno++;
 	YY_BREAK
-case 22:
+case 26:
 YY_RULE_SETUP
 
 	YY_BREAK
-case 23:
+case 27:
 YY_RULE_SETUP
 {
 		fprintf(stderr,
@@ -1208,8 +1245,8 @@ case YY_STATE_EOF(PARAM):
 	}
 	YY_BREAK
 
-case 24:
-/* rule 24 can match eol */
+case 28:
+/* rule 28 can match eol */
 *yy_cp = (yy_hold_char); /* undo effects of setting up zconftext */
 (yy_c_buf_p) = yy_cp -= 1;
 YY_DO_BEFORE_ACTION; /* set up zconftext again */
@@ -1220,14 +1257,14 @@ YY_RULE_SETUP
 		return T_WORD_QUOTE;
 	}
 	YY_BREAK
-case 25:
+case 29:
 YY_RULE_SETUP
 {
 		append_string(zconftext, zconfleng);
 	}
 	YY_BREAK
-case 26:
-/* rule 26 can match eol */
+case 30:
+/* rule 30 can match eol */
 *yy_cp = (yy_hold_char); /* undo effects of setting up zconftext */
 (yy_c_buf_p) = yy_cp -= 1;
 YY_DO_BEFORE_ACTION; /* set up zconftext again */
@@ -1238,13 +1275,13 @@ YY_RULE_SETUP
 		return T_WORD_QUOTE;
 	}
 	YY_BREAK
-case 27:
+case 31:
 YY_RULE_SETUP
 {
 		append_string(zconftext + 1, zconfleng - 1);
 	}
 	YY_BREAK
-case 28:
+case 32:
 YY_RULE_SETUP
 {
 		if (str == zconftext[0]) {
@@ -1255,8 +1292,8 @@ YY_RULE_SETUP
 			append_string(zconftext, 1);
 	}
 	YY_BREAK
-case 29:
-/* rule 29 can match eol */
+case 33:
+/* rule 33 can match eol */
 YY_RULE_SETUP
 {
 		printf("%s:%d:warning: multi-line strings not supported\n", zconf_curname(), zconf_lineno());
@@ -1271,7 +1308,7 @@ case YY_STATE_EOF(STRING):
 	}
 	YY_BREAK
 
-case 30:
+case 34:
 YY_RULE_SETUP
 {
 		ts = 0;
@@ -1296,8 +1333,8 @@ YY_RULE_SETUP
 		}
 	}
 	YY_BREAK
-case 31:
-/* rule 31 can match eol */
+case 35:
+/* rule 35 can match eol */
 *yy_cp = (yy_hold_char); /* undo effects of setting up zconftext */
 (yy_c_buf_p) = yy_cp -= 1;
 YY_DO_BEFORE_ACTION; /* set up zconftext again */
@@ -1308,15 +1345,15 @@ YY_RULE_SETUP
 		return T_HELPTEXT;
 	}
 	YY_BREAK
-case 32:
-/* rule 32 can match eol */
+case 36:
+/* rule 36 can match eol */
 YY_RULE_SETUP
 {
 		current_file->lineno++;
 		append_string("\n", 1);
 	}
 	YY_BREAK
-case 33:
+case 37:
 YY_RULE_SETUP
 {
 		while (zconfleng) {
@@ -1347,7 +1384,7 @@ case YY_STATE_EOF(COMMAND):
 	yyterminate();
 }
 	YY_BREAK
-case 34:
+case 38:
 YY_RULE_SETUP
 YY_FATAL_ERROR( "flex scanner jammed" );
 	YY_BREAK
--- 3.19-rc5-kconfig.orig/scripts/kconfig/zconf.tab.c_shipped
+++ 3.19-rc5-kconfig/scripts/kconfig/zconf.tab.c_shipped
@@ -1,8 +1,8 @@
-/* A Bison parser, made by GNU Bison 2.5.  */
+/* A Bison parser, made by GNU Bison 2.5.1.  */
 
 /* Bison implementation for Yacc-like parsers in C
    
-      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
+      Copyright (C) 1984, 1989-1990, 2000-2012 Free Software Foundation, Inc.
    
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
@@ -44,7 +44,7 @@
 #define YYBISON 1
 
 /* Bison version.  */
-#define YYBISON_VERSION "2.5"
+#define YYBISON_VERSION "2.5.1"
 
 /* Skeleton name.  */
 #define YYSKELETON_NAME "yacc.c"
@@ -108,6 +108,14 @@ static struct menu *current_menu, *curre
 
 
 
+# ifndef YY_NULL
+#  if defined __cplusplus && 201103L <= __cplusplus
+#   define YY_NULL nullptr
+#  else
+#   define YY_NULL 0
+#  endif
+# endif
+
 /* Enabling traces.  */
 #ifndef YYDEBUG
 # define YYDEBUG 1
@@ -159,13 +167,17 @@ static struct menu *current_menu, *curre
      T_WORD = 281,
      T_WORD_QUOTE = 282,
      T_UNEQUAL = 283,
-     T_CLOSE_PAREN = 284,
-     T_OPEN_PAREN = 285,
-     T_EOL = 286,
-     T_OR = 287,
-     T_AND = 288,
-     T_EQUAL = 289,
-     T_NOT = 290
+     T_LESS = 284,
+     T_LESS_EQUAL = 285,
+     T_GREATER = 286,
+     T_GREATER_EQUAL = 287,
+     T_CLOSE_PAREN = 288,
+     T_OPEN_PAREN = 289,
+     T_EOL = 290,
+     T_OR = 291,
+     T_AND = 292,
+     T_EQUAL = 293,
+     T_NOT = 294
    };
 #endif
 
@@ -304,6 +316,7 @@ YYID (yyi)
 #    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
      || defined __cplusplus || defined _MSC_VER)
 #     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
+      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
 #     ifndef EXIT_SUCCESS
 #      define EXIT_SUCCESS 0
 #     endif
@@ -395,20 +408,20 @@ union yyalloc
 #endif
 
 #if defined YYCOPY_NEEDED && YYCOPY_NEEDED
-/* Copy COUNT objects from FROM to TO.  The source and destination do
+/* Copy COUNT objects from SRC to DST.  The source and destination do
    not overlap.  */
 # ifndef YYCOPY
 #  if defined __GNUC__ && 1 < __GNUC__
-#   define YYCOPY(To, From, Count) \
-      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
+#   define YYCOPY(Dst, Src, Count) \
+      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
 #  else
-#   define YYCOPY(To, From, Count)		\
-      do					\
-	{					\
-	  YYSIZE_T yyi;				\
-	  for (yyi = 0; yyi < (Count); yyi++)	\
-	    (To)[yyi] = (From)[yyi];		\
-	}					\
+#   define YYCOPY(Dst, Src, Count)              \
+      do                                        \
+        {                                       \
+          YYSIZE_T yyi;                         \
+          for (yyi = 0; yyi < (Count); yyi++)   \
+            (Dst)[yyi] = (Src)[yyi];            \
+        }                                       \
       while (YYID (0))
 #  endif
 # endif
@@ -417,20 +430,20 @@ union yyalloc
 /* YYFINAL -- State number of the termination state.  */
 #define YYFINAL  11
 /* YYLAST -- Last index in YYTABLE.  */
-#define YYLAST   290
+#define YYLAST   298
 
 /* YYNTOKENS -- Number of terminals.  */
-#define YYNTOKENS  36
+#define YYNTOKENS  40
 /* YYNNTS -- Number of nonterminals.  */
 #define YYNNTS  50
 /* YYNRULES -- Number of rules.  */
-#define YYNRULES  118
+#define YYNRULES  122
 /* YYNRULES -- Number of states.  */
-#define YYNSTATES  191
+#define YYNSTATES  199
 
 /* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
 #define YYUNDEFTOK  2
-#define YYMAXUTOK   290
+#define YYMAXUTOK   294
 
 #define YYTRANSLATE(YYX)						\
   ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)
@@ -467,7 +480,7 @@ static const yytype_uint8 yytranslate[] 
        5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
       15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
-      35
+      35,    36,    37,    38,    39
 };
 
 #if YYDEBUG
@@ -486,64 +499,67 @@ static const yytype_uint16 yyprhs[] =
      235,   238,   241,   244,   248,   252,   255,   258,   261,   262,
      265,   268,   271,   276,   277,   280,   283,   286,   287,   290,
      292,   294,   297,   300,   303,   305,   308,   309,   312,   314,
-     318,   322,   326,   329,   333,   337,   339,   341,   342
+     318,   322,   326,   330,   334,   338,   342,   345,   349,   353,
+     355,   357,   358
 };
 
 /* YYRHS -- A `-1'-separated list of the rules' RHS.  */
 static const yytype_int8 yyrhs[] =
 {
-      37,     0,    -1,    81,    38,    -1,    38,    -1,    63,    39,
-      -1,    39,    -1,    -1,    39,    41,    -1,    39,    55,    -1,
-      39,    67,    -1,    39,    80,    -1,    39,    26,     1,    31,
-      -1,    39,    40,     1,    31,    -1,    39,     1,    31,    -1,
+      41,     0,    -1,    85,    42,    -1,    42,    -1,    67,    43,
+      -1,    43,    -1,    -1,    43,    45,    -1,    43,    59,    -1,
+      43,    71,    -1,    43,    84,    -1,    43,    26,     1,    35,
+      -1,    43,    44,     1,    35,    -1,    43,     1,    35,    -1,
       16,    -1,    18,    -1,    19,    -1,    21,    -1,    17,    -1,
-      22,    -1,    20,    -1,    23,    -1,    31,    -1,    61,    -1,
-      71,    -1,    44,    -1,    46,    -1,    69,    -1,    26,     1,
-      31,    -1,     1,    31,    -1,    10,    26,    31,    -1,    43,
-      47,    -1,    11,    26,    31,    -1,    45,    47,    -1,    -1,
-      47,    48,    -1,    47,    49,    -1,    47,    75,    -1,    47,
-      73,    -1,    47,    42,    -1,    47,    31,    -1,    19,    78,
-      31,    -1,    18,    79,    82,    31,    -1,    20,    83,    82,
-      31,    -1,    21,    26,    82,    31,    -1,    22,    84,    84,
-      82,    31,    -1,    24,    50,    31,    -1,    -1,    50,    26,
-      51,    -1,    -1,    34,    79,    -1,     7,    85,    31,    -1,
-      52,    56,    -1,    80,    -1,    53,    58,    54,    -1,    -1,
-      56,    57,    -1,    56,    75,    -1,    56,    73,    -1,    56,
-      31,    -1,    56,    42,    -1,    18,    79,    82,    31,    -1,
-      19,    78,    31,    -1,    17,    31,    -1,    20,    26,    82,
-      31,    -1,    -1,    58,    41,    -1,    14,    83,    81,    -1,
-      80,    -1,    59,    62,    60,    -1,    -1,    62,    41,    -1,
-      62,    67,    -1,    62,    55,    -1,     3,    79,    81,    -1,
-       4,    79,    31,    -1,    64,    76,    74,    -1,    80,    -1,
-      65,    68,    66,    -1,    -1,    68,    41,    -1,    68,    67,
-      -1,    68,    55,    -1,     6,    79,    31,    -1,     9,    79,
-      31,    -1,    70,    74,    -1,    12,    31,    -1,    72,    13,
-      -1,    -1,    74,    75,    -1,    74,    31,    -1,    74,    42,
-      -1,    16,    25,    83,    31,    -1,    -1,    76,    77,    -1,
-      76,    31,    -1,    23,    82,    -1,    -1,    79,    82,    -1,
-      26,    -1,    27,    -1,     5,    31,    -1,     8,    31,    -1,
-      15,    31,    -1,    31,    -1,    81,    31,    -1,    -1,    14,
-      83,    -1,    84,    -1,    84,    34,    84,    -1,    84,    28,
-      84,    -1,    30,    83,    29,    -1,    35,    83,    -1,    83,
-      32,    83,    -1,    83,    33,    83,    -1,    26,    -1,    27,
-      -1,    -1,    26,    -1
+      22,    -1,    20,    -1,    23,    -1,    35,    -1,    65,    -1,
+      75,    -1,    48,    -1,    50,    -1,    73,    -1,    26,     1,
+      35,    -1,     1,    35,    -1,    10,    26,    35,    -1,    47,
+      51,    -1,    11,    26,    35,    -1,    49,    51,    -1,    -1,
+      51,    52,    -1,    51,    53,    -1,    51,    79,    -1,    51,
+      77,    -1,    51,    46,    -1,    51,    35,    -1,    19,    82,
+      35,    -1,    18,    83,    86,    35,    -1,    20,    87,    86,
+      35,    -1,    21,    26,    86,    35,    -1,    22,    88,    88,
+      86,    35,    -1,    24,    54,    35,    -1,    -1,    54,    26,
+      55,    -1,    -1,    38,    83,    -1,     7,    89,    35,    -1,
+      56,    60,    -1,    84,    -1,    57,    62,    58,    -1,    -1,
+      60,    61,    -1,    60,    79,    -1,    60,    77,    -1,    60,
+      35,    -1,    60,    46,    -1,    18,    83,    86,    35,    -1,
+      19,    82,    35,    -1,    17,    35,    -1,    20,    26,    86,
+      35,    -1,    -1,    62,    45,    -1,    14,    87,    85,    -1,
+      84,    -1,    63,    66,    64,    -1,    -1,    66,    45,    -1,
+      66,    71,    -1,    66,    59,    -1,     3,    83,    85,    -1,
+       4,    83,    35,    -1,    68,    80,    78,    -1,    84,    -1,
+      69,    72,    70,    -1,    -1,    72,    45,    -1,    72,    71,
+      -1,    72,    59,    -1,     6,    83,    35,    -1,     9,    83,
+      35,    -1,    74,    78,    -1,    12,    35,    -1,    76,    13,
+      -1,    -1,    78,    79,    -1,    78,    35,    -1,    78,    46,
+      -1,    16,    25,    87,    35,    -1,    -1,    80,    81,    -1,
+      80,    35,    -1,    23,    86,    -1,    -1,    83,    86,    -1,
+      26,    -1,    27,    -1,     5,    35,    -1,     8,    35,    -1,
+      15,    35,    -1,    35,    -1,    85,    35,    -1,    -1,    14,
+      87,    -1,    88,    -1,    88,    29,    88,    -1,    88,    30,
+      88,    -1,    88,    31,    88,    -1,    88,    32,    88,    -1,
+      88,    38,    88,    -1,    88,    28,    88,    -1,    34,    87,
+      33,    -1,    39,    87,    -1,    87,    36,    87,    -1,    87,
+      37,    87,    -1,    26,    -1,    27,    -1,    -1,    26,    -1
 };
 
 /* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
 static const yytype_uint16 yyrline[] =
 {
-       0,   103,   103,   103,   105,   105,   107,   109,   110,   111,
-     112,   113,   114,   118,   122,   122,   122,   122,   122,   122,
-     122,   122,   126,   127,   128,   129,   130,   131,   135,   136,
-     142,   150,   156,   164,   174,   176,   177,   178,   179,   180,
-     181,   184,   192,   198,   208,   214,   220,   223,   225,   236,
-     237,   242,   251,   256,   264,   267,   269,   270,   271,   272,
-     273,   276,   282,   293,   299,   309,   311,   316,   324,   332,
-     335,   337,   338,   339,   344,   351,   358,   363,   371,   374,
-     376,   377,   378,   381,   389,   396,   403,   409,   416,   418,
-     419,   420,   423,   431,   433,   434,   437,   444,   446,   451,
-     452,   455,   456,   457,   461,   462,   465,   466,   469,   470,
-     471,   472,   473,   474,   475,   478,   479,   482,   483
+       0,   108,   108,   108,   110,   110,   112,   114,   115,   116,
+     117,   118,   119,   123,   127,   127,   127,   127,   127,   127,
+     127,   127,   131,   132,   133,   134,   135,   136,   140,   141,
+     147,   155,   161,   169,   179,   181,   182,   183,   184,   185,
+     186,   189,   197,   203,   213,   219,   225,   228,   230,   241,
+     242,   247,   256,   261,   269,   272,   274,   275,   276,   277,
+     278,   281,   287,   298,   304,   314,   316,   321,   329,   337,
+     340,   342,   343,   344,   349,   356,   363,   368,   376,   379,
+     381,   382,   383,   386,   394,   401,   408,   414,   421,   423,
+     424,   425,   428,   436,   438,   439,   442,   449,   451,   456,
+     457,   460,   461,   462,   466,   467,   470,   471,   474,   475,
+     476,   477,   478,   479,   480,   481,   482,   483,   484,   487,
+     488,   491,   492
 };
 #endif
 
@@ -557,6 +573,7 @@ static const char *const yytname[] =
   "T_MENUCONFIG", "T_HELP", "T_HELPTEXT", "T_IF", "T_ENDIF", "T_DEPENDS",
   "T_OPTIONAL", "T_PROMPT", "T_TYPE", "T_DEFAULT", "T_SELECT", "T_RANGE",
   "T_VISIBLE", "T_OPTION", "T_ON", "T_WORD", "T_WORD_QUOTE", "T_UNEQUAL",
+  "T_LESS", "T_LESS_EQUAL", "T_GREATER", "T_GREATER_EQUAL",
   "T_CLOSE_PAREN", "T_OPEN_PAREN", "T_EOL", "T_OR", "T_AND", "T_EQUAL",
   "T_NOT", "$accept", "input", "start", "stmt_list", "option_name",
   "common_stmt", "option_error", "config_entry_start", "config_stmt",
@@ -568,7 +585,7 @@ static const char *const yytname[] =
   "menu_entry", "menu_end", "menu_stmt", "menu_block", "source_stmt",
   "comment", "comment_stmt", "help_start", "help", "depends_list",
   "depends", "visibility_list", "visible", "prompt_stmt_opt", "prompt",
-  "end", "nl", "if_expr", "expr", "symbol", "word_opt", 0
+  "end", "nl", "if_expr", "expr", "symbol", "word_opt", YY_NULL
 };
 #endif
 
@@ -580,25 +597,26 @@ static const yytype_uint16 yytoknum[] =
        0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
      265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
      275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
-     285,   286,   287,   288,   289,   290
+     285,   286,   287,   288,   289,   290,   291,   292,   293,   294
 };
 # endif
 
 /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
 static const yytype_uint8 yyr1[] =
 {
-       0,    36,    37,    37,    38,    38,    39,    39,    39,    39,
-      39,    39,    39,    39,    40,    40,    40,    40,    40,    40,
-      40,    40,    41,    41,    41,    41,    41,    41,    42,    42,
-      43,    44,    45,    46,    47,    47,    47,    47,    47,    47,
-      47,    48,    48,    48,    48,    48,    49,    50,    50,    51,
-      51,    52,    53,    54,    55,    56,    56,    56,    56,    56,
-      56,    57,    57,    57,    57,    58,    58,    59,    60,    61,
-      62,    62,    62,    62,    63,    64,    65,    66,    67,    68,
-      68,    68,    68,    69,    70,    71,    72,    73,    74,    74,
-      74,    74,    75,    76,    76,    76,    77,    78,    78,    79,
-      79,    80,    80,    80,    81,    81,    82,    82,    83,    83,
-      83,    83,    83,    83,    83,    84,    84,    85,    85
+       0,    40,    41,    41,    42,    42,    43,    43,    43,    43,
+      43,    43,    43,    43,    44,    44,    44,    44,    44,    44,
+      44,    44,    45,    45,    45,    45,    45,    45,    46,    46,
+      47,    48,    49,    50,    51,    51,    51,    51,    51,    51,
+      51,    52,    52,    52,    52,    52,    53,    54,    54,    55,
+      55,    56,    57,    58,    59,    60,    60,    60,    60,    60,
+      60,    61,    61,    61,    61,    62,    62,    63,    64,    65,
+      66,    66,    66,    66,    67,    68,    69,    70,    71,    72,
+      72,    72,    72,    73,    74,    75,    76,    77,    78,    78,
+      78,    78,    79,    80,    80,    80,    81,    82,    82,    83,
+      83,    84,    84,    84,    85,    85,    86,    86,    87,    87,
+      87,    87,    87,    87,    87,    87,    87,    87,    87,    88,
+      88,    89,    89
 };
 
 /* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
@@ -615,7 +633,8 @@ static const yytype_uint8 yyr2[] =
        2,     2,     2,     3,     3,     2,     2,     2,     0,     2,
        2,     2,     4,     0,     2,     2,     2,     0,     2,     1,
        1,     2,     2,     2,     1,     2,     0,     2,     1,     3,
-       3,     3,     2,     3,     3,     1,     1,     0,     1
+       3,     3,     3,     3,     3,     3,     2,     3,     3,     1,
+       1,     0,     1
 };
 
 /* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
@@ -624,72 +643,72 @@ static const yytype_uint8 yyr2[] =
 static const yytype_uint8 yydefact[] =
 {
        6,     0,   104,     0,     3,     0,     6,     6,    99,   100,
-       0,     1,     0,     0,     0,     0,   117,     0,     0,     0,
+       0,     1,     0,     0,     0,     0,   121,     0,     0,     0,
        0,     0,     0,    14,    18,    15,    16,    20,    17,    19,
       21,     0,    22,     0,     7,    34,    25,    34,    26,    55,
       65,     8,    70,    23,    93,    79,     9,    27,    88,    24,
-      10,     0,   105,     2,    74,    13,     0,   101,     0,   118,
-       0,   102,     0,     0,     0,   115,   116,     0,     0,     0,
+      10,     0,   105,     2,    74,    13,     0,   101,     0,   122,
+       0,   102,     0,     0,     0,   119,   120,     0,     0,     0,
      108,   103,     0,     0,     0,     0,     0,     0,     0,    88,
-       0,     0,    75,    83,    51,    84,    30,    32,     0,   112,
-       0,     0,    67,     0,     0,    11,    12,     0,     0,     0,
-       0,    97,     0,     0,     0,    47,     0,    40,    39,    35,
-      36,     0,    38,    37,     0,     0,    97,     0,    59,    60,
-      56,    58,    57,    66,    54,    53,    71,    73,    69,    72,
-      68,   106,    95,     0,    94,    80,    82,    78,    81,    77,
-      90,    91,    89,   111,   113,   114,   110,   109,    29,    86,
-       0,   106,     0,   106,   106,   106,     0,     0,     0,    87,
-      63,   106,     0,   106,     0,    96,     0,     0,    41,    98,
-       0,     0,   106,    49,    46,    28,     0,    62,     0,   107,
-      92,    42,    43,    44,     0,     0,    48,    61,    64,    45,
-      50
+       0,     0,    75,    83,    51,    84,    30,    32,     0,   116,
+       0,     0,    67,     0,     0,     0,     0,     0,     0,    11,
+      12,     0,     0,     0,     0,    97,     0,     0,     0,    47,
+       0,    40,    39,    35,    36,     0,    38,    37,     0,     0,
+      97,     0,    59,    60,    56,    58,    57,    66,    54,    53,
+      71,    73,    69,    72,    68,   106,    95,     0,    94,    80,
+      82,    78,    81,    77,    90,    91,    89,   115,   117,   118,
+     114,   109,   110,   111,   112,   113,    29,    86,     0,   106,
+       0,   106,   106,   106,     0,     0,     0,    87,    63,   106,
+       0,   106,     0,    96,     0,     0,    41,    98,     0,     0,
+     106,    49,    46,    28,     0,    62,     0,   107,    92,    42,
+      43,    44,     0,     0,    48,    61,    64,    45,    50
 };
 
 /* YYDEFGOTO[NTERM-NUM].  */
 static const yytype_int16 yydefgoto[] =
 {
-      -1,     3,     4,     5,    33,    34,   108,    35,    36,    37,
-      38,    74,   109,   110,   157,   186,    39,    40,   124,    41,
-      76,   120,    77,    42,   128,    43,    78,     6,    44,    45,
-     137,    46,    80,    47,    48,    49,   111,   112,    81,   113,
-      79,   134,   152,   153,    50,     7,   165,    69,    70,    60
+      -1,     3,     4,     5,    33,    34,   112,    35,    36,    37,
+      38,    74,   113,   114,   165,   194,    39,    40,   128,    41,
+      76,   124,    77,    42,   132,    43,    78,     6,    44,    45,
+     141,    46,    80,    47,    48,    49,   115,   116,    81,   117,
+      79,   138,   160,   161,    50,     7,   173,    69,    70,    60
 };
 
 /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
    STATE-NUM.  */
-#define YYPACT_NINF -90
+#define YYPACT_NINF -91
 static const yytype_int16 yypact[] =
 {
-       4,    42,   -90,    96,   -90,   111,   -90,    15,   -90,   -90,
-      75,   -90,    82,    42,   104,    42,   110,   107,    42,   115,
-     125,    -4,   121,   -90,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   162,   -90,   163,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   139,   -90,   -90,   138,   -90,   142,   -90,   143,   -90,
-     152,   -90,   164,   167,   168,   -90,   -90,    -4,    -4,    77,
-     -18,   -90,   177,   185,    33,    71,   195,   247,   236,    -2,
-     236,   171,   -90,   -90,   -90,   -90,   -90,   -90,    41,   -90,
-      -4,    -4,   138,    97,    97,   -90,   -90,   186,   187,   194,
-      42,    42,    -4,   196,    97,   -90,   219,   -90,   -90,   -90,
-     -90,   210,   -90,   -90,   204,    42,    42,   199,   -90,   -90,
-     -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   222,   -90,   223,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   -90,   -90,   -90,   215,   -90,   -90,   -90,   -90,   -90,
-      -4,   222,   228,   222,    -5,   222,    97,    35,   229,   -90,
-     -90,   222,   232,   222,    -4,   -90,   135,   233,   -90,   -90,
-     234,   235,   222,   240,   -90,   -90,   237,   -90,   239,   -13,
-     -90,   -90,   -90,   -90,   244,    42,   -90,   -90,   -90,   -90,
-     -90
+      19,    37,   -91,    13,   -91,    79,   -91,    20,   -91,   -91,
+     -16,   -91,    21,    37,    25,    37,    41,    36,    37,    78,
+      83,    31,    56,   -91,   -91,   -91,   -91,   -91,   -91,   -91,
+     -91,   116,   -91,   127,   -91,   -91,   -91,   -91,   -91,   -91,
+     -91,   -91,   -91,   -91,   -91,   -91,   -91,   -91,   -91,   -91,
+     -91,   147,   -91,   -91,   105,   -91,   109,   -91,   111,   -91,
+     114,   -91,   136,   137,   142,   -91,   -91,    31,    31,    76,
+     254,   -91,   143,   146,    27,   115,   207,   258,   243,   -14,
+     243,   179,   -91,   -91,   -91,   -91,   -91,   -91,    -7,   -91,
+      31,    31,   105,    51,    51,    51,    51,    51,    51,   -91,
+     -91,   156,   168,   181,    37,    37,    31,   178,    51,   -91,
+     206,   -91,   -91,   -91,   -91,   196,   -91,   -91,   175,    37,
+      37,   185,   -91,   -91,   -91,   -91,   -91,   -91,   -91,   -91,
+     -91,   -91,   -91,   -91,   -91,   214,   -91,   230,   -91,   -91,
+     -91,   -91,   -91,   -91,   -91,   -91,   -91,   -91,   183,   -91,
+     -91,   -91,   -91,   -91,   -91,   -91,   -91,   -91,    31,   214,
+     194,   214,    45,   214,    51,    26,   195,   -91,   -91,   214,
+     197,   214,    31,   -91,   139,   208,   -91,   -91,   220,   224,
+     214,   222,   -91,   -91,   226,   -91,   227,   123,   -91,   -91,
+     -91,   -91,   235,    37,   -91,   -91,   -91,   -91,   -91
 };
 
 /* YYPGOTO[NTERM-NUM].  */
 static const yytype_int16 yypgoto[] =
 {
-     -90,   -90,   269,   271,   -90,    23,   -70,   -90,   -90,   -90,
-     -90,   243,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -48,
-     -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   -20,   -90,   -90,   -90,   -90,   -90,   206,   205,   -68,
-     -90,   -90,   169,    -1,    27,    -7,   118,   -66,   -89,   -90
+     -91,   -91,   264,   268,   -91,    30,   -65,   -91,   -91,   -91,
+     -91,   238,   -91,   -91,   -91,   -91,   -91,   -91,   -91,   -12,
+     -91,   -91,   -91,   -91,   -91,   -91,   -91,   -91,   -91,   -91,
+     -91,    -5,   -91,   -91,   -91,   -91,   -91,   200,   209,   -61,
+     -91,   -91,   170,    -1,    65,     0,   118,   -66,   -90,   -91
 };
 
 /* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
@@ -698,102 +717,102 @@ static const yytype_int16 yypgoto[] =
 #define YYTABLE_NINF -86
 static const yytype_int16 yytable[] =
 {
-      10,    88,    89,    54,   146,   147,   119,     1,   122,   164,
-      93,   141,    56,   142,    58,   156,    94,    62,     1,    90,
-      91,   131,    65,    66,   144,   145,    67,    90,    91,   132,
-     127,    68,   136,   -31,    97,     2,   154,   -31,   -31,   -31,
-     -31,   -31,   -31,   -31,   -31,    98,    52,   -31,   -31,    99,
-     -31,   100,   101,   102,   103,   104,   -31,   105,   129,   106,
-     138,   173,    92,   141,   107,   142,   174,   172,     8,     9,
-     143,   -33,    97,    90,    91,   -33,   -33,   -33,   -33,   -33,
-     -33,   -33,   -33,    98,   166,   -33,   -33,    99,   -33,   100,
-     101,   102,   103,   104,   -33,   105,    11,   106,   179,   151,
-     123,   126,   107,   135,   125,   130,     2,   139,     2,    90,
-      91,    -5,    12,    55,   161,    13,    14,    15,    16,    17,
-      18,    19,    20,    65,    66,    21,    22,    23,    24,    25,
-      26,    27,    28,    29,    30,    57,    59,    31,    61,    -4,
-      12,    63,    32,    13,    14,    15,    16,    17,    18,    19,
-      20,    64,    71,    21,    22,    23,    24,    25,    26,    27,
-      28,    29,    30,    72,    73,    31,   180,    90,    91,    52,
-      32,   -85,    97,    82,    83,   -85,   -85,   -85,   -85,   -85,
-     -85,   -85,   -85,    84,   190,   -85,   -85,    99,   -85,   -85,
-     -85,   -85,   -85,   -85,   -85,    85,    97,   106,    86,    87,
-     -52,   -52,   140,   -52,   -52,   -52,   -52,    98,    95,   -52,
-     -52,    99,   114,   115,   116,   117,    96,   148,   149,   150,
-     158,   106,   155,   159,    97,   163,   118,   -76,   -76,   -76,
-     -76,   -76,   -76,   -76,   -76,   160,   164,   -76,   -76,    99,
-      13,    14,    15,    16,    17,    18,    19,    20,    91,   106,
-      21,    22,    14,    15,   140,    17,    18,    19,    20,   168,
-     175,    21,    22,   177,   181,   182,   183,    32,   187,   167,
-     188,   169,   170,   171,   185,   189,    53,    51,    32,   176,
-      75,   178,   121,     0,   133,   162,     0,     0,     0,     0,
-     184
+      10,    88,    89,   150,   151,   152,   153,   154,   155,   135,
+      54,   123,    56,    11,    58,   126,   145,    62,   164,     2,
+     146,   136,     1,     1,   148,   149,   147,   -31,   101,    90,
+      91,   -31,   -31,   -31,   -31,   -31,   -31,   -31,   -31,   102,
+     162,   -31,   -31,   103,   -31,   104,   105,   106,   107,   108,
+     -31,   109,   181,   110,     2,    52,    55,    65,    66,   172,
+      57,   182,   111,     8,     9,    67,   131,    59,   140,    92,
+      68,    61,   145,   133,   180,   142,   146,    65,    66,    -5,
+      12,    90,    91,    13,    14,    15,    16,    17,    18,    19,
+      20,    71,   174,    21,    22,    23,    24,    25,    26,    27,
+      28,    29,    30,   159,    63,    31,   187,   127,   130,    64,
+     139,     2,    90,    91,    32,   -33,   101,    72,   169,   -33,
+     -33,   -33,   -33,   -33,   -33,   -33,   -33,   102,    73,   -33,
+     -33,   103,   -33,   104,   105,   106,   107,   108,   -33,   109,
+      52,   110,   129,   134,    82,   143,    83,    -4,    12,    84,
+     111,    13,    14,    15,    16,    17,    18,    19,    20,    90,
+      91,    21,    22,    23,    24,    25,    26,    27,    28,    29,
+      30,    85,    86,    31,   188,    90,    91,    87,    99,   -85,
+     101,   100,    32,   -85,   -85,   -85,   -85,   -85,   -85,   -85,
+     -85,   156,   198,   -85,   -85,   103,   -85,   -85,   -85,   -85,
+     -85,   -85,   -85,   157,   163,   110,   158,   166,   101,   167,
+     168,   171,   -52,   -52,   144,   -52,   -52,   -52,   -52,   102,
+      91,   -52,   -52,   103,   118,   119,   120,   121,   172,   176,
+     183,   101,   185,   110,   -76,   -76,   -76,   -76,   -76,   -76,
+     -76,   -76,   122,   189,   -76,   -76,   103,    13,    14,    15,
+      16,    17,    18,    19,    20,   190,   110,    21,    22,   191,
+     193,   195,   196,    14,    15,   144,    17,    18,    19,    20,
+     197,    53,    21,    22,    51,    75,   125,   175,    32,   177,
+     178,   179,    93,    94,    95,    96,    97,   184,   137,   186,
+     170,     0,    98,    32,     0,     0,     0,     0,   192
 };
 
 #define yypact_value_is_default(yystate) \
-  ((yystate) == (-90))
+  ((yystate) == (-91))
 
 #define yytable_value_is_error(yytable_value) \
   YYID (0)
 
 static const yytype_int16 yycheck[] =
 {
-       1,    67,    68,    10,    93,    94,    76,     3,    76,    14,
-      28,    81,    13,    81,    15,   104,    34,    18,     3,    32,
-      33,    23,    26,    27,    90,    91,    30,    32,    33,    31,
-      78,    35,    80,     0,     1,    31,   102,     4,     5,     6,
-       7,     8,     9,    10,    11,    12,    31,    14,    15,    16,
-      17,    18,    19,    20,    21,    22,    23,    24,    78,    26,
-      80,    26,    69,   133,    31,   133,    31,   156,    26,    27,
-      29,     0,     1,    32,    33,     4,     5,     6,     7,     8,
-       9,    10,    11,    12,   150,    14,    15,    16,    17,    18,
-      19,    20,    21,    22,    23,    24,     0,    26,   164,   100,
-      77,    78,    31,    80,    77,    78,    31,    80,    31,    32,
-      33,     0,     1,    31,   115,     4,     5,     6,     7,     8,
-       9,    10,    11,    26,    27,    14,    15,    16,    17,    18,
-      19,    20,    21,    22,    23,    31,    26,    26,    31,     0,
-       1,    26,    31,     4,     5,     6,     7,     8,     9,    10,
-      11,    26,    31,    14,    15,    16,    17,    18,    19,    20,
-      21,    22,    23,     1,     1,    26,    31,    32,    33,    31,
-      31,     0,     1,    31,    31,     4,     5,     6,     7,     8,
-       9,    10,    11,    31,   185,    14,    15,    16,    17,    18,
-      19,    20,    21,    22,    23,    31,     1,    26,    31,    31,
-       5,     6,    31,     8,     9,    10,    11,    12,    31,    14,
-      15,    16,    17,    18,    19,    20,    31,    31,    31,    25,
-       1,    26,    26,    13,     1,    26,    31,     4,     5,     6,
-       7,     8,     9,    10,    11,    31,    14,    14,    15,    16,
-       4,     5,     6,     7,     8,     9,    10,    11,    33,    26,
-      14,    15,     5,     6,    31,     8,     9,    10,    11,    31,
-      31,    14,    15,    31,    31,    31,    31,    31,    31,   151,
-      31,   153,   154,   155,    34,    31,     7,     6,    31,   161,
-      37,   163,    76,    -1,    79,   116,    -1,    -1,    -1,    -1,
-     172
+       1,    67,    68,    93,    94,    95,    96,    97,    98,    23,
+      10,    76,    13,     0,    15,    76,    81,    18,   108,    35,
+      81,    35,     3,     3,    90,    91,    33,     0,     1,    36,
+      37,     4,     5,     6,     7,     8,     9,    10,    11,    12,
+     106,    14,    15,    16,    17,    18,    19,    20,    21,    22,
+      23,    24,    26,    26,    35,    35,    35,    26,    27,    14,
+      35,    35,    35,    26,    27,    34,    78,    26,    80,    69,
+      39,    35,   137,    78,   164,    80,   137,    26,    27,     0,
+       1,    36,    37,     4,     5,     6,     7,     8,     9,    10,
+      11,    35,   158,    14,    15,    16,    17,    18,    19,    20,
+      21,    22,    23,   104,    26,    26,   172,    77,    78,    26,
+      80,    35,    36,    37,    35,     0,     1,     1,   119,     4,
+       5,     6,     7,     8,     9,    10,    11,    12,     1,    14,
+      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
+      35,    26,    77,    78,    35,    80,    35,     0,     1,    35,
+      35,     4,     5,     6,     7,     8,     9,    10,    11,    36,
+      37,    14,    15,    16,    17,    18,    19,    20,    21,    22,
+      23,    35,    35,    26,    35,    36,    37,    35,    35,     0,
+       1,    35,    35,     4,     5,     6,     7,     8,     9,    10,
+      11,    35,   193,    14,    15,    16,    17,    18,    19,    20,
+      21,    22,    23,    35,    26,    26,    25,     1,     1,    13,
+      35,    26,     5,     6,    35,     8,     9,    10,    11,    12,
+      37,    14,    15,    16,    17,    18,    19,    20,    14,    35,
+      35,     1,    35,    26,     4,     5,     6,     7,     8,     9,
+      10,    11,    35,    35,    14,    15,    16,     4,     5,     6,
+       7,     8,     9,    10,    11,    35,    26,    14,    15,    35,
+      38,    35,    35,     5,     6,    35,     8,     9,    10,    11,
+      35,     7,    14,    15,     6,    37,    76,   159,    35,   161,
+     162,   163,    28,    29,    30,    31,    32,   169,    79,   171,
+     120,    -1,    38,    35,    -1,    -1,    -1,    -1,   180
 };
 
 /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
    symbol of state STATE-NUM.  */
 static const yytype_uint8 yystos[] =
 {
-       0,     3,    31,    37,    38,    39,    63,    81,    26,    27,
-      79,     0,     1,     4,     5,     6,     7,     8,     9,    10,
+       0,     3,    35,    41,    42,    43,    67,    85,    26,    27,
+      83,     0,     1,     4,     5,     6,     7,     8,     9,    10,
       11,    14,    15,    16,    17,    18,    19,    20,    21,    22,
-      23,    26,    31,    40,    41,    43,    44,    45,    46,    52,
-      53,    55,    59,    61,    64,    65,    67,    69,    70,    71,
-      80,    39,    31,    38,    81,    31,    79,    31,    79,    26,
-      85,    31,    79,    26,    26,    26,    27,    30,    35,    83,
-      84,    31,     1,     1,    47,    47,    56,    58,    62,    76,
-      68,    74,    31,    31,    31,    31,    31,    31,    83,    83,
-      32,    33,    81,    28,    34,    31,    31,     1,    12,    16,
-      18,    19,    20,    21,    22,    24,    26,    31,    42,    48,
-      49,    72,    73,    75,    17,    18,    19,    20,    31,    42,
-      57,    73,    75,    41,    54,    80,    41,    55,    60,    67,
-      80,    23,    31,    74,    77,    41,    55,    66,    67,    80,
-      31,    42,    75,    29,    83,    83,    84,    84,    31,    31,
-      25,    79,    78,    79,    83,    26,    84,    50,     1,    13,
-      31,    79,    78,    26,    14,    82,    83,    82,    31,    82,
-      82,    82,    84,    26,    31,    31,    82,    31,    82,    83,
-      31,    31,    31,    31,    82,    34,    51,    31,    31,    31,
-      79
+      23,    26,    35,    44,    45,    47,    48,    49,    50,    56,
+      57,    59,    63,    65,    68,    69,    71,    73,    74,    75,
+      84,    43,    35,    42,    85,    35,    83,    35,    83,    26,
+      89,    35,    83,    26,    26,    26,    27,    34,    39,    87,
+      88,    35,     1,     1,    51,    51,    60,    62,    66,    80,
+      72,    78,    35,    35,    35,    35,    35,    35,    87,    87,
+      36,    37,    85,    28,    29,    30,    31,    32,    38,    35,
+      35,     1,    12,    16,    18,    19,    20,    21,    22,    24,
+      26,    35,    46,    52,    53,    76,    77,    79,    17,    18,
+      19,    20,    35,    46,    61,    77,    79,    45,    58,    84,
+      45,    59,    64,    71,    84,    23,    35,    78,    81,    45,
+      59,    70,    71,    84,    35,    46,    79,    33,    87,    87,
+      88,    88,    88,    88,    88,    88,    35,    35,    25,    83,
+      82,    83,    87,    26,    88,    54,     1,    13,    35,    83,
+      82,    26,    14,    86,    87,    86,    35,    86,    86,    86,
+      88,    26,    35,    35,    86,    35,    86,    87,    35,    35,
+      35,    35,    86,    38,    55,    35,    35,    35,    83
 };
 
 #define yyerrok		(yyerrstatus = 0)
@@ -823,17 +842,18 @@ static const yytype_uint8 yystos[] =
 
 #define YYRECOVERING()  (!!yyerrstatus)
 
-#define YYBACKUP(Token, Value)					\
-do								\
-  if (yychar == YYEMPTY && yylen == 1)				\
-    {								\
-      yychar = (Token);						\
-      yylval = (Value);						\
-      YYPOPSTACK (1);						\
-      goto yybackup;						\
-    }								\
-  else								\
-    {								\
+#define YYBACKUP(Token, Value)                                  \
+do                                                              \
+  if (yychar == YYEMPTY)                                        \
+    {                                                           \
+      yychar = (Token);                                         \
+      yylval = (Value);                                         \
+      YYPOPSTACK (yylen);                                       \
+      yystate = *yyssp;                                         \
+      goto yybackup;                                            \
+    }                                                           \
+  else                                                          \
+    {                                                           \
       yyerror (YY_("syntax error: cannot back up")); \
       YYERROR;							\
     }								\
@@ -928,6 +948,8 @@ yy_symbol_value_print (yyoutput, yytype,
     YYSTYPE const * const yyvaluep;
 #endif
 {
+  FILE *yyo = yyoutput;
+  YYUSE (yyo);
   if (!yyvaluep)
     return;
 # ifdef YYPRINT
@@ -1179,12 +1201,12 @@ static int
 yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                 yytype_int16 *yyssp, int yytoken)
 {
-  YYSIZE_T yysize0 = yytnamerr (0, yytname[yytoken]);
+  YYSIZE_T yysize0 = yytnamerr (YY_NULL, yytname[yytoken]);
   YYSIZE_T yysize = yysize0;
   YYSIZE_T yysize1;
   enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
   /* Internationalized format string. */
-  const char *yyformat = 0;
+  const char *yyformat = YY_NULL;
   /* Arguments of yyformat. */
   char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
   /* Number of reported tokens (one for the "unexpected", one per
@@ -1244,7 +1266,7 @@ yysyntax_error (YYSIZE_T *yymsg_alloc, c
                     break;
                   }
                 yyarg[yycount++] = yytname[yyx];
-                yysize1 = yysize + yytnamerr (0, yytname[yyx]);
+                yysize1 = yysize + yytnamerr (YY_NULL, yytname[yyx]);
                 if (! (yysize <= yysize1
                        && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                   return 2;
@@ -1329,7 +1351,7 @@ yydestruct (yymsg, yytype, yyvaluep)
 
   switch (yytype)
     {
-      case 53: /* "choice_entry" */
+      case 57: /* "choice_entry" */
 
 	{
 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
@@ -1339,7 +1361,7 @@ yydestruct (yymsg, yytype, yyvaluep)
 };
 
 	break;
-      case 59: /* "if_entry" */
+      case 63: /* "if_entry" */
 
 	{
 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
@@ -1349,7 +1371,7 @@ yydestruct (yymsg, yytype, yyvaluep)
 };
 
 	break;
-      case 65: /* "menu_entry" */
+      case 69: /* "menu_entry" */
 
 	{
 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
@@ -1426,7 +1448,7 @@ yyparse ()
        `yyss': related to states.
        `yyvs': related to semantic values.
 
-       Refer to the stacks thru separate pointers, to allow yyoverflow
+       Refer to the stacks through separate pointers, to allow yyoverflow
        to reallocate them elsewhere.  */
 
     /* The state stack.  */
@@ -2012,46 +2034,66 @@ yyreduce:
 
   case 109:
 
-    { (yyval.expr) = expr_alloc_comp(E_EQUAL, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); }
+    { (yyval.expr) = expr_alloc_comp(E_LTH, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); }
     break;
 
   case 110:
 
-    { (yyval.expr) = expr_alloc_comp(E_UNEQUAL, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); }
+    { (yyval.expr) = expr_alloc_comp(E_LEQ, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); }
     break;
 
   case 111:
 
-    { (yyval.expr) = (yyvsp[(2) - (3)].expr); }
+    { (yyval.expr) = expr_alloc_comp(E_GTH, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); }
     break;
 
   case 112:
 
-    { (yyval.expr) = expr_alloc_one(E_NOT, (yyvsp[(2) - (2)].expr)); }
+    { (yyval.expr) = expr_alloc_comp(E_GEQ, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); }
     break;
 
   case 113:
 
-    { (yyval.expr) = expr_alloc_two(E_OR, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); }
+    { (yyval.expr) = expr_alloc_comp(E_EQUAL, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); }
     break;
 
   case 114:
 
-    { (yyval.expr) = expr_alloc_two(E_AND, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); }
+    { (yyval.expr) = expr_alloc_comp(E_UNEQUAL, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); }
     break;
 
   case 115:
 
-    { (yyval.symbol) = sym_lookup((yyvsp[(1) - (1)].string), 0); free((yyvsp[(1) - (1)].string)); }
+    { (yyval.expr) = (yyvsp[(2) - (3)].expr); }
     break;
 
   case 116:
 
-    { (yyval.symbol) = sym_lookup((yyvsp[(1) - (1)].string), SYMBOL_CONST); free((yyvsp[(1) - (1)].string)); }
+    { (yyval.expr) = expr_alloc_one(E_NOT, (yyvsp[(2) - (2)].expr)); }
     break;
 
   case 117:
 
+    { (yyval.expr) = expr_alloc_two(E_OR, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); }
+    break;
+
+  case 118:
+
+    { (yyval.expr) = expr_alloc_two(E_AND, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); }
+    break;
+
+  case 119:
+
+    { (yyval.symbol) = sym_lookup((yyvsp[(1) - (1)].string), 0); free((yyvsp[(1) - (1)].string)); }
+    break;
+
+  case 120:
+
+    { (yyval.symbol) = sym_lookup((yyvsp[(1) - (1)].string), SYMBOL_CONST); free((yyvsp[(1) - (1)].string)); }
+    break;
+
+  case 121:
+
     { (yyval.string) = NULL; }
     break;
 
@@ -2243,7 +2285,7 @@ yyabortlab:
   yyresult = 1;
   goto yyreturn;
 
-#if !defined(yyoverflow) || YYERROR_VERBOSE
+#if !defined yyoverflow || YYERROR_VERBOSE
 /*-------------------------------------------------.
 | yyexhaustedlab -- memory exhaustion comes here.  |
 `-------------------------------------------------*/
--- 3.19-rc5-kconfig.orig/scripts/kconfig/zconf.y
+++ 3.19-rc5-kconfig/scripts/kconfig/zconf.y
@@ -69,6 +69,10 @@ static struct menu *current_menu, *curre
 %token <string> T_WORD
 %token <string> T_WORD_QUOTE
 %token T_UNEQUAL
+%token T_LESS
+%token T_LESS_EQUAL
+%token T_GREATER
+%token T_GREATER_EQUAL
 %token T_CLOSE_PAREN
 %token T_OPEN_PAREN
 %token T_EOL
@@ -76,6 +80,7 @@ static struct menu *current_menu, *curre
 %left T_OR
 %left T_AND
 %left T_EQUAL T_UNEQUAL
+%left T_LESS T_LESS_EQUAL T_GREATER T_GREATER_EQUAL
 %nonassoc T_NOT
 
 %type <string> prompt
@@ -467,6 +472,10 @@ if_expr:  /* empty */			{ $$ = NULL; }
 ;
 
 expr:	  symbol				{ $$ = expr_alloc_symbol($1); }
+	| symbol T_LESS symbol			{ $$ = expr_alloc_comp(E_LTH, $1, $3); }
+	| symbol T_LESS_EQUAL symbol		{ $$ = expr_alloc_comp(E_LEQ, $1, $3); }
+	| symbol T_GREATER symbol		{ $$ = expr_alloc_comp(E_GTH, $1, $3); }
+	| symbol T_GREATER_EQUAL symbol		{ $$ = expr_alloc_comp(E_GEQ, $1, $3); }
 	| symbol T_EQUAL symbol			{ $$ = expr_alloc_comp(E_EQUAL, $1, $3); }
 	| symbol T_UNEQUAL symbol		{ $$ = expr_alloc_comp(E_UNEQUAL, $1, $3); }
 	| T_OPEN_PAREN expr T_CLOSE_PAREN	{ $$ = $2; }


