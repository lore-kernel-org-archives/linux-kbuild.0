Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:13334 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759283AbbIVSgq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:46 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 05/39] Port xconfig to Qt5 - Use QList
Date: Tue, 22 Sep 2015 11:36:05 -0700
Message-Id: <1442946999-37018-6-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.h  |  4 ++--
 scripts/kconfig/qconf.cc | 14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 4d5218d..0d364c7 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -16,8 +16,8 @@ class ConfigMainWindow;
 class ConfigSettings : public QSettings {
 public:
 	ConfigSettings();
-	Q3ValueList<int> readSizes(const QString& key, bool *ok);
-	bool writeSizes(const QString& key, const Q3ValueList<int>& value);
+	QList<int> readSizes(const QString& key, bool *ok);
+	bool writeSizes(const QString& key, const QList<int>& value);
 };
 
 enum colIdx {
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 9f1a9cf..bd62f60 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -7,7 +7,7 @@
 
 #include <QMainWindow>
 #include <q3vbox.h>
-#include <q3valuelist.h>
+#include <QList>
 #include <q3textbrowser.h>
 #include <QAction>
 #include <q3header.h>
@@ -64,9 +64,9 @@ ConfigSettings::ConfigSettings()
 /**
  * Reads a list of integer values from the application settings.
  */
-Q3ValueList<int> ConfigSettings::readSizes(const QString& key, bool *ok)
+QList<int> ConfigSettings::readSizes(const QString& key, bool *ok)
 {
-	Q3ValueList<int> result;
+	QList<int> result;
 	QStringList entryList = readListEntry(key, ok);
 	QStringList::Iterator it;
 
@@ -79,10 +79,10 @@ Q3ValueList<int> ConfigSettings::readSizes(const QString& key, bool *ok)
 /**
  * Writes a list of integer values to the application settings.
  */
-bool ConfigSettings::writeSizes(const QString& key, const Q3ValueList<int>& value)
+bool ConfigSettings::writeSizes(const QString& key, const QList<int>& value)
 {
 	QStringList stringList;
-	Q3ValueList<int>::ConstIterator it;
+	QList<int>::ConstIterator it;
 
 	for (it = value.begin(); it != value.end(); ++it)
 		stringList.push_back(QString::number(*it));
@@ -1214,7 +1214,7 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *nam
 			y = configSettings->readNumEntry("/window y", 0, &ok);
 		if (ok)
 			move(x, y);
-		Q3ValueList<int> sizes = configSettings->readSizes("/split", &ok);
+		QList<int> sizes = configSettings->readSizes("/split", &ok);
 		if (ok)
 			split->setSizes(sizes);
 		configSettings->endGroup();
@@ -1446,7 +1446,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 		showSplitView();
 
 	// UI setup done, restore splitter positions
-	Q3ValueList<int> sizes = configSettings->readSizes("/split1", &ok);
+	QList<int> sizes = configSettings->readSizes("/split1", &ok);
 	if (ok)
 		split1->setSizes(sizes);
 
-- 
2.1.4

