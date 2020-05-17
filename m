Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:38297 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbgEQJte (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:34 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 06/29] modpost: avoid false-positive file open error
Date: Sun, 17 May 2020 18:48:36 +0900
Message-Id: <20200517094859.2376211-7-masahiroy@kernel.org>
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

One problem of grab_file() is that it cannot distinguish the following
two cases:

 - I cannot read the file (the file does not exist, or read permission
   is not set)

 - It can read the file, but the file size is zero

This is because grab_file() calls mmap(), which requires the mapped
length is greater than 0. Hence, grab_file() fails for both cases.

If an empty header file were included from a module that requires checksum
calculation, the following warning would be printed:

  WARNING: modpost: could not open ...: Invalid argument

An empty file is a valid source file, so it should not fail.

Use read_text_file() instead. It can read a zero-length file.
Then, parse_file() will succeed with doing nothing.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/sumversion.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index f9df0b1863f1..a1c7b0f4cd5a 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -258,10 +258,12 @@ static int parse_file(const char *fname, struct md4_ctx *md)
 	char *file;
 	unsigned long i, len;
 
-	file = grab_file(fname, &len);
+	file = read_text_file(fname);
 	if (!file)
 		return 0;
 
+	len = strlen(file);
+
 	for (i = 0; i < len; i++) {
 		/* Collapse and ignore \ and CR. */
 		if (file[i] == '\\' && (i+1 < len) && file[i+1] == '\n') {
@@ -287,7 +289,7 @@ static int parse_file(const char *fname, struct md4_ctx *md)
 
 		add_char(file[i], md);
 	}
-	release_file(file, len);
+	free(file);
 	return 1;
 }
 /* Check whether the file is a static library or not */
-- 
2.25.1
