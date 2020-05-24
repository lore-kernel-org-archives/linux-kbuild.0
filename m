Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:19701 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728399AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 08/29] modpost: remove get_next_text() and make {grab,release_}file static
Date: Mon, 25 May 2020 00:42:14 +0900
Message-Id: <20200524154235.380482-9-masahiroy@kernel.org>
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

get_next_line() is no longer used. Remove.

grab_file() and release_file() are only used in modpost.c. Make them
static.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/mod/modpost.c | 38 ++------------------------------------
 scripts/mod/modpost.h |  3 ---
 2 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 40c6414aaeec..33cdb78a4ba1 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -462,7 +462,7 @@ static void sym_set_crc(const char *name, unsigned int crc)
 	s->crc_valid = 1;
 }
 
-void *grab_file(const char *filename, unsigned long *size)
+static void *grab_file(const char *filename, unsigned long *size)
 {
 	struct stat st;
 	void *map = MAP_FAILED;
@@ -484,41 +484,7 @@ void *grab_file(const char *filename, unsigned long *size)
 	return map;
 }
 
-/**
-  * Return a copy of the next line in a mmap'ed file.
-  * spaces in the beginning of the line is trimmed away.
-  * Return a pointer to a static buffer.
-  **/
-char *get_next_line(unsigned long *pos, void *file, unsigned long size)
-{
-	static char line[4096];
-	int skip = 1;
-	size_t len = 0;
-	signed char *p = (signed char *)file + *pos;
-	char *s = line;
-
-	for (; *pos < size ; (*pos)++) {
-		if (skip && isspace(*p)) {
-			p++;
-			continue;
-		}
-		skip = 0;
-		if (*p != '\n' && (*pos < size)) {
-			len++;
-			*s++ = *p++;
-			if (len > 4095)
-				break; /* Too long, stop */
-		} else {
-			/* End of string */
-			*s = '\0';
-			return line;
-		}
-	}
-	/* End of buffer */
-	return NULL;
-}
-
-void release_file(void *file, unsigned long size)
+static void release_file(void *file, unsigned long size)
 {
 	munmap(file, size);
 }
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index dfadaa0c01ec..232a0e11fcaa 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -192,9 +192,6 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen);
 /* from modpost.c */
 char *read_text_file(const char *filename);
 char *get_line(char **stringp);
-void *grab_file(const char *filename, unsigned long *size);
-char* get_next_line(unsigned long *pos, void *file, unsigned long size);
-void release_file(void *file, unsigned long size);
 
 enum loglevel {
 	LOG_WARN,
-- 
2.25.1
