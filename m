Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fmmailgate03.web.de ([217.72.192.234]:39003 "EHLO
	fmmailgate03.web.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758385AbZDSNlV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 Apr 2009 09:41:21 -0400
From: Markus Heidelberg <markus.heidelberg@web.de>
Subject: [PATCH 05/10] kconfig qconf: fix -Wall compiler warnings
Date: Sun, 19 Apr 2009 15:41:22 +0200
Message-Id: <1240148487-27584-6-git-send-email-markus.heidelberg@web.de>
In-Reply-To: <1240148487-27584-1-git-send-email-markus.heidelberg@web.de>
References: <1240148487-27584-1-git-send-email-markus.heidelberg@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Markus Heidelberg <markus.heidelberg@web.de>

These compiler warnings occure when adding -Wall to HOSTCXXFLAGS in
/Makefile

scripts/kconfig/qconf.h: In constructor ‘ConfigInfoView::ConfigInfoView(QWidget*, const char*)’:
scripts/kconfig/qconf.h:274: warning: ‘ConfigInfoView::menu’ will be initialized after
scripts/kconfig/qconf.h:273: warning:   ‘symbol* ConfigInfoView::sym’
scripts/kconfig/qconf.cc:922: warning:   when initialized here

scripts/kconfig/qconf.cc: In member function ‘void ConfigMainWindow::setMenuLink(menu*)’:
scripts/kconfig/qconf.cc:1498: warning: enumeration value ‘menuMode’ not handled in switch
scripts/kconfig/qconf.cc:1498: warning: enumeration value ‘listMode’ not handled in switch

scripts/kconfig/qconf.cc: In member function ‘void ConfigMainWindow::saveSettings()’:
scripts/kconfig/qconf.cc:1664: warning: enumeration value ‘menuMode’ not handled in switch
scripts/kconfig/qconf.cc:1664: warning: enumeration value ‘listMode’ not handled in switch

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 scripts/kconfig/qconf.cc |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 5d0fd38..2bd6ed0 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -920,7 +920,7 @@ void ConfigView::updateListAll(void)
 }
 
 ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
-	: Parent(parent, name), menu(0), sym(0)
+	: Parent(parent, name), sym(0), menu(0)
 {
 	if (name) {
 		configSettings->beginGroup(name);
@@ -1524,6 +1524,8 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
 	case fullMode:
 		list = configList;
 		break;
+	default:
+		break;
 	}
 
 	if (list) {
@@ -1673,6 +1675,9 @@ void ConfigMainWindow::saveSettings(void)
 	case fullMode :
 		entry = "full";
 		break;
+
+	default:
+		break;
 	}
 	configSettings->writeEntry("/listMode", entry);
 
-- 
1.6.3.rc1.24.g467d50

