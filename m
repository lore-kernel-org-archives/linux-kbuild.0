Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:8362 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933332AbbIVSgx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:53 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 27/39] Port xconfig to Qt5 - Remove ConfigList::updateMenuList template.
Date: Tue, 22 Sep 2015 11:36:27 -0700
Message-Id: <1442946999-37018-28-git-send-email-thiago.macieira@intel.com>
In-Reply-To: <1442946999-37018-1-git-send-email-thiago.macieira@intel.com>
References: <1442946999-37018-1-git-send-email-thiago.macieira@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>, Boris Barbulovski <bbarbulovski@gmail.com>

From: Boris Barbulovski <bbarbulovski@gmail.com>

ConfigItem executes parent->takeChild(0)

while

ConfigList executes parent->takeTopLevelItem(0)

Signed-off-by: Boris Barbulovski <bbarbulovski@gmail.com>
Signed-off-by: Thiago Macieira <thiago.macieira@intel.com>
---
 scripts/kconfig/qconf.h  |  4 +--
 scripts/kconfig/qconf.cc | 73 ++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index d1383c6..d86ae3c 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -102,8 +102,8 @@ public:
 
 	bool menuSkip(struct menu *);
 
-	template <class P>
-	void updateMenuList(P*, struct menu*);
+	void updateMenuList(ConfigItem *parent, struct menu*);
+	void updateMenuList(ConfigList *parent, struct menu*);
 
 	bool updateAll;
 
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 168f0cc..f54f19f 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -568,8 +568,7 @@ void ConfigList::setParentMenu(void)
  * parent: either the menu list widget or a menu entry widget
  * menu: entry to be updated
  */
-template <class P>
-void ConfigList::updateMenuList(P* parent, struct menu* menu)
+void ConfigList::updateMenuList(ConfigItem *parent, struct menu* menu)
 {
 	struct menu* child;
 	ConfigItem* item;
@@ -578,6 +577,11 @@ void ConfigList::updateMenuList(P* parent, struct menu* menu)
 	enum prop_type type;
 
 	if (!menu) {
+		while (parent->childCount() > 0)
+		{
+			delete parent->takeChild(0);
+		}
+
 		return;
 	}
 
@@ -629,6 +633,71 @@ void ConfigList::updateMenuList(P* parent, struct menu* menu)
 	}
 }
 
+void ConfigList::updateMenuList(ConfigList *parent, struct menu* menu)
+{
+	struct menu* child;
+	ConfigItem* item;
+	ConfigItem* last;
+	bool visible;
+	enum prop_type type;
+
+	if (!menu) {
+		while (parent->topLevelItemCount() > 0)
+		{
+			delete parent->takeTopLevelItem(0);
+		}
+
+		return;
+	}
+
+	last = (ConfigItem*)parent->topLevelItem(0);
+	if (last && !last->goParent)
+		last = 0;
+	for (child = menu->list; child; child = child->next) {
+		item = last ? last->nextSibling() : (ConfigItem*)parent->topLevelItem(0);
+		type = child->prompt ? child->prompt->type : P_UNKNOWN;
+
+		switch (mode) {
+		case menuMode:
+			if (!(child->flags & MENU_ROOT))
+				goto hide;
+			break;
+		case symbolMode:
+			if (child->flags & MENU_ROOT)
+				goto hide;
+			break;
+		default:
+			break;
+		}
+
+		visible = menu_is_visible(child);
+		if (!menuSkip(child)) {
+			if (!child->sym && !child->list && !child->prompt)
+				continue;
+			if (!item || item->menu != child)
+				item = new ConfigItem(parent, last, child, visible);
+			else
+				item->testUpdateMenu(visible);
+
+			if (mode == fullMode || mode == menuMode || type != P_MENU)
+				updateMenuList(item, child);
+			else
+				updateMenuList(item, 0);
+			last = item;
+			continue;
+		}
+	hide:
+		if (item && item->menu == child) {
+			last = (ConfigItem*)parent->topLevelItem(0);
+			if (last == item)
+				last = 0;
+			else while (last->nextSibling() != item)
+				last = last->nextSibling();
+			delete item;
+		}
+	}
+}
+
 void ConfigList::keyPressEvent(QKeyEvent* ev)
 {
 	QTreeWidgetItem* i = currentItem();
-- 
2.1.4

