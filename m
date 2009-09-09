Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay1.sgi.com ([192.48.179.29]:42335 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752046AbZIISZQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Sep 2009 14:25:16 -0400
Received: from estes.americas.sgi.com (estes.americas.sgi.com [128.162.236.10])
	by relay1.corp.sgi.com (Postfix) with ESMTP id 0C9D08F80BC
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Sep 2009 11:25:19 -0700 (PDT)
Date: Wed, 9 Sep 2009 13:25:18 -0500
From: Robin Holt <holt@sgi.com>
Subject: [Patch] menuconfig: Display current values with symbols.
Message-ID: <20090909182518.GB9913@sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: holt@sgi.com


While investigating why a CONFIG_ symbol was not displayed, I was
frustrated with finding each of the dependent symbol's values.  This patch
adds a display of the symbol's value along side the symbol's name.

Signed-off-by: Robin Holt <holt@sgi.com>

---

One additional suggestion would be an easy way to navigate from the
search screen to the spot in the menus where that CONFIG_ value is set.
I could not figure out a clear and convenient method for that.  Some of
the menus are fairly long and since they are not sorted, can result in
some frustration while searching for the individual setting.


Index: xpmem_numatools_kernel/scripts/kconfig/expr.c
===================================================================
--- xpmem_numatools_kernel.orig/scripts/kconfig/expr.c	2009-09-08 13:30:57.000000000 -0500
+++ xpmem_numatools_kernel/scripts/kconfig/expr.c	2009-09-09 11:53:07.000000000 -0500
@@ -1013,6 +1013,19 @@ int expr_compare_type(enum expr_type t1,
 #endif
 }
 
+void expr_print_symbol(void (*fn)(void *, struct symbol *, const char *), void *data, struct symbol *sym)
+{
+	char sym_value_str[5];
+
+	if (sym->name) {
+		fn(data, sym, sym->name);
+		if (snprintf(sym_value_str, 5, "[=%s]", sym_get_string_value(sym)) < 5)
+			fn(data, sym, sym_value_str);
+	} else {
+		fn(data, NULL, "<choice>");
+	}
+}
+
 void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken)
 {
 	if (!e) {
@@ -1024,28 +1037,19 @@ void expr_print(struct expr *e, void (*f
 		fn(data, NULL, "(");
 	switch (e->type) {
 	case E_SYMBOL:
-		if (e->left.sym->name)
-			fn(data, e->left.sym, e->left.sym->name);
-		else
-			fn(data, NULL, "<choice>");
+		expr_print_symbol(fn, data, e->left.sym);
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
+		expr_print_symbol(fn, data, e->left.sym);
 		fn(data, NULL, "=");
 		fn(data, e->right.sym, e->right.sym->name);
 		break;
 	case E_UNEQUAL:
-		if (e->left.sym->name)
-			fn(data, e->left.sym, e->left.sym->name);
-		else
-			fn(data, NULL, "<choice>");
+		expr_print_symbol(fn, data, e->left.sym);
 		fn(data, NULL, "!=");
 		fn(data, e->right.sym, e->right.sym->name);
 		break;
