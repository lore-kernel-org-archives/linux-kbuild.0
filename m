Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:59967 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932883AbbIVSgw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:52 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 32/39] Port xconfig to Qt5 - Source format.
Date: Tue, 22 Sep 2015 11:36:32 -0700
Message-Id: <1442946999-37018-33-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 000403d..a40036d 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -157,10 +157,10 @@ public:
 		ConfigItem *_parent = (ConfigItem *)parent();
 
 		if(_parent) {
-		  ret = (ConfigItem *)_parent->child(_parent->indexOfChild(this)+1);
+			ret = (ConfigItem *)_parent->child(_parent->indexOfChild(this)+1);
 		} else {
-		  QTreeWidget *_treeWidget = treeWidget();
-		  ret = (ConfigItem *)_treeWidget->topLevelItem(_treeWidget->indexOfTopLevelItem(this)+1);
+			QTreeWidget *_treeWidget = treeWidget();
+			ret = (ConfigItem *)_treeWidget->topLevelItem(_treeWidget->indexOfTopLevelItem(this)+1);
 		}
 
 		return ret;
-- 
2.1.4

