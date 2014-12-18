Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from exchange07.timesys.com ([209.114.137.116]:16000 "EHLO
	exchange07.timesys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751023AbaLRSNt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Dec 2014 13:13:49 -0500
From: Andy Voltz <andy.voltz@timesys.com>
Subject: [PATCH] kconfig: allow KCONFIG_CONFIG environment to be full path
Date: Thu, 18 Dec 2014 13:07:52 -0500
Message-ID: <1418926072-10014-2-git-send-email-andy.voltz@timesys.com>
In-Reply-To: <1418926072-10014-1-git-send-email-andy.voltz@timesys.com>
References: <1418926072-10014-1-git-send-email-andy.voltz@timesys.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andy Voltz <andy.voltz@timesys.com>

When no name arg is passed to conf_write, the .tmpconfig file used to
prepare a new config is created in the working dir. If KCONFIG_CONFIG
specifies a path which is not on the same volume, the rename fails
with 'Invalid cross-device link'.

This change determines the dir passed in KCONFIG_CONFIG, and uses it
as the location for the tmpconfig.

Signed-off-by: Andy Voltz <andy.voltz@timesys.com>
---
 scripts/kconfig/confdata.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index f88d90f..072838b 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -743,26 +743,26 @@ int conf_write(const char *name)
 	char *env;
 
 	dirname[0] = 0;
-	if (name && name[0]) {
-		struct stat st;
-		char *slash;
+	if (!name)
+		name = conf_get_configname();
+
+	struct stat st;
+	char *slash;
 
-		if (!stat(name, &st) && S_ISDIR(st.st_mode)) {
-			strcpy(dirname, name);
-			strcat(dirname, "/");
+	if (!stat(name, &st) && S_ISDIR(st.st_mode)) {
+		strcpy(dirname, name);
+		strcat(dirname, "/");
+		basename = conf_get_configname();
+	} else if ((slash = strrchr(name, '/'))) {
+		int size = slash - name + 1;
+		memcpy(dirname, name, size);
+		dirname[size] = 0;
+		if (slash[1])
+			basename = slash + 1;
+		else
 			basename = conf_get_configname();
-		} else if ((slash = strrchr(name, '/'))) {
-			int size = slash - name + 1;
-			memcpy(dirname, name, size);
-			dirname[size] = 0;
-			if (slash[1])
-				basename = slash + 1;
-			else
-				basename = conf_get_configname();
-		} else
-			basename = name;
 	} else
-		basename = conf_get_configname();
+		basename = name;
 
 	sprintf(newname, "%s%s", dirname, basename);
 	env = getenv("KCONFIG_OVERWRITECONFIG");
-- 
2.1.3

