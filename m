Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:35018 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759324AbbIVSgr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:47 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 09/39] Port xconfig to Qt5 - Replace Q3VBox with QWidget
Date: Tue, 22 Sep 2015 11:36:09 -0700
Message-Id: <1442946999-37018-10-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.h  | 4 ++--
 scripts/kconfig/qconf.cc | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 94e57bd..8c7d951 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -199,9 +199,9 @@ public:
 	ConfigItem *item;
 };
 
-class ConfigView : public Q3VBox {
+class ConfigView : public QWidget {
 	Q_OBJECT
-	typedef class Q3VBox Parent;
+	typedef class QWidget Parent;
 public:
 	ConfigView(QWidget* parent, const char *name = 0);
 	~ConfigView(void);
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 6437197..df1700e 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -6,7 +6,6 @@
 #include <qglobal.h>
 
 #include <QMainWindow>
-#include <q3vbox.h>
 #include <QList>
 #include <qtextbrowser.h>
 #include <QAction>
-- 
2.1.4

