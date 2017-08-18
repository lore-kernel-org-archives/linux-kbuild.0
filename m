Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:35751 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752167AbdHRWVn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Aug 2017 18:21:43 -0400
Received: by mail-wr0-f196.google.com with SMTP id p8so8332590wrf.2
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Aug 2017 15:21:43 -0700 (PDT)
From: Nicolas Porcel <nicolasporcel06@gmail.com>
Subject: [PATCH 2/2] kconfig: support out of tree KCONFIG_CONFIG
Date: Sat, 19 Aug 2017 00:20:52 +0200
Message-Id: <20170818222052.22375-3-nicolasporcel06@gmail.com>
In-Reply-To: <20170818222052.22375-1-nicolasporcel06@gmail.com>
References: <20170818222052.22375-1-nicolasporcel06@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicolas Porcel <nicolasporcel06@gmail.com>

If KCONFIG_CONFIG is on a different file system than the kernel source,
oldconfig/defconfig will fail due to the use of rename in conf_write. It
will also fail if the kernel source directory is not writable.

This patch changes the behavior of conf_write to be more intuitive.

When no argument is passed to conf_write, KCONFIG_CONFIG is used instead
for the config path. The consequence is that the .tmpconfig.%(pid) is
written in the same directory as KCONFIG_CONFIG.

Some defaulting logic has been added, allowing the use of a directory
for KCONFIG_CONFIG. In that case, the .config file will be written in
this directory.

Signed-off-by: Nicolas Porcel <nicolasporcel06@gmail.com>
---
 scripts/kconfig/confdata.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 297b079ae4d9..3c2b7155a385 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -743,32 +743,37 @@ int conf_write(const char *name)
 	FILE *out;
 	struct symbol *sym;
 	struct menu *menu;
+	struct stat st;
 	const char *basename;
 	const char *str;
 	char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1];
 	char *env;
+	char *slash;
+
+	const char *configname = conf_get_configname();
 
 	dirname[0] = 0;
-	if (name && name[0]) {
-		struct stat st;
-		char *slash;
-
-		if (!stat(name, &st) && S_ISDIR(st.st_mode)) {
-			strcpy(dirname, name);
-			strcat(dirname, "/");
-			basename = conf_get_configname();
-		} else if ((slash = strrchr(name, '/'))) {
+	if (!name || !name[0])
+		name = configname;
+
+	if (!stat(name, &st) && S_ISDIR(st.st_mode)) {
+		strcpy(dirname, name);
+		strcat(dirname, "/");
+		if (name == configname || strchr(configname, '/'))
+			basename =  ".config";
+		else
+			basename = configname;
+	} else {
+		slash = strrchr(name, '/');
+		if (slash) {
 			int size = slash - name + 1;
+
 			memcpy(dirname, name, size);
 			dirname[size] = 0;
-			if (slash[1])
-				basename = slash + 1;
-			else
-				basename = conf_get_configname();
+			basename = slash + 1;
 		} else
 			basename = name;
-	} else
-		basename = conf_get_configname();
+	}
 
 	sprintf(newname, "%s%s", dirname, basename);
 	env = getenv("KCONFIG_OVERWRITECONFIG");
-- 
2.14.1

