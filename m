Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:60734 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932665AbeAKNGc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jan 2018 08:06:32 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 4/7] fixdep: remove unneeded memcpy() in parse_dep_file()
Date: Thu, 11 Jan 2018 22:05:43 +0900
Message-Id: <1515675946-7514-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1515675946-7514-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515675946-7514-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Each token in the depfile is copied to the temporary buffer 's' to
terminate the token with zero.  We do not need to do this any more
because the parsed buffer is now writable.  Insert '\0' directly in
the buffer without calling memcpy().

<limits.h> is no longer necessary. (It was needed for PATH_MAX).

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/basic/fixdep.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 9f9238e..dfba77b 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -109,7 +109,6 @@
 #include <string.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include <limits.h>
 #include <ctype.h>
 
 int insert_extra_deps;
@@ -304,7 +303,6 @@ static void *read_file(const char *filename)
 static void parse_dep_file(char *m)
 {
 	char *p;
-	char s[PATH_MAX];
 	int is_last, is_target;
 	int saw_any_target = 0;
 	int is_first_dep = 0;
@@ -330,16 +328,14 @@ static void parse_dep_file(char *m)
 			/* The /next/ file is the first dependency */
 			is_first_dep = 1;
 		} else {
-			/* Save this token/filename */
-			memcpy(s, m, p-m);
-			s[p - m] = 0;
+			*p = '\0';
 
 			/* Ignore certain dependencies */
-			if (strrcmp(s, "include/generated/autoconf.h") &&
-			    strrcmp(s, "include/generated/autoksyms.h") &&
-			    strrcmp(s, "arch/um/include/uml-config.h") &&
-			    strrcmp(s, "include/linux/kconfig.h") &&
-			    strrcmp(s, ".ver")) {
+			if (strrcmp(m, "include/generated/autoconf.h") &&
+			    strrcmp(m, "include/generated/autoksyms.h") &&
+			    strrcmp(m, "arch/um/include/uml-config.h") &&
+			    strrcmp(m, "include/linux/kconfig.h") &&
+			    strrcmp(m, ".ver")) {
 				/*
 				 * Do not list the source file as dependency,
 				 * so that kbuild is not confused if a .c file
@@ -360,15 +356,15 @@ static void parse_dep_file(char *m)
 					if (!saw_any_target) {
 						saw_any_target = 1;
 						printf("source_%s := %s\n\n",
-							target, s);
+							target, m);
 						printf("deps_%s := \\\n",
 							target);
 					}
 					is_first_dep = 0;
 				} else
-					printf("  %s \\\n", s);
+					printf("  %s \\\n", m);
 
-				buf = read_file(s);
+				buf = read_file(m);
 				parse_config_file(buf);
 				free(buf);
 			}
-- 
2.7.4

