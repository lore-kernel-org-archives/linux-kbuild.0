Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:22158 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbgGAGSf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 02:18:35 -0400
From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2] modpost: remove use of non-standard strsep() in HOSTCC code
Date: Wed,  1 Jul 2020 08:18:27 +0200
Message-Id: <60381408622ebbb7d205b2cf6edcf8c6acecf1d7.1593584306.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, "H. Nikolaus Schaller" <hns@goldelico.com>

strsep() is neither standard C nor POSIX and used outside
the kernel code here. Using it here requires that the
build host supports it out of the box which is e.g.
not true for a Darwin build host and using a cross-compiler.
This leads to:

scripts/mod/modpost.c:145:2: warning: implicit declaration of function 'strsep' [-Wimplicit-function-declaration]
  return strsep(stringp, "\n");
  ^

and a segfault when running MODPOST.

See also: https://stackoverflow.com/a/7219504

So let's replace this by strchr() instead of using strsep().
It does not hurt kernel size or speed since this code is run
on the build host.

Fixes: ac5100f5432967 ("modpost: add read_text_file() and get_line() helpers")
Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 scripts/mod/modpost.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 6aea65c657454..45f2ab2ec2d46 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -138,11 +138,19 @@ char *read_text_file(const char *filename)
 
 char *get_line(char **stringp)
 {
+	char *orig = *stringp, *next;
+
 	/* do not return the unwanted extra line at EOF */
-	if (*stringp && **stringp == '\0')
+	if (!orig || *orig == '\0')
 		return NULL;
 
-	return strsep(stringp, "\n");
+	next = strchr(orig, '\n');
+	if (next)
+		*next++ = '\0';
+
+	*stringp = next;
+
+	return orig;
 }
 
 /* A list of all modules we processed */
-- 
2.26.2
