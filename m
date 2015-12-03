Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:28399 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756467AbbLCB5H (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Dec 2015 20:57:07 -0500
From: Markus Mayer <mmayer@broadcom.com>
Subject: [PATCH] kconfig: allow kconfig to handle longer path names
Date: Wed, 2 Dec 2015 17:56:44 -0800
Message-ID: <1449107804-16625-1-git-send-email-mmayer@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. Morin" <yann.morin.1998@free.fr>
Cc: Linux Kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, Markus Mayer <mmayer@broadcom.com>

The current (arbitrary) limit of 128 for path names has proven too
short for Android builds, as longer path names are used there.

Change conf.c, so it can handle path lengths up to PATH_MAX characters.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 scripts/kconfig/conf.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 6c20431..866369f 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -5,6 +5,7 @@
 
 #include <locale.h>
 #include <ctype.h>
+#include <limits.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -41,7 +42,7 @@ static int tty_stdio;
 static int valid_stdin = 1;
 static int sync_kconfig;
 static int conf_cnt;
-static char line[128];
+static char line[PATH_MAX];
 static struct menu *rootEntry;
 
 static void print_help(struct menu *menu)
@@ -109,7 +110,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 		/* fall through */
 	case oldaskconfig:
 		fflush(stdout);
-		xfgets(line, 128, stdin);
+		xfgets(line, sizeof(line), stdin);
 		if (!tty_stdio)
 			printf("\n");
 		return 1;
@@ -311,7 +312,7 @@ static int conf_choice(struct menu *menu)
 			/* fall through */
 		case oldaskconfig:
 			fflush(stdout);
-			xfgets(line, 128, stdin);
+			xfgets(line, sizeof(line), stdin);
 			strip(line);
 			if (line[0] == '?') {
 				print_help(menu);
-- 
1.9.1

