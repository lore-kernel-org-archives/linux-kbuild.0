Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:27301 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750985AbeAIIb7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jan 2018 03:31:59 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 5/6] fixdep: refactor parse_dep_file()
Date: Tue,  9 Jan 2018 17:30:49 +0900
Message-Id: <1515486650-1141-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1515486650-1141-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515486650-1141-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

parse_dep_file() has too much indentation, and puts the code far to
the right.  This commit refactors the code and reduces the one level
of indentation.

strrcmp() computes 'slen' by itself, but the caller already knows the
length of the token, so 'slen' can be passed via function argument.
With this, we can swap the order of strrcmp() and "*p = \0;"

Also, strrcmp() is an ambiguous function name.  Flip the logic and
rename it to str_ends_with().

I added a new helper is_ignored_file() - this returns 1 if the token
represents a file that should be ignored.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/basic/fixdep.c | 80 +++++++++++++++++++++++++-------------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index bb6d2da..3881bf1 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -250,15 +250,14 @@ static void parse_config_file(const char *p)
 }
 
 /* test if s ends in sub */
-static int strrcmp(const char *s, const char *sub)
+static int str_ends_with(const char *s, int slen, const char *sub)
 {
-	int slen = strlen(s);
 	int sublen = strlen(sub);
 
 	if (sublen > slen)
-		return 1;
+		return 0;
 
-	return memcmp(s + slen - sublen, sub, sublen);
+	return !memcmp(s + slen - sublen, sub, sublen);
 }
 
 static void *load_file(const char *filename)
@@ -293,6 +292,16 @@ static void *load_file(const char *filename)
 	return buf;
 }
 
+/* Ignore certain dependencies */
+static int is_ignored_file(const char *s, int len)
+{
+	return str_ends_with(s, len, "include/generated/autoconf.h") ||
+	       str_ends_with(s, len, "include/generated/autoksyms.h") ||
+	       str_ends_with(s, len, "arch/um/include/uml-config.h") ||
+	       str_ends_with(s, len, "include/linux/kconfig.h") ||
+	       str_ends_with(s, len, ".ver");
+}
+
 /*
  * Important: The below generated source_foo.o and deps_foo.o variable
  * assignments are parsed not only by make, but also by the rather simple
@@ -325,47 +334,38 @@ static void parse_dep_file(char *m, const char *target, int insert_extra_deps)
 		if (is_target) {
 			/* The /next/ file is the first dependency */
 			is_first_dep = 1;
-		} else {
+		} else if (!is_ignored_file(m, p - m)) {
 			*p = '\0';
 
-			/* Ignore certain dependencies */
-			if (strrcmp(m, "include/generated/autoconf.h") &&
-			    strrcmp(m, "include/generated/autoksyms.h") &&
-			    strrcmp(m, "arch/um/include/uml-config.h") &&
-			    strrcmp(m, "include/linux/kconfig.h") &&
-			    strrcmp(m, ".ver")) {
+			/*
+			 * Do not list the source file as dependency, so that
+			 * kbuild is not confused if a .c file is rewritten
+			 * into .S or vice versa. Storing it in source_* is
+			 * needed for modpost to compute srcversions.
+			 */
+			if (is_first_dep) {
 				/*
-				 * Do not list the source file as dependency,
-				 * so that kbuild is not confused if a .c file
-				 * is rewritten into .S or vice versa. Storing
-				 * it in source_* is needed for modpost to
-				 * compute srcversions.
+				 * If processing the concatenation of multiple
+				 * dependency files, only process the first
+				 * target name, which will be the original
+				 * source name, and ignore any other target
+				 * names, which will be intermediate temporary
+				 * files.
 				 */
-				if (is_first_dep) {
-					/*
-					 * If processing the concatenation of
-					 * multiple dependency files, only
-					 * process the first target name, which
-					 * will be the original source name,
-					 * and ignore any other target names,
-					 * which will be intermediate temporary
-					 * files.
-					 */
-					if (!saw_any_target) {
-						saw_any_target = 1;
-						printf("source_%s := %s\n\n",
-							target, m);
-						printf("deps_%s := \\\n",
-							target);
-					}
-					is_first_dep = 0;
-				} else
-					printf("  %s \\\n", m);
-
-				buf = load_file(m);
-				parse_config_file(buf);
-				free(buf);
+				if (!saw_any_target) {
+					saw_any_target = 1;
+					printf("source_%s := %s\n\n",
+					       target, m);
+					printf("deps_%s := \\\n", target);
+				}
+				is_first_dep = 0;
+			} else {
+				printf("  %s \\\n", m);
 			}
+
+			buf = load_file(m);
+			parse_config_file(buf);
+			free(buf);
 		}
 
 		if (is_last)
-- 
2.7.4

