Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga17.intel.com ([192.55.52.151]:46411 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752392AbeC3ROT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Mar 2018 13:14:19 -0400
From: Juro Bystricky <juro.bystricky@intel.com>
Subject: [PATCH] modpost: srcversion sometimes incorrect
Date: Fri, 30 Mar 2018 10:14:05 -0700
Message-Id: <1522430045-31685-1-git-send-email-juro.bystricky@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, richard.purdie@linuxfoundation.org, jurobystricky@hotmail.com, Juro Bystricky <juro.bystricky@intel.com>

"srcversion" field inserted into module modinfo section contains a
sum of the source files which made it. However, this field can
be incorrect. Building the same module can end up having inconsistent
srcversion field eventhough the sources remain the same.
This can be reproduced by building modules in a deeply nested directory,
but other factors contribute as well.

The reason for incorrect srcversion is that some source files can be
simply silently skipped from the checksum calculation due to limited
buffer space for line parsing.

This patch addresses two issues:

1. Allocates a larger line buffer (32k vs 4k).
2. Issues a warning if a line length exceeds the line buffer.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 scripts/mod/modpost.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 9917f92..955f26e 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -385,9 +385,10 @@ void *grab_file(const char *filename, unsigned long *size)
   * spaces in the beginning of the line is trimmed away.
   * Return a pointer to a static buffer.
   **/
+#define MODPOST_MAX_LINE 32768
 char *get_next_line(unsigned long *pos, void *file, unsigned long size)
 {
-	static char line[4096];
+	static char line[MODPOST_MAX_LINE];
 	int skip = 1;
 	size_t len = 0;
 	signed char *p = (signed char *)file + *pos;
@@ -402,8 +403,11 @@ char *get_next_line(unsigned long *pos, void *file, unsigned long size)
 		if (*p != '\n' && (*pos < size)) {
 			len++;
 			*s++ = *p++;
-			if (len > 4095)
+			if (len > (sizeof(line)-1)) {
+				warn(" %s: line exceeds buffer size %zu bytes\n"
+				     , __func__, sizeof(line));
 				break; /* Too long, stop */
+			}
 		} else {
 			/* End of string */
 			*s = '\0';
-- 
2.7.4

