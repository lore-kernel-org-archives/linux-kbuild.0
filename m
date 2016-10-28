Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:65303 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934317AbcJ1IjU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Oct 2016 04:39:20 -0400
Subject: [PATCH 08/10] scripts/basic/fixdep: Complete error handling in
 print_config()
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <11b02385-965b-c9ca-c564-0df7757f8145@users.sourceforge.net>
Date: Fri, 28 Oct 2016 10:39:11 +0200
MIME-Version: 1.0
In-Reply-To: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Oct 2016 22:45:03 +0200

Return values were not checked from calls of the function "printf"
and "putchar".

This issue was detected also by using the Coccinelle software.

* Add a bit of exception handling there.

* Optimise this function implementation a bit by replacing two output calls
  with the functions "fputs" and "puts".

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/basic/fixdep.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 2c4ec91..f5ff6eea 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -142,16 +142,26 @@ static void print_config(const char *m, int slen)
 {
 	int c, i;
 
-	printf("    $(wildcard include/config/");
+	if (fputs("    $(wildcard include/config/", stdout) < 0)
+		goto put_failure;
 	for (i = 0; i < slen; i++) {
 		c = m[i];
 		if (c == '_')
 			c = '/';
 		else
 			c = tolower(c);
-		putchar(c);
+		if (putchar(c) == EOF)
+			goto put_failure;
+	}
+	if (puts(".h) \\") < 0) {
+put_failure:
+		{
+			int code = errno;
+
+			perror("fixdep: print_config");
+			exit(code);
+		}
 	}
-	printf(".h) \\\n");
 }
 
 static void do_extra_deps(void)
-- 
2.10.1

