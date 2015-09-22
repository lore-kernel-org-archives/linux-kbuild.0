Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:62639 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759387AbbIVSgv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:51 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 29/39] Port xconfig to Qt5 - Disable ConfigList soring
Date: Tue, 22 Sep 2015 11:36:29 -0700
Message-Id: <1442946999-37018-30-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.cc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 6de8589..e5bfa6b 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -315,7 +315,7 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
 	int i;
 
 	setObjectName(name);
-	setSortingEnabled(-1);
+	setSortingEnabled(false);
 	setRootIsDecorated(true);
 
 	setHeaderLabels(QStringList() << _("Option") << _("Name") << "N" << "M" << "Y" << _("Value"));
-- 
2.1.4

