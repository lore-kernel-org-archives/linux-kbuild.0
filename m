Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:64245 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755836AbcJ1ImQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Oct 2016 04:42:16 -0400
Subject: [PATCH 10/10] scripts/basic/fixdep: Combine two fprintf() calls into
 one fputs() call in usage()
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <e4ad7dc2-eeba-1389-369d-ae4ded67688e@users.sourceforge.net>
Date: Fri, 28 Oct 2016 10:41:39 +0200
MIME-Version: 1.0
In-Reply-To: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Oct 2016 09:45:30 +0200

Some data were printed by two separate function calls.
Print the same data by a single call of the function "fputs" instead.

This issue was detected also by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/basic/fixdep.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 911347a..bdd031f 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -122,8 +122,10 @@ char *cmdline;
 
 static void usage(void)
 {
-	fprintf(stderr, "Usage: fixdep [-e] <depfile> <target> <cmdline>\n");
-	fprintf(stderr, " -e  insert extra dependencies given on stdin\n");
+	if (fputs("Usage: fixdep [-e] <depfile> <target> <cmdline>\n"
+		  " -e  insert extra dependencies given on stdin\n", stderr)
+	   < 0)
+		perror("fixdep: usage");
 	exit(1);
 }
 
-- 
2.10.1

