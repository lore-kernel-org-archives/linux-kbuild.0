Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:55701 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730664AbeHNJaz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Aug 2018 05:30:55 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kconfig: report recursive dependency involving 'imply'
Date: Tue, 14 Aug 2018 15:43:40 +0900
Message-Id: <1534229021-8056-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Currently, Kconfig does not report anything about the recursive
dependency where 'imply' keywords are involved.

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

To report this correctly, sym_check_expr_deps() should recurse to
not only sym->rev_dep.expr but also sym->implied.expr .

At this moment, sym_check_print_recursive() cannot distinguish
'select' and 'imply' since it does not know the precise context
where the recursive dependency is hit.  This will be solved by
the next commit.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/symbol.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 4ec8b1f..7de7463a 100644
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
-- 
2.7.4
