Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:40955 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfCJQNi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Mar 2019 12:13:38 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kconfig: fix 'Save As' menu of xconfig
Date: Mon, 11 Mar 2019 01:13:15 +0900
Message-Id: <1552234395-7699-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The 'Save As' menu of xconfig is not working; it always saves the
kernel configuration into the default file irrespective of the file
chosen in the dialog box.

The 'Save' menu always writes into the default file, but it would
make more sense to write into the file previously chosen by 'Load'
or 'Save As'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/qconf.cc | 42 +++++++++++++++++++++++++++++++++++-------
 scripts/kconfig/qconf.h  |  1 +
 2 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 8be8a70..ce7fc87 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1392,6 +1392,8 @@ ConfigMainWindow::ConfigMainWindow(void)
 	conf_set_changed_callback(conf_changed);
 	// Set saveAction's initial state
 	conf_changed();
+	configname = xstrdup(conf_get_configname());
+
 	QAction *saveAsAction = new QAction("Save &As...", this);
 	  connect(saveAsAction, SIGNAL(triggered(bool)), SLOT(saveConfigAs()));
 	QAction *searchAction = new QAction("&Find", this);
@@ -1520,17 +1522,29 @@ ConfigMainWindow::ConfigMainWindow(void)
 
 void ConfigMainWindow::loadConfig(void)
 {
-	QString s = QFileDialog::getOpenFileName(this, "", conf_get_configname());
-	if (s.isNull())
+	QString str;
+	QByteArray ba;
+	const char *name;
+
+	str = QFileDialog::getOpenFileName(this, "", configname);
+	if (str.isNull())
 		return;
-	if (conf_read(QFile::encodeName(s)))
+
+	ba = str.toLocal8Bit();
+	name = ba.data();
+
+	if (conf_read(name))
 		QMessageBox::information(this, "qconf", "Unable to load configuration!");
+
+	free(configname);
+	configname = xstrdup(name);
+
 	ConfigView::updateListAll();
 }
 
 bool ConfigMainWindow::saveConfig(void)
 {
-	if (conf_write(NULL)) {
+	if (conf_write(configname)) {
 		QMessageBox::information(this, "qconf", "Unable to save configuration!");
 		return false;
 	}
@@ -1541,10 +1555,24 @@ bool ConfigMainWindow::saveConfig(void)
 
 void ConfigMainWindow::saveConfigAs(void)
 {
-	QString s = QFileDialog::getSaveFileName(this, "", conf_get_configname());
-	if (s.isNull())
+	QString str;
+	QByteArray ba;
+	const char *name;
+
+	str = QFileDialog::getSaveFileName(this, "", configname);
+	if (str.isNull())
 		return;
-	saveConfig();
+
+	ba = str.toLocal8Bit();
+	name = ba.data();
+
+	if (conf_write(name)) {
+		QMessageBox::information(this, "qconf", "Unable to save configuration!");
+	}
+	conf_write_autoconf(0);
+
+	free(configname);
+	configname = xstrdup(name);
 }
 
 void ConfigMainWindow::searchConfig(void)
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 41df466..45bfe9b 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -291,6 +291,7 @@ public slots:
 class ConfigMainWindow : public QMainWindow {
 	Q_OBJECT
 
+	char *configname;
 	static QAction *saveAction;
 	static void conf_changed(void);
 public:
-- 
2.7.4
