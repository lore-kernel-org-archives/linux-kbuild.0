Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:8362 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758000AbbIVSg4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 14:36:56 -0400
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: [PATCH 35/39] Port xconfig to Qt5 - Add(back) one click checkbox toggle.
Date: Tue, 22 Sep 2015 11:36:35 -0700
Message-Id: <1442946999-37018-36-git-send-email-thiago.macieira@intel.com>
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
 scripts/kconfig/qconf.cc | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 455969c..a46aac7 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -779,10 +779,26 @@ void ConfigList::mouseReleaseEvent(QMouseEvent* e)
 
 	menu = item->menu;
 	x = header()->offset() + p.x();
-	idx = header()->sectionPosition(x);
+	idx = header()->logicalIndexAt(x);
 	switch (idx) {
 	case promptColIdx:
 		icon = item->pixmap(promptColIdx);
+		if (!icon.isNull()) {
+			int off = header()->sectionPosition(0) + visualRect(indexAt(p)).x() + 4; // 4 is Hardcoded image offset. There might be a way to do it properly.
+			if (x >= off && x < off + icon.availableSizes().first().width()) {
+				if (item->goParent) {
+					emit parentSelected();
+					break;
+				} else if (!menu)
+					break;
+				ptype = menu->prompt ? menu->prompt->type : P_UNKNOWN;
+				if (ptype == P_MENU && rootEntry != menu &&
+				    mode != fullMode && mode != menuMode)
+					emit menuSelected(menu);
+				else
+					changeValue(item);
+			}
+		}
 		break;
 	case noColIdx:
 		setValue(item, no);
-- 
2.1.4

