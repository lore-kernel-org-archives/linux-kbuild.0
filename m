Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:39326 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752494AbeGCMua (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Jul 2018 08:50:30 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH v3] kconfig: rename SYMBOL_AUTO to SYMBOL_NO_WRITE
Date: Tue,  3 Jul 2018 14:43:31 +0200
Message-Id: <20180703124331.9279-1-dirk@gouders.net>
In-Reply-To: <ghd0w4wtgh.fsf@lena.gouders.net>
References: <ghd0w4wtgh.fsf@lena.gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Dirk Gouders <dirk@gouders.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>

Over time, the use of the flag SYMBOL_AUTO changed from initially
marking three automatically generated symbols ARCH, KERNELRELEASE and
UNAME_RELEASE to today's effect of protecting symbols from being
written out.

Currently, only symbols of type CHOICE and those with option
defconf_list set have that flag set.

Reflect that change in semantics in the flag's name.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/kconfig/confdata.c | 4 ++--
 scripts/kconfig/expr.h     | 2 +-
 scripts/kconfig/gconf.c    | 4 ++--
 scripts/kconfig/menu.c     | 2 +-
 scripts/kconfig/symbol.c   | 2 +-
 scripts/kconfig/zconf.y    | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 39e20974f4a3..d1216e4ade2f 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -397,7 +397,7 @@ int conf_read(const char *name)
 
 	for_all_symbols(i, sym) {
 		sym_calc_value(sym);
-		if (sym_is_choice(sym) || (sym->flags & SYMBOL_AUTO))
+		if (sym_is_choice(sym) || (sym->flags & SYMBOL_NO_WRITE))
 			continue;
 		if (sym_has_value(sym) && (sym->flags & SYMBOL_WRITE)) {
 			/* check that calculated value agrees with saved value */
@@ -832,7 +832,7 @@ static int conf_split_config(void)
 	res = 0;
 	for_all_symbols(i, sym) {
 		sym_calc_value(sym);
-		if ((sym->flags & SYMBOL_AUTO) || !sym->name)
+		if ((sym->flags & SYMBOL_NO_WRITE) || !sym->name)
 			continue;
 		if (sym->flags & SYMBOL_WRITE) {
 			if (sym->flags & SYMBOL_DEF_AUTO) {
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index f63b41b0dd49..84a5199bb46b 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -141,7 +141,7 @@ struct symbol {
 #define SYMBOL_OPTIONAL   0x0100  /* choice is optional - values can be 'n' */
 #define SYMBOL_WRITE      0x0200  /* write symbol to file (KCONFIG_CONFIG) */
 #define SYMBOL_CHANGED    0x0400  /* ? */
-#define SYMBOL_AUTO       0x1000  /* value from environment variable */
+#define SYMBOL_NO_WRITE   0x1000  /* Symbol for internal use only; it will not be written */
 #define SYMBOL_CHECKED    0x2000  /* used during dependency checking */
 #define SYMBOL_WARNED     0x8000  /* warning has been issued */
 
diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 610c4ab54d76..a9e48cc7b50a 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -101,8 +101,8 @@ const char *dbg_sym_flags(int val)
 		strcat(buf, "write/");
 	if (val & SYMBOL_CHANGED)
 		strcat(buf, "changed/");
-	if (val & SYMBOL_AUTO)
-		strcat(buf, "auto/");
+	if (val & SYMBOL_NO_WRITE)
+		strcat(buf, "no_write/");
 
 	buf[strlen(buf) - 1] = '\0';
 
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 379a119dcd1e..4cf15d449c05 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -212,7 +212,7 @@ void menu_add_option(int token, char *arg)
 			sym_defconfig_list = current_entry->sym;
 		else if (sym_defconfig_list != current_entry->sym)
 			zconf_error("trying to redefine defconfig symbol");
-		sym_defconfig_list->flags |= SYMBOL_AUTO;
+		sym_defconfig_list->flags |= SYMBOL_NO_WRITE;
 		break;
 	case T_OPT_ALLNOCONFIG_Y:
 		current_entry->sym->flags |= SYMBOL_ALLNOCONFIG_Y;
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 7c9a88e91cfa..869a5e8e87a5 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -463,7 +463,7 @@ void sym_calc_value(struct symbol *sym)
 		}
 	}
 
-	if (sym->flags & SYMBOL_AUTO)
+	if (sym->flags & SYMBOL_NO_WRITE)
 		sym->flags &= ~SYMBOL_WRITE;
 
 	if (sym->flags & SYMBOL_NEED_SET_CHOICE_VALUES)
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 4b68272ebdb9..96081aa0fef0 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -265,7 +265,7 @@ symbol_option_arg:
 choice: T_CHOICE word_opt T_EOL
 {
 	struct symbol *sym = sym_lookup($2, SYMBOL_CHOICE);
-	sym->flags |= SYMBOL_AUTO;
+	sym->flags |= SYMBOL_NO_WRITE;
 	menu_add_entry(sym);
 	menu_add_expr(P_CHOICE, NULL, NULL);
 	free($2);
-- 
2.16.1

