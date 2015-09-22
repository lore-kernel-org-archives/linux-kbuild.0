Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:35856 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759235AbbIVSgo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:44 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 01/39] Remove support for QT3 and older.
Date: Tue, 22 Sep 2015 11:36:01 -0700
Message-Id: <1442946999-37018-2-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.h  | 18 ------------------
 scripts/kconfig/qconf.cc | 23 -----------------------
 2 files changed, 41 deletions(-)

diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index bde0c6b..703285d 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -3,27 +3,9 @@
  * Released under the terms of the GNU GPL v2.0.
  */
 
-#if QT_VERSION < 0x040000
-#include <qlistview.h>
-#else
 #include <q3listview.h>
-#endif
 #include <qsettings.h>
 
-#if QT_VERSION < 0x040000
-#define Q3ValueList             QValueList
-#define Q3PopupMenu             QPopupMenu
-#define Q3ListView              QListView
-#define Q3ListViewItem          QListViewItem
-#define Q3VBox                  QVBox
-#define Q3TextBrowser           QTextBrowser
-#define Q3MainWindow            QMainWindow
-#define Q3Action                QAction
-#define Q3ToolBar               QToolBar
-#define Q3ListViewItemIterator  QListViewItemIterator
-#define Q3FileDialog            QFileDialog
-#endif
-
 class ConfigView;
 class ConfigList;
 class ConfigItem;
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index c3bb7fe..0e18a9c 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -5,18 +5,6 @@
 
 #include <qglobal.h>
 
-#if QT_VERSION < 0x040000
-#include <stddef.h>
-#include <qmainwindow.h>
-#include <qvbox.h>
-#include <qvaluelist.h>
-#include <qtextbrowser.h>
-#include <qaction.h>
-#include <qheader.h>
-#include <qfiledialog.h>
-#include <qdragobject.h>
-#include <qpopupmenu.h>
-#else
 #include <q3mainwindow.h>
 #include <q3vbox.h>
 #include <q3valuelist.h>
@@ -26,7 +14,6 @@
 #include <q3filedialog.h>
 #include <q3dragobject.h>
 #include <q3popupmenu.h>
-#endif
 
 #include <qapplication.h>
 #include <qdesktopwidget.h>
@@ -1282,11 +1269,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 	QDesktopWidget *d = configApp->desktop();
 	snprintf(title, sizeof(title), "%s%s",
 		rootmenu.prompt->text,
-#if QT_VERSION < 0x040000
-		" (Qt3)"
-#else
 		""
-#endif
 		);
 	setCaption(title);
 
@@ -1368,15 +1351,9 @@ ConfigMainWindow::ConfigMainWindow(void)
 	connect(optGroup, SIGNAL(selected(QAction *)), menuView,
 		SLOT(setOptionMode(QAction *)));
 
-#if QT_VERSION >= 0x040000
 	configView->showNormalAction = new QAction(_("Show Normal Options"), optGroup);
 	configView->showAllAction = new QAction(_("Show All Options"), optGroup);
 	configView->showPromptAction = new QAction(_("Show Prompt Options"), optGroup);
-#else
-	configView->showNormalAction = new QAction(_("Show Normal Options"), 0, optGroup);
-	configView->showAllAction = new QAction(_("Show All Options"), 0, optGroup);
-	configView->showPromptAction = new QAction(_("Show Prompt Options"), 0, optGroup);
-#endif
 	configView->showNormalAction->setToggleAction(TRUE);
 	configView->showNormalAction->setOn(configList->optMode == normalOpt);
 	configView->showAllAction->setToggleAction(TRUE);
-- 
2.1.4

