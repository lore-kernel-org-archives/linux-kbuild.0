Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:35856 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759394AbbIVSg4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:56 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 33/39] Port xconfig to Qt5 - Remove some commented code.
Date: Tue, 22 Sep 2015 11:36:33 -0700
Message-Id: <1442946999-37018-34-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.cc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 2ef06c1..8d96960 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -199,9 +199,6 @@ void ConfigItem::updateMenu(void)
 
 		data = sym_get_string_value(sym);
 
-		//int i = list->mapIdx(dataColIdx);
-		//if (i >= 0)
-		//	setRenameEnabled(i, true);
 		setText(dataColIdx, data);
 		if (type == S_STRING)
 			prompt = QString("%1: %2").arg(prompt).arg(data);
@@ -1356,7 +1353,6 @@ ConfigMainWindow::ConfigMainWindow(void)
 	configList = configView->list;
 
 	helpText = new ConfigInfoView(split2, "help");
-	//helpText->setTextFormat(Qt::RichText);
 
 	setTabOrder(configList, helpText);
 	configList->setFocus();
-- 
2.1.4

