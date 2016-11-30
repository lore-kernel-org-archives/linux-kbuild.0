Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:46386 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755154AbcK3W56 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Nov 2016 17:57:58 -0500
Subject: [PATCH 2/2] xconfig: fix missing suboption and help panels on first
 run
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <83475b00-45f0-0140-d024-b946b4999087@infradead.org>
Date: Wed, 30 Nov 2016 14:57:55 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>
Cc: Jason Vas Dias <jason.vas.dias@gmail.com>, Boris Barbulovski <bbarbulovski@gmail.com>

From: Boris Barbulovski <bbarbulovski@gmail.com>

qconfig initial slider sizes fix.

On first `make xconfig`, suboption and help panels were hidden.
Now we properly detect the first run, and show those panels.

Reported-by: Jason Vas Dias <jason.vas.dias@gmail.com>
Signed-off-by: Boris Barbulovski <bbarbulovski@gmail.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
 scripts/kconfig/qconf.cc |   16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

Boris asked me to push these 2 patches.

--- lnx-49-rc7.orig/scripts/kconfig/qconf.cc
+++ lnx-49-rc7/scripts/kconfig/qconf.cc
@@ -65,11 +65,19 @@ ConfigSettings::ConfigSettings()
 QList<int> ConfigSettings::readSizes(const QString& key, bool *ok)
 {
 	QList<int> result;
-	QStringList entryList = value(key).toStringList();
-	QStringList::Iterator it;
 
-	for (it = entryList.begin(); it != entryList.end(); ++it)
-		result.push_back((*it).toInt());
+	if (contains(key))
+	{
+		QStringList entryList = value(key).toStringList();
+		QStringList::Iterator it;
+
+		for (it = entryList.begin(); it != entryList.end(); ++it)
+			result.push_back((*it).toInt());
+
+		*ok = true;
+	}
+	else
+		*ok = false;
 
 	return result;
 }
