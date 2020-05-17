Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:38335 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727819AbgEQJth (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:37 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 04/29] modpost: fix potential mmap'ed file overrun in get_src_version()
Date: Sun, 17 May 2020 18:48:34 +0900
Message-Id: <20200517094859.2376211-5-masahiroy@kernel.org>
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

I do not know how reliably this function works, but it seems dangerous
to me, at least.

The function call

    strchr(sources, '\n');

... continues searching until it finds '\n' or it reaches the '\0'
terminator. In other words, 'sources' should be a null-terminated
string.

However, grab_file() just mmaps a file, so 'sources' is not terminated
with null byte. If the file does not contain '\n' at all, strchr() will
go beyond the mmap'ed memory.

Instead, use read_text_file(), which loads the file content into a
malloc'ed buffer, appending null-byte.

Here we are interested only in the first line of *.mod files. Use
get_line() helper to get the first line.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/sumversion.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index f27f22420cbc..f9aa532d93cf 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -392,40 +392,37 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 /* Calc and record src checksum. */
 void get_src_version(const char *modname, char sum[], unsigned sumlen)
 {
-	void *file;
-	unsigned long len;
+	char *buf, *pos, *firstline;
 	struct md4_ctx md;
-	char *sources, *end, *fname;
+	char *fname;
 	char filelist[PATH_MAX + 1];
 
 	/* objects for a module are listed in the first line of *.mod file. */
 	snprintf(filelist, sizeof(filelist), "%.*smod",
 		 (int)strlen(modname) - 1, modname);
 
-	file = grab_file(filelist, &len);
-	if (!file)
+	buf = read_text_file(filelist);
+	if (!buf)
 		/* not a module or .mod file missing - ignore */
 		return;
 
-	sources = file;
-
-	end = strchr(sources, '\n');
-	if (!end) {
+	pos = buf;
+	firstline = get_line(&pos);
+	if (!firstline) {
 		warn("bad ending versions file for %s\n", modname);
-		goto release;
+		goto free;
 	}
-	*end = '\0';
 
 	md4_init(&md);
-	while ((fname = strsep(&sources, " ")) != NULL) {
+	while ((fname = strsep(&firstline, " "))) {
 		if (!*fname)
 			continue;
 		if (!(is_static_library(fname)) &&
 				!parse_source_files(fname, &md))
-			goto release;
+			goto free;
 	}
 
 	md4_final_ascii(&md, sum, sumlen);
-release:
-	release_file(file, len);
+free:
+	free(buf);
 }
-- 
2.25.1
