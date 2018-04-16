Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:42333 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751146AbeDPTH7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Apr 2018 15:07:59 -0400
Received: by mail-qk0-f193.google.com with SMTP id d193so6357019qke.9
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Apr 2018 12:07:59 -0700 (PDT)
Date: Mon, 16 Apr 2018 15:07:57 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH] fixdep: suppress consecutive / from file paths in dependency
 list files
Message-ID: <nycvar.YSQ.7.76.1804161456540.28462@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org

Underscores in symbol names are translated into slashes for path names.
Filesystems treat consecutive slashes as if there was only one, so
let's do the same in the dependency list for easier grepping, etc.

Signed-off-by: Nicolas Pitre <nico@linaro.org>

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index f387538c58..850966f3d6 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -115,7 +115,7 @@ static void usage(void)
  */
 static void print_dep(const char *m, int slen, const char *dir)
 {
-	int c, i;
+	int c, prev_c = '/', i;
 
 	printf("    $(wildcard %s/", dir);
 	for (i = 0; i < slen; i++) {
@@ -124,7 +124,9 @@ static void print_dep(const char *m, int slen, const char *dir)
 			c = '/';
 		else
 			c = tolower(c);
-		putchar(c);
+		if (c != '/' || prev_c != '/')
+			putchar(c);
+		prev_c = c;
 	}
 	printf(".h) \\\n");
 }
