Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:59668 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753289Ab3ESTss (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 May 2013 15:48:48 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH v2] mconf: handle keys in empty dialogs
Date: Sun, 19 May 2013 21:48:44 +0200
Message-Id: <1368992924-4700-1-git-send-email-dirk@gouders.net>
In-Reply-To: <20130519151227.GA3339@free.fr>
References: <20130519151227.GA3339@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org

When entering an empty dialog, using the movement keys resulted in
unexpected characters beeing displayed, other keys like "z" and "h"
did not work as expected.

This patch handles the movement keys as well as other keys, especially
"z", "h" and "/".

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 scripts/kconfig/lxdialog/menubox.c |  8 ++++----
 scripts/kconfig/mconf.c            | 11 ++++++-----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/lxdialog/menubox.c
index 48d382e..eda0350 100644
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
+		     key == KEY_PPAGE || key == KEY_NPAGE) && item_count() != 0) {
 			/* Remove highligt of current item */
 			print_item(scroll + choice, choice, FALSE);
 
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 387dc8d..a69cbd7 100644
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
+		if (item_count() != 0) {
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

