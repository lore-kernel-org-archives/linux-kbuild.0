Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387721AbgDBJ2I (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 05:28:08 -0400
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 2/6] kconfig: qconf: Change title for the item window
Date: Thu,  2 Apr 2020 11:27:59 +0200
Message-Id: <39c72450d98fc16b735237df296b066c8eebb066.1585819250.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1585819250.git.mchehab+huawei@kernel.org>
References: <cover.1585819250.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org

Both main config window and the item window have "Option"
name. That sounds weird, and makes harder to debug issues
of a window appearing at the wrong place.

So, change the title to reflect the contents of each
window.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index daa3325c0a49..2f4971906207 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -318,7 +318,10 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
 	setVerticalScrollMode(ScrollPerPixel);
 	setHorizontalScrollMode(ScrollPerPixel);
 
-	setHeaderLabels(QStringList() << "Option" << "Name" << "N" << "M" << "Y" << "Value");
+	if (mode == symbolMode)
+		setHeaderLabels(QStringList() << "Item" << "Name" << "N" << "M" << "Y" << "Value");
+	else
+		setHeaderLabels(QStringList() << "Option" << "Name" << "N" << "M" << "Y" << "Value");
 
 	connect(this, SIGNAL(itemSelectionChanged(void)),
 		SLOT(updateSelection(void)));
@@ -399,6 +402,11 @@ void ConfigList::updateSelection(void)
 	struct menu *menu;
 	enum prop_type type;
 
+	if (mode == symbolMode)
+		setHeaderLabels(QStringList() << "Item" << "Name" << "N" << "M" << "Y" << "Value");
+	else
+		setHeaderLabels(QStringList() << "Option" << "Name" << "N" << "M" << "Y" << "Value");
+
 	if (selectedItems().count() == 0)
 		return;
 
-- 
2.25.1
