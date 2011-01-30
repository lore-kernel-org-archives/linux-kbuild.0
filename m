Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:45474 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754924Ab1A3XP3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 30 Jan 2011 18:15:29 -0500
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: [PATCH 2/2] kconfig: get rid of unused flags
Date: Mon, 31 Jan 2011 00:15:21 +0100
Message-Id: <1296429321-6991-3-git-send-email-yann.morin.1998@anciens.enib.fr>
In-Reply-To: <1296429321-6991-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1296429321-6991-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Now that we detect recusrion of sourced files, get rid of
now unused flags.

Regenerate _shipped files.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 scripts/kconfig/expr.h              |    4 ----
 scripts/kconfig/lex.zconf.c_shipped |    4 ----
 scripts/kconfig/zconf.l             |    4 ----
 3 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 184eb6a..3d73a98 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -20,12 +20,8 @@ struct file {
 	struct file *parent;
 	const char *name;
 	int lineno;
-	int flags;
 };
 
-#define FILE_BUSY		0x0001
-#define FILE_SCANNED		0x0002
-
 typedef enum tristate {
 	no, mod, yes
 } tristate;
diff --git a/scripts/kconfig/lex.zconf.c_shipped b/scripts/kconfig/lex.zconf.c_shipped
index f4b3b1a..d918291 100644
--- a/scripts/kconfig/lex.zconf.c_shipped
+++ b/scripts/kconfig/lex.zconf.c_shipped
@@ -2363,7 +2363,6 @@ void zconf_initscan(const char *name)
 
 	current_file = file_lookup(name);
 	current_file->lineno = 1;
-	current_file->flags = FILE_BUSY;
 }
 
 void zconf_nextfile(const char *name)
@@ -2403,7 +2402,6 @@ void zconf_nextfile(const char *name)
 			exit(1);
 		}
 	}
-	file->flags |= FILE_BUSY;
 	file->lineno = 1;
 	file->parent = current_file;
 	current_file = file;
@@ -2413,8 +2411,6 @@ static void zconf_endfile(void)
 {
 	struct buffer *parent;
 
-	current_file->flags |= FILE_SCANNED;
-	current_file->flags &= ~FILE_BUSY;
 	current_file = current_file->parent;
 
 	parent = current_buf->parent;
diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index f23e3af..b22f884 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -294,7 +294,6 @@ void zconf_initscan(const char *name)
 
 	current_file = file_lookup(name);
 	current_file->lineno = 1;
-	current_file->flags = FILE_BUSY;
 }
 
 void zconf_nextfile(const char *name)
@@ -334,7 +333,6 @@ void zconf_nextfile(const char *name)
 			exit(1);
 		}
 	}
-	file->flags |= FILE_BUSY;
 	file->lineno = 1;
 	file->parent = current_file;
 	current_file = file;
@@ -344,8 +342,6 @@ static void zconf_endfile(void)
 {
 	struct buffer *parent;
 
-	current_file->flags |= FILE_SCANNED;
-	current_file->flags &= ~FILE_BUSY;
 	current_file = current_file->parent;
 
 	parent = current_buf->parent;
-- 
1.7.1

