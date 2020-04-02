Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387736AbgDBJ2I (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 05:28:08 -0400
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 5/6] kconfig: qconf: remove some old bogus TODOs
Date: Thu,  2 Apr 2020 11:28:02 +0200
Message-Id: <d12dc3231f3f9b1148c002ca3d44d6d9cd6585e5.1585819250.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1585819250.git.mchehab+huawei@kernel.org>
References: <cover.1585819250.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org

The items described on those TODOs are already solved. So,
remove the comments.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 5a560c647321..f3eaeb2b70da 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -839,7 +839,7 @@ void ConfigList::mouseMoveEvent(QMouseEvent* e)
 
 void ConfigList::mouseDoubleClickEvent(QMouseEvent* e)
 {
-	QPoint p = e->pos(); // TODO: Check if this works(was contentsToViewport).
+	QPoint p = e->pos();
 	ConfigItem* item = (ConfigItem*)itemAt(p);
 	struct menu *menu;
 	enum prop_type ptype;
@@ -1773,7 +1773,6 @@ void ConfigMainWindow::showFullView(void)
 
 /*
  * ask for saving configuration before quitting
- * TODO ask only when something changed
  */
 void ConfigMainWindow::closeEvent(QCloseEvent* e)
 {
-- 
2.25.1
