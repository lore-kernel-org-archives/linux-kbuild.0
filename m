Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:31945 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759325AbbIVSgr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:47 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 06/39] Port xconfig to Qt5 - Use QTextBrowser
Date: Tue, 22 Sep 2015 11:36:06 -0700
Message-Id: <1442946999-37018-7-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.h  |  8 ++++----
 scripts/kconfig/qconf.cc | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 0d364c7..84b62f5 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -232,9 +232,9 @@ public:
 	static QAction *showPromptAction;
 };
 
-class ConfigInfoView : public Q3TextBrowser {
+class ConfigInfoView : public QTextBrowser {
 	Q_OBJECT
-	typedef class Q3TextBrowser Parent;
+	typedef class QTextBrowser Parent;
 public:
 	ConfigInfoView(QWidget* parent, const char *name = 0);
 	bool showDebug(void) const { return _showDebug; }
@@ -254,8 +254,8 @@ protected:
 	QString debug_info(struct symbol *sym);
 	static QString print_filter(const QString &str);
 	static void expr_print_help(void *data, struct symbol *sym, const char *str);
-	Q3PopupMenu* createPopupMenu(const QPoint& pos);
-	void contentsContextMenuEvent(QContextMenuEvent *e);
+	QMenu *createStandardContextMenu(const QPoint & pos);
+	void contextMenuEvent(QContextMenuEvent *e);
 
 	struct symbol *sym;
 	struct menu *_menu;
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index bd62f60..f4231d4 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -8,7 +8,7 @@
 #include <QMainWindow>
 #include <q3vbox.h>
 #include <QList>
-#include <q3textbrowser.h>
+#include <qtextbrowser.h>
 #include <QAction>
 #include <q3header.h>
 #include <QFileDialog>
@@ -1154,22 +1154,22 @@ void ConfigInfoView::expr_print_help(void *data, struct symbol *sym, const char
 		*text += str2;
 }
 
-Q3PopupMenu* ConfigInfoView::createPopupMenu(const QPoint& pos)
+QMenu* ConfigInfoView::createStandardContextMenu(const QPoint & pos)
 {
-	Q3PopupMenu* popup = Parent::createPopupMenu(pos);
+	QMenu* popup = Parent::createStandardContextMenu(pos);
 	QAction* action = new QAction(_("Show Debug Info"), popup);
 	  action->setToggleAction(TRUE);
 	  connect(action, SIGNAL(toggled(bool)), SLOT(setShowDebug(bool)));
 	  connect(this, SIGNAL(showDebugChanged(bool)), action, SLOT(setOn(bool)));
 	  action->setOn(showDebug());
-	popup->insertSeparator();
+	popup->addSeparator();
 	action->addTo(popup);
 	return popup;
 }
 
-void ConfigInfoView::contentsContextMenuEvent(QContextMenuEvent *e)
+void ConfigInfoView::contextMenuEvent(QContextMenuEvent *e)
 {
-	Parent::contentsContextMenuEvent(e);
+	Parent::contextMenuEvent(e);
 }
 
 ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *name)
-- 
2.1.4

