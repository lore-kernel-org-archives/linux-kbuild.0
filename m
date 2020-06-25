Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:48900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405604AbgFYOxE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jun 2020 10:53:04 -0400
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH] kconfig: qconf: Fix find on split mode
Date: Thu, 25 Jun 2020 16:52:56 +0200
Message-Id: <371f4815f6daac50e90057520d5f2b40a6ca3a74.1593096720.git.mchehab+huawei@kernel.org>
In-Reply-To: <20200625154226.25692cd1@coco.lan>
References: <20200625154226.25692cd1@coco.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>

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
