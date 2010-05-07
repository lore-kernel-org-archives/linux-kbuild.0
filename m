Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([222.73.24.84]:62303 "EHLO song.cn.fujitsu.com"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1753018Ab0EGF4O (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 7 May 2010 01:56:14 -0400
Message-ID: <4BE3ABEC.1090307@cn.fujitsu.com>
Date: Fri, 07 May 2010 13:58:04 +0800
From: Li Zefan <lizf@cn.fujitsu.com>
MIME-Version: 1.0
Subject: [PATCH v2 7/8] xconfig: clean up
References: <4BE3AB91.80606@cn.fujitsu.com>
In-Reply-To: <4BE3AB91.80606@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

@ok is a pointer to a bool var, so we should check the value of
*ok. But actually we don't need to check it, so just remove the
if statement.

Signed-off-by: Li Zefan <lizf@cn.fujitsu.com>
---
 scripts/kconfig/qconf.cc |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 00c5150..47cdeae 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -58,11 +58,10 @@ QValueList<int> ConfigSettings::readSizes(const QString& key, bool *ok)
 {
 	QValueList<int> result;
 	QStringList entryList = readListEntry(key, ok);
-	if (ok) {
-		QStringList::Iterator it;
-		for (it = entryList.begin(); it != entryList.end(); ++it)
-			result.push_back((*it).toInt());
-	}
+	QStringList::Iterator it;
+
+	for (it = entryList.begin(); it != entryList.end(); ++it)
+		result.push_back((*it).toInt());
 
 	return result;
 }
-- 
1.6.3

