Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387723AbgDBJ2I (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 05:28:08 -0400
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 3/6] kconfig: qconf: fix the content of the main widget
Date: Thu,  2 Apr 2020 11:28:00 +0200
Message-Id: <3f87c3c69b198ee3b42b92d5d230c3976115b60e.1585819250.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1585819250.git.mchehab+huawei@kernel.org>
References: <cover.1585819250.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org

The port to Qt5 tried to preserve the same way as it used
to work with Qt3 and Qt4. However, at least with newer
versions of Qt5 (5.13), this doesn't work properly.

Change the schema by adding a vertical layout, in order
for it to start working properly again.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 2f4971906207..81ae6c059c1c 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1362,21 +1362,32 @@ ConfigMainWindow::ConfigMainWindow(void)
 	if ((x.isValid())&&(y.isValid()))
 		move(x.toInt(), y.toInt());
 
-	split1 = new QSplitter(this);
+	QWidget *widget = new QWidget(this);
+	QVBoxLayout *layout = new QVBoxLayout(widget);
+	setCentralWidget(widget);
+
+	split1 = new QSplitter(widget);
 	split1->setOrientation(Qt::Horizontal);
-	setCentralWidget(split1);
+	split1->setChildrenCollapsible(false);
 
-	menuView = new ConfigView(split1, "menu");
+	menuView = new ConfigView(widget, "menu");
 	menuList = menuView->list;
 
-	split2 = new QSplitter(split1);
+	split2 = new QSplitter(widget);
+	split2->setChildrenCollapsible(false);
 	split2->setOrientation(Qt::Vertical);
 
 	// create config tree
-	configView = new ConfigView(split2, "config");
+	configView = new ConfigView(widget, "config");
 	configList = configView->list;
 
-	helpText = new ConfigInfoView(split2, "help");
+	helpText = new ConfigInfoView(widget, "help");
+
+	layout->addWidget(split2);
+	split2->addWidget(split1);
+	split1->addWidget(configView);
+	split1->addWidget(menuView);
+	split2->addWidget(helpText);
 
 	setTabOrder(configList, helpText);
 	configList->setFocus();
-- 
2.25.1
