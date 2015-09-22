Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:31945 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757518AbbIVSg4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:56 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 31/39] Port xconfig to Qt5 - Add horizontal scrollbar, and scroll per pixel.
Date: Tue, 22 Sep 2015 11:36:31 -0700
Message-Id: <1442946999-37018-32-git-send-email-thiago.macieira@intel.com>
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
index e5bfa6b..2ef06c1 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -318,6 +318,9 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
 	setSortingEnabled(false);
 	setRootIsDecorated(true);
 
+	setVerticalScrollMode(ScrollPerPixel);
+	setHorizontalScrollMode(ScrollPerPixel);
+
 	setHeaderLabels(QStringList() << _("Option") << _("Name") << "N" << "M" << "Y" << _("Value"));
 
 	connect(this, SIGNAL(itemSelectionChanged(void)),
@@ -453,11 +456,13 @@ void ConfigList::updateList(ConfigItem* item)
 
 		updateMenuList(item, rootEntry);
 		update();
+		resizeColumnToContents(0);
 		return;
 	}
 update:
 	updateMenuList(this, rootEntry);
 	update();
+	resizeColumnToContents(0);
 }
 
 void ConfigList::setValue(ConfigItem* item, tristate val)
-- 
2.1.4

