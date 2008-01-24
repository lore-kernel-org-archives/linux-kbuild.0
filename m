Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37484 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756475AbYAXWEB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:01 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 38/77] kconfig: delete unused FILE_ and SYMBOL_ flags
Date: Thu, 24 Jan 2008 23:03:19 +0100
Message-Id: <1201212238-4369-38-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>

The *_PRINTED flags were never used - so delete them.
Do we need them later then we can re-add them.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
---
 scripts/kconfig/expr.h  |    2 --
 scripts/kconfig/gconf.c |    2 --
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index b788997..1ee8b16 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -25,7 +25,6 @@ struct file {
 
 #define FILE_BUSY		0x0001
 #define FILE_SCANNED		0x0002
-#define FILE_PRINTED		0x0004
 
 typedef enum tristate {
 	no, mod, yes
@@ -86,7 +85,6 @@ struct symbol {
 #define SYMBOL_CHECK		0x0008
 #define SYMBOL_CHOICE		0x0010
 #define SYMBOL_CHOICEVAL	0x0020
-#define SYMBOL_PRINTED		0x0040
 #define SYMBOL_VALID		0x0080
 #define SYMBOL_OPTIONAL		0x0100
 #define SYMBOL_WRITE		0x0200
diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 262908c..df910cb 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -119,8 +119,6 @@ const char *dbg_print_flags(int val)
 		strcat(buf, "choice/");
 	if (val & SYMBOL_CHOICEVAL)
 		strcat(buf, "choiceval/");
-	if (val & SYMBOL_PRINTED)
-		strcat(buf, "printed/");
 	if (val & SYMBOL_VALID)
 		strcat(buf, "valid/");
 	if (val & SYMBOL_OPTIONAL)
-- 
1.5.4.rc3.14.g44397

