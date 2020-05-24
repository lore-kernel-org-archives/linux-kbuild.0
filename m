Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:19693 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728292AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 07/29] modpost: use read_text_file() and get_line() for reading text files
Date: Mon, 25 May 2020 00:42:13 +0900
Message-Id: <20200524154235.380482-8-masahiroy@kernel.org>
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

grab_file() mmaps a file, but it is not so efficient here because
get_next_line() copies every line to the temporary buffer anyway.

read_text_file() and get_line() are simpler. get_line() exploits the
library function strchr().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/mod/modpost.c    | 15 ++++++++-------
 scripts/mod/sumversion.c | 11 ++++++-----
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 139b811dc183..40c6414aaeec 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2476,15 +2476,16 @@ static void write_if_changed(struct buffer *b, const char *fname)
  **/
 static void read_dump(const char *fname, unsigned int kernel)
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
@@ -2519,10 +2520,10 @@ static void read_dump(const char *fname, unsigned int kernel)
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
index a1c7b0f4cd5a..89c8baefde9d 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -306,9 +306,8 @@ static int is_static_library(const char *objfile)
  * to figure out source files. */
 static int parse_source_files(const char *objfile, struct md4_ctx *md)
 {
-	char *cmd, *file, *line, *dir;
+	char *cmd, *file, *line, *dir, *pos;
 	const char *base;
-	unsigned long flen, pos = 0;
 	int dirlen, ret = 0, check_files = 0;
 
 	cmd = NOFAIL(malloc(strlen(objfile) + sizeof("..cmd")));
@@ -326,14 +325,16 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 	strncpy(dir, objfile, dirlen);
 	dir[dirlen] = '\0';
 
-	file = grab_file(cmd, &flen);
+	file = read_text_file(cmd);
 	if (!file) {
 		warn("could not find %s for %s\n", cmd, objfile);
 		goto out;
 	}
 
+	pos = file;
+
 	/* Sum all files in the same dir or subdirs. */
-	while ((line = get_next_line(&pos, file, flen)) != NULL) {
+	while ((line = get_line(&pos))) {
 		char* p = line;
 
 		if (strncmp(line, "source_", sizeof("source_")-1) == 0) {
@@ -384,7 +385,7 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 	/* Everyone parsed OK */
 	ret = 1;
 out_file:
-	release_file(file, flen);
+	free(file);
 out:
 	free(dir);
 	free(cmd);
-- 
2.25.1
