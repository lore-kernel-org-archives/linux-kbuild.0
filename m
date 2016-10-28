Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:63783 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934755AbcJ1IhP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Oct 2016 04:37:15 -0400
Subject: [PATCH 06/10] scripts/basic/fixdep: Complete error handling in
 do_config_file()
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <c2024e45-97b5-3334-904f-c5cf0d00acf0@users.sourceforge.net>
Date: Fri, 28 Oct 2016 10:36:38 +0200
MIME-Version: 1.0
In-Reply-To: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Oct 2016 22:02:42 +0200

Return values were not checked from four calls of the function "close".

This issue was detected also by using the Coccinelle software.


Add a bit of exception handling there.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/basic/fixdep.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 5f6a4f4..be0fdaa 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -284,27 +284,33 @@ static void do_config_file(const char *filename)
 		perror(filename);
 		exit(2);
 	}
-	if (st.st_size == 0) {
-		close(fd);
-		return;
-	}
+	if (st.st_size == 0)
+		goto close_fd;
 	map = malloc(st.st_size + 1);
 	if (!map) {
 		perror("fixdep: malloc");
-		close(fd);
-		return;
+		goto close_fd;
 	}
 	if (read(fd, map, st.st_size) != st.st_size) {
 		perror("fixdep: read");
-		close(fd);
-		return;
+		goto close_fd;
 	}
 	map[st.st_size] = '\0';
-	close(fd);
-
+	if (close(fd))
+		goto close_failure;
 	parse_config_file(map);
-
 	free(map);
+	return;
+close_fd:
+	if (close(fd)) {
+close_failure:
+		{
+			int code = errno;
+
+			perror("fixdep: close");
+			exit(code);
+		}
+	}
 }
 
 /*
-- 
2.10.1

