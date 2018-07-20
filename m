Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:28748 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727751AbeGTIfJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jul 2018 04:35:09 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4 02/11] kconfig: split out useful helpers in confdata.c
Date: Fri, 20 Jul 2018 16:46:27 +0900
Message-Id: <1532072796-7947-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1532072796-7947-1-git-send-email-yamada.masahiro@socionext.com>
References: <1532072796-7947-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Split out helpers:
 is_present() - check if the given path exists
 is_dir() - check if the given path exists and it is a directory
 make_parent_dir() - create the parent directories of the given path

These helpers will be reused in later commits.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4:
  - Rename mkdir_p() to make_parent_dir() for clarification
  - Add is_present() instead of is_file()

 scripts/kconfig/confdata.c | 81 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 64 insertions(+), 17 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 4771820..f9c5ad4 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -16,6 +16,64 @@
 
 #include "lkc.h"
 
+/* return true if 'path' exists, false otherwise */
+static bool is_present(const char *path)
+{
+	struct stat st;
+
+	return !stat(path, &st);
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
+ */
+static int make_parent_dir(const char *path)
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
@@ -83,7 +141,6 @@ const char *conf_get_autoconfig_name(void)
 
 char *conf_get_default_confname(void)
 {
-	struct stat buf;
 	static char fullname[PATH_MAX+1];
 	char *env, *name;
 
@@ -91,7 +148,7 @@ char *conf_get_default_confname(void)
 	env = getenv(SRCTREE);
 	if (env) {
 		sprintf(fullname, "%s/%s", env, name);
-		if (!stat(fullname, &buf))
+		if (is_present(fullname))
 			return fullname;
 	}
 	return name;
@@ -725,10 +782,9 @@ int conf_write(const char *name)
 
 	dirname[0] = 0;
 	if (name && name[0]) {
-		struct stat st;
 		char *slash;
 
-		if (!stat(name, &st) && S_ISDIR(st.st_mode)) {
+		if (is_dir(name)) {
 			strcpy(dirname, name);
 			strcat(dirname, "/");
 			basename = conf_get_configname();
@@ -848,7 +904,6 @@ static int conf_split_config(void)
 	char path[PATH_MAX+1];
 	char *s, *d, c;
 	struct symbol *sym;
-	struct stat sb;
 	int res, i, fd;
 
 	name = conf_get_autoconfig_name();
@@ -926,18 +981,10 @@ static int conf_split_config(void)
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
+			if (make_parent_dir(path)) {
+				res = 1;
+				goto out;
 			}
 			/* Try it again. */
 			fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0644);
-- 
2.7.4

