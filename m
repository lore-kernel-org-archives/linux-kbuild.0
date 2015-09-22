Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:13334 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759396AbbIVSg4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:56 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 36/39] Port xconfig to Qt5 - on Back clicked, deselect old item.
Date: Tue, 22 Sep 2015 11:36:36 -0700
Message-Id: <1442946999-37018-37-git-send-email-thiago.macieira@intel.com>
In-Reply-To: <1442946999-37018-1-git-send-email-thiago.macieira@intel.com>
References: <1442946999-37018-1-git-send-email-thiago.macieira@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>, Boris Barbulovski <bbarbulovski@gmail.com>

From: Boris Barbulovski <bbarbulovski@gmail.com>

Signed-off-by: Boris Barbulovski <bbarbulovski@gmail.com>
Signed-off-by: Thiago Macieira <thiago.macieira@intel.com>
---
 scripts/kconfig/qconf.cc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index a46aac7..d4e9cd5 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1621,7 +1621,7 @@ void ConfigMainWindow::listFocusChanged(void)
 
 void ConfigMainWindow::goBack(void)
 {
-	ConfigItem* item;
+	ConfigItem* item, *oldSelection;
 
 	configList->setParentMenu();
 	if (configList->rootEntry == &rootmenu)
@@ -1631,8 +1631,10 @@ void ConfigMainWindow::goBack(void)
 		return;
 
 	item = (ConfigItem*)menuList->selectedItems().first();
+	oldSelection = item;
 	while (item) {
 		if (item->menu == configList->rootEntry) {
+			oldSelection->setSelected(false);
 			item->setSelected(true);
 			break;
 		}
-- 
2.1.4

