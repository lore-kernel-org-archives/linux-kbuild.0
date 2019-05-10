Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:49769 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfEJGNP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 02:13:15 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kconfig: do not accept a directory for configuration output
Date: Fri, 10 May 2019 15:12:04 +0900
Message-Id: <20190510061205.28753-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, Ulf Magnusson <ulfalizer@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Joel Fernandes <joel@joelfernandes.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Nicolas Porcel <nicolasporcel06@gmail.com>, linux-kernel@vger.kernel.org

Currently, conf_write() can be called with a directory name instead
of a file name. As far as I see, this can happen for menuconfig,
nconfig, gconfig.

If it is given with a directory path, conf_write() kindly appends
getenv("KCONFIG_CONFIG"), but this ends up with hacky dir/basename
handling, and screwed up with a corner-case like "what if
KCONFIG_CONFIG is an absolute path?" as discussed before:

  https://patchwork.kernel.org/patch/9910037/

Since conf_write() is already messed up, I'd say "do not do it".
Please pass a file path all the time. If a directory path is specified
for the configuration output, conf_write() will simply error out.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nicolas Porcel <nicolasporcel06@gmail.com>
---

 scripts/kconfig/confdata.c | 58 ++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 34 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 08ba146a83c5..9fd6430c93d2 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -817,40 +817,31 @@ int conf_write(const char *name)
 	FILE *out;
 	struct symbol *sym;
 	struct menu *menu;
-	const char *basename;
 	const char *str;
-	char dirname[PATH_MAX+1], tmpname[PATH_MAX+22], newname[PATH_MAX+8];
+	char tmpname[PATH_MAX + 1], oldname[PATH_MAX + 1];
 	char *env;
 
-	dirname[0] = 0;
-	if (name && name[0]) {
-		char *slash;
-
-		if (is_dir(name)) {
-			strcpy(dirname, name);
-			strcat(dirname, "/");
-			basename = conf_get_configname();
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
-	} else
-		basename = conf_get_configname();
-
-	sprintf(newname, "%s%s", dirname, basename);
+	if (!name)
+		name = conf_get_configname();
+
+	if (!*name) {
+		fprintf(stderr, "config name is empty\n");
+		return -1;
+	}
+
+	if (is_dir(name)) {
+		fprintf(stderr, "%s: Is a directory\n", name);
+		return -1;
+	}
+
 	env = getenv("KCONFIG_OVERWRITECONFIG");
-	if (!env || !*env) {
-		sprintf(tmpname, "%s.tmpconfig.%d", dirname, (int)getpid());
-		out = fopen(tmpname, "w");
-	} else {
+	if (env && *env) {
 		*tmpname = 0;
-		out = fopen(newname, "w");
+		out = fopen(name, "w");
+	} else {
+		snprintf(tmpname, sizeof(tmpname), "%s.%d.tmp",
+			 name, (int)getpid());
+		out = fopen(tmpname, "w");
 	}
 	if (!out)
 		return 1;
@@ -897,14 +888,13 @@ int conf_write(const char *name)
 	fclose(out);
 
 	if (*tmpname) {
-		strcat(dirname, basename);
-		strcat(dirname, ".old");
-		rename(newname, dirname);
-		if (rename(tmpname, newname))
+		snprintf(oldname, sizeof(oldname), "%s.old", name);
+		rename(name, oldname);
+		if (rename(tmpname, name))
 			return 1;
 	}
 
-	conf_message("configuration written to %s", newname);
+	conf_message("configuration written to %s", name);
 
 	sym_set_change_count(0);
 
-- 
2.17.1
