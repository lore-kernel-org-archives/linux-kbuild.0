Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:40753 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751788Ab3KSVIs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Nov 2013 16:08:48 -0500
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH] scripts/kconfig: handle cases with 'option modules' defined after reference
In-Reply-To: <gheh6c155v.fsf@lena.gouders.net> (Dirk Gouders's message of
	"Tue, 19 Nov 2013 21:57:00 +0100")
References: <4647748.CU0TquGsxA@tacticalops> <20131105230619.GC3337@free.fr>
	<gheh6c155v.fsf@lena.gouders.net>
Date: Tue, 19 Nov 2013 22:08:24 +0100
Message-ID: <gh7gc414mv.fsf_-_@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Martin Walch <walch.martin@web.de>, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Libo Chen <libo.chen@huawei.com>

Currently, the following test-case causes a segfault:

config A
	tristate "A" if m

config MODULES
	boolean "MODULES"
	option modules

This is, because modules_sym is NULL until 'option modules' appears,
since commit
6902dccfda (kconfig: do not special-case 'MODULES' symbol).

The above example causes an expression of type symbol being generated
with NULL as the pointer to the symbol in menu_check_dep(), later
causing a segfault when that pointer is dereferenced.

This patch basically reverts commit 6902dccfda keeping only the change
that modules_sym references symbol 'n' as a default when 'option
modules' is not used in the config files.

Reported-by: Martin Walch <walch.martin@web.de>
Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 scripts/kconfig/menu.c  |  9 ++++++---
 scripts/kconfig/zconf.y | 11 +++++++++--
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index db1512a..c4ec1ff 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -198,15 +198,18 @@ void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep)
 
 void menu_add_option(int token, char *arg)
 {
+	struct property *prop;
+
 	switch (token) {
 	case T_OPT_MODULES:
-		if (modules_sym)
+		if (modules_sym->prop)
 			zconf_error("symbol '%s' redefines option 'modules'"
 				    " already defined by symbol '%s'",
 				    current_entry->sym->name,
-				    modules_sym->name
+				    prop_get_symbol(modules_sym->prop)->name
 				    );
-		modules_sym = current_entry->sym;
+		prop = prop_alloc(P_DEFAULT, modules_sym);
+		prop->expr = expr_alloc_symbol(current_entry->sym);
 		break;
 	case T_OPT_DEFCONFIG_LIST:
 		if (!sym_defconfig_list)
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 0653886..941ec32 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -493,6 +493,9 @@ void conf_parse(const char *name)
 
 	sym_init();
 	_menu_init();
+	modules_sym = sym_lookup(NULL, 0);
+	modules_sym->type = S_BOOLEAN;
+	modules_sym->flags |= SYMBOL_AUTO;
 	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
 
 	if (getenv("ZCONF_DEBUG"))
@@ -500,8 +503,12 @@ void conf_parse(const char *name)
 	zconfparse();
 	if (zconfnerrs)
 		exit(1);
-	if (!modules_sym)
-		modules_sym = sym_find( "n" );
+	if (!modules_sym->prop) {
+		struct property *prop;
+
+		prop = prop_alloc(P_DEFAULT, modules_sym);
+		prop->expr = expr_alloc_symbol(sym_find("n"));
+	}
 
 	rootmenu.prompt->text = _(rootmenu.prompt->text);
 	rootmenu.prompt->text = sym_expand_string_value(rootmenu.prompt->text);
-- 
1.8.4

