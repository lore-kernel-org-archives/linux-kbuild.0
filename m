Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:36144 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753341AbYL2Nvu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Dec 2008 08:51:50 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 07/13] kconfig: improve error messages for bad source statements
Date: Mon, 29 Dec 2008 14:53:17 +0100
Message-Id: <1230558803-7168-7-git-send-email-sam@ravnborg.org>
In-Reply-To: <20081229134402.GA7069@uranus.ravnborg.org>
References: <20081229134402.GA7069@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>

We now say where we detect the second source of a file,
and where we detect a recursively source of the same file.
This makes it easier to fix such errors.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
---
 scripts/kconfig/lex.zconf.c_shipped |    7 +++++--
 scripts/kconfig/zconf.l             |    7 +++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/lex.zconf.c_shipped b/scripts/kconfig/lex.zconf.c_shipped
index 7342ce0..dc3e818 100644
--- a/scripts/kconfig/lex.zconf.c_shipped
+++ b/scripts/kconfig/lex.zconf.c_shipped
@@ -2370,11 +2370,14 @@ void zconf_nextfile(const char *name)
 	current_buf = buf;
 
 	if (file->flags & FILE_BUSY) {
-		printf("recursive scan (%s)?\n", name);
+		printf("%s:%d: do not source '%s' from itself\n",
+		       zconf_curname(), zconf_lineno(), name);
 		exit(1);
 	}
 	if (file->flags & FILE_SCANNED) {
-		printf("file %s already scanned?\n", name);
+		printf("%s:%d: file '%s' is already sourced from '%s'\n",
+		       zconf_curname(), zconf_lineno(), name,
+		       file->parent->name);
 		exit(1);
 	}
 	file->flags |= FILE_BUSY;
diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 5164ef7..21ff69c 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -314,11 +314,14 @@ void zconf_nextfile(const char *name)
 	current_buf = buf;
 
 	if (file->flags & FILE_BUSY) {
-		printf("recursive scan (%s)?\n", name);
+		printf("%s:%d: do not source '%s' from itself\n",
+		       zconf_curname(), zconf_lineno(), name);
 		exit(1);
 	}
 	if (file->flags & FILE_SCANNED) {
-		printf("file %s already scanned?\n", name);
+		printf("%s:%d: file '%s' is already sourced from '%s'\n",
+		       zconf_curname(), zconf_lineno(), name,
+		       file->parent->name);
 		exit(1);
 	}
 	file->flags |= FILE_BUSY;
-- 
1.6.0.2.GIT

