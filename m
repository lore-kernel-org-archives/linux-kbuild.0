Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:59967 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759380AbbIVSgu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:50 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 23/39] Port xconfig to Qt5 - Quick workaround to bypass app crash at startup.
Date: Tue, 22 Sep 2015 11:36:23 -0700
Message-Id: <1442946999-37018-24-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.cc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 3454c43..8d72e4a 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -576,9 +576,6 @@ void ConfigList::updateMenuList(P* parent, struct menu* menu)
 	enum prop_type type;
 
 	if (!menu) {
-		while ((item = parent->firstChild()))
-			item->parent()->removeChild(item);
-			delete item;
 		return;
 	}
 
-- 
2.1.4

