Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:16373 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755219AbcB2DsW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 28 Feb 2016 22:48:22 -0500
Content-transfer-encoding: 7BIT
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v4 3/8] fixdep: accept extra dependencies on stdin
Date: Sun, 28 Feb 2016 22:48:06 -0500
Message-id: <1456717691-28298-4-git-send-email-nicolas.pitre@linaro.org>
In-reply-to: <1456717691-28298-1-git-send-email-nicolas.pitre@linaro.org>
References: <1456717691-28298-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

... and merge them in the list of parsed dependencies.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
---
 scripts/basic/fixdep.c | 60 +++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 15 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 5b327c67a8..d984deb120 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -120,13 +120,15 @@
 #define INT_NFIG ntohl(0x4e464947)
 #define INT_FIG_ ntohl(0x4649475f)
 
+int insert_extra_deps;
 char *target;
 char *depfile;
 char *cmdline;
 
 static void usage(void)
 {
-	fprintf(stderr, "Usage: fixdep <depfile> <target> <cmdline>\n");
+	fprintf(stderr, "Usage: fixdep [-e] <depfile> <target> <cmdline>\n");
+	fprintf(stderr, " -e  insert extra dependencies given on stdin\n");
 	exit(1);
 }
 
@@ -138,6 +140,40 @@ static void print_cmdline(void)
 	printf("cmd_%s := %s\n\n", target, cmdline);
 }
 
+/*
+ * Print out a dependency path from a symbol name
+ */
+static void print_config(const char *m, int slen)
+{
+	int c, i;
+
+	printf("    $(wildcard include/config/");
+	for (i = 0; i < slen; i++) {
+		c = m[i];
+		if (c == '_')
+			c = '/';
+		else
+			c = tolower(c);
+		putchar(c);
+	}
+	printf(".h) \\\n");
+}
+
+static void do_extra_deps(void)
+{
+	if (insert_extra_deps) {
+		char buf[80];
+		while(fgets(buf, sizeof(buf), stdin)) {
+			int len = strlen(buf);
+			if (len < 2 || buf[len-1] != '\n') {
+				fprintf(stderr, "fixdep: bad data on stdin\n");
+				exit(1);
+			}
+			print_config(buf, len-1);
+		}
+	}
+}
+
 struct item {
 	struct item	*next;
 	unsigned int	len;
@@ -197,23 +233,12 @@ static void define_config(const char *name, int len, unsigned int hash)
 static void use_config(const char *m, int slen)
 {
 	unsigned int hash = strhash(m, slen);
-	int c, i;
 
 	if (is_defined_config(m, slen, hash))
 	    return;
 
 	define_config(m, slen, hash);
-
-	printf("    $(wildcard include/config/");
-	for (i = 0; i < slen; i++) {
-		c = m[i];
-		if (c == '_')
-			c = '/';
-		else
-			c = tolower(c);
-		putchar(c);
-	}
-	printf(".h) \\\n");
+	print_config(m, slen);
 }
 
 static void parse_config_file(const char *map, size_t len)
@@ -250,7 +275,7 @@ static void parse_config_file(const char *map, size_t len)
 	}
 }
 
-/* test is s ends in sub */
+/* test if s ends in sub */
 static int strrcmp(const char *s, const char *sub)
 {
 	int slen = strlen(s);
@@ -374,6 +399,8 @@ static void parse_dep_file(void *map, size_t len)
 		exit(1);
 	}
 
+	do_extra_deps();
+
 	printf("\n%s: $(deps_%s)\n\n", target, target);
 	printf("$(deps_%s):\n", target);
 }
@@ -430,7 +457,10 @@ int main(int argc, char *argv[])
 {
 	traps();
 
-	if (argc != 4)
+	if (argc == 5 && !strcmp(argv[1], "-e")) {
+		insert_extra_deps = 1;
+		argv++;
+	} else if (argc != 4)
 		usage();
 
 	depfile = argv[1];
-- 
2.5.0

