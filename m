Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:62639 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759346AbbIVSgs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:48 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 21/39] Port xconfig to Qt5 - Use correct signal names.
Date: Tue, 22 Sep 2015 11:36:21 -0700
Message-Id: <1442946999-37018-22-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.cc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index e0518ca..a8b5452 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -270,7 +270,7 @@ ConfigItem::~ConfigItem(void)
 ConfigLineEdit::ConfigLineEdit(ConfigView* parent)
 	: Parent(parent)
 {
-	connect(this, SIGNAL(lostFocus()), SLOT(hide()));
+	connect(this, SIGNAL(editingFinished()), SLOT(hide()));
 }
 
 void ConfigLineEdit::show(ConfigItem* i)
@@ -318,7 +318,7 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
 	setSortingEnabled(-1);
 	setRootIsDecorated(true);
 
-	connect(this, SIGNAL(selectionChanged(void)),
+	connect(this, SIGNAL(itemSelectionChanged(void)),
 		SLOT(updateSelection(void)));
 
 	if (name) {
-- 
2.1.4

