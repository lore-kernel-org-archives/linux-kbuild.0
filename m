Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730741AbgF2TfP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 15:35:15 -0400
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 2/2] kconfig: qconf: don't show goback button on splitMode
Date: Mon, 29 Jun 2020 17:30:17 +0200
Message-Id: <781cc3dc06dfe179f19c8aca8068c14890bace52.1593444492.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1593444492.git.mchehab+huawei@kernel.org>
References: <cover.1593444492.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

the goback button does nothing on splitMode. So, why display
it?

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index d0bcc0b717f0..f49fbac91995 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -437,9 +437,10 @@ void ConfigList::updateList(ConfigItem* item)
 	if (rootEntry != &rootmenu && (mode == singleMode ||
 	    (mode == symbolMode && rootEntry->parent != &rootmenu))) {
 		item = (ConfigItem *)topLevelItem(0);
-		if (!item)
+		if (!item && mode != symbolMode) {
 			item = new ConfigItem(this, 0, true);
-		last = item;
+			last = item;
+		}
 	}
 	if ((mode == singleMode || (mode == symbolMode && !(rootEntry->flags & MENU_ROOT))) &&
 	    rootEntry->sym && rootEntry->prompt) {
-- 
2.26.2
