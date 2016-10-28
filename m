Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:63889 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756194AbcJ1Iki (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Oct 2016 04:40:38 -0400
Subject: [PATCH 09/10] scripts/basic/fixdep: Complete error handling in
 print_cmdline()
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <d4bd9a09-d413-a073-c2d5-67933d425b87@users.sourceforge.net>
Date: Fri, 28 Oct 2016 10:40:30 +0200
MIME-Version: 1.0
In-Reply-To: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 28 Oct 2016 09:29:59 +0200

A return value was not checked from a call of the function "printf".

This issue was detected also by using the Coccinelle software.


Add a bit of exception handling there.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/basic/fixdep.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index f5ff6eea..911347a 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -132,7 +132,12 @@ static void usage(void)
  */
 static void print_cmdline(void)
 {
-	printf("cmd_%s := %s\n\n", target, cmdline);
+	if (printf("cmd_%s := %s\n\n", target, cmdline) < 10) {
+		int code = errno;
+
+		perror("fixdep: print_cmdline");
+		exit(code);
+	}
 }
 
 /*
-- 
2.10.1

