Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:35856 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752171AbbIVSgp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:45 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 04/39] Port xconfig to Qt5 - Use QFileDialog
Date: Tue, 22 Sep 2015 11:36:04 -0700
Message-Id: <1442946999-37018-5-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.cc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 601c868..9f1a9cf 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -11,7 +11,7 @@
 #include <q3textbrowser.h>
 #include <QAction>
 #include <q3header.h>
-#include <q3filedialog.h>
+#include <QFileDialog>
 #include <q3dragobject.h>
 #include <q3popupmenu.h>
 
@@ -1457,7 +1457,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 
 void ConfigMainWindow::loadConfig(void)
 {
-	QString s = Q3FileDialog::getOpenFileName(conf_get_configname(), NULL, this);
+	QString s = QFileDialog::getOpenFileName(conf_get_configname(), NULL, this);
 	if (s.isNull())
 		return;
 	if (conf_read(QFile::encodeName(s)))
@@ -1476,7 +1476,7 @@ bool ConfigMainWindow::saveConfig(void)
 
 void ConfigMainWindow::saveConfigAs(void)
 {
-	QString s = Q3FileDialog::getSaveFileName(conf_get_configname(), NULL, this);
+	QString s = QFileDialog::getSaveFileName(conf_get_configname(), NULL, this);
 	if (s.isNull())
 		return;
 	saveConfig();
-- 
2.1.4

