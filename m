Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:40014 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727100AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 25/37] modpost: avoid false-positive file open error
Date: Mon,  1 Jun 2020 14:57:19 +0900
Message-Id: <20200601055731.3006266-25-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>

One problem of grab_file() is that it cannot distinguish the following
two cases:

 - It cannot read the file (the file does not exist, or read permission
   is not set)

 - It can read the file, but the file size is zero

This is because grab_file() calls mmap(), which requires the mapped
length is greater than 0. Hence, grab_file() fails for both cases.

If an empty header file were included for checksum calculation, the
following warning would be printed:

  WARNING: modpost: could not open ...: Invalid argument

An empty file is a valid source file, so it should not fail.

Use read_text_file() instead. It can read a zero-length file.
Then, parse_file() will succeed with doing nothing.

Going forward, the first case (it cannot read the file) is a fatal
error. If the source file from which an object was compiled is missing,
something went wrong.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/sumversion.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 5fb142db6195..9f77c9dfce20 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -258,9 +258,8 @@ static int parse_file(const char *fname, struct md4_ctx *md)
 	char *file;
 	unsigned long i, len;
 
-	file = grab_file(fname, &len);
-	if (!file)
-		return 0;
+	file = read_text_file(fname);
+	len = strlen(file);
 
 	for (i = 0; i < len; i++) {
 		/* Collapse and ignore \ and CR. */
@@ -287,7 +286,7 @@ static int parse_file(const char *fname, struct md4_ctx *md)
 
 		add_char(file[i], md);
 	}
-	release_file(file, len);
+	free(file);
 	return 1;
 }
 /* Check whether the file is a static library or not */
-- 
2.25.1
