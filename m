Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:60598 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934064AbeAKNG1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jan 2018 08:06:27 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 3/7] fixdep: factor out common code for reading files
Date: Thu, 11 Jan 2018 22:05:42 +0900
Message-Id: <1515675946-7514-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1515675946-7514-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515675946-7514-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Now, do_config_files() and print_deps() are almost the same.  Only
the difference is the parser function called (parse_config_file vs
parse_dep_file).

We can reduce the code duplication by factoring out the common code
into read_file() - this function allocates a buffer and loads a file
to it.  It returns the pointer to the allocated buffer.  (As before,
it bails out by exit(2) for any error.)  The caller must free the
buffer when done.

Having empty source files is possible; fixdep should simply skip them.
I deleted the "st.st_size == 0" check, so read_file() allocates 1-byte
buffer for an empty file.  strstr() will immediately return NULL, and
this is what we expect.

On the other hand, an empty dep_file should be treated as an error.
In this case, parse_dep_file() will error out with "no targets found"
and it is a correct error message.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - rename load_file to read_file

 scripts/basic/fixdep.c | 75 ++++++++++++++------------------------------------
 1 file changed, 20 insertions(+), 55 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 91bb4c1..9f9238e 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -264,42 +264,36 @@ static int strrcmp(const char *s, const char *sub)
 	return memcmp(s + slen - sublen, sub, sublen);
 }
 
-static void do_config_file(const char *filename)
+static void *read_file(const char *filename)
 {
 	struct stat st;
 	int fd;
-	char *map;
+	char *buf;
 
 	fd = open(filename, O_RDONLY);
 	if (fd < 0) {
-		fprintf(stderr, "fixdep: error opening config file: ");
+		fprintf(stderr, "fixdep: error opening file: ");
 		perror(filename);
 		exit(2);
 	}
 	if (fstat(fd, &st) < 0) {
-		fprintf(stderr, "fixdep: error fstat'ing config file: ");
+		fprintf(stderr, "fixdep: error fstat'ing file: ");
 		perror(filename);
 		exit(2);
 	}
-	if (st.st_size == 0) {
-		close(fd);
-		return;
-	}
-	map = malloc(st.st_size + 1);
-	if (!map) {
+	buf = malloc(st.st_size + 1);
+	if (!buf) {
 		perror("fixdep: malloc");
 		exit(2);
 	}
-	if (read(fd, map, st.st_size) != st.st_size) {
+	if (read(fd, buf, st.st_size) != st.st_size) {
 		perror("fixdep: read");
 		exit(2);
 	}
-	map[st.st_size] = '\0';
+	buf[st.st_size] = '\0';
 	close(fd);
 
-	parse_config_file(map);
-
-	free(map);
+	return buf;
 }
 
 /*
@@ -314,6 +308,7 @@ static void parse_dep_file(char *m)
 	int is_last, is_target;
 	int saw_any_target = 0;
 	int is_first_dep = 0;
+	void *buf;
 
 	while (1) {
 		/* Skip any "white space" */
@@ -372,7 +367,10 @@ static void parse_dep_file(char *m)
 					is_first_dep = 0;
 				} else
 					printf("  %s \\\n", s);
-				do_config_file(s);
+
+				buf = read_file(s);
+				parse_config_file(buf);
+				free(buf);
 			}
 		}
 
@@ -397,46 +395,10 @@ static void parse_dep_file(char *m)
 	printf("$(deps_%s):\n", target);
 }
 
-static void print_deps(const char *filename)
-{
-	struct stat st;
-	int fd;
-	char *buf;
-
-	fd = open(filename, O_RDONLY);
-	if (fd < 0) {
-		fprintf(stderr, "fixdep: error opening depfile: ");
-		perror(filename);
-		exit(2);
-	}
-	if (fstat(fd, &st) < 0) {
-		fprintf(stderr, "fixdep: error fstat'ing depfile: ");
-		perror(filename);
-		exit(2);
-	}
-	if (st.st_size == 0) {
-		close(fd);
-		return;
-	}
-	buf = malloc(st.st_size + 1);
-	if (!buf) {
-		perror("fixdep: malloc");
-		exit(2);
-	}
-	if (read(fd, buf, st.st_size) != st.st_size) {
-		perror("fixdep: read");
-		exit(2);
-	}
-	buf[st.st_size] = '\0';
-	close(fd);
-
-	parse_dep_file(buf);
-
-	free(buf);
-}
-
 int main(int argc, char *argv[])
 {
+	void *buf;
+
 	if (argc == 5 && !strcmp(argv[1], "-e")) {
 		insert_extra_deps = 1;
 		argv++;
@@ -448,7 +410,10 @@ int main(int argc, char *argv[])
 	cmdline = argv[3];
 
 	print_cmdline();
-	print_deps(depfile);
+
+	buf = read_file(depfile);
+	parse_dep_file(buf);
+	free(buf);
 
 	return 0;
 }
-- 
2.7.4

