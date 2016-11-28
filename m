Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:32828 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750797AbcK1ATd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 27 Nov 2016 19:19:33 -0500
From: Randy Dunlap <rdunlap@infradead.org>
Subject: xconfig patches to be merged
Message-ID: <870ad06b-d43f-e627-118b-8b5c2eddb677@infradead.org>
Date: Sun, 27 Nov 2016 16:19:29 -0800
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------8CEFE14899413C464B8D4960"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Boris Barbulovski <bbarbulovski@gmail.com>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

This is a multi-part message in MIME format.
--------------8CEFE14899413C464B8D4960
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Boris,

[one of my mail "folders" is mucked up; it happens to contain linux-kbuild
emails, so I cannot reply to them directly]


Please resend 2 (or 3; see below) xconfig patches to Michal and the
linux-kbuild mailing list.  Also please add my
Tested-by: Randy Dunlap <rdunlap@infradead.org>
to both of them.

1. your xconfig - Fix 'Show Debug' functionality
patch.

Same as https://patchwork.kernel.org/patch/9407305/

2. your qconfig initial slider sizes fix
https://patchwork.kernel.org/patch/9380811/

However, I don't have a record that this patch was needed or used
in my testing.

3. your QSlider sizes issues patch
which I cannot find in email archives, so I am attaching it below.


Thanks.
-- 
~Randy

--------------8CEFE14899413C464B8D4960
Content-Type: text/x-patch;
 name="QSlider_sizes_issues.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="QSlider_sizes_issues.patch"

From f7e1fcd11f88e0f7bc256c758c6f70c1e621fd1d Mon Sep 17 00:00:00 2001
From: Boris Barbulovski <bbarbulovski@gmail.com>
Date: Mon, 17 Oct 2016 20:33:10 +0200
Subject: [PATCH] qconfig initial slider sizes fix.

On first `make xconfig`, suboption and help panels were hidden.

Now we properly detect the first run, and show those panels.
---
 scripts/kconfig/qconf.cc |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

--- lnx-48.orig/scripts/kconfig/qconf.cc
+++ lnx-48/scripts/kconfig/qconf.cc
@@ -1291,6 +1291,8 @@ ConfigSearchWindow::ConfigSearchWindow(C
 		QList<int> sizes = configSettings->readSizes("/split", &ok);
 		if (ok)
 			split->setSizes(sizes);
+		else
+			split->setSizes(QList<int>() << 1 << 1);
 		configSettings->endGroup();
 		connect(configApp, SIGNAL(aboutToQuit()), SLOT(saveSettings()));
 	}
@@ -1511,12 +1513,17 @@ ConfigMainWindow::ConfigMainWindow(void)
 
 	// UI setup done, restore splitter positions
 	QList<int> sizes = configSettings->readSizes("/split1", &ok);
-	if (ok)
+	if ((ok)&&(sizes.length() == 2))
 		split1->setSizes(sizes);
+	else
+		split1->setSizes(QList<int>() << 1 << 1);
+
 
 	sizes = configSettings->readSizes("/split2", &ok);
-	if (ok)
+	if ((ok)&&(sizes.length() == 2))
 		split2->setSizes(sizes);
+	else
+		split2->setSizes(QList<int>() << 1 << 1);
 }
 
 void ConfigMainWindow::loadConfig(void)

--------------8CEFE14899413C464B8D4960--
