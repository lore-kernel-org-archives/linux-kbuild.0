Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:57319 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751228AbdJHRmh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Oct 2017 13:42:37 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH] kconfig: Document automatic submenu creation code
Date: Sun,  8 Oct 2017 19:42:18 +0200
Message-Id: <1507484538-24051-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, michal.lkml@markovi.net, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, JBeulich@suse.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

It's tricky to figure out what it does (and how) without staring at the
code for a long time. Document it to make it more transparent.

No functional changes. Only comments added.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/menu.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index e935793..d5fa572 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -347,25 +347,63 @@ void menu_finalize(struct menu *parent)
 		for (menu = parent->list; menu; menu = menu->next)
 			menu_finalize(menu);
 	} else if (sym) {
+		/*
+		 * Automatic submenu creation. If sym, A, B, C, ..., are
+		 * consecutive symbols and A, B, C, ... all depend on sym, the
+		 * following menu structure will be created:
+		 *
+		 *	sym
+		 *	 +-A
+		 *	 +-B
+		 *	 +-C
+		 *	 ...
+		 *
+		 * This also works recursively, giving the following structure
+		 * if B depends on A:
+		 *
+		 *	sym
+		 *	 +-A
+		 *	 | +-B
+		 *	 +-C
+		 *	 ...
+		 */
+
 		basedep = parent->prompt ? parent->prompt->visible.expr : NULL;
 		basedep = expr_trans_compare(basedep, E_UNEQUAL, &symbol_no);
 		basedep = expr_eliminate_dups(expr_transform(basedep));
+
+		/* Examine consecutive elements after sym */
 		last_menu = NULL;
 		for (menu = parent->next; menu; menu = menu->next) {
 			dep = menu->prompt ? menu->prompt->visible.expr : menu->dep;
 			if (!expr_contains_symbol(dep, sym))
+				/* No dependency, quit */
 				break;
 			if (expr_depends_symbol(dep, sym))
+				/* Absolute dependency, put in submenu */
 				goto next;
+
+			/*
+			 * Also consider it a dependency on sym if our
+			 * dependencies contain sym and are a "superset" of
+			 * sym's dependencies, e.g. '(sym || Q) && R' when sym
+			 * depends on R.
+			 *
+			 * Note that 'R' might be from an enclosing menu or if,
+			 * making this a more common case than it might seem.
+			 */
+
 			dep = expr_trans_compare(dep, E_UNEQUAL, &symbol_no);
 			dep = expr_eliminate_dups(expr_transform(dep));
 			dep2 = expr_copy(basedep);
 			expr_eliminate_eq(&dep, &dep2);
 			expr_free(dep);
 			if (!expr_is_yes(dep2)) {
+				/* Not superset, quit */
 				expr_free(dep2);
 				break;
 			}
+			/* Superset, put in submenu */
 			expr_free(dep2);
 		next:
 			menu_finalize(menu);
-- 
2.7.4

