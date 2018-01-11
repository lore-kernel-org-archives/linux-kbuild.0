Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:60688 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934394AbeAKNGb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jan 2018 08:06:31 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 2/7] fixdep: use malloc() and read() to load dep_file to buffer
Date: Thu, 11 Jan 2018 22:05:41 +0900
Message-Id: <1515675946-7514-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1515675946-7514-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515675946-7514-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Commit dee81e988674 ("fixdep: faster CONFIG_ search") changed how to
read files in which CONFIG options are searched.  It used malloc()
and read() instead of mmap() because it needed to zero-terminate the
buffer in order to use strstr().  print_deps() was left untouched
since there was no reason to change it.

Now, I have two motivations to change it in the same way.

 - do_config_file() and print_deps() do quite similar things; they
   open a file, load it onto memory, and pass it to a parser function.
   If we use malloc() and read() for print_deps() too, we can factor
   out the common code.  (I will do this in the next commit.)

 - parse_dep_file() copies each token to a temporary buffer because
   it needs to zero-terminate it to be passed to printf().  It is not
   possible to modify the buffer directly because it is mmap'ed with
   O_RDONLY.  If we load the file content into a malloc'ed buffer, we
   can insert '\0' after each token, and save memcpy().  (I will do
   this in the commit after next.)

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Remove #include <sys/mman.h>

 scripts/basic/fixdep.c | 56 ++++++++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 24 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index b9b4bbf..91bb4c1 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -104,7 +104,6 @@
 
 #include <sys/types.h>
 #include <sys/stat.h>
-#include <sys/mman.h>
 #include <unistd.h>
 #include <fcntl.h>
 #include <string.h>
@@ -308,24 +307,27 @@ static void do_config_file(const char *filename)
  * assignments are parsed not only by make, but also by the rather simple
  * parser in scripts/mod/sumversion.c.
  */
-static void parse_dep_file(void *map, size_t len)
+static void parse_dep_file(char *m)
 {
-	char *m = map;
-	char *end = m + len;
 	char *p;
 	char s[PATH_MAX];
-	int is_target;
+	int is_last, is_target;
 	int saw_any_target = 0;
 	int is_first_dep = 0;
 
-	while (m < end) {
+	while (1) {
 		/* Skip any "white space" */
-		while (m < end && (*m == ' ' || *m == '\\' || *m == '\n'))
+		while (*m == ' ' || *m == '\\' || *m == '\n')
 			m++;
+
+		if (!*m)
+			break;
+
 		/* Find next "white space" */
 		p = m;
-		while (p < end && *p != ' ' && *p != '\\' && *p != '\n')
+		while (*p && *p != ' ' && *p != '\\' && *p != '\n')
 			p++;
+		is_last = (*p == '\0');
 		/* Is the token we found a target name? */
 		is_target = (*(p-1) == ':');
 		/* Don't write any target names into the dependency file */
@@ -373,6 +375,10 @@ static void parse_dep_file(void *map, size_t len)
 				do_config_file(s);
 			}
 		}
+
+		if (is_last)
+			break;
+
 		/*
 		 * Start searching for next token immediately after the first
 		 * "whitespace" character that follows this token.
@@ -391,40 +397,42 @@ static void parse_dep_file(void *map, size_t len)
 	printf("$(deps_%s):\n", target);
 }
 
-static void print_deps(void)
+static void print_deps(const char *filename)
 {
 	struct stat st;
 	int fd;
-	void *map;
+	char *buf;
 
-	fd = open(depfile, O_RDONLY);
+	fd = open(filename, O_RDONLY);
 	if (fd < 0) {
 		fprintf(stderr, "fixdep: error opening depfile: ");
-		perror(depfile);
+		perror(filename);
 		exit(2);
 	}
 	if (fstat(fd, &st) < 0) {
 		fprintf(stderr, "fixdep: error fstat'ing depfile: ");
-		perror(depfile);
+		perror(filename);
 		exit(2);
 	}
 	if (st.st_size == 0) {
-		fprintf(stderr,"fixdep: %s is empty\n",depfile);
 		close(fd);
 		return;
 	}
-	map = mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
-	if ((long) map == -1) {
-		perror("fixdep: mmap");
-		close(fd);
-		return;
+	buf = malloc(st.st_size + 1);
+	if (!buf) {
+		perror("fixdep: malloc");
+		exit(2);
 	}
+	if (read(fd, buf, st.st_size) != st.st_size) {
+		perror("fixdep: read");
+		exit(2);
+	}
+	buf[st.st_size] = '\0';
+	close(fd);
 
-	parse_dep_file(map, st.st_size);
-
-	munmap(map, st.st_size);
+	parse_dep_file(buf);
 
-	close(fd);
+	free(buf);
 }
 
 int main(int argc, char *argv[])
@@ -440,7 +448,7 @@ int main(int argc, char *argv[])
 	cmdline = argv[3];
 
 	print_cmdline();
-	print_deps();
+	print_deps(depfile);
 
 	return 0;
 }
-- 
2.7.4

