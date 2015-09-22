Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:31945 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933366AbbIVSgx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:53 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 25/39] Port xconfig to Qt5 - Add ConfigItem::nextItem to initializer list.
Date: Tue, 22 Sep 2015 11:36:25 -0700
Message-Id: <1442946999-37018-26-git-send-email-thiago.macieira@intel.com>
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
index 819e029..d1383c6 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -124,17 +124,17 @@ class ConfigItem : public QTreeWidgetItem {
 	typedef class QTreeWidgetItem Parent;
 public:
 	ConfigItem(QTreeWidget *parent, ConfigItem *after, struct menu *m, bool v)
-	: Parent(parent, after), menu(m), visible(v), goParent(false)
+	: Parent(parent, after), nextItem(0), menu(m), visible(v), goParent(false)
 	{
 		init();
 	}
 	ConfigItem(ConfigItem *parent, ConfigItem *after, struct menu *m, bool v)
-	: Parent(parent, after), menu(m), visible(v), goParent(false)
+	: Parent(parent, after), nextItem(0), menu(m), visible(v), goParent(false)
 	{
 		init();
 	}
 	ConfigItem(QTreeWidget *parent, ConfigItem *after, bool v)
-	: Parent(parent, after), menu(0), visible(v), goParent(true)
+	: Parent(parent, after), nextItem(0), menu(0), visible(v), goParent(true)
 	{
 		init();
 	}
-- 
2.1.4

