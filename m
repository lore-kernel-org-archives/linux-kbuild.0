Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:54244 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbeHOIwQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Aug 2018 04:52:16 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 2/3] kconfig: report recursive dependency involving 'imply'
Date: Wed, 15 Aug 2018 14:59:44 +0900
Message-Id: <1534312785-28434-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1534312785-28434-1-git-send-email-yamada.masahiro@socionext.com>
References: <1534312785-28434-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org

Currently, Kconfig does not complain about the recursive dependency
where 'imply' keywords are involved.

[Test Code]

  config A
          bool "a"

  config B
          bool "b"
          imply A
          depends on A

In the code above, Kconfig cannot calculate the symbol values correctly
due to the circular dependency.  For example, allyesconfig followed by
syncconfig results in an odd behavior because CONFIG_B becomes visible
in syncconfig.

  $ make allyesconfig
  scripts/kconfig/conf  --allyesconfig Kconfig
  #
  # configuration written to .config
  #
  $ cat .config
  #
  # Automatically generated file; DO NOT EDIT.
  # Main menu
  #
  CONFIG_A=y
  $ make syncconfig
  scripts/kconfig/conf  --syncconfig Kconfig
  *
  * Restart config...
  *
  *
  * Main menu
  *
  a (A) [Y/n/?] y
    b (B) [N/y/?] (NEW)

To detect this correctly, sym_check_expr_deps() should recurse to
not only sym->rev_dep.expr but also sym->implied.expr .

At this moment, sym_check_print_recursive() cannot distinguish
'select' and 'imply' since it does not know the precise context
where the recursive dependency has been hit.  This will be solved
by the next commit.

In fact, even the document and the unit-test are confused.  Using
'imply' does not solve recursive dependency since 'imply' addresses
the unmet direct dependency, which 'select' could cause.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
 - Fix documentation and unit-test

 Documentation/kbuild/kconfig-language.txt          |  3 +-
 scripts/kconfig/symbol.c                           |  9 +++--
 scripts/kconfig/tests/err_recursive_dep/Kconfig    |  3 +-
 .../tests/err_recursive_dep/expected_stderr        | 38 +++++++++++++---------
 4 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
index c54cb7c..864e740 100644
--- a/Documentation/kbuild/kconfig-language.txt
+++ b/Documentation/kbuild/kconfig-language.txt
@@ -545,7 +545,7 @@ make KBUILD_KCONFIG=Documentation/kbuild/Kconfig.recursion-issue-02 allnoconfig
 Practical solutions to kconfig recursive issue
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-Developers who run into the recursive Kconfig issue have three options
+Developers who run into the recursive Kconfig issue have two options
 at their disposal. We document them below and also provide a list of
 historical issues resolved through these different solutions.
 
@@ -553,7 +553,6 @@ historical issues resolved through these different solutions.
   b) Match dependency semantics:
 	b1) Swap all "select FOO" to "depends on FOO" or,
 	b2) Swap all "depends on FOO" to "select FOO"
-  c) Consider the use of "imply" instead of "select"
 
 The resolution to a) can be tested with the sample Kconfig file
 Documentation/kbuild/Kconfig.recursion-issue-01 through the removal
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 688f487..90e70609 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1098,7 +1098,7 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 				sym->name ? sym->name : "<choice>",
 				next_sym->name ? next_sym->name : "<choice>");
 		} else {
-			fprintf(stderr, "%s:%d:\tsymbol %s is selected by %s\n",
+			fprintf(stderr, "%s:%d:\tsymbol %s is selected or implied by %s\n",
 				prop->file->name, prop->lineno,
 				sym->name ? sym->name : "<choice>",
 				next_sym->name ? next_sym->name : "<choice>");
@@ -1161,8 +1161,13 @@ static struct symbol *sym_check_sym_deps(struct symbol *sym)
 	if (sym2)
 		goto out;
 
+	sym2 = sym_check_expr_deps(sym->implied.expr);
+	if (sym2)
+		goto out;
+
 	for (prop = sym->prop; prop; prop = prop->next) {
-		if (prop->type == P_CHOICE || prop->type == P_SELECT)
+		if (prop->type == P_CHOICE || prop->type == P_SELECT ||
+		    prop->type == P_IMPLY)
 			continue;
 		stack.prop = prop;
 		sym2 = sym_check_expr_deps(prop->visible.expr);
diff --git a/scripts/kconfig/tests/err_recursive_dep/Kconfig b/scripts/kconfig/tests/err_recursive_dep/Kconfig
index a65bfcb..ebdb3ff 100644
--- a/scripts/kconfig/tests/err_recursive_dep/Kconfig
+++ b/scripts/kconfig/tests/err_recursive_dep/Kconfig
@@ -1,3 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
 # depends on itself
 
 config A
@@ -31,7 +33,6 @@ config D2
 	bool
 
 # depends on and imply
-# This is not recursive dependency
 
 config E1
 	bool "E1"
diff --git a/scripts/kconfig/tests/err_recursive_dep/expected_stderr b/scripts/kconfig/tests/err_recursive_dep/expected_stderr
index 3de807d..2eb2528 100644
--- a/scripts/kconfig/tests/err_recursive_dep/expected_stderr
+++ b/scripts/kconfig/tests/err_recursive_dep/expected_stderr
@@ -1,30 +1,38 @@
-Kconfig:9:error: recursive dependency detected!
-Kconfig:9:	symbol B is selected by B
+Kconfig:11:error: recursive dependency detected!
+Kconfig:11:	symbol B is selected or implied by B
 For a resolution refer to Documentation/kbuild/kconfig-language.txt
 subsection "Kconfig recursive dependency limitations"
 
-Kconfig:3:error: recursive dependency detected!
-Kconfig:3:	symbol A depends on A
+Kconfig:5:error: recursive dependency detected!
+Kconfig:5:	symbol A depends on A
 For a resolution refer to Documentation/kbuild/kconfig-language.txt
 subsection "Kconfig recursive dependency limitations"
 
-Kconfig:15:error: recursive dependency detected!
-Kconfig:15:	symbol C1 depends on C2
-Kconfig:19:	symbol C2 depends on C1
+Kconfig:17:error: recursive dependency detected!
+Kconfig:17:	symbol C1 depends on C2
+Kconfig:21:	symbol C2 depends on C1
 For a resolution refer to Documentation/kbuild/kconfig-language.txt
 subsection "Kconfig recursive dependency limitations"
 
-Kconfig:30:error: recursive dependency detected!
-Kconfig:30:	symbol D2 is selected by D1
-Kconfig:25:	symbol D1 depends on D2
+Kconfig:32:error: recursive dependency detected!
+Kconfig:32:	symbol D2 is selected or implied by D1
+Kconfig:27:	symbol D1 depends on D2
 For a resolution refer to Documentation/kbuild/kconfig-language.txt
 subsection "Kconfig recursive dependency limitations"
 
-Kconfig:59:error: recursive dependency detected!
-Kconfig:59:	symbol G depends on G
+Kconfig:37:error: recursive dependency detected!
+Kconfig:37:	symbol E1 depends on E2
+Kconfig:42:	symbol E2 is selected or implied by E1
 For a resolution refer to Documentation/kbuild/kconfig-language.txt
 subsection "Kconfig recursive dependency limitations"
 
-Kconfig:50:error: recursive dependency detected!
-Kconfig:50:	symbol F2 depends on F1
-Kconfig:48:	symbol F1 default value contains F2
+Kconfig:60:error: recursive dependency detected!
+Kconfig:60:	symbol G depends on G
+For a resolution refer to Documentation/kbuild/kconfig-language.txt
+subsection "Kconfig recursive dependency limitations"
+
+Kconfig:51:error: recursive dependency detected!
+Kconfig:51:	symbol F2 depends on F1
+Kconfig:49:	symbol F1 default value contains F2
+For a resolution refer to Documentation/kbuild/kconfig-language.txt
+subsection "Kconfig recursive dependency limitations"
-- 
2.7.4
