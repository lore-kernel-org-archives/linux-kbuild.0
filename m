Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:54027 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbeHOIwI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Aug 2018 04:52:08 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 3/3] kconfig: improve the recursive dependency report
Date: Wed, 15 Aug 2018 14:59:45 +0900
Message-Id: <1534312785-28434-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1534312785-28434-1-git-send-email-yamada.masahiro@socionext.com>
References: <1534312785-28434-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This commit improves the messages of the recursive dependency.
Currently, sym->dir_dep.expr is not checked.  Hence, any dependency
in property visibility is regarded as the dependency of the symbol.

[Test Code 1]

  config A
          bool "a"
          depends on B

  config B
          bool "b"
          depends on A

[Test Code 2]

  config A
          bool "a" if B

  config B
          bool "b"
          depends on A

For both cases above, the same message is displayed:

        symbol B depends on A
        symbol A depends on B

This commit changes the message for the latter case like this:

        symbol B depends on A
        symbol A prompt is visible depending on B

Also, 'select' and 'imply' are distinguished.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
 - Update unit test

 scripts/kconfig/symbol.c                           | 48 +++++++++++++++-------
 .../tests/err_recursive_dep/expected_stderr        |  6 +--
 2 files changed, 37 insertions(+), 17 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 90e70609..703b9b8 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1011,7 +1011,7 @@ static struct dep_stack {
 	struct dep_stack *prev, *next;
 	struct symbol *sym;
 	struct property *prop;
-	struct expr *expr;
+	struct expr **expr;
 } *check_top;
 
 static void dep_stack_insert(struct dep_stack *stack, struct symbol *sym)
@@ -1076,31 +1076,42 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 			fprintf(stderr, "%s:%d:error: recursive dependency detected!\n",
 				prop->file->name, prop->lineno);
 
-		if (stack->expr) {
-			fprintf(stderr, "%s:%d:\tsymbol %s %s value contains %s\n",
-				prop->file->name, prop->lineno,
+		if (sym_is_choice(sym)) {
+			fprintf(stderr, "%s:%d:\tchoice %s contains symbol %s\n",
+				menu->file->name, menu->lineno,
+				sym->name ? sym->name : "<choice>",
+				next_sym->name ? next_sym->name : "<choice>");
+		} else if (sym_is_choice_value(sym)) {
+			fprintf(stderr, "%s:%d:\tsymbol %s is part of choice %s\n",
+				menu->file->name, menu->lineno,
 				sym->name ? sym->name : "<choice>",
-				prop_get_type_name(prop->type),
 				next_sym->name ? next_sym->name : "<choice>");
-		} else if (stack->prop) {
+		} else if (stack->expr == &sym->dir_dep.expr) {
 			fprintf(stderr, "%s:%d:\tsymbol %s depends on %s\n",
 				prop->file->name, prop->lineno,
 				sym->name ? sym->name : "<choice>",
 				next_sym->name ? next_sym->name : "<choice>");
-		} else if (sym_is_choice(sym)) {
-			fprintf(stderr, "%s:%d:\tchoice %s contains symbol %s\n",
-				menu->file->name, menu->lineno,
+		} else if (stack->expr == &sym->rev_dep.expr) {
+			fprintf(stderr, "%s:%d:\tsymbol %s is selected by %s\n",
+				prop->file->name, prop->lineno,
 				sym->name ? sym->name : "<choice>",
 				next_sym->name ? next_sym->name : "<choice>");
-		} else if (sym_is_choice_value(sym)) {
-			fprintf(stderr, "%s:%d:\tsymbol %s is part of choice %s\n",
-				menu->file->name, menu->lineno,
+		} else if (stack->expr == &sym->implied.expr) {
+			fprintf(stderr, "%s:%d:\tsymbol %s is implied by %s\n",
+				prop->file->name, prop->lineno,
 				sym->name ? sym->name : "<choice>",
 				next_sym->name ? next_sym->name : "<choice>");
+		} else if (stack->expr) {
+			fprintf(stderr, "%s:%d:\tsymbol %s %s value contains %s\n",
+				prop->file->name, prop->lineno,
+				sym->name ? sym->name : "<choice>",
+				prop_get_type_name(prop->type),
+				next_sym->name ? next_sym->name : "<choice>");
 		} else {
-			fprintf(stderr, "%s:%d:\tsymbol %s is selected or implied by %s\n",
+			fprintf(stderr, "%s:%d:\tsymbol %s %s is visible depending on %s\n",
 				prop->file->name, prop->lineno,
 				sym->name ? sym->name : "<choice>",
+				prop_get_type_name(prop->type),
 				next_sym->name ? next_sym->name : "<choice>");
 		}
 	}
@@ -1157,14 +1168,23 @@ static struct symbol *sym_check_sym_deps(struct symbol *sym)
 
 	dep_stack_insert(&stack, sym);
 
+	stack.expr = &sym->dir_dep.expr;
+	sym2 = sym_check_expr_deps(sym->dir_dep.expr);
+	if (sym2)
+		goto out;
+
+	stack.expr = &sym->rev_dep.expr;
 	sym2 = sym_check_expr_deps(sym->rev_dep.expr);
 	if (sym2)
 		goto out;
 
+	stack.expr = &sym->implied.expr;
 	sym2 = sym_check_expr_deps(sym->implied.expr);
 	if (sym2)
 		goto out;
 
+	stack.expr = NULL;
+
 	for (prop = sym->prop; prop; prop = prop->next) {
 		if (prop->type == P_CHOICE || prop->type == P_SELECT ||
 		    prop->type == P_IMPLY)
@@ -1175,7 +1195,7 @@ static struct symbol *sym_check_sym_deps(struct symbol *sym)
 			break;
 		if (prop->type != P_DEFAULT || sym_is_choice(sym))
 			continue;
-		stack.expr = prop->expr;
+		stack.expr = &prop->expr;
 		sym2 = sym_check_expr_deps(prop->expr);
 		if (sym2)
 			break;
diff --git a/scripts/kconfig/tests/err_recursive_dep/expected_stderr b/scripts/kconfig/tests/err_recursive_dep/expected_stderr
index 2eb2528..84679b1 100644
--- a/scripts/kconfig/tests/err_recursive_dep/expected_stderr
+++ b/scripts/kconfig/tests/err_recursive_dep/expected_stderr
@@ -1,5 +1,5 @@
 Kconfig:11:error: recursive dependency detected!
-Kconfig:11:	symbol B is selected or implied by B
+Kconfig:11:	symbol B is selected by B
 For a resolution refer to Documentation/kbuild/kconfig-language.txt
 subsection "Kconfig recursive dependency limitations"
 
@@ -15,14 +15,14 @@ For a resolution refer to Documentation/kbuild/kconfig-language.txt
 subsection "Kconfig recursive dependency limitations"
 
 Kconfig:32:error: recursive dependency detected!
-Kconfig:32:	symbol D2 is selected or implied by D1
+Kconfig:32:	symbol D2 is selected by D1
 Kconfig:27:	symbol D1 depends on D2
 For a resolution refer to Documentation/kbuild/kconfig-language.txt
 subsection "Kconfig recursive dependency limitations"
 
 Kconfig:37:error: recursive dependency detected!
 Kconfig:37:	symbol E1 depends on E2
-Kconfig:42:	symbol E2 is selected or implied by E1
+Kconfig:42:	symbol E2 is implied by E1
 For a resolution refer to Documentation/kbuild/kconfig-language.txt
 subsection "Kconfig recursive dependency limitations"
 
-- 
2.7.4
