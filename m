Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39999 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 26/37] modpost: use read_text_file() and get_line() for reading text files
Date: Mon,  1 Jun 2020 14:57:20 +0900
Message-Id: <20200601055731.3006266-26-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>

grab_file() mmaps a file, but it is not so efficient here because
get_next_line() copies every line to the temporary buffer anyway.

read_text_file() and get_line() are simpler. get_line() exploits the
library function strchr().

Going forward, the missing *.symvers or *.cmd is a fatal error.
This should not happen because scripts/Makefile.modpost guards the
-i option files with $(wildcard $(input-symdump)).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c    | 15 ++++++++-------
 scripts/mod/sumversion.c | 16 ++++++----------
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 0a844902998e..4fdf992e9729 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2481,15 +2481,16 @@ static void write_if_changed(struct buffer *b, const char *fname)
  **/
 static void read_dump(const char *fname)
 {
-	unsigned long size, pos = 0;
-	void *file = grab_file(fname, &size);
-	char *line;
+	char *buf, *pos, *line;
 
-	if (!file)
+	buf = read_text_file(fname);
+	if (!buf)
 		/* No symbol versions, silently ignore */
 		return;
 
-	while ((line = get_next_line(&pos, file, size))) {
+	pos = buf;
+
+	while ((line = get_line(&pos))) {
 		char *symname, *namespace, *modname, *d, *export;
 		unsigned int crc;
 		struct module *mod;
@@ -2524,10 +2525,10 @@ static void read_dump(const char *fname)
 		sym_set_crc(symname, crc);
 		sym_update_namespace(symname, namespace);
 	}
-	release_file(file, size);
+	free(buf);
 	return;
 fail:
-	release_file(file, size);
+	free(buf);
 	fatal("parse error in symbol dump file\n");
 }
 
diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 9f77c9dfce20..d587f40f1117 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -303,9 +303,8 @@ static int is_static_library(const char *objfile)
  * to figure out source files. */
 static int parse_source_files(const char *objfile, struct md4_ctx *md)
 {
-	char *cmd, *file, *line, *dir;
+	char *cmd, *file, *line, *dir, *pos;
 	const char *base;
-	unsigned long flen, pos = 0;
 	int dirlen, ret = 0, check_files = 0;
 
 	cmd = NOFAIL(malloc(strlen(objfile) + sizeof("..cmd")));
@@ -323,14 +322,12 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 	strncpy(dir, objfile, dirlen);
 	dir[dirlen] = '\0';
 
-	file = grab_file(cmd, &flen);
-	if (!file) {
-		warn("could not find %s for %s\n", cmd, objfile);
-		goto out;
-	}
+	file = read_text_file(cmd);
+
+	pos = file;
 
 	/* Sum all files in the same dir or subdirs. */
-	while ((line = get_next_line(&pos, file, flen)) != NULL) {
+	while ((line = get_line(&pos))) {
 		char* p = line;
 
 		if (strncmp(line, "source_", sizeof("source_")-1) == 0) {
@@ -381,8 +378,7 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 	/* Everyone parsed OK */
 	ret = 1;
 out_file:
-	release_file(file, flen);
-out:
+	free(file);
 	free(dir);
 	free(cmd);
 	return ret;
-- 
2.25.1
