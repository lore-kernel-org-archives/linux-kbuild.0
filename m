Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726243AbgF1MFB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 08:05:01 -0400
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH] kconfig: qconf: Fix find on split mode
Date: Sun, 28 Jun 2020 14:04:53 +0200
Message-Id: <371f4815f6daac50e90057520d5f2b40a6ca3a74.1593345886.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>

The logic handling find on split mode is currently broken.
Fix it, making it work again as expected.

Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index c0ac8f7b5f1a..b8f577c6e8aa 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1645,22 +1645,21 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
 			return;
 		list->setRootMenu(parent);
 		break;
-	case symbolMode:
+	case menuMode:
 		if (menu->flags & MENU_ROOT) {
-			configList->setRootMenu(menu);
+			menuList->setRootMenu(menu);
 			configList->clearSelection();
-			list = menuList;
-		} else {
 			list = configList;
+		} else {
+			configList->setRootMenu(menu);
+			configList->clearSelection();
+
 			parent = menu_get_parent_menu(menu->parent);
 			if (!parent)
 				return;
-			item = menuList->findConfigItem(parent);
-			if (item) {
-				item->setSelected(true);
-				menuList->scrollToItem(item);
-			}
-			list->setRootMenu(parent);
+			menuList->setRootMenu(parent);
+
+			list = menuList;
 		}
 		break;
 	case fullMode:
-- 
2.26.2
