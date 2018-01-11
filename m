Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:60595 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934059AbeAKNG1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jan 2018 08:06:27 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 5/7] fixdep: move global variables to local variables of main()
Date: Thu, 11 Jan 2018 22:05:44 +0900
Message-Id: <1515675946-7514-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1515675946-7514-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515675946-7514-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

I do not mind global variables where they are useful enough.  In this
case, I do not see a good reason to use global variables since they
are just referenced in shallow places.  It is easy to pass them via
function arguments.

I squashed print_cmdline() into main() since it is just one line code.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Squash print_cmdline() into main()

 scripts/basic/fixdep.c | 42 ++++++++++++++++--------------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index dfba77b..d33b5a4 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -111,11 +111,6 @@
 #include <stdio.h>
 #include <ctype.h>
 
-int insert_extra_deps;
-char *target;
-char *depfile;
-char *cmdline;
-
 static void usage(void)
 {
 	fprintf(stderr, "Usage: fixdep [-e] <depfile> <target> <cmdline>\n");
@@ -124,14 +119,6 @@ static void usage(void)
 }
 
 /*
- * Print out the commandline prefixed with cmd_<target filename> :=
- */
-static void print_cmdline(void)
-{
-	printf("cmd_%s := %s\n\n", target, cmdline);
-}
-
-/*
  * Print out a dependency path from a symbol name
  */
 static void print_config(const char *m, int slen)
@@ -152,16 +139,16 @@ static void print_config(const char *m, int slen)
 
 static void do_extra_deps(void)
 {
-	if (insert_extra_deps) {
-		char buf[80];
-		while(fgets(buf, sizeof(buf), stdin)) {
-			int len = strlen(buf);
-			if (len < 2 || buf[len-1] != '\n') {
-				fprintf(stderr, "fixdep: bad data on stdin\n");
-				exit(1);
-			}
-			print_config(buf, len-1);
+	char buf[80];
+
+	while (fgets(buf, sizeof(buf), stdin)) {
+		int len = strlen(buf);
+
+		if (len < 2 || buf[len - 1] != '\n') {
+			fprintf(stderr, "fixdep: bad data on stdin\n");
+			exit(1);
 		}
+		print_config(buf, len - 1);
 	}
 }
 
@@ -300,7 +287,7 @@ static void *read_file(const char *filename)
  * assignments are parsed not only by make, but also by the rather simple
  * parser in scripts/mod/sumversion.c.
  */
-static void parse_dep_file(char *m)
+static void parse_dep_file(char *m, const char *target, int insert_extra_deps)
 {
 	char *p;
 	int is_last, is_target;
@@ -385,7 +372,8 @@ static void parse_dep_file(char *m)
 		exit(1);
 	}
 
-	do_extra_deps();
+	if (insert_extra_deps)
+		do_extra_deps();
 
 	printf("\n%s: $(deps_%s)\n\n", target, target);
 	printf("$(deps_%s):\n", target);
@@ -393,6 +381,8 @@ static void parse_dep_file(char *m)
 
 int main(int argc, char *argv[])
 {
+	const char *depfile, *target, *cmdline;
+	int insert_extra_deps = 0;
 	void *buf;
 
 	if (argc == 5 && !strcmp(argv[1], "-e")) {
@@ -405,10 +395,10 @@ int main(int argc, char *argv[])
 	target = argv[2];
 	cmdline = argv[3];
 
-	print_cmdline();
+	printf("cmd_%s := %s\n\n", target, cmdline);
 
 	buf = read_file(depfile);
-	parse_dep_file(buf);
+	parse_dep_file(buf, target, insert_extra_deps);
 	free(buf);
 
 	return 0;
-- 
2.7.4

