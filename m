Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:43647 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753154AbeGECl3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jul 2018 22:41:29 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 02/12] kconfig: split out helpers to check file/directory, create directory
Date: Thu,  5 Jul 2018 11:39:39 +0900
Message-Id: <1530758389-30862-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1530758389-30862-1-git-send-email-yamada.masahiro@socionext.com>
References: <1530758389-30862-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Split out helpers:
 is_file() - check if the given path exists and it is a regular file
 is_dir() - check if the given path exists and it is a directory
 mkdir_p() - create the parent directories of the given path

These helpers will be reused in later commits.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/confdata.c | 85 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 68 insertions(+), 17 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 4771820..881993e 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -16,6 +16,68 @@
 
 #include "lkc.h"
 
+/* return true if 'path' exists and it is a regular file, false otherwise */
+static bool is_file(const char *path)
+{
+	struct stat st;
+
+	if (stat(path, &st))
+		return 0;
+
+	return S_ISREG(st.st_mode);
+}
+
+/* return true if 'path' exists and it is a directory, false otherwise */
+static bool is_dir(const char *path)
+{
+	struct stat st;
+
+	if (stat(path, &st))
+		return 0;
+
+	return S_ISDIR(st.st_mode);
+}
+
+/*
+ * Create the parent directory of the given path.
+ *
+ * For example, if 'include/config/auto.conf' is given, create 'include/config'.
+ * If the path ends with '/' like 'include/config/', create 'include/config'.
+ */
+static int mkdir_p(const char *path)
+{
+	char tmp[PATH_MAX + 1];
+	char *p;
+
+	strncpy(tmp, path, sizeof(tmp));
+	tmp[sizeof(tmp) - 1] = 0;
+
+	/* Remove the base name. Just return if nothing is left */
+	p = strrchr(tmp, '/');
+	if (!p)
+		return 0;
+	*(p + 1) = 0;
+
+	/* Just in case it is an absolute path */
+	p = tmp;
+	while (*p == '/')
+		p++;
+
+	while ((p = strchr(p, '/'))) {
+		*p = 0;
+
+		/* skip if the directory exists */
+		if (!is_dir(tmp) && mkdir(tmp, 0755))
+			return -1;
+
+		*p = '/';
+		while (*p == '/')
+			p++;
+	}
+
+	return 0;
+}
+
 struct conf_printer {
 	void (*print_symbol)(FILE *, struct symbol *, const char *, void *);
 	void (*print_comment)(FILE *, const char *, void *);
@@ -83,7 +145,6 @@ const char *conf_get_autoconfig_name(void)
 
 char *conf_get_default_confname(void)
 {
-	struct stat buf;
 	static char fullname[PATH_MAX+1];
 	char *env, *name;
 
@@ -91,7 +152,7 @@ char *conf_get_default_confname(void)
 	env = getenv(SRCTREE);
 	if (env) {
 		sprintf(fullname, "%s/%s", env, name);
-		if (!stat(fullname, &buf))
+		if (is_file(fullname))
 			return fullname;
 	}
 	return name;
@@ -725,10 +786,9 @@ int conf_write(const char *name)
 
 	dirname[0] = 0;
 	if (name && name[0]) {
-		struct stat st;
 		char *slash;
 
-		if (!stat(name, &st) && S_ISDIR(st.st_mode)) {
+		if (is_dir(name)) {
 			strcpy(dirname, name);
 			strcat(dirname, "/");
 			basename = conf_get_configname();
@@ -848,7 +908,6 @@ static int conf_split_config(void)
 	char path[PATH_MAX+1];
 	char *s, *d, c;
 	struct symbol *sym;
-	struct stat sb;
 	int res, i, fd;
 
 	name = conf_get_autoconfig_name();
@@ -926,18 +985,10 @@ static int conf_split_config(void)
 				res = 1;
 				break;
 			}
-			/*
-			 * Create directory components,
-			 * unless they exist already.
-			 */
-			d = path;
-			while ((d = strchr(d, '/'))) {
-				*d = 0;
-				if (stat(path, &sb) && mkdir(path, 0755)) {
-					res = 1;
-					goto out;
-				}
-				*d++ = '/';
+
+			if (mkdir_p(path)) {
+				res = 1;
+				goto out;
 			}
 			/* Try it again. */
 			fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0644);
-- 
2.7.4

