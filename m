Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728459AbgF2Skn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 14:40:43 -0400
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v2 2/5] kconfig: qconf: ensure that only one item will be highlighted
Date: Mon, 29 Jun 2020 11:35:36 +0200
Message-Id: <9cc77cb28cf641d537b3dd08892f3d655f26ffb2.1593423060.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1593423060.git.mchehab+huawei@kernel.org>
References: <cover.1593423060.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The logic which is used by search to show a new link lacks
support for un-selecting a previously-selected item.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 0e06afa08908..67dac2406a98 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1662,6 +1662,13 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
 	}
 
 	if (list) {
+		/* Clear an already-selected item */
+		if (!list->selectedItems().isEmpty()) {
+			item = (ConfigItem*)list->selectedItems().first();
+			if (item)
+				item->setSelected(false);
+		}
+
 		item = list->findConfigItem(menu);
 		if (item) {
 			item->setSelected(true);
-- 
2.26.2
