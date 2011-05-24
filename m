Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:43990 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932506Ab1EXSQ3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 May 2011 14:16:29 -0400
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] xconfig: merge code path to conf_write()
Date: Tue, 24 May 2011 14:16:18 -0400
Message-Id: <1306260978-29437-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Hiromu Yakura <hiromu1996@gmail.com>, Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

Michal, Hiromu,

That should fix the first error miss in xconfig. I'll have a look tonight to
gconf.

 - Arnaud

---

From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] xconfig: merge code path to conf_write()

Avoid to have multiple path saving the config. This fixes an error check miss
when the window is being closed and the user requested the config to be written.

Reported-by: Hiromu Yakura <hiromu1996@gmail.com>
Pointed-out-by: Michal Marek <mmarek@suse.cz>
Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/qconf.cc |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 06dd2e3..c2796b8 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1489,8 +1489,7 @@ void ConfigMainWindow::saveConfigAs(void)
 	QString s = Q3FileDialog::getSaveFileName(conf_get_configname(), NULL, this);
 	if (s.isNull())
 		return;
-	if (conf_write(QFile::encodeName(s)))
-		QMessageBox::information(this, "qconf", _("Unable to save configuration!"));
+	saveConfig();
 }
 
 void ConfigMainWindow::searchConfig(void)
@@ -1643,7 +1642,7 @@ void ConfigMainWindow::closeEvent(QCloseEvent* e)
 	mb.setButtonText(QMessageBox::Cancel, _("Cancel Exit"));
 	switch (mb.exec()) {
 	case QMessageBox::Yes:
-		conf_write(NULL);
+		saveConfig();
 	case QMessageBox::No:
 		e->accept();
 		break;
-- 
1.7.3.4.574.g608b.dirty

