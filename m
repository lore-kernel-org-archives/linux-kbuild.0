Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:35856 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759356AbbIVSgs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:48 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 16/39] Port xconfig to Qt5 - update signals
Date: Tue, 22 Sep 2015 11:36:16 -0700
Message-Id: <1442946999-37018-17-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.cc | 51 ++++++++++++++----------------------------------
 1 file changed, 15 insertions(+), 36 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index d134a89..c6b7320 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -90,7 +90,7 @@ bool ConfigSettings::writeSizes(const QString& key, const QList<int>& value)
 ConfigLineEdit::ConfigLineEdit(ConfigView* parent)
 	: Parent(parent)
 {
-	connect(this, SIGNAL(lostFocus()), SLOT(hide()));
+	connect(this, SIGNAL(editingFinished()), SLOT(hide()));
 }
 
 void ConfigLineEdit::show(QTreeWidgetItem *i)
@@ -484,7 +484,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 	: searchWindow(0)
 {
 	QMenuBar* menu;
-	bool ok;
+	bool ok = true;
 	QVariant x, y;
 	int width, height;
 	char title[256];
@@ -529,54 +529,51 @@ ConfigMainWindow::ConfigMainWindow(void)
 	addToolBar(toolBar);
 
 	backAction = new QAction(QPixmap(xpm_back), _("Back"), this);
-	  connect(backAction, SIGNAL(activated()), SLOT(goBack()));
+	  connect(backAction, SIGNAL(triggered(bool)), SLOT(goBack()));
 	  backAction->setEnabled(false);
 	QAction *quitAction = new QAction(_("&Quit"), this);
 	quitAction->setShortcut(Qt::CTRL + Qt::Key_Q);
-	  connect(quitAction, SIGNAL(activated()), SLOT(close()));
+	  connect(quitAction, SIGNAL(triggered(bool)), SLOT(close()));
 	QAction *loadAction = new QAction(QPixmap(xpm_load), _("&Load"), this);
 	loadAction->setShortcut(Qt::CTRL + Qt::Key_L);
-	  connect(loadAction, SIGNAL(activated()), SLOT(loadConfig()));
+	  connect(loadAction, SIGNAL(triggered(bool)), SLOT(loadConfig()));
 	saveAction = new QAction(QPixmap(xpm_save), _("&Save"), this);
 	saveAction->setShortcut(Qt::CTRL + Qt::Key_S);
-	  connect(saveAction, SIGNAL(activated()), SLOT(saveConfig()));
+	  connect(saveAction, SIGNAL(triggered(bool)), SLOT(saveConfig()));
 	conf_set_changed_callback(conf_changed);
 	// Set saveAction's initial state
 	conf_changed();
 	QAction *saveAsAction = new QAction(_("Save &As..."), this);
-	  connect(saveAsAction, SIGNAL(activated()), SLOT(saveConfigAs()));
+	  connect(saveAsAction, SIGNAL(triggered(bool)), SLOT(saveConfigAs()));
 	QAction *searchAction = new QAction(_("&Find"), this);
 	searchAction->setShortcut(Qt::CTRL + Qt::Key_F);
-	  connect(searchAction, SIGNAL(activated()), SLOT(searchConfig()));
+	  connect(searchAction, SIGNAL(triggered(bool)), SLOT(searchConfig()));
 	singleViewAction = new QAction(QPixmap(xpm_single_view), _("Single View"), this);
 	singleViewAction->setCheckable(true);
-	  connect(singleViewAction, SIGNAL(activated()), SLOT(showSingleView()));
+	  connect(singleViewAction, SIGNAL(triggered(bool)), SLOT(showSingleView()));
 	splitViewAction = new QAction(QPixmap(xpm_split_view), _("Split View"), this);
 	splitViewAction->setCheckable(true);
-	  connect(splitViewAction, SIGNAL(activated()), SLOT(showSplitView()));
+	  connect(splitViewAction, SIGNAL(triggered(bool)), SLOT(showSplitView()));
 	fullViewAction = new QAction(QPixmap(xpm_tree_view), _("Full View"), this);
 	fullViewAction->setCheckable(true);
-	  connect(fullViewAction, SIGNAL(activated()), SLOT(showFullView()));
+	  connect(fullViewAction, SIGNAL(triggered(bool)), SLOT(showFullView()));
 
 	QAction *showNameAction = new QAction(_("Show Name"), this);
 	  showNameAction->setCheckable(true);
 	  connect(showNameAction, SIGNAL(toggled(bool)), configView, SLOT(setShowName(bool)));
-	  connect(configView, SIGNAL(showNameChanged(bool)), showNameAction, SLOT(setOn(bool)));
 	  showNameAction->setChecked(configView->showName());
 	QAction *showRangeAction = new QAction(_("Show Range"), this);
 	  showRangeAction->setCheckable(true);
 	  connect(showRangeAction, SIGNAL(toggled(bool)), configView, SLOT(setShowRange(bool)));
-	  connect(configView, SIGNAL(showRangeChanged(bool)), showRangeAction, SLOT(setOn(bool)));
 	QAction *showDataAction = new QAction(_("Show Data"), this);
 	  showDataAction->setCheckable(true);
 	  connect(showDataAction, SIGNAL(toggled(bool)), configView, SLOT(setShowData(bool)));
-	  connect(configView, SIGNAL(showDataChanged(bool)), showDataAction, SLOT(setOn(bool)));
 
 	QActionGroup *optGroup = new QActionGroup(this);
 	optGroup->setExclusive(true);
-	connect(optGroup, SIGNAL(selected(QAction *)), configView,
+	connect(optGroup, SIGNAL(triggered(QAction*)), configView,
 		SLOT(setOptionMode(QAction *)));
-	connect(optGroup, SIGNAL(selected(QAction *)), menuView,
+	connect(optGroup, SIGNAL(triggered(QAction *)), menuView,
 		SLOT(setOptionMode(QAction *)));
 
 	configView->showNormalAction = new QAction(_("Show Normal Options"), optGroup);
@@ -589,13 +586,12 @@ ConfigMainWindow::ConfigMainWindow(void)
 	QAction *showDebugAction = new QAction( _("Show Debug Info"), this);
 	  showDebugAction->setCheckable(true);
 	  connect(showDebugAction, SIGNAL(toggled(bool)), helpText, SLOT(setShowDebug(bool)));
-	  connect(helpText, SIGNAL(showDebugChanged(bool)), showDebugAction, SLOT(setOn(bool)));
 	  showDebugAction->setChecked(helpText->showDebug());
 
 	QAction *showIntroAction = new QAction( _("Introduction"), this);
-	  connect(showIntroAction, SIGNAL(activated()), SLOT(showIntro()));
+	  connect(showIntroAction, SIGNAL(triggered(bool)), SLOT(showIntro()));
 	QAction *showAboutAction = new QAction( _("About"), this);
-	  connect(showAboutAction, SIGNAL(activated()), SLOT(showAbout()));
+	  connect(showAboutAction, SIGNAL(triggered(bool)), SLOT(showAbout()));
 
 	// init tool bar
 	toolBar->addAction(backAction);
@@ -634,23 +630,6 @@ ConfigMainWindow::ConfigMainWindow(void)
 	helpMenu->addAction(showIntroAction);
 	helpMenu->addAction(showAboutAction);
 
-	connect(configList, SIGNAL(menuChanged(struct menu *)),
-		helpText, SLOT(setInfo(struct menu *)));
-	connect(configList, SIGNAL(menuSelected(struct menu *)),
-		SLOT(changeMenu(struct menu *)));
-	connect(configList, SIGNAL(parentSelected()),
-		SLOT(goBack()));
-	connect(menuList, SIGNAL(menuChanged(struct menu *)),
-		helpText, SLOT(setInfo(struct menu *)));
-	connect(menuList, SIGNAL(menuSelected(struct menu *)),
-		SLOT(changeMenu(struct menu *)));
-
-	connect(configList, SIGNAL(gotFocus(struct menu *)),
-		helpText, SLOT(setInfo(struct menu *)));
-	connect(menuList, SIGNAL(gotFocus(struct menu *)),
-		helpText, SLOT(setInfo(struct menu *)));
-	connect(menuList, SIGNAL(gotFocus(struct menu *)),
-		SLOT(listFocusChanged(void)));
 	connect(helpText, SIGNAL(menuSelected(struct menu *)),
 		SLOT(setMenuLink(struct menu *)));
 
-- 
2.1.4

