Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387726AbgDBJ2I (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 05:28:08 -0400
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 4/6] kconfig: qconf: fix support for the split view mode
Date: Thu,  2 Apr 2020 11:28:01 +0200
Message-Id: <2407b050c25b9bb53743f089b16e4611143d2239.1585819250.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1585819250.git.mchehab+huawei@kernel.org>
References: <cover.1585819250.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org

At least on my tests (building against Qt5.13), it seems to
me that, since Kernel 3.14, the split view mode is broken.

Maybe it was not a top priority during the conversion time.

Anyway, this patch changes the logic in order to properly
support the split view mode and the single view mode.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 33 ++++++++++++++++++++++++++-------
 scripts/kconfig/qconf.h  |  2 ++
 2 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 81ae6c059c1c..5a560c647321 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -744,7 +744,10 @@ void ConfigList::keyPressEvent(QKeyEvent* ev)
 		type = menu->prompt ? menu->prompt->type : P_UNKNOWN;
 		if (type == P_MENU && rootEntry != menu &&
 		    mode != fullMode && mode != menuMode) {
-			emit menuSelected(menu);
+			if (mode == menuMode)
+				emit menuSelected(menu);
+			else
+				emit itemSelected(menu);
 			break;
 		}
 	case Qt::Key_Space:
@@ -851,9 +854,12 @@ void ConfigList::mouseDoubleClickEvent(QMouseEvent* e)
 	if (!menu)
 		goto skip;
 	ptype = menu->prompt ? menu->prompt->type : P_UNKNOWN;
-	if (ptype == P_MENU && (mode == singleMode || mode == symbolMode))
-		emit menuSelected(menu);
-	else if (menu->sym)
+	if (ptype == P_MENU) {
+		if (mode == singleMode)
+			emit itemSelected(menu);
+		else if (mode == symbolMode)
+			emit menuSelected(menu);
+	} else if (menu->sym)
 		changeValue(item);
 
 skip:
@@ -1505,6 +1511,8 @@ ConfigMainWindow::ConfigMainWindow(void)
 		helpText, SLOT(setInfo(struct menu *)));
 	connect(configList, SIGNAL(menuSelected(struct menu *)),
 		SLOT(changeMenu(struct menu *)));
+	connect(configList, SIGNAL(itemSelected(struct menu *)),
+		SLOT(changeItens(struct menu *)));
 	connect(configList, SIGNAL(parentSelected()),
 		SLOT(goBack()));
 	connect(menuList, SIGNAL(menuChanged(struct menu *)),
@@ -1601,15 +1609,26 @@ void ConfigMainWindow::searchConfig(void)
 	searchWindow->show();
 }
 
-void ConfigMainWindow::changeMenu(struct menu *menu)
+void ConfigMainWindow::changeItens(struct menu *menu)
 {
 	configList->setRootMenu(menu);
+
 	if (configList->rootEntry->parent == &rootmenu)
 		backAction->setEnabled(false);
 	else
 		backAction->setEnabled(true);
 }
 
+void ConfigMainWindow::changeMenu(struct menu *menu)
+{
+	menuList->setRootMenu(menu);
+
+	if (menuList->rootEntry->parent == &rootmenu)
+		backAction->setEnabled(false);
+	else
+		backAction->setEnabled(true);
+}
+
 void ConfigMainWindow::setMenuLink(struct menu *menu)
 {
 	struct menu *parent;
@@ -1719,14 +1738,14 @@ void ConfigMainWindow::showSplitView(void)
 	fullViewAction->setEnabled(true);
 	fullViewAction->setChecked(false);
 
-	configList->mode = symbolMode;
+	configList->mode = menuMode;
 	if (configList->rootEntry == &rootmenu)
 		configList->updateListAll();
 	else
 		configList->setRootMenu(&rootmenu);
 	configList->setAllOpen(true);
 	configApp->processEvents();
-	menuList->mode = menuMode;
+	menuList->mode = symbolMode;
 	menuList->setRootMenu(&rootmenu);
 	menuList->setAllOpen(true);
 	menuView->show();
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 45bfe9b2b966..c879d79ce817 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -71,6 +71,7 @@ public slots:
 signals:
 	void menuChanged(struct menu *menu);
 	void menuSelected(struct menu *menu);
+	void itemSelected(struct menu *menu);
 	void parentSelected(void);
 	void gotFocus(struct menu *);
 
@@ -298,6 +299,7 @@ class ConfigMainWindow : public QMainWindow {
 	ConfigMainWindow(void);
 public slots:
 	void changeMenu(struct menu *);
+	void changeItens(struct menu *);
 	void setMenuLink(struct menu *);
 	void listFocusChanged(void);
 	void goBack(void);
-- 
2.25.1
