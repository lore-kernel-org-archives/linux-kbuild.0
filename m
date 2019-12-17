Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49410 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727472AbfLQEOv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:14:51 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 8/8] kconfig: squash prop_alloc() into menu_add_prop()
Date: Tue, 17 Dec 2019 13:14:23 +0900
Message-Id: <20191217041424.29285-9-masahiroy@kernel.org>
In-Reply-To: <20191217041424.29285-1-masahiroy@kernel.org>
References: <20191217041424.29285-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

prop_alloc() is only called from menu_add_prop(). Squash it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/lkc.h    |  1 -
 scripts/kconfig/menu.c   | 18 +++++++++++++++++-
 scripts/kconfig/symbol.c | 21 ---------------------
 3 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 4fb16f316626..73d3f01f1736 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -112,7 +112,6 @@ struct symbol *sym_choice_default(struct symbol *sym);
 struct property *sym_get_range_prop(struct symbol *sym);
 const char *sym_get_string_default(struct symbol *sym);
 struct symbol *sym_check_deps(struct symbol *sym);
-struct property *prop_alloc(enum prop_type type, struct symbol *sym);
 struct symbol *prop_get_symbol(struct property *prop);
 
 static inline tristate sym_get_tristate_value(struct symbol *sym)
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 5a43784ded2c..8b772ced755d 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -127,12 +127,28 @@ void menu_set_type(int type)
 static struct property *menu_add_prop(enum prop_type type, struct expr *expr,
 				      struct expr *dep)
 {
-	struct property *prop = prop_alloc(type, current_entry->sym);
+	struct property *prop;
 
+	prop = xmalloc(sizeof(*prop));
+	memset(prop, 0, sizeof(*prop));
+	prop->type = type;
+	prop->file = current_file;
+	prop->lineno = zconf_lineno();
 	prop->menu = current_entry;
 	prop->expr = expr;
 	prop->visible.expr = dep;
 
+	/* append property to the prop list of symbol */
+	if (current_entry->sym) {
+		struct property **propp;
+
+		for (propp = &current_entry->sym->prop;
+		     *propp;
+		     propp = &(*propp)->next)
+			;
+		*propp = prop;
+	}
+
 	return prop;
 }
 
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index dbc5365d8bbc..8d38b700b314 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1273,27 +1273,6 @@ struct symbol *sym_check_deps(struct symbol *sym)
 	return sym2;
 }
 
-struct property *prop_alloc(enum prop_type type, struct symbol *sym)
-{
-	struct property *prop;
-	struct property **propp;
-
-	prop = xmalloc(sizeof(*prop));
-	memset(prop, 0, sizeof(*prop));
-	prop->type = type;
-	prop->file = current_file;
-	prop->lineno = zconf_lineno();
-
-	/* append property to the prop list of symbol */
-	if (sym) {
-		for (propp = &sym->prop; *propp; propp = &(*propp)->next)
-			;
-		*propp = prop;
-	}
-
-	return prop;
-}
-
 struct symbol *prop_get_symbol(struct property *prop)
 {
 	if (prop->expr && (prop->expr->type == E_SYMBOL ||
-- 
2.17.1
