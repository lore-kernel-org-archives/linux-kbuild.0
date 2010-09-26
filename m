Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:43342 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753851Ab0IZUYa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 26 Sep 2010 16:24:30 -0400
Received: by qyk36 with SMTP id 36so4056808qyk.19
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Sep 2010 13:24:29 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] kconfig: delay symbol direct dependency initialization
Date: Sun, 26 Sep 2010 16:22:03 -0400
Message-Id: <1285532523-10180-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>

This fixes the use-after-free and associated crash in kconfig introduced
in commit 246cf9c26bf11f2bffbecea6e5bd222eee7b1df8.

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 scripts/kconfig/expr.h |    1 -
 scripts/kconfig/menu.c |    7 ++-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 2b95a58..2788c7a 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -165,7 +165,6 @@ struct menu {
 	struct symbol *sym;
 	struct property *prompt;
 	struct expr *dep;
-	struct expr *dir_dep;
 	unsigned int flags;
 	char *help;
 	struct file *file;
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 4fb5902..edda8b4 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -107,7 +107,6 @@ static struct expr *menu_check_dep(struct expr *e)
 void menu_add_dep(struct expr *dep)
 {
 	current_entry->dep = expr_alloc_and(current_entry->dep, menu_check_dep(dep));
-	current_entry->dir_dep = current_entry->dep;
 }
 
 void menu_set_type(int type)
@@ -291,10 +290,6 @@ void menu_finalize(struct menu *parent)
 		for (menu = parent->list; menu; menu = menu->next)
 			menu_finalize(menu);
 	} else if (sym) {
-		/* ignore inherited dependencies for dir_dep */
-		sym->dir_dep.expr = expr_transform(expr_copy(parent->dir_dep));
-		sym->dir_dep.expr = expr_eliminate_dups(sym->dir_dep.expr);
-
 		basedep = parent->prompt ? parent->prompt->visible.expr : NULL;
 		basedep = expr_trans_compare(basedep, E_UNEQUAL, &symbol_no);
 		basedep = expr_eliminate_dups(expr_transform(basedep));
@@ -325,6 +320,8 @@ void menu_finalize(struct menu *parent)
 			parent->next = last_menu->next;
 			last_menu->next = NULL;
 		}
+
+		sym->dir_dep.expr = parent->dep;
 	}
 	for (menu = parent->list; menu; menu = menu->next) {
 		if (sym && sym_is_choice(sym) &&
-- 
1.7.2.30.gc37d7.dirty

