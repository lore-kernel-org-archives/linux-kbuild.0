Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:55411 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754135Ab3EQItQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 May 2013 04:49:16 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH] mconf: handle keys in empty dialogs
Date: Fri, 17 May 2013 10:48:43 +0200
Message-Id: <1368780523-19382-2-git-send-email-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

When entering an empty dialog, using the movement keys resulted in
unexpected characters beeing displayed, other keys like "z" and "h" did
not work as expected.

This patch handles the movement keys as well as other keys,
especially "z", "h" and "/".

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 scripts/kconfig/lxdialog/menubox.c |  8 ++++----
 scripts/kconfig/mconf.c            | 11 ++++++-----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/lxdialog/menubox.c
index 48d382e..f5aff9c 100644
--- a/scripts/kconfig/lxdialog/menubox.c
+++ b/scripts/kconfig/lxdialog/menubox.c
@@ -303,10 +303,10 @@ do_resize:
 				}
 		}
 
-		if (i < max_choice ||
-		    key == KEY_UP || key == KEY_DOWN ||
-		    key == '-' || key == '+' ||
-		    key == KEY_PPAGE || key == KEY_NPAGE) {
+		if ((i < max_choice ||
+		     key == KEY_UP || key == KEY_DOWN ||
+		     key == '-' || key == '+' ||
+		     key == KEY_PPAGE || key == KEY_NPAGE) && item_count()) {
 			/* Remove highligt of current item */
 			print_item(scroll + choice, choice, FALSE);
 
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 387dc8d..ccb71ae 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -670,11 +670,12 @@ static void conf(struct menu *menu, struct menu *active_menu)
 				  active_menu, &s_scroll);
 		if (res == 1 || res == KEY_ESC || res == -ERRDISPLAYTOOSMALL)
 			break;
-		if (!item_activate_selected())
-			continue;
-		if (!item_tag())
-			continue;
-
+		if (item_count()) {
+			if (!item_activate_selected())
+				continue;
+			if (!item_tag())
+				continue;
+		}
 		submenu = item_data();
 		active_menu = item_data();
 		if (submenu)
-- 
1.8.2.1

