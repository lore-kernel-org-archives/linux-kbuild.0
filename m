Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:59173 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755623Ab1BXSgw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Feb 2011 13:36:52 -0500
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: [PATCH 1/2] kconfig: allow multiple inclusion of the same file
Date: Thu, 24 Feb 2011 19:36:42 +0100
Message-Id: <1298572603-1907-2-git-send-email-yann.morin.1998@anciens.enib.fr>
In-Reply-To: <1298572603-1907-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1298572603-1907-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Allow 'source'ing the same file from multiple places (eg. from
different files, and/or under different conditions).

To avoid circular inclusion, scan the source-ancestry of the
current file, and abort if already sourced in this branch.

Regenerate the pre-parsed lex.zconf.c_shipped file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 scripts/kconfig/lex.zconf.c_shipped |   29 +++++++++++++++++++----------
 scripts/kconfig/zconf.l             |   29 +++++++++++++++++++----------
 2 files changed, 38 insertions(+), 20 deletions(-)

diff --git a/scripts/kconfig/lex.zconf.c_shipped b/scripts/kconfig/lex.zconf.c_shipped
index 6eb0397..f4b3b1a 100644
--- a/scripts/kconfig/lex.zconf.c_shipped
+++ b/scripts/kconfig/lex.zconf.c_shipped
@@ -2368,6 +2368,7 @@ void zconf_initscan(const char *name)
 
 void zconf_nextfile(const char *name)
 {
+	struct file *iter;
 	struct file *file = file_lookup(name);
 	struct buffer *buf = malloc(sizeof(*buf));
 	memset(buf, 0, sizeof(*buf));
@@ -2383,16 +2384,24 @@ void zconf_nextfile(const char *name)
 	buf->parent = current_buf;
 	current_buf = buf;
 
-	if (file->flags & FILE_BUSY) {
-		printf("%s:%d: do not source '%s' from itself\n",
-		       zconf_curname(), zconf_lineno(), name);
-		exit(1);
-	}
-	if (file->flags & FILE_SCANNED) {
-		printf("%s:%d: file '%s' is already sourced from '%s'\n",
-		       zconf_curname(), zconf_lineno(), name,
-		       file->parent->name);
-		exit(1);
+	for (iter = current_file->parent; iter; iter = iter->parent ) {
+		if (!strcmp(current_file->name,iter->name) ) {
+			printf("%s:%d: recursive inclusion detected. "
+			       "Inclusion path:\n  current file : '%s'\n",
+			       zconf_curname(), zconf_lineno(),
+			       zconf_curname());
+			iter = current_file->parent;
+			while (iter && \
+			       strcmp(iter->name,current_file->name)) {
+				printf("  included from: '%s:%d'\n",
+				       iter->name, iter->lineno-1);
+				iter = iter->parent;
+			}
+			if (iter)
+				printf("  included from: '%s:%d'\n",
+				       iter->name, iter->lineno+1);
+			exit(1);
+		}
 	}
 	file->flags |= FILE_BUSY;
 	file->lineno = 1;
diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 3dbaec1..f23e3af 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -299,6 +299,7 @@ void zconf_initscan(const char *name)
 
 void zconf_nextfile(const char *name)
 {
+	struct file *iter;
 	struct file *file = file_lookup(name);
 	struct buffer *buf = malloc(sizeof(*buf));
 	memset(buf, 0, sizeof(*buf));
@@ -314,16 +315,24 @@ void zconf_nextfile(const char *name)
 	buf->parent = current_buf;
 	current_buf = buf;
 
-	if (file->flags & FILE_BUSY) {
-		printf("%s:%d: do not source '%s' from itself\n",
-		       zconf_curname(), zconf_lineno(), name);
-		exit(1);
-	}
-	if (file->flags & FILE_SCANNED) {
-		printf("%s:%d: file '%s' is already sourced from '%s'\n",
-		       zconf_curname(), zconf_lineno(), name,
-		       file->parent->name);
-		exit(1);
+	for (iter = current_file->parent; iter; iter = iter->parent ) {
+		if (!strcmp(current_file->name,iter->name) ) {
+			printf("%s:%d: recursive inclusion detected. "
+			       "Inclusion path:\n  current file : '%s'\n",
+			       zconf_curname(), zconf_lineno(),
+			       zconf_curname());
+			iter = current_file->parent;
+			while (iter && \
+			       strcmp(iter->name,current_file->name)) {
+				printf("  included from: '%s:%d'\n",
+				       iter->name, iter->lineno-1);
+				iter = iter->parent;
+			}
+			if (iter)
+				printf("  included from: '%s:%d'\n",
+				       iter->name, iter->lineno+1);
+			exit(1);
+		}
 	}
 	file->flags |= FILE_BUSY;
 	file->lineno = 1;
-- 
1.7.2.3

