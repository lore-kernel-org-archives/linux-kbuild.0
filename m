Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:31945 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759273AbbIVSgp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:45 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 02/39] Port xconfig to Qt5 - Use QMainWindow, QToolBar
Date: Tue, 22 Sep 2015 11:36:02 -0700
Message-Id: <1442946999-37018-3-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.h  | 5 +++--
 scripts/kconfig/qconf.cc | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 703285d..db4b417 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -4,6 +4,7 @@
  */
 
 #include <q3listview.h>
+#include <QMainWindow>
 #include <qsettings.h>
 
 class ConfigView;
@@ -281,7 +282,7 @@ protected:
 	struct symbol **result;
 };
 
-class ConfigMainWindow : public Q3MainWindow {
+class ConfigMainWindow : public QMainWindow {
 	Q_OBJECT
 
 	static Q3Action *saveAction;
@@ -313,7 +314,7 @@ protected:
 	ConfigView *configView;
 	ConfigList *configList;
 	ConfigInfoView *helpText;
-	Q3ToolBar *toolBar;
+	QToolBar *toolBar;
 	Q3Action *backAction;
 	QSplitter* split1;
 	QSplitter* split2;
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 0e18a9c..199934c 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -5,7 +5,7 @@
 
 #include <qglobal.h>
 
-#include <q3mainwindow.h>
+#include <QMainWindow>
 #include <q3vbox.h>
 #include <q3valuelist.h>
 #include <q3textbrowser.h>
@@ -1303,7 +1303,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 	configList->setFocus();
 
 	menu = menuBar();
-	toolBar = new Q3ToolBar("Tools", this);
+	toolBar = new QToolBar("Tools", this);
 
 	backAction = new Q3Action("Back", QPixmap(xpm_back), _("Back"), 0, this);
 	  connect(backAction, SIGNAL(activated()), SLOT(goBack()));
-- 
2.1.4

