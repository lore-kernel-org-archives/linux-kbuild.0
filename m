Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49416 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727683AbfLQEOw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:14:52 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 5/8] kconfig: move prompt handling to menu_add_prompt() from menu_add_prop()
Date: Tue, 17 Dec 2019 13:14:20 +0900
Message-Id: <20191217041424.29285-6-masahiroy@kernel.org>
In-Reply-To: <20191217041424.29285-1-masahiroy@kernel.org>
References: <20191217041424.29285-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

menu_add_prompt() is the only function that calls menu_add_prop() with
non-NULL prompt.

So, the code inside the if-conditional block of menu_add_prop() can be
moved to menu_add_prompt().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/menu.c | 70 ++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index bbabf0a59ac4..45daece8d983 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -132,53 +132,51 @@ static struct property *menu_add_prop(enum prop_type type, char *prompt, struct
 	prop->expr = expr;
 	prop->visible.expr = dep;
 
-	if (prompt) {
-		if (isspace(*prompt)) {
-			prop_warn(prop, "leading whitespace ignored");
-			while (isspace(*prompt))
-				prompt++;
-		}
-		if (current_entry->prompt)
-			prop_warn(prop, "prompt redefined");
+	return prop;
+}
 
-		/* Apply all upper menus' visibilities to actual prompts. */
-		if(type == P_PROMPT) {
-			struct menu *menu = current_entry;
+struct property *menu_add_prompt(enum prop_type type, char *prompt,
+				 struct expr *dep)
+{
+	struct property *prop = menu_add_prop(type, prompt, NULL, dep);
 
-			while ((menu = menu->parent) != NULL) {
-				struct expr *dup_expr;
+	if (isspace(*prompt)) {
+		prop_warn(prop, "leading whitespace ignored");
+		while (isspace(*prompt))
+			prompt++;
+	}
+	if (current_entry->prompt)
+		prop_warn(prop, "prompt redefined");
 
-				if (!menu->visibility)
-					continue;
-				/*
-				 * Do not add a reference to the
-				 * menu's visibility expression but
-				 * use a copy of it.  Otherwise the
-				 * expression reduction functions
-				 * will modify expressions that have
-				 * multiple references which can
-				 * cause unwanted side effects.
-				 */
-				dup_expr = expr_copy(menu->visibility);
+	/* Apply all upper menus' visibilities to actual prompts. */
+	if (type == P_PROMPT) {
+		struct menu *menu = current_entry;
 
-				prop->visible.expr
-					= expr_alloc_and(prop->visible.expr,
-							 dup_expr);
-			}
-		}
+		while ((menu = menu->parent) != NULL) {
+			struct expr *dup_expr;
 
-		current_entry->prompt = prop;
+			if (!menu->visibility)
+				continue;
+			/*
+			 * Do not add a reference to the menu's visibility
+			 * expression but use a copy of it. Otherwise the
+			 * expression reduction functions will modify
+			 * expressions that have multiple references which
+			 * can cause unwanted side effects.
+			 */
+			dup_expr = expr_copy(menu->visibility);
+
+			prop->visible.expr = expr_alloc_and(prop->visible.expr,
+							    dup_expr);
+		}
 	}
+
+	current_entry->prompt = prop;
 	prop->text = prompt;
 
 	return prop;
 }
 
-struct property *menu_add_prompt(enum prop_type type, char *prompt, struct expr *dep)
-{
-	return menu_add_prop(type, prompt, NULL, dep);
-}
-
 void menu_add_visibility(struct expr *expr)
 {
 	current_entry->visibility = expr_alloc_and(current_entry->visibility,
-- 
2.17.1
