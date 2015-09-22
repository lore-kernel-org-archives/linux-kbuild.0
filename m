Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:31945 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759345AbbIVSgs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:48 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 13/39] Port xconfig to Qt5 - Make single/split/full actions checkable.
Date: Tue, 22 Sep 2015 11:36:13 -0700
Message-Id: <1442946999-37018-14-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.h  |  3 +++
 scripts/kconfig/qconf.cc | 30 +++++++++++++++++++++++++++---
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 8c7d951..2139901 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -316,6 +316,9 @@ protected:
 	ConfigInfoView *helpText;
 	QToolBar *toolBar;
 	QAction *backAction;
+	QAction *singleViewAction;
+	QAction *splitViewAction;
+	QAction *fullViewAction;
 	QSplitter* split1;
 	QSplitter* split2;
 };
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index c2f9767..f439f35 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1329,11 +1329,14 @@ ConfigMainWindow::ConfigMainWindow(void)
 	QAction *searchAction = new QAction(_("&Find"), this);
 	searchAction->setShortcut(Qt::CTRL + Qt::Key_F);
 	  connect(searchAction, SIGNAL(activated()), SLOT(searchConfig()));
-	QAction *singleViewAction = new QAction(QPixmap(xpm_single_view), _("Single View"), this);
+	singleViewAction = new QAction(QPixmap(xpm_single_view), _("Single View"), this);
+	singleViewAction->setCheckable(TRUE);
 	  connect(singleViewAction, SIGNAL(activated()), SLOT(showSingleView()));
-	QAction *splitViewAction = new QAction(QPixmap(xpm_split_view), _("Split View"), this);
+	splitViewAction = new QAction(QPixmap(xpm_split_view), _("Split View"), this);
+	splitViewAction->setCheckable(TRUE);
 	  connect(splitViewAction, SIGNAL(activated()), SLOT(showSplitView()));
-	QAction *fullViewAction = new QAction(QPixmap(xpm_tree_view), _("Full View"), this);
+	fullViewAction = new QAction(QPixmap(xpm_tree_view), _("Full View"), this);
+	fullViewAction->setCheckable(TRUE);
 	  connect(fullViewAction, SIGNAL(activated()), SLOT(showFullView()));
 
 	QAction *showNameAction = new QAction(_("Show Name"), this);
@@ -1579,6 +1582,13 @@ void ConfigMainWindow::goBack(void)
 
 void ConfigMainWindow::showSingleView(void)
 {
+	singleViewAction->setEnabled(false);
+	singleViewAction->setChecked(true);
+	splitViewAction->setEnabled(true);
+	splitViewAction->setChecked(false);
+	fullViewAction->setEnabled(true);
+	fullViewAction->setChecked(false);
+
 	menuView->hide();
 	menuList->setRootMenu(0);
 	configList->mode = singleMode;
@@ -1592,6 +1602,13 @@ void ConfigMainWindow::showSingleView(void)
 
 void ConfigMainWindow::showSplitView(void)
 {
+	singleViewAction->setEnabled(true);
+	singleViewAction->setChecked(false);
+	splitViewAction->setEnabled(false);
+	splitViewAction->setChecked(true);
+	fullViewAction->setEnabled(true);
+	fullViewAction->setChecked(false);
+
 	configList->mode = symbolMode;
 	if (configList->rootEntry == &rootmenu)
 		configList->updateListAll();
@@ -1608,6 +1625,13 @@ void ConfigMainWindow::showSplitView(void)
 
 void ConfigMainWindow::showFullView(void)
 {
+	singleViewAction->setEnabled(true);
+	singleViewAction->setChecked(false);
+	splitViewAction->setEnabled(true);
+	splitViewAction->setChecked(false);
+	fullViewAction->setEnabled(false);
+	fullViewAction->setChecked(true);
+
 	menuView->hide();
 	menuList->setRootMenu(0);
 	configList->mode = fullMode;
-- 
2.1.4

