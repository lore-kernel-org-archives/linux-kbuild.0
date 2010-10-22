Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:58075 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757212Ab0JVOcZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Oct 2010 10:32:25 -0400
From: Namhyung Kim <namhyung@gmail.com>
Subject: [PATCH] kbuild: check return value of asprintf()
Date: Fri, 22 Oct 2010 23:32:10 +0900
Message-Id: <1287757930-2766-1-git-send-email-namhyung@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Check return value of asprintf() in docsect() and exit if error
occurs. This removes following warning:

  HOSTCC  scripts/basic/docproc
scripts/basic/docproc.c: In function ‘docsect’:
scripts/basic/docproc.c:336: warning: ignoring return value of ‘asprintf’,
				declared with attribute warn_unused_result

Signed-off-by: Namhyung Kim <namhyung@gmail.com>
---
The patch is on top of v2.6.36, thanks.

 scripts/basic/docproc.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/scripts/basic/docproc.c b/scripts/basic/docproc.c
index fc3b18d..98dec87 100644
--- a/scripts/basic/docproc.c
+++ b/scripts/basic/docproc.c
@@ -333,7 +333,10 @@ static void docsect(char *filename, char *line)
 		if (*s == '\n')
 			*s = '\0';
 
-	asprintf(&s, "DOC: %s", line);
+	if (asprintf(&s, "DOC: %s", line) < 0) {
+		perror("asprintf");
+		exit(1);
+	}
 	consume_symbol(s);
 	free(s);
 
-- 
1.7.0.4

