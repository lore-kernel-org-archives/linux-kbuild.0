Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:45986 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751882Ab0LVSaV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Dec 2010 13:30:21 -0500
Received: by qwa26 with SMTP id 26so5427670qwa.19
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Dec 2010 10:30:21 -0800 (PST)
From: Ben Gamari <bgamari.foss@gmail.com>
Subject: [PATCH] Make fixdep error handling more explicit
Date: Wed, 22 Dec 2010 13:30:14 -0500
Message-Id: <1293042614-27726-1-git-send-email-bgamari.foss@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ben Gamari <bgamari.foss@gmail.com>

Also add missing error handling to fstat call

Signed-off-by: Ben Gamari <bgamari.foss@gmail.com>
---
 scripts/basic/fixdep.c |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index ea26b23..184fb89 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -273,7 +273,7 @@ static void do_config_file(char *filename)
 
 	fd = open(filename, O_RDONLY);
 	if (fd < 0) {
-		fprintf(stderr, "fixdep: ");
+		fprintf(stderr, "fixdep: error opening config file: ");
 		perror(filename);
 		exit(2);
 	}
@@ -344,11 +344,15 @@ static void print_deps(void)
 
 	fd = open(depfile, O_RDONLY);
 	if (fd < 0) {
-		fprintf(stderr, "fixdep: ");
+		fprintf(stderr, "fixdep: error opening depfile: ");
 		perror(depfile);
 		exit(2);
 	}
-	fstat(fd, &st);
+	if (fstat(fd, &st) < 0) {
+                fprintf(stderr, "fixdep: error fstat'ing depfile: ");
+                perror(depfile);
+                exit(2);
+        }
 	if (st.st_size == 0) {
 		fprintf(stderr,"fixdep: %s is empty\n",depfile);
 		close(fd);
-- 
1.7.0.4

