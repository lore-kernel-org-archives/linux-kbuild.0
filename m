Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:13334 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933482AbbIVSgy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:54 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 30/39] Port xconfig to Qt5 - Change ConfigItem constructor parent type.
Date: Tue, 22 Sep 2015 11:36:30 -0700
Message-Id: <1442946999-37018-31-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index d86ae3c..000403d 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -123,7 +123,7 @@ public:
 class ConfigItem : public QTreeWidgetItem {
 	typedef class QTreeWidgetItem Parent;
 public:
-	ConfigItem(QTreeWidget *parent, ConfigItem *after, struct menu *m, bool v)
+	ConfigItem(ConfigList *parent, ConfigItem *after, struct menu *m, bool v)
 	: Parent(parent, after), nextItem(0), menu(m), visible(v), goParent(false)
 	{
 		init();
@@ -133,7 +133,7 @@ public:
 	{
 		init();
 	}
-	ConfigItem(QTreeWidget *parent, ConfigItem *after, bool v)
+	ConfigItem(ConfigList *parent, ConfigItem *after, bool v)
 	: Parent(parent, after), nextItem(0), menu(0), visible(v), goParent(true)
 	{
 		init();
-- 
2.1.4

