Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:62639 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759326AbbIVSgr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:47 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 11/39] Port xconfig to Qt5 - Fix layout margin.
Date: Tue, 22 Sep 2015 11:36:11 -0700
Message-Id: <1442946999-37018-12-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.cc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 3a5ff5d..6d32f39 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -856,6 +856,7 @@ ConfigView::ConfigView(QWidget* parent, const char *name)
 	: Parent(parent, name)
 {
 	QVBoxLayout *verticalLayout = new QVBoxLayout(this);
+	verticalLayout->setContentsMargins(0, 0, 0, 0);
 
 	list = new ConfigList(this, name);
 	verticalLayout->addWidget(list);
-- 
2.1.4

