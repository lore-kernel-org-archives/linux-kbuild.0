Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:35856 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933377AbbIVSgx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:53 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 28/39] Add current selection check.
Date: Tue, 22 Sep 2015 11:36:28 -0700
Message-Id: <1442946999-37018-29-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.cc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index f54f19f..6de8589 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -399,6 +399,9 @@ void ConfigList::updateSelection(void)
 	struct menu *menu;
 	enum prop_type type;
 
+	if (selectedItems().count() == 0)
+		return;
+
 	ConfigItem* item = (ConfigItem*)selectedItems().first();
 	if (!item)
 		return;
@@ -1605,6 +1608,10 @@ void ConfigMainWindow::goBack(void)
 	configList->setParentMenu();
 	if (configList->rootEntry == &rootmenu)
 		backAction->setEnabled(false);
+
+	if (menuList->selectedItems().count() == 0)
+		return;
+
 	item = (ConfigItem*)menuList->selectedItems().first();
 	while (item) {
 		if (item->menu == configList->rootEntry) {
-- 
2.1.4

