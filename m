Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:60411 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S964792AbcJ1Ieg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Oct 2016 04:34:36 -0400
Subject: [PATCH 04/10] scripts/basic/fixdep: Fix error log output in
 print_deps()
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <afce4a5b-0bd1-c887-9fcf-046dac0d3927@users.sourceforge.net>
Date: Fri, 28 Oct 2016 10:34:28 +0200
MIME-Version: 1.0
In-Reply-To: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Oct 2016 19:04:01 +0200

The function "perror" was called after a call of the function "fprintf"
in two if branches. So it could happen that an error message was displayed
for a failed print operation instead of the failure according to the call
of the function "fstat" or "open" here.

* Pass the relevant error data in the logging calls directly.

* Express that the corresponding return values are intentionally unused
  by casts to void.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/basic/fixdep.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 0dcec29..9a2ff68 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -403,13 +403,15 @@ static void print_deps(void)
 
 	fd = open(depfile, O_RDONLY);
 	if (fd < 0) {
-		fprintf(stderr, "fixdep: error opening depfile: ");
-		perror(depfile);
+		(void) fprintf(stderr,
+			       "fixdep: error opening depfile: %s: %s\n",
+			       depfile, strerror(errno));
 		exit(2);
 	}
 	if (fstat(fd, &st) < 0) {
-		fprintf(stderr, "fixdep: error fstat'ing depfile: ");
-		perror(depfile);
+		(void) fprintf(stderr,
+			       "fixdep: error fstat'ing depfile: %s: %s\n",
+			       depfile, strerror(errno));
 		exit(2);
 	}
 	if (st.st_size == 0) {
-- 
2.10.1

