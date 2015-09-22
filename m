Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:59967 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758297AbbIVSgp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:45 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 07/39] Port xconfig to Qt5 - Use QMenu
Date: Tue, 22 Sep 2015 11:36:07 -0700
Message-Id: <1442946999-37018-8-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.h  |  2 +-
 scripts/kconfig/qconf.cc | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 84b62f5..94e57bd 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -117,7 +117,7 @@ public:
 	struct menu *rootEntry;
 	QColorGroup disabledColorGroup;
 	QColorGroup inactivedColorGroup;
-	Q3PopupMenu* headerPopup;
+	QMenu* headerPopup;
 
 private:
 	int colMap[colNr];
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index f4231d4..334000a 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -13,7 +13,7 @@
 #include <q3header.h>
 #include <QFileDialog>
 #include <q3dragobject.h>
-#include <q3popupmenu.h>
+#include <QMenu>
 
 #include <qapplication.h>
 #include <qdesktopwidget.h>
@@ -817,7 +817,7 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *e)
 		if (!headerPopup) {
 			QAction *action;
 
-			headerPopup = new Q3PopupMenu(this);
+			headerPopup = new QMenu(this);
 			action = new QAction(_("Show Name"), this);
 			  action->setToggleAction(TRUE);
 			  connect(action, SIGNAL(toggled(bool)),
@@ -1387,32 +1387,32 @@ ConfigMainWindow::ConfigMainWindow(void)
 	fullViewAction->addTo(toolBar);
 
 	// create config menu
-	Q3PopupMenu* config = new Q3PopupMenu(this);
+	QMenu* config = new QMenu(this);
 	menu->insertItem(_("&File"), config);
 	loadAction->addTo(config);
 	saveAction->addTo(config);
 	saveAsAction->addTo(config);
-	config->insertSeparator();
+	config->addSeparator();
 	quitAction->addTo(config);
 
 	// create edit menu
-	Q3PopupMenu* editMenu = new Q3PopupMenu(this);
+	QMenu* editMenu = new QMenu(this);
 	menu->insertItem(_("&Edit"), editMenu);
 	searchAction->addTo(editMenu);
 
 	// create options menu
-	Q3PopupMenu* optionMenu = new Q3PopupMenu(this);
+	QMenu* optionMenu = new QMenu(this);
 	menu->insertItem(_("&Option"), optionMenu);
 	showNameAction->addTo(optionMenu);
 	showRangeAction->addTo(optionMenu);
 	showDataAction->addTo(optionMenu);
-	optionMenu->insertSeparator();
+	optionMenu->addSeparator();
 	optGroup->addTo(optionMenu);
-	optionMenu->insertSeparator();
+	optionMenu->addSeparator();
 
 	// create help menu
-	Q3PopupMenu* helpMenu = new Q3PopupMenu(this);
-	menu->insertSeparator();
+	QMenu* helpMenu = new QMenu(this);
+	menu->addSeparator();
 	menu->insertItem(_("&Help"), helpMenu);
 	showIntroAction->addTo(helpMenu);
 	showAboutAction->addTo(helpMenu);
-- 
2.1.4

