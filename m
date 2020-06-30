Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730080AbgF3G0r (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 02:26:47 -0400
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v3 7/7] kconfig: qconf: navigate menus on hyperlinks
Date: Tue, 30 Jun 2020 08:26:41 +0200
Message-Id: <6f7162e40f127e76c7169315d33a14946a85719a.1593498345.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1593498345.git.mchehab+huawei@kernel.org>
References: <cover.1593498345.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Instead of just changing the helper window to show a
dependency, also navigate to it at the config and menu
widgets.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 6a327b69ff5f..f49fbac91995 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1233,7 +1233,6 @@ void ConfigInfoView::clicked(const QUrl &url)
 	char *data = new char[count + 1];
 	struct symbol **result;
 	struct menu *m = NULL;
-	char type;
 
 	if (count < 1) {
 		qInfo() << "Clicked link is empty";
@@ -1243,7 +1242,6 @@ void ConfigInfoView::clicked(const QUrl &url)
 
 	memcpy(data, str.constData(), count);
 	data[count] = '\0';
-	type = data[0];
 
 	/* Seek for exact match */
 	data[0] = '^';
@@ -1256,15 +1254,8 @@ void ConfigInfoView::clicked(const QUrl &url)
 	}
 
 	sym = *result;
-	if (type == 's') {
-		symbolInfo();
-		emit showDebugChanged(true);
-		free(result);
-		delete data;
-		return;
-	}
 
-	/* URL is a menu */
+	/* Seek for the menu which holds the symbol */
 	for (struct property *prop = sym->prop; prop; prop = prop->next) {
 		    if (prop->type != P_PROMPT && prop->type != P_MENU)
 			    continue;
@@ -1272,17 +1263,11 @@ void ConfigInfoView::clicked(const QUrl &url)
 		    break;
 	}
 
-	if (!m) {
+	if (!m)
 		qInfo() << "Clicked menu is invalid:" << data;
-		free(result);
-		delete data;
-		return;
-	}
+	else
+		emit menuSelected(m);
 
-	_menu = m;
-	menuInfo();
-
-	emit showDebugChanged(true);
 	free(result);
 	delete data;
 }
@@ -1731,6 +1716,7 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
 			list->setSelected(item, true);
 			list->scrollToItem(item);
 			list->setFocus();
+			helpText->setInfo(menu);
 		}
 	}
 }
-- 
2.26.2
