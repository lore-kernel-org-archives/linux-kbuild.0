Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f173.google.com ([209.85.208.173]:37471 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729287AbeHORUa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Aug 2018 13:20:30 -0400
Received: by mail-lj1-f173.google.com with SMTP id v9-v6so1105946ljk.4
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Aug 2018 07:28:06 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 3/3] Kbuild: let fixdep do the renaming to .cmd
Date: Wed, 15 Aug 2018 16:27:49 +0200
Message-Id: <20180815142749.18804-4-linux@rasmusvillemoes.dk>
In-Reply-To: <20180815142749.18804-1-linux@rasmusvillemoes.dk>
References: <20180815142749.18804-1-linux@rasmusvillemoes.dk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org

Avoid spawning one more process per TU by having fixdep open the tmpfile
and rename to its final name.

The only change in behaviour is that if fixdep fails, the tmpfile we
leave behind is $(dot-target).cmd.tmp rather than $(dot-target).tmp .

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 scripts/Kbuild.include | 10 ++++------
 scripts/basic/fixdep.c | 31 +++++++++++++++++++++++++++++--
 2 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index a944510acd9d..ded089436a3f 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -274,9 +274,8 @@ ifndef CONFIG_TRIM_UNUSED_KSYMS
 
 cmd_and_fixdep =                                                             \
 	$(echo-cmd) $(cmd_$(1));                                             \
-	scripts/basic/fixdep -r $(depfile) $@ '$(make-cmd)'                  \
-		> $(dot-target).tmp;                                         \
-	mv -f $(dot-target).tmp $(dot-target).cmd;
+	scripts/basic/fixdep -r -o $(dot-target).cmd                         \
+		$(depfile) $@ '$(make-cmd)';
 
 else
 
@@ -298,9 +297,8 @@ ksym_dep_filter =                                                            \
 cmd_and_fixdep =                                                             \
 	$(echo-cmd) $(cmd_$(1));                                             \
 	$(ksym_dep_filter) |                                                 \
-		scripts/basic/fixdep -e -r $(depfile) $@ '$(make-cmd)'       \
-			> $(dot-target).tmp;	                             \
-	mv -f $(dot-target).tmp $(dot-target).cmd;
+		scripts/basic/fixdep -e -r -o $(dot-target).cmd              \
+			$(depfile) $@ '$(make-cmd)';
 
 endif
 
diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 7b59c185858a..78985052a3c7 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -94,6 +94,7 @@
  *  but I don't think the added complexity is worth it)
  */
 
+#define _GNU_SOURCE
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <unistd.h>
@@ -105,9 +106,10 @@
 
 static void usage(void)
 {
-	fprintf(stderr, "Usage: fixdep [-e] [-r] <depfile> <target> <cmdline>\n");
+	fprintf(stderr, "Usage: fixdep [-e] [-r] [-o <output>] <depfile> <target> <cmdline>\n");
 	fprintf(stderr, " -e  insert extra dependencies given on stdin\n");
 	fprintf(stderr, " -r  remove <depfile> after processing\n");
+	fprintf(stderr, " -o  write to <output> instead of stdout\n");
 	exit(1);
 }
 
@@ -380,15 +382,17 @@ static void parse_dep_file(char *m, const char *target, int insert_extra_deps)
 int main(int argc, char *argv[])
 {
 	const char *depfile, *target, *cmdline;
+	char *outfile = NULL, *tmpfile;
 	int insert_extra_deps = 0;
 	int remove_depfile = 0;
 	void *buf;
 	int opt;
 
-	while ((opt = getopt(argc, argv, "er")) != -1) {
+	while ((opt = getopt(argc, argv, "ero:")) != -1) {
 		switch (opt) {
 		case 'e': insert_extra_deps = 1; break;
 		case 'r': remove_depfile = 1; break;
+		case 'o': outfile = optarg; break;
 		default: usage();
 		}
 	}
@@ -402,12 +406,35 @@ int main(int argc, char *argv[])
 	target = argv[1];
 	cmdline = argv[2];
 
+	if (outfile) {
+		if (asprintf(&tmpfile, "%s.tmp", outfile) < 0) {
+			perror("fixdep:asprintf");
+			exit(1);
+		}
+		if (freopen(tmpfile, "w", stdout) == NULL) {
+			perror("fixdep:freopen");
+			exit(1);
+		}
+	}
+
 	printf("cmd_%s := %s\n\n", target, cmdline);
 
 	buf = read_file(depfile);
 	parse_dep_file(buf, target, insert_extra_deps);
 	free(buf);
 
+	if (fclose(stdout)) {
+		perror("fixdep:fclose");
+		exit(1);
+	}
+	if (outfile) {
+		if (rename(tmpfile, outfile) < 0) {
+			perror("fixdep:rename");
+			exit(1);
+		}
+		free(tmpfile);
+	}
+
 	if (remove_depfile)
 		unlink(depfile);
 
-- 
2.16.4
