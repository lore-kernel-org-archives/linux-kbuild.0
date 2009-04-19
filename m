Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fmmailgate02.web.de ([217.72.192.227]:32818 "EHLO
	fmmailgate02.web.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758768AbZDSNlW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 Apr 2009 09:41:22 -0400
From: Markus Heidelberg <markus.heidelberg@web.de>
Subject: [PATCH 08/10] kconfig qconf: fix the type of the desktop widget
Date: Sun, 19 Apr 2009 15:41:25 +0200
Message-Id: <1240148487-27584-9-git-send-email-markus.heidelberg@web.de>
In-Reply-To: <1240148487-27584-1-git-send-email-markus.heidelberg@web.de>
References: <1240148487-27584-1-git-send-email-markus.heidelberg@web.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Markus Heidelberg <markus.heidelberg@web.de>

QApplication::desktop() returns a pointer to QDesktopWidget, not to
QWidget.

Fixes the following compiler error after a quick conversion with 'qt3to4',
which occured with g++ 3.4.6 and 4.1.2, but not anymore with 4.3.2.

scripts/kconfig/qconf.cc: In constructor 'ConfigMainWindow::ConfigMainWindow()':
scripts/kconfig/qconf.cc:1289: error: cannot convert 'QDesktopWidget*' to 'QWidget*' in initialization

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 scripts/kconfig/qconf.cc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index afae613..19811fc 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -5,6 +5,7 @@
 
 #include <qapplication.h>
 #include <qmainwindow.h>
+#include <qdesktopwidget.h>
 #include <qtoolbar.h>
 #include <qlayout.h>
 #include <qvbox.h>
@@ -1275,7 +1276,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 	int x, y, width, height;
 	char title[256];
 
-	QWidget *d = configApp->desktop();
+	QDesktopWidget *d = configApp->desktop();
 	snprintf(title, sizeof(title), _("Linux Kernel v%s Configuration"),
 		getenv("KERNELVERSION"));
 	setCaption(title);
-- 
1.6.3.rc1.24.g467d50

