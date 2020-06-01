Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:40025 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 27/37] modpost: remove get_next_text() and make {grab,release_}file static
Date: Mon,  1 Jun 2020 14:57:21 +0900
Message-Id: <20200601055731.3006266-27-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>

get_next_line() is no longer used. Remove.

grab_file() and release_file() are only used in modpost.c. Make them
static.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 38 ++------------------------------------
 scripts/mod/modpost.h |  3 ---
 2 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 4fdf992e9729..93019349f022 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -463,7 +463,7 @@ static void sym_set_crc(const char *name, unsigned int crc)
 	s->crc_valid = 1;
 }
 
-void *grab_file(const char *filename, unsigned long *size)
+static void *grab_file(const char *filename, unsigned long *size)
 {
 	struct stat st;
 	void *map = MAP_FAILED;
@@ -485,41 +485,7 @@ void *grab_file(const char *filename, unsigned long *size)
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
index 205afc90b08a..aaf3c4ad5d60 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -193,9 +193,6 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen);
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
