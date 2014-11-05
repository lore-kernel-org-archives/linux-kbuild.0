Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:53092 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750867AbaKEGh3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 5 Nov 2014 01:37:29 -0500
From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
Subject: [PATCH] xconfig: Don't move focus when clicking on the search button
Date: Wed,  5 Nov 2014 07:37:21 +0100
Message-Id: <1415169441-5912-1-git-send-email-syntheticpp@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr, =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>

When the search button is clicked the focus moves to the
search button. Changing the search text after such a button
press requires an additional click into the edit field.
With this patch this click is not necessary anymore because
the button is configured to not accept the focus.

Signed-off-by: Peter Kümmel <syntheticpp@gmx.net>
---
 scripts/kconfig/qconf.cc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 9d3b04b..750a5ff 100644
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
-- 
1.9.1

