Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:46378 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755180AbcK3W5z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Nov 2016 17:57:55 -0500
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 1/2] xconfig: fix 'Show Debug' functionality
Message-ID: <fb990a5d-c9c5-5b37-0e59-d5df19f64c67@infradead.org>
Date: Wed, 30 Nov 2016 14:57:52 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>
Cc: Jason Vas Dias <jason.vas.dias@gmail.com>, Boris Barbulovski <bbarbulovski@gmail.com>

From: Boris Barbulovski <bbarbulovski@gmail.com>

xconfig - Fix missing 'Show Debug' functionality.

xconfig Help mentions 'Show Debug Info' but it was missing from any
menu.

* Add 'Show debug' menu to the main menu.
* Properly load showDebug settings.

Reported-by: Jason Vas Dias <jason.vas.dias@gmail.com>
Signed-off-by: Boris Barbulovski <bbarbulovski@gmail.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
 scripts/kconfig/qconf.cc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Boris asked me to push these 2 patches.

--- lnx-49-rc7.orig/scripts/kconfig/qconf.cc
+++ lnx-49-rc7/scripts/kconfig/qconf.cc
@@ -1014,7 +1014,7 @@ ConfigInfoView::ConfigInfoView(QWidget*
 
 	if (!objectName().isEmpty()) {
 		configSettings->beginGroup(objectName());
-		_showDebug = configSettings->value("/showDebug", false).toBool();
+		setShowDebug(configSettings->value("/showDebug", false).toBool());
 		configSettings->endGroup();
 		connect(configApp, SIGNAL(aboutToQuit()), SLOT(saveSettings()));
 	}
@@ -1474,6 +1474,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 	optionMenu->addSeparator();
 	optionMenu->addActions(optGroup->actions());
 	optionMenu->addSeparator();
+	optionMenu->addAction(showDebugAction);
 
 	// create help menu
 	menu->addSeparator();
