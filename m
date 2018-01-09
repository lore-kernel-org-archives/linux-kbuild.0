Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:27464 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751127AbeAIIcD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jan 2018 03:32:03 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/6] fixdep: remove unneeded memcpy() in parse_dep_file()
Date: Tue,  9 Jan 2018 17:30:47 +0900
Message-Id: <1515486650-1141-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1515486650-1141-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515486650-1141-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Each token in the depfile is copied to the temporary buffer 's' to
terminate the token with zero.  We do not need to do this any more
because the parsed buffer is now writable.  Insert '\0' directly in
the buffer without calling memcpy().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/basic/fixdep.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index f954f226..bc2364e 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -306,7 +306,6 @@ static void *load_file(const char *filename)
 static void parse_dep_file(char *m)
 {
 	char *p;
-	char s[PATH_MAX];
 	int is_last, is_target;
 	int saw_any_target = 0;
 	int is_first_dep = 0;
@@ -332,16 +331,14 @@ static void parse_dep_file(char *m)
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
@@ -362,15 +359,15 @@ static void parse_dep_file(char *m)
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
 
-				buf = load_file(s);
+				buf = load_file(m);
 				parse_config_file(buf);
 				free(buf);
 			}
-- 
2.7.4

