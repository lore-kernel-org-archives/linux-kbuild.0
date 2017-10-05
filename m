Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:55661 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751317AbdJEMCz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Oct 2017 08:02:55 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 3/3] kconfig: Clean up modules handling and fix crash
Date: Thu,  5 Oct 2017 14:01:15 +0200
Message-Id: <1507204875-5021-4-git-send-email-ulfalizer@gmail.com>
In-Reply-To: <1507204875-5021-1-git-send-email-ulfalizer@gmail.com>
References: <1507204875-5021-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, mmarek@suse.com, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, JBeulich@suse.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

Kconfig currently doesn't handle 'm' appearing in a Kconfig file before
the modules symbol is defined (the symbol with 'option modules'). The
problem is the following code, which runs during parsing:

	/* change 'm' into 'm' && MODULES */
	if (e->left.sym == &symbol_mod)
		return expr_alloc_and(e, expr_alloc_symbol(modules_sym));

If the modules symbol has not yet been defined, modules_sym is NULL,
giving an invalid expression.

Here is a test file where both BEFORE_1 and BEFORE_2 trigger a segfault.
If the modules symbol is removed, all symbols trigger segfaults.

	config BEFORE_1
		def_tristate y if m

	if m
	config BEFORE_2
		def_tristate y
	endif

	config MODULES
		def_bool y
		option modules

	config AFTER_1
		def_tristate y if m

	if m
	config AFTER_2
		def_tristate y
	endif

Fix the issue by rewriting 'm' in menu_finalize() instead. This function
runs after parsing and is the proper place to do it. The following
existing code in conf_parse() in zconf.y ensures that the modules symbol
exists at that point:

	if (!modules_sym)
		modules_sym = sym_find( "n" );

	...

	menu_finalize(&rootmenu);

The following tests were done to ensure no functional changes for
configurations that don't reference 'm' before the modules symbol:

	- zconfdump(stdout) was run with ARCH=x86 and ARCH=arm before
	  and after the change and verified to produce identical output.
	  This function prints all symbols, choices, and menus together
	  with their properties and their dependency expressions. A
	  rewritten 'm' appears as 'm && MODULES'.

	  A small annoyance is that the assert(len != 0) in xfwrite()
	  needs to be disabled in order to use zconfdump(), because it
	  chokes on e.g. 'default ""'.

	- The Kconfiglib test suite was run to indirectly verify that
	  alldefconfig, allyesconfig, allnoconfig, and all defconfigs in
	  the kernel still generate the same final .config.

	- Valgrind was used to check for memory errors and (new) memory
	  leaks.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/menu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 94f192de..a7396e4 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -110,7 +110,7 @@ static struct expr *rewrite_m(struct expr *e)
 
 void menu_add_dep(struct expr *dep)
 {
-	current_entry->dep = expr_alloc_and(current_entry->dep, rewrite_m(dep));
+	current_entry->dep = expr_alloc_and(current_entry->dep, dep);
 }
 
 void menu_set_type(int type)
@@ -135,7 +135,7 @@ static struct property *menu_add_prop(enum prop_type type, char *prompt, struct
 
 	prop->menu = current_entry;
 	prop->expr = expr;
-	prop->visible.expr = rewrite_m(dep);
+	prop->visible.expr = dep;
 
 	if (prompt) {
 		if (isspace(*prompt)) {
@@ -330,7 +330,8 @@ void menu_finalize(struct menu *parent)
 			 * Propagate parent dependencies to the child menu
 			 * node, also rewriting and simplifying expressions
 			 */
-			basedep = expr_transform(menu->dep);
+			basedep = rewrite_m(menu->dep);
+			basedep = expr_transform(basedep);
 			basedep = expr_alloc_and(expr_copy(parentdep), basedep);
 			basedep = expr_eliminate_dups(basedep);
 			menu->dep = basedep;
@@ -373,7 +374,8 @@ void menu_finalize(struct menu *parent)
 				 * property's condition, rewriting and
 				 * simplifying expressions at the same time
 				 */
-				dep = expr_transform(prop->visible.expr);
+				dep = rewrite_m(prop->visible.expr);
+				dep = expr_transform(dep);
 				dep = expr_alloc_and(expr_copy(basedep), dep);
 				dep = expr_eliminate_dups(dep);
 				if (menu->sym && menu->sym->type != S_TRISTATE)
-- 
2.7.4

