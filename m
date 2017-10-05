Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34082 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751452AbdJEMCw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Oct 2017 08:02:52 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 2/3] kconfig: Clarify expression rewriting
Date: Thu,  5 Oct 2017 14:01:14 +0200
Message-Id: <1507204875-5021-3-git-send-email-ulfalizer@gmail.com>
In-Reply-To: <1507204875-5021-1-git-send-email-ulfalizer@gmail.com>
References: <1507204875-5021-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, mmarek@suse.com, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, JBeulich@suse.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

menu_finalize() is one of the more opaque parts of Kconfig, and I need
to make some changes to it to fix an issue related to modules. Add some
comments related to expression rewriting and dependency propagation as a
review aid. They will also help other people trying to understand the
code.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/menu.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 8354dfa..94f192de 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -296,6 +296,11 @@ void menu_finalize(struct menu *parent)
 
 	sym = parent->sym;
 	if (parent->list) {
+		/*
+		 * This menu node has children. We (recursively) process them
+		 * and propagate parent dependencies before moving on.
+		 */
+
 		if (sym && sym_is_choice(sym)) {
 			if (sym->type == S_UNKNOWN) {
 				/* find the first choice value to find out choice type */
@@ -319,24 +324,66 @@ void menu_finalize(struct menu *parent)
 		else
 			parentdep = parent->dep;
 
+		/* For each child menu node... */
 		for (menu = parent->list; menu; menu = menu->next) {
+			/*
+			 * Propagate parent dependencies to the child menu
+			 * node, also rewriting and simplifying expressions
+			 */
 			basedep = expr_transform(menu->dep);
 			basedep = expr_alloc_and(expr_copy(parentdep), basedep);
 			basedep = expr_eliminate_dups(basedep);
 			menu->dep = basedep;
+
 			if (menu->sym)
+				/*
+				 * Note: For symbols, all prompts are included
+				 * too in the symbol's own property list
+				 */
 				prop = menu->sym->prop;
 			else
+				/*
+				 * For non-symbol menu nodes, we just need to
+				 * handle the prompt
+				 */
 				prop = menu->prompt;
+
+			/* For each property... */
 			for (; prop; prop = prop->next) {
 				if (prop->menu != menu)
+					/*
+					 * Two possibilities:
+					 *
+					 * 1. The property lacks dependencies
+					 *    and so isn't location-specific,
+					 *    e.g. an 'option'
+					 *
+					 * 2. The property belongs to a symbol
+					 *    defined in multiple locations and
+					 *    is from some other location. It
+					 *    will be handled there in that
+					 *    case.
+					 *
+					 * Skip the property.
+					 */
 					continue;
+
+				/*
+				 * Propagate parent dependencies to the
+				 * property's condition, rewriting and
+				 * simplifying expressions at the same time
+				 */
 				dep = expr_transform(prop->visible.expr);
 				dep = expr_alloc_and(expr_copy(basedep), dep);
 				dep = expr_eliminate_dups(dep);
 				if (menu->sym && menu->sym->type != S_TRISTATE)
 					dep = expr_trans_bool(dep);
 				prop->visible.expr = dep;
+
+				/*
+				 * Handle selects and implies, which modify the
+				 * dependencies of the selected/implied symbol
+				 */
 				if (prop->type == P_SELECT) {
 					struct symbol *es = prop_get_symbol(prop);
 					es->rev_dep.expr = expr_alloc_or(es->rev_dep.expr,
@@ -348,6 +395,11 @@ void menu_finalize(struct menu *parent)
 				}
 			}
 		}
+
+		/*
+		 * Recursively process children in the same fashion before
+		 * moving on
+		 */
 		for (menu = parent->list; menu; menu = menu->next)
 			menu_finalize(menu);
 	} else if (sym) {
-- 
2.7.4

