Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:43890 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753105AbeGEClg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jul 2018 22:41:36 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 01/12] kconfig: rename file_write_dep and move it to confdata.c
Date: Thu,  5 Jul 2018 11:39:38 +0900
Message-Id: <1530758389-30862-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1530758389-30862-1-git-send-email-yamada.masahiro@socionext.com>
References: <1530758389-30862-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

file_write_dep() is called only from conf_write_autoconf().
Move it from util.c to confdata.c to make it static.
Also, rename it to conf_write_dep() since it should belong to
the group of conf_write* functions.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/confdata.c | 31 ++++++++++++++++++++++++++++++-
 scripts/kconfig/lkc.h      |  1 -
 scripts/kconfig/util.c     | 30 ------------------------------
 3 files changed, 30 insertions(+), 32 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 39e2097..4771820 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -813,6 +813,35 @@ int conf_write(const char *name)
 	return 0;
 }
 
+/* write a dependency file as used by kbuild to track dependencies */
+static int conf_write_dep(const char *name)
+{
+	struct file *file;
+	FILE *out;
+
+	if (!name)
+		name = ".kconfig.d";
+	out = fopen("..config.tmp", "w");
+	if (!out)
+		return 1;
+	fprintf(out, "deps_config := \\\n");
+	for (file = file_list; file; file = file->next) {
+		if (file->next)
+			fprintf(out, "\t%s \\\n", file->name);
+		else
+			fprintf(out, "\t%s\n", file->name);
+	}
+	fprintf(out, "\n%s: \\\n"
+		     "\t$(deps_config)\n\n", conf_get_autoconfig_name());
+
+	env_write_dep(out, conf_get_autoconfig_name());
+
+	fprintf(out, "\n$(deps_config): ;\n");
+	fclose(out);
+	rename("..config.tmp", name);
+	return 0;
+}
+
 static int conf_split_config(void)
 {
 	const char *name;
@@ -935,7 +964,7 @@ int conf_write_autoconf(void)
 
 	sym_clear_all_valid();
 
-	file_write_dep("include/config/auto.conf.cmd");
+	conf_write_dep("include/config/auto.conf.cmd");
 
 	if (conf_split_config())
 		return 1;
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index ed3ff88..6b7bbc6 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -97,7 +97,6 @@ void menu_set_type(int type);
 
 /* util.c */
 struct file *file_lookup(const char *name);
-int file_write_dep(const char *name);
 void *xmalloc(size_t size);
 void *xcalloc(size_t nmemb, size_t size);
 void *xrealloc(void *p, size_t size);
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index a365594..d999683 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -29,36 +29,6 @@ struct file *file_lookup(const char *name)
 	return file;
 }
 
-/* write a dependency file as used by kbuild to track dependencies */
-int file_write_dep(const char *name)
-{
-	struct file *file;
-	FILE *out;
-
-	if (!name)
-		name = ".kconfig.d";
-	out = fopen("..config.tmp", "w");
-	if (!out)
-		return 1;
-	fprintf(out, "deps_config := \\\n");
-	for (file = file_list; file; file = file->next) {
-		if (file->next)
-			fprintf(out, "\t%s \\\n", file->name);
-		else
-			fprintf(out, "\t%s\n", file->name);
-	}
-	fprintf(out, "\n%s: \\\n"
-		     "\t$(deps_config)\n\n", conf_get_autoconfig_name());
-
-	env_write_dep(out, conf_get_autoconfig_name());
-
-	fprintf(out, "\n$(deps_config): ;\n");
-	fclose(out);
-	rename("..config.tmp", name);
-	return 0;
-}
-
-
 /* Allocate initial growable string */
 struct gstr str_new(void)
 {
-- 
2.7.4

