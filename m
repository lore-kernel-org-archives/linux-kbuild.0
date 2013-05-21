Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:42700 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752862Ab3EUIyN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 May 2013 04:54:13 -0400
Received: from mx10.gouders.net (localhost [127.0.0.1])
	by mx10.gouders.net (8.14.6/8.14.5) with ESMTP id r4L8sBrD011970
	for <linux-kbuild@vger.kernel.org>; Tue, 21 May 2013 10:54:11 +0200
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH] kconfig/menu.c: fix multiple references to expressions in menu_add_prop()
Date: Tue, 21 May 2013 10:54:11 +0200
Message-Id: <1369126451-11930-1-git-send-email-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

menu_add_prop() applies upper menus' visibilities to actual prompts
by AND-ing the prompts visibilities with the upper menus ones.

This creates a further reference to the menu's visibilities and when
the expression reduction functions do their work, they may remove or
modify expressions that have multiple references, thus causing
unpredictable side-effects.

The following example Kconfig constructs a case where this causes
problems: a menu and a prompt which's visibilities depend on the same
symbol.  When invoking mconf with this Kconfig and pressing "Z" we
see a problem caused by a free'd expression still referenced by the
menu's visibility:

------------------------------------------------------------------------
mainmenu "Kconfig Testing Configuration"

config VISIBLE
	def_bool n

config Placeholder
	bool "Place holder"

menu "Invisible"
	visible if VISIBLE

config TEST_VAR
	bool "Test option" if VISIBLE

endmenu
------------------------------------------------------------------------

This patch fixes this problem by creating copies of the menu's
visibility expressions before AND-ing them with the prompt's one.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 scripts/kconfig/menu.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index b5c7d90..567939c 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -143,14 +143,25 @@ struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *e
 
 		/* Apply all upper menus' visibilities to actual prompts. */
 		if(type == P_PROMPT) {
+			struct expr *dup_expr;
 			struct menu *menu = current_entry;
 
 			while ((menu = menu->parent) != NULL) {
 				if (!menu->visibility)
 					continue;
+				/*
+				 * Do not add a reference to the
+				 * menu's visibility expression but
+				 * use a copy of it.  Otherwise the
+				 * expression reduction functions
+				 * will modify expressions that have
+				 * multiple references which can
+				 * cause unwanted side-effects.
+				 */
+				dup_expr = expr_copy(menu->visibility);
+
 				prop->visible.expr
-					= expr_alloc_and(prop->visible.expr,
-							 menu->visibility);
+					= expr_alloc_and(prop->visible.expr, dup_expr);
 			}
 		}
 
-- 
1.8.2.1

