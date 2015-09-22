Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:13334 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757890AbbIVSgs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:48 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 12/39] Port xconfig to Qt5 - Update QAction checkable
Date: Tue, 22 Sep 2015 11:36:12 -0700
Message-Id: <1442946999-37018-13-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.cc | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 6d32f39..c2f9767 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -817,28 +817,28 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *e)
 
 			headerPopup = new QMenu(this);
 			action = new QAction(_("Show Name"), this);
-			  action->setToggleAction(TRUE);
+			  action->setCheckable(TRUE);
 			  connect(action, SIGNAL(toggled(bool)),
 				  parent(), SLOT(setShowName(bool)));
 			  connect(parent(), SIGNAL(showNameChanged(bool)),
 				  action, SLOT(setOn(bool)));
-			  action->setOn(showName);
+			  action->setChecked(showName);
 			  action->addTo(headerPopup);
 			action = new QAction(_("Show Range"), this);
-			  action->setToggleAction(TRUE);
+			  action->setCheckable(TRUE);
 			  connect(action, SIGNAL(toggled(bool)),
 				  parent(), SLOT(setShowRange(bool)));
 			  connect(parent(), SIGNAL(showRangeChanged(bool)),
 				  action, SLOT(setOn(bool)));
-			  action->setOn(showRange);
+			  action->setChecked(showRange);
 			  action->addTo(headerPopup);
 			action = new QAction( _("Show Data"), this);
-			  action->setToggleAction(TRUE);
+			  action->setCheckable(TRUE);
 			  connect(action, SIGNAL(toggled(bool)),
 				  parent(), SLOT(setShowData(bool)));
 			  connect(parent(), SIGNAL(showDataChanged(bool)),
 				  action, SLOT(setOn(bool)));
-			  action->setOn(showData);
+			  action->setChecked(showData);
 			  action->addTo(headerPopup);
 		}
 		headerPopup->exec(e->globalPos());
@@ -1161,10 +1161,10 @@ QMenu* ConfigInfoView::createStandardContextMenu(const QPoint & pos)
 {
 	QMenu* popup = Parent::createStandardContextMenu(pos);
 	QAction* action = new QAction(_("Show Debug Info"), popup);
-	  action->setToggleAction(TRUE);
+	  action->setCheckable(TRUE);
 	  connect(action, SIGNAL(toggled(bool)), SLOT(setShowDebug(bool)));
 	  connect(this, SIGNAL(showDebugChanged(bool)), action, SLOT(setOn(bool)));
-	  action->setOn(showDebug());
+	  action->setChecked(showDebug());
 	popup->addSeparator();
 	action->addTo(popup);
 	return popup;
@@ -1337,20 +1337,20 @@ ConfigMainWindow::ConfigMainWindow(void)
 	  connect(fullViewAction, SIGNAL(activated()), SLOT(showFullView()));
 
 	QAction *showNameAction = new QAction(_("Show Name"), this);
-	  showNameAction->setToggleAction(TRUE);
+	  showNameAction->setCheckable(TRUE);
 	  connect(showNameAction, SIGNAL(toggled(bool)), configView, SLOT(setShowName(bool)));
 	  connect(configView, SIGNAL(showNameChanged(bool)), showNameAction, SLOT(setOn(bool)));
-	  showNameAction->setOn(configView->showName());
+	  showNameAction->setChecked(configView->showName());
 	QAction *showRangeAction = new QAction(_("Show Range"), this);
-	  showRangeAction->setToggleAction(TRUE);
+	  showRangeAction->setCheckable(TRUE);
 	  connect(showRangeAction, SIGNAL(toggled(bool)), configView, SLOT(setShowRange(bool)));
 	  connect(configView, SIGNAL(showRangeChanged(bool)), showRangeAction, SLOT(setOn(bool)));
-	  showRangeAction->setOn(configList->showRange);
+	  showRangeAction->setChecked(configList->showRange);
 	QAction *showDataAction = new QAction(_("Show Data"), this);
-	  showDataAction->setToggleAction(TRUE);
+	  showDataAction->setCheckable(TRUE);
 	  connect(showDataAction, SIGNAL(toggled(bool)), configView, SLOT(setShowData(bool)));
 	  connect(configView, SIGNAL(showDataChanged(bool)), showDataAction, SLOT(setOn(bool)));
-	  showDataAction->setOn(configList->showData);
+	  showDataAction->setChecked(configList->showData);
 
 	QActionGroup *optGroup = new QActionGroup(this);
 	optGroup->setExclusive(TRUE);
@@ -1362,18 +1362,18 @@ ConfigMainWindow::ConfigMainWindow(void)
 	configView->showNormalAction = new QAction(_("Show Normal Options"), optGroup);
 	configView->showAllAction = new QAction(_("Show All Options"), optGroup);
 	configView->showPromptAction = new QAction(_("Show Prompt Options"), optGroup);
-	configView->showNormalAction->setToggleAction(TRUE);
-	configView->showNormalAction->setOn(configList->optMode == normalOpt);
-	configView->showAllAction->setToggleAction(TRUE);
-	configView->showAllAction->setOn(configList->optMode == allOpt);
-	configView->showPromptAction->setToggleAction(TRUE);
-	configView->showPromptAction->setOn(configList->optMode == promptOpt);
+	configView->showNormalAction->setCheckable(TRUE);
+	configView->showNormalAction->setChecked(configList->optMode == normalOpt);
+	configView->showAllAction->setCheckable(TRUE);
+	configView->showAllAction->setChecked(configList->optMode == allOpt);
+	configView->showPromptAction->setCheckable(TRUE);
+	configView->showPromptAction->setChecked(configList->optMode == promptOpt);
 
 	QAction *showDebugAction = new QAction( _("Show Debug Info"), this);
-	  showDebugAction->setToggleAction(TRUE);
+	  showDebugAction->setCheckable(TRUE);
 	  connect(showDebugAction, SIGNAL(toggled(bool)), helpText, SLOT(setShowDebug(bool)));
 	  connect(helpText, SIGNAL(showDebugChanged(bool)), showDebugAction, SLOT(setOn(bool)));
-	  showDebugAction->setOn(helpText->showDebug());
+	  showDebugAction->setChecked(helpText->showDebug());
 
 	QAction *showIntroAction = new QAction( _("Introduction"), this);
 	  connect(showIntroAction, SIGNAL(activated()), SLOT(showIntro()));
-- 
2.1.4

