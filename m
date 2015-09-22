Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:13334 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759383AbbIVSgu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:50 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 17/39] Port xconfig to Qt5 - Introduce Qt4/5 version of ConfigList and ConfigItem
Date: Tue, 22 Sep 2015 11:36:17 -0700
Message-Id: <1442946999-37018-18-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.h  | 48 ++++++++++++++++++++++++++++++++++++++++++------
 scripts/kconfig/qconf.cc | 24 +++++++++++++++++++++---
 2 files changed, 63 insertions(+), 9 deletions(-)

diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 1cd0219..54b3b92 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -17,6 +17,8 @@
 #include "expr.h"
 
 class ConfigView;
+class ConfigList;
+class ConfigItem;
 class ConfigLineEdit;
 class ConfigMainWindow;
 
@@ -37,6 +39,40 @@ enum optionMode {
 	normalOpt = 0, allOpt, promptOpt
 };
 
+class ConfigList : public QTreeWidget {
+	Q_OBJECT
+	typedef class QTreeWidget Parent;
+public:
+	ConfigList(ConfigView* p, const char *name = 0);
+};
+
+class ConfigItem : public QTreeWidgetItem {
+	typedef class QTreeWidgetItem Parent;
+public:
+	ConfigItem(QTreeWidgetItem *parent, ConfigItem *after, struct menu *m, bool v)
+	: Parent(parent, after), menu(m), visible(v), goParent(false)
+	{
+		init();
+	}
+	ConfigItem(ConfigItem *parent, ConfigItem *after, struct menu *m, bool v)
+	: Parent(parent, after), menu(m), visible(v), goParent(false)
+	{
+		init();
+	}
+	ConfigItem(QTreeWidgetItem *parent, ConfigItem *after, bool v)
+	: Parent(parent, after), menu(0), visible(v), goParent(true)
+	{
+		init();
+	}
+	~ConfigItem(void);
+	void init(void);
+
+	ConfigItem* nextItem;
+	struct menu *menu;
+	bool visible;
+	bool goParent;
+};
+
 class ConfigLineEdit : public QLineEdit {
 	Q_OBJECT
 	typedef class QLineEdit Parent;
@@ -46,11 +82,11 @@ public:
 	{
 		return (ConfigView*)Parent::parent();
 	}
-	void show(QTreeWidgetItem *i);
+	void show(ConfigItem *i);
 	void keyPressEvent(QKeyEvent *e);
 
 public:
-	QTreeWidgetItem *item;
+	ConfigItem *item;
 };
 
 class ConfigView : public QWidget {
@@ -59,7 +95,7 @@ class ConfigView : public QWidget {
 public:
 	ConfigView(QWidget* parent, const char *name = 0);
 	~ConfigView(void);
-	static void updateList(QTreeWidgetItem* item);
+	static void updateList(ConfigItem* item);
 	static void updateListAll(void);
 
 	bool showName(void) const { return false; } // TODO: Implement me.
@@ -75,7 +111,7 @@ signals:
 	void showRangeChanged(bool);
 	void showDataChanged(bool);
 public:
-	QTreeWidget* list;
+	ConfigList* list;
 	ConfigLineEdit* lineEdit;
 
 	static ConfigView* viewList;
@@ -164,9 +200,9 @@ protected:
 
 	ConfigSearchWindow *searchWindow;
 	ConfigView *menuView;
-	QTreeWidget *menuList;
+	ConfigList *menuList;
 	ConfigView *configView;
-	QTreeWidget *configList;
+	ConfigList *configList;
 	ConfigInfoView *helpText;
 	QToolBar *toolBar;
 	QAction *backAction;
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index c6b7320..a86409d 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -87,13 +87,27 @@ bool ConfigSettings::writeSizes(const QString& key, const QList<int>& value)
 	return true;
 }
 
+/*
+ * construct a menu entry
+ */
+void ConfigItem::init(void)
+{
+}
+
+/*
+ * destruct a menu entry
+ */
+ConfigItem::~ConfigItem(void)
+{
+}
+
 ConfigLineEdit::ConfigLineEdit(ConfigView* parent)
 	: Parent(parent)
 {
 	connect(this, SIGNAL(editingFinished()), SLOT(hide()));
 }
 
-void ConfigLineEdit::show(QTreeWidgetItem *i)
+void ConfigLineEdit::show(ConfigItem* i)
 {
 	item = i;
 	Parent::show();
@@ -118,6 +132,10 @@ void ConfigLineEdit::keyPressEvent(QKeyEvent* e)
 	hide();
 }
 
+ConfigList::ConfigList(ConfigView* p, const char *name)
+	: Parent(p)
+{
+}
 ConfigView*ConfigView::viewList;
 QAction *ConfigView::showNormalAction;
 QAction *ConfigView::showAllAction;
@@ -129,7 +147,7 @@ ConfigView::ConfigView(QWidget* parent, const char *name)
 	QVBoxLayout *verticalLayout = new QVBoxLayout(this);
 	verticalLayout->setContentsMargins(0, 0, 0, 0);
 
-	list = new QTreeWidget(this);
+	list = new ConfigList(this);
 	verticalLayout->addWidget(list);
 	lineEdit = new ConfigLineEdit(this);
 	lineEdit->hide();
@@ -167,7 +185,7 @@ void ConfigView::setShowData(bool b)
 {
 }
 
-void ConfigView::updateList(QTreeWidgetItem* item)
+void ConfigView::updateList(ConfigItem* item)
 {
 }
 
-- 
2.1.4

