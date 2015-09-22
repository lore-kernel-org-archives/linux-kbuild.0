Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:35018 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759343AbbIVSgs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:48 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 18/39] Port xconfig to Qt5 - Put back some of the old implementation.
Date: Tue, 22 Sep 2015 11:36:18 -0700
Message-Id: <1442946999-37018-19-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.h  | 113 +++++++++++++++++++++++++++++++++++++++++--
 scripts/kconfig/qconf.cc | 121 +++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 216 insertions(+), 18 deletions(-)

diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 54b3b92..7c55b1d 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -44,6 +44,81 @@ class ConfigList : public QTreeWidget {
 	typedef class QTreeWidget Parent;
 public:
 	ConfigList(ConfigView* p, const char *name = 0);
+	void reinit(void);
+	ConfigView* parent(void) const
+	{
+		return (ConfigView*)Parent::parent();
+	}
+	ConfigItem* findConfigItem(struct menu *);
+
+protected:
+	void keyPressEvent(QKeyEvent *e);
+	void contentsMousePressEvent(QMouseEvent *e);
+	void contentsMouseReleaseEvent(QMouseEvent *e);
+	void contentsMouseMoveEvent(QMouseEvent *e);
+	void contentsMouseDoubleClickEvent(QMouseEvent *e);
+	void focusInEvent(QFocusEvent *e);
+	void contextMenuEvent(QContextMenuEvent *e);
+
+public slots:
+	void setRootMenu(struct menu *menu);
+
+	void updateList(ConfigItem *item);
+	void setValue(ConfigItem* item, tristate val);
+	void changeValue(ConfigItem* item);
+	void updateSelection(void);
+	void saveSettings(void);
+signals:
+	void menuChanged(struct menu *menu);
+	void menuSelected(struct menu *menu);
+	void parentSelected(void);
+	void gotFocus(struct menu *);
+
+public:
+	void updateListAll(void)
+	{
+		updateAll = true;
+		updateList(NULL);
+		updateAll = false;
+	}
+	ConfigList* listView()
+	{
+		return this;
+	}
+	ConfigItem* firstChild() const
+	{
+		// TODO: Implement me.
+		return NULL;
+	}
+	void addColumn(colIdx idx, const QString& label)
+	{
+		// TODO: Implement me.
+	}
+	void removeColumn(colIdx idx)
+	{
+		// TODO: Implement me.
+	}
+	void setAllOpen(bool open);
+	void setParentMenu(void);
+
+	bool menuSkip(struct menu *);
+
+	template <class P>
+	void updateMenuList(P*, struct menu*);
+
+	bool updateAll;
+
+	QPixmap symbolYesPix, symbolModPix, symbolNoPix;
+	QPixmap choiceYesPix, choiceNoPix;
+	QPixmap menuPix, menuInvPix, menuBackPix, voidPix;
+
+	bool showName, showRange, showData;
+	enum listMode mode;
+	enum optionMode optMode;
+	struct menu *rootEntry;
+	QPalette disabledColorGroup;
+	QPalette inactivedColorGroup;
+	QMenu* headerPopup;
 };
 
 class ConfigItem : public QTreeWidgetItem {
@@ -66,6 +141,38 @@ public:
 	}
 	~ConfigItem(void);
 	void init(void);
+	void okRename(int col);
+	void updateMenu(void);
+	void testUpdateMenu(bool v);
+	ConfigList* listView() const
+	{
+		return (ConfigList*)Parent::treeWidget();
+	}
+	ConfigItem* firstChild() const
+	{
+		return (ConfigItem *)Parent::child(0);
+	}
+	ConfigItem* nextSibling() const
+	{
+		return NULL; // TODO: Implement me
+	}
+	void setText(colIdx idx, const QString& text)
+	{
+		Parent::setText(idx, text);
+	}
+	QString text(colIdx idx) const
+	{
+		return Parent::text(idx);
+	}
+	void setPixmap(colIdx idx, const QPixmap& pm)
+	{
+		// TODO: Implement me
+	}
+	const QPixmap* pixmap(colIdx idx) const
+	{
+		return NULL; // TODO: Implement me
+	}
+	// Implement paintCell
 
 	ConfigItem* nextItem;
 	struct menu *menu;
@@ -98,9 +205,9 @@ public:
 	static void updateList(ConfigItem* item);
 	static void updateListAll(void);
 
-	bool showName(void) const { return false; } // TODO: Implement me.
-	bool showRange(void) const { return false; } // TODO: Implement me.
-	bool showData(void) const { return false; } // TODO: Implement me.
+	bool showName(void) const { return list->showName; }
+	bool showRange(void) const { return list->showRange; }
+	bool showData(void) const { return list->showData; }
 public slots:
 	void setShowName(bool);
 	void setShowRange(bool);
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index a86409d..0987a75 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -84,9 +84,31 @@ bool ConfigSettings::writeSizes(const QString& key, const QList<int>& value)
 	for (it = value.begin(); it != value.end(); ++it)
 		stringList.push_back(QString::number(*it));
 	setValue(key, stringList);
+
 	return true;
 }
 
+
+/*
+ * set the new data
+ * TODO check the value
+ */
+void ConfigItem::okRename(int col)
+{
+}
+
+/*
+ * update the displayed of a menu entry
+ */
+void ConfigItem::updateMenu(void)
+{
+}
+
+void ConfigItem::testUpdateMenu(bool v)
+{
+}
+
+
 /*
  * construct a menu entry
  */
@@ -133,9 +155,92 @@ void ConfigLineEdit::keyPressEvent(QKeyEvent* e)
 }
 
 ConfigList::ConfigList(ConfigView* p, const char *name)
-	: Parent(p)
+	: Parent(p),
+	  updateAll(false),
+	  symbolYesPix(xpm_symbol_yes), symbolModPix(xpm_symbol_mod), symbolNoPix(xpm_symbol_no),
+	  choiceYesPix(xpm_choice_yes), choiceNoPix(xpm_choice_no),
+	  menuPix(xpm_menu), menuInvPix(xpm_menu_inv), menuBackPix(xpm_menuback), voidPix(xpm_void),
+	  showName(false), showRange(false), showData(false), optMode(normalOpt),
+	  rootEntry(0), headerPopup(0)
+{
+}
+
+void ConfigList::reinit(void)
+{
+}
+
+void ConfigList::saveSettings(void)
+{
+}
+
+ConfigItem* ConfigList::findConfigItem(struct menu *menu)
+{
+}
+
+void ConfigList::updateSelection(void)
+{
+}
+
+void ConfigList::updateList(ConfigItem* item)
+{
+}
+
+void ConfigList::setValue(ConfigItem* item, tristate val)
+{
+}
+
+void ConfigList::changeValue(ConfigItem* item)
+{
+}
+
+void ConfigList::setRootMenu(struct menu *menu)
+{
+}
+
+void ConfigList::setParentMenu(void)
+{
+}
+
+/*
+ * update all the children of a menu entry
+ *   removes/adds the entries from the parent widget as necessary
+ *
+ * parent: either the menu list widget or a menu entry widget
+ * menu: entry to be updated
+ */
+template <class P>
+void ConfigList::updateMenuList(P* parent, struct menu* menu)
+{
+}
+
+void ConfigList::keyPressEvent(QKeyEvent* ev)
+{
+}
+
+void ConfigList::contentsMousePressEvent(QMouseEvent* e)
 {
 }
+
+void ConfigList::contentsMouseReleaseEvent(QMouseEvent* e)
+{
+}
+
+void ConfigList::contentsMouseMoveEvent(QMouseEvent* e)
+{
+}
+
+void ConfigList::contentsMouseDoubleClickEvent(QMouseEvent* e)
+{
+}
+
+void ConfigList::focusInEvent(QFocusEvent *e)
+{
+}
+
+void ConfigList::contextMenuEvent(QContextMenuEvent *e)
+{
+}
+
 ConfigView*ConfigView::viewList;
 QAction *ConfigView::showNormalAction;
 QAction *ConfigView::showAllAction;
@@ -206,11 +311,6 @@ ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
 
 void ConfigInfoView::saveSettings(void)
 {
-	/*if (name()) {
-		configSettings->beginGroup(name());
-		configSettings->setValue("/showDebug", showDebug());
-		configSettings->endGroup();
-	}*/
 }
 
 void ConfigInfoView::setShowDebug(bool b)
@@ -480,15 +580,6 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *nam
 
 void ConfigSearchWindow::saveSettings(void)
 {
-	/*if (name()) {
-		configSettings->beginGroup(name());
-		configSettings->setValue("/window x", pos().x());
-		configSettings->setValue("/window y", pos().y());
-		configSettings->setValue("/window width", size().width());
-		configSettings->setValue("/window height", size().height());
-		configSettings->writeSizes("/split", split->sizes());
-		configSettings->endGroup();
-	}*/
 }
 
 void ConfigSearchWindow::search(void)
-- 
2.1.4

