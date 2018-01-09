Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:27300 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751150AbeAIIb7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jan 2018 03:31:59 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/6] fixdep: move global variables to local variables of main()
Date: Tue,  9 Jan 2018 17:30:48 +0900
Message-Id: <1515486650-1141-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1515486650-1141-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515486650-1141-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

I do not mind global variables where they are useful enough.  In this
case, I do not see a good reason to use global variables since they
are just referenced in shallow places.  It is easy to pass them via
function arguments.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/basic/fixdep.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index bc2364e..bb6d2da 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -114,11 +114,6 @@
 #include <ctype.h>
 #include <arpa/inet.h>
 
-int insert_extra_deps;
-char *target;
-char *depfile;
-char *cmdline;
-
 static void usage(void)
 {
 	fprintf(stderr, "Usage: fixdep [-e] <depfile> <target> <cmdline>\n");
@@ -129,7 +124,7 @@ static void usage(void)
 /*
  * Print out the commandline prefixed with cmd_<target filename> :=
  */
-static void print_cmdline(void)
+static void print_cmdline(const char *target, const char *cmdline)
 {
 	printf("cmd_%s := %s\n\n", target, cmdline);
 }
@@ -155,16 +150,16 @@ static void print_config(const char *m, int slen)
 
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
 
@@ -303,7 +298,7 @@ static void *load_file(const char *filename)
  * assignments are parsed not only by make, but also by the rather simple
  * parser in scripts/mod/sumversion.c.
  */
-static void parse_dep_file(char *m)
+static void parse_dep_file(char *m, const char *target, int insert_extra_deps)
 {
 	char *p;
 	int is_last, is_target;
@@ -388,7 +383,8 @@ static void parse_dep_file(char *m)
 		exit(1);
 	}
 
-	do_extra_deps();
+	if (insert_extra_deps)
+		do_extra_deps();
 
 	printf("\n%s: $(deps_%s)\n\n", target, target);
 	printf("$(deps_%s):\n", target);
@@ -396,6 +392,8 @@ static void parse_dep_file(char *m)
 
 int main(int argc, char *argv[])
 {
+	const char *depfile, *target, *cmdline;
+	int insert_extra_deps = 0;
 	void *buf;
 
 	if (argc == 5 && !strcmp(argv[1], "-e")) {
@@ -408,10 +406,10 @@ int main(int argc, char *argv[])
 	target = argv[2];
 	cmdline = argv[3];
 
-	print_cmdline();
+	print_cmdline(target, cmdline);
 
 	buf = load_file(depfile);
-	parse_dep_file(buf);
+	parse_dep_file(buf, target, insert_extra_deps);
 	free(buf);
 
 	return 0;
-- 
2.7.4

