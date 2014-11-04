Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:62975 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750985AbaKDJus (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Nov 2014 04:50:48 -0500
From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
Subject: [PATCH] xconfig: Don't forget changed string value on focus lost
Date: Tue,  4 Nov 2014 10:50:27 +0100
Message-Id: <1415094627-18917-1-git-send-email-syntheticpp@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr, =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>

Signed-off-by: Peter Kümmel <syntheticpp@gmx.net>
---
 scripts/kconfig/qconf.cc | 23 +++++++++++++++++++----
 scripts/kconfig/qconf.h  |  2 ++
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 9d3b04b..f08472e 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -302,13 +302,18 @@ ConfigLineEdit::ConfigLineEdit(ConfigView* parent)
 	connect(this, SIGNAL(lostFocus()), SLOT(hide()));
 }
 
-void ConfigLineEdit::show(ConfigItem* i)
+void ConfigLineEdit::updateLineEditText(ConfigItem* i)
 {
-	item = i;
-	if (sym_get_string_value(item->menu->sym))
-		setText(QString::fromLocal8Bit(sym_get_string_value(item->menu->sym)));
+	if (sym_get_string_value(i->menu->sym))
+		setText(QString::fromLocal8Bit(sym_get_string_value(i->menu->sym)));
 	else
 		setText(QString::null);
+}
+
+void ConfigLineEdit::show(ConfigItem* i)
+{
+	item = i;
+	updateLineEditText(item);
 	Parent::show();
 	setFocus();
 }
@@ -317,6 +322,7 @@ void ConfigLineEdit::keyPressEvent(QKeyEvent* e)
 {
 	switch (e->key()) {
 	case Qt::Key_Escape:
+		updateLineEditText(item);
 		break;
 	case Qt::Key_Return:
 	case Qt::Key_Enter:
@@ -332,6 +338,15 @@ void ConfigLineEdit::keyPressEvent(QKeyEvent* e)
 	hide();
 }
 
+void ConfigLineEdit::focusOutEvent(QFocusEvent *e)
+{
+	if (e->lostFocus()) {
+		sym_set_string_value(item->menu->sym, text().latin1());
+		parent()->updateList(item);
+	}
+	Parent::focusOutEvent(e);
+}
+
 ConfigList::ConfigList(ConfigView* p, const char *name)
 	: Parent(p, name),
 	  updateAll(false),
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index bde0c6b..11efb71 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -209,8 +209,10 @@ public:
 	{
 		return (ConfigView*)Parent::parent();
 	}
+	void updateLineEditText(ConfigItem *i);
 	void show(ConfigItem *i);
 	void keyPressEvent(QKeyEvent *e);
+	void focusOutEvent(QFocusEvent *e);
 
 public:
 	ConfigItem *item;
-- 
1.9.1

