Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:53794 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750760AbaKEGX0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 5 Nov 2014 01:23:26 -0500
From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
Subject: [PATCH] xconfig: Set keyboard focus to line edit whenever the search dialog opens
Date: Wed,  5 Nov 2014 07:23:18 +0100
Message-Id: <1415168598-3867-1-git-send-email-syntheticpp@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr, =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>

When after a search on a result is clicked the focus jumps to
the result list. So after closing and reopening the dialog the
field does not have the focus any more. This is annoying when
you press Ctrl-F and start typing for a new search because
the text shows not up in the edit field but gets lost. You
have to click additionally into the edit field to move the
focus to this field. With this patch the focus is always set
to the edit field when the dialog opens.

Signed-off-by: Peter Kümmel <syntheticpp@gmx.net>
---
 scripts/kconfig/qconf.cc | 6 ++++++
 scripts/kconfig/qconf.h  | 1 +
 2 files changed, 7 insertions(+)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 9d3b04b..7ef498d 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1235,6 +1235,11 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *nam
 	}
 }
 
+void ConfigSearchWindow::setFocusOnLineEdit()
+{
+	editField->setFocus(Qt::OtherFocusReason);
+}
+
 void ConfigSearchWindow::saveSettings(void)
 {
 	if (name()) {
@@ -1506,6 +1511,7 @@ void ConfigMainWindow::searchConfig(void)
 	if (!searchWindow)
 		searchWindow = new ConfigSearchWindow(this, "search");
 	searchWindow->show();
+	searchWindow->setFocusOnLineEdit();
 }
 
 void ConfigMainWindow::changeMenu(struct menu *menu)
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index bde0c6b..6f2c4d6 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -288,6 +288,7 @@ public:
 public slots:
 	void saveSettings(void);
 	void search(void);
+	void setFocusOnLineEdit(void);
 
 protected:
 	QLineEdit* editField;
-- 
1.9.1

