Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:35982 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751317AbdJEMCt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Oct 2017 08:02:49 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 1/3] kconfig: Rename menu_check_dep() to rewrite_m()
Date: Thu,  5 Oct 2017 14:01:13 +0200
Message-Id: <1507204875-5021-2-git-send-email-ulfalizer@gmail.com>
In-Reply-To: <1507204875-5021-1-git-send-email-ulfalizer@gmail.com>
References: <1507204875-5021-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, mmarek@suse.com, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, JBeulich@suse.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

More directly describes the only thing it does.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/menu.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index e935793..8354dfa 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -79,19 +79,23 @@ void menu_end_menu(void)
 	current_menu = current_menu->parent;
 }
 
-static struct expr *menu_check_dep(struct expr *e)
+/*
+ * Rewrites 'm' to 'm' && MODULES, so that it evaluates to 'n' when running
+ * without modules
+ */
+static struct expr *rewrite_m(struct expr *e)
 {
 	if (!e)
 		return e;
 
 	switch (e->type) {
 	case E_NOT:
-		e->left.expr = menu_check_dep(e->left.expr);
+		e->left.expr = rewrite_m(e->left.expr);
 		break;
 	case E_OR:
 	case E_AND:
-		e->left.expr = menu_check_dep(e->left.expr);
-		e->right.expr = menu_check_dep(e->right.expr);
+		e->left.expr = rewrite_m(e->left.expr);
+		e->right.expr = rewrite_m(e->right.expr);
 		break;
 	case E_SYMBOL:
 		/* change 'm' into 'm' && MODULES */
@@ -106,7 +110,7 @@ static struct expr *menu_check_dep(struct expr *e)
 
 void menu_add_dep(struct expr *dep)
 {
-	current_entry->dep = expr_alloc_and(current_entry->dep, menu_check_dep(dep));
+	current_entry->dep = expr_alloc_and(current_entry->dep, rewrite_m(dep));
 }
 
 void menu_set_type(int type)
@@ -131,7 +135,7 @@ static struct property *menu_add_prop(enum prop_type type, char *prompt, struct
 
 	prop->menu = current_entry;
 	prop->expr = expr;
-	prop->visible.expr = menu_check_dep(dep);
+	prop->visible.expr = rewrite_m(dep);
 
 	if (prompt) {
 		if (isspace(*prompt)) {
-- 
2.7.4

