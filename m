Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:57409 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754158AbYJ2VUo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Oct 2008 17:20:44 -0400
Message-Id: <200810292120.m9TLKCJP019376@imap1.linux-foundation.org>
Subject: [patch 10/13] kbuild: prevent modpost from looking for a .cmd file for a static library linked into a module
From: akpm@linux-foundation.org
Date: Wed, 29 Oct 2008 14:20:12 -0700
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, ashutosh@chelsio.com, ashutosh.naik@gmail.com, rusty@rustcorp.com.au

From: "Ashutosh Naik" <ashutosh@chelsio.com>

This fixes a compile time warning which occurs whenever a static library
is linked into a kernel module.  MODPOST tries to look for a
".<modulename>.cmd" file to look for its dependencies, but that file
doesn't exist or get generated for static libraries.

This patch prevents modpost from looking for a .cmd file when a module is
linked with a static library

[akpm@linux-foundation.org: coding-style fixes]
Signed-off-by: Ashutosh Naik <ashutosh.naik@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/mod/sumversion.c |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff -puN scripts/mod/sumversion.c~kbuild-prevent-modpost-from-looking-for-a-cmd-file-for-a-static-library-linked-into-a-module scripts/mod/sumversion.c
--- a/scripts/mod/sumversion.c~kbuild-prevent-modpost-from-looking-for-a-cmd-file-for-a-static-library-linked-into-a-module
+++ a/scripts/mod/sumversion.c
@@ -290,6 +290,15 @@ static int parse_file(const char *fname,
 	release_file(file, len);
 	return 1;
 }
+/* Check whether the file is a static library or not */
+static int is_static_library(const char *objfile)
+{
+	int len = strlen(objfile);
+	if (objfile[len - 2] == '.' && objfile[len - 1] == 'a')
+		return 1;
+	else
+		return 0;
+}
 
 /* We have dir/file.o.  Open dir/.file.o.cmd, look for deps_ line to
  * figure out source file. */
@@ -420,7 +429,8 @@ void get_src_version(const char *modname
 	while ((fname = strsep(&sources, " ")) != NULL) {
 		if (!*fname)
 			continue;
-		if (!parse_source_files(fname, &md))
+		if (!(is_static_library(fname)) &&
+				!parse_source_files(fname, &md))
 			goto release;
 	}
 
_
