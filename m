Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:31945 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759398AbbIVSg5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:57 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 38/39] Port xconfig to Qt5 - Update copyright.
Date: Tue, 22 Sep 2015 11:36:38 -0700
Message-Id: <1442946999-37018-39-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.cc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 1f31651..91b7e6f 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1,5 +1,6 @@
 /*
  * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
+ * Copyright (C) 2015 Boris Barbulovski <bbarbulovski@gmail.com>
  * Released under the terms of the GNU GPL v2.0.
  */
 
@@ -1753,7 +1754,8 @@ void ConfigMainWindow::showIntro(void)
 
 void ConfigMainWindow::showAbout(void)
 {
-	static const QString str = _("qconf is Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>.\n\n"
+	static const QString str = _("qconf is Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>.\n"
+		"Copyright (C) 2015 Boris Barbulovski <bbarbulovski@gmail.com>.\n\n"
 		"Bug reports and feature request can also be entered at http://bugzilla.kernel.org/\n");
 
 	QMessageBox::information(this, "qconf", str);
-- 
2.1.4

