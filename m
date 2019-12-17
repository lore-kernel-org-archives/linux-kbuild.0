Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49412 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727672AbfLQEOv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:14:51 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 6/8] kconfig: remove 'prompt' argument from menu_add_prop()
Date: Tue, 17 Dec 2019 13:14:21 +0900
Message-Id: <20191217041424.29285-7-masahiroy@kernel.org>
In-Reply-To: <20191217041424.29285-1-masahiroy@kernel.org>
References: <20191217041424.29285-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

This function does not use the 'prompt' argument.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/menu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 45daece8d983..5a43784ded2c 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -124,7 +124,8 @@ void menu_set_type(int type)
 		sym_type_name(sym->type), sym_type_name(type));
 }
 
-static struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *expr, struct expr *dep)
+static struct property *menu_add_prop(enum prop_type type, struct expr *expr,
+				      struct expr *dep)
 {
 	struct property *prop = prop_alloc(type, current_entry->sym);
 
@@ -138,7 +139,7 @@ static struct property *menu_add_prop(enum prop_type type, char *prompt, struct
 struct property *menu_add_prompt(enum prop_type type, char *prompt,
 				 struct expr *dep)
 {
-	struct property *prop = menu_add_prop(type, prompt, NULL, dep);
+	struct property *prop = menu_add_prop(type, NULL, dep);
 
 	if (isspace(*prompt)) {
 		prop_warn(prop, "leading whitespace ignored");
@@ -185,12 +186,12 @@ void menu_add_visibility(struct expr *expr)
 
 void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep)
 {
-	menu_add_prop(type, NULL, expr, dep);
+	menu_add_prop(type, expr, dep);
 }
 
 void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep)
 {
-	menu_add_prop(type, NULL, expr_alloc_symbol(sym), dep);
+	menu_add_prop(type, expr_alloc_symbol(sym), dep);
 }
 
 void menu_add_option_modules(void)
-- 
2.17.1
