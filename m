Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.23]:9901 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390330AbgFYIxS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jun 2020 04:53:18 -0400
From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH] modpost: remove use of non-standard strsep() in HOSTCC code
Date: Thu, 25 Jun 2020 10:41:13 +0200
Message-Id: <11c1e65b393b4c3ca6118515c77bbf19524dab11.1593074472.git.hns@goldelico.com>
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

So let's add some lines of code separating the string at the
next newline character instead of using strsep(). It does not
hurt kernel size or speed since this code is run on the build host.

Fixes: ac5100f5432967 ("modpost: add read_text_file() and get_line() helpers")
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 scripts/mod/modpost.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 6aea65c65745..8fe63989c6e1 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -138,11 +138,16 @@ char *read_text_file(const char *filename)
 
 char *get_line(char **stringp)
 {
+	char *p;
 	/* do not return the unwanted extra line at EOF */
 	if (*stringp && **stringp == '\0')
 		return NULL;
 
-	return strsep(stringp, "\n");
+	p = *stringp;
+	while (**stringp != '\n')
+		(*stringp)++;
+	*(*stringp)++ = '\0';
+	return p;
 }
 
 /* A list of all modules we processed */
-- 
2.26.2
