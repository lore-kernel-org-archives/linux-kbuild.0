Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:35856 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759333AbbIVSgr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:47 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 10/39] Port xconfig to Qt5 - Fix layout
Date: Tue, 22 Sep 2015 11:36:10 -0700
Message-Id: <1442946999-37018-11-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.cc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index df1700e..3a5ff5d 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -855,9 +855,13 @@ QAction *ConfigView::showPromptAction;
 ConfigView::ConfigView(QWidget* parent, const char *name)
 	: Parent(parent, name)
 {
+	QVBoxLayout *verticalLayout = new QVBoxLayout(this);
+
 	list = new ConfigList(this, name);
+	verticalLayout->addWidget(list);
 	lineEdit = new ConfigLineEdit(this);
 	lineEdit->hide();
+	verticalLayout->addWidget(lineEdit);
 
 	this->nextView = viewList;
 	viewList = this;
@@ -1302,6 +1306,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 
 	menu = menuBar();
 	toolBar = new QToolBar("Tools", this);
+	addToolBar(toolBar);
 
 	backAction = new QAction(QPixmap(xpm_back), _("Back"), this);
 	  connect(backAction, SIGNAL(activated()), SLOT(goBack()));
-- 
2.1.4

