Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:52722 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750727AbaKDKff (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Nov 2014 05:35:35 -0500
From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
Subject: [PATCH] xconfig: Search text should have focus after search and reopen
Date: Tue,  4 Nov 2014 11:35:23 +0100
Message-Id: <1415097323-20991-1-git-send-email-syntheticpp@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr, =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>

Signed-off-by: Peter Kümmel <syntheticpp@gmx.net>
---
 scripts/kconfig/qconf.cc | 7 +++++++
 scripts/kconfig/qconf.h  | 1 +
 2 files changed, 8 insertions(+)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 9d3b04b..014df76c 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1198,6 +1198,7 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *nam
 	layout2->addWidget(editField);
 	searchButton = new QPushButton(_("Search"), this);
 	searchButton->setAutoDefault(FALSE);
+	searchButton->setFocusPolicy(Qt::NoFocus);
 	connect(searchButton, SIGNAL(clicked()), SLOT(search()));
 	layout2->addWidget(searchButton);
 	layout1->addLayout(layout2);
@@ -1235,6 +1236,11 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *nam
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
@@ -1506,6 +1512,7 @@ void ConfigMainWindow::searchConfig(void)
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

