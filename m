Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:61239 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756158AbcJ1IdA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Oct 2016 04:33:00 -0400
Subject: [PATCH 02/10] scripts/basic/fixdep: Complete error handling in
 print_deps()
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <9402cf24-9e3e-95d0-c3e6-a51631eda20e@users.sourceforge.net>
Date: Fri, 28 Oct 2016 10:32:49 +0200
MIME-Version: 1.0
In-Reply-To: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Oct 2016 18:08:30 +0200

Return values were not checked from calls of the functions "close"
and "munmap".

This issue was detected also by using the Coccinelle software.


Add a bit of exception handling there.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/basic/fixdep.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index fff818b..c9ce3e3 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -113,6 +113,7 @@
 #include <limits.h>
 #include <ctype.h>
 #include <arpa/inet.h>
+#include <errno.h>
 
 int insert_extra_deps;
 char *target;
@@ -413,21 +414,24 @@ static void print_deps(void)
 	}
 	if (st.st_size == 0) {
 		fprintf(stderr,"fixdep: %s is empty\n",depfile);
-		close(fd);
-		return;
+		goto close_fd;
 	}
 	map = mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
 	if ((long) map == -1) {
 		perror("fixdep: mmap");
-		close(fd);
-		return;
+		goto close_fd;
 	}
 
 	parse_dep_file(map, st.st_size);
-
-	munmap(map, st.st_size);
-
-	close(fd);
+	if (munmap(map, st.st_size))
+		perror("fixdep: munmap");
+close_fd:
+	if (close(fd)) {
+		int code = errno;
+
+		perror("fixdep: close");
+		exit(code);
+	}
 }
 
 int main(int argc, char *argv[])
-- 
2.10.1

