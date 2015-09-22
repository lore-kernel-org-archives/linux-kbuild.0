Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:13334 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933286AbbIVSgw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:52 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 24/39] Port xconfig to Qt5 - Tree widget set column titles.
Date: Tue, 22 Sep 2015 11:36:24 -0700
Message-Id: <1442946999-37018-25-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.cc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 8d72e4a..c64b905 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -318,6 +318,8 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
 	setSortingEnabled(-1);
 	setRootIsDecorated(true);
 
+	setHeaderLabels(QStringList() << _("Option") << _("Name") << "N" << "M" << "Y" << _("Value"));
+
 	connect(this, SIGNAL(itemSelectionChanged(void)),
 		SLOT(updateSelection(void)));
 
-- 
2.1.4

