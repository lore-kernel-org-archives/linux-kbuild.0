Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:53915 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753057AbZGLIM3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 Jul 2009 04:12:29 -0400
From: Cheng Renquan <crq@kernel.org>
Subject: [PATCH 6/6] make use of menu_get_ext_help in "make config"
Date: Sun, 12 Jul 2009 16:11:48 +0800
Message-Id: <1247386308-19628-7-git-send-email-crq@kernel.org>
In-Reply-To: <1247386308-19628-6-git-send-email-crq@kernel.org>
References: <1247386308-19628-1-git-send-email-crq@kernel.org>
 <1247386308-19628-2-git-send-email-crq@kernel.org>
 <1247386308-19628-3-git-send-email-crq@kernel.org>
 <1247386308-19628-4-git-send-email-crq@kernel.org>
 <1247386308-19628-5-git-send-email-crq@kernel.org>
 <1247386308-19628-6-git-send-email-crq@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, crquan@gmail.com

From: Cheng Renquan <crquan@gmail.com>

Signed-off-by: Cheng Renquan <crquan@gmail.com>
---
 scripts/kconfig/conf.c |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 3baaaec..5de3303 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -38,14 +38,14 @@ static int conf_cnt;
 static char line[128];
 static struct menu *rootEntry;
 
-static char nohelp_text[] = N_("Sorry, no help available for this option yet.\n");
-
-static const char *get_help(struct menu *menu)
+static void print_help(struct menu *menu)
 {
-	if (menu_has_help(menu))
-		return _(menu_get_help(menu));
-	else
-		return nohelp_text;
+	struct gstr help = str_new();
+
+	menu_get_ext_help(menu, &help);
+
+	printf("\n%s\n", str_get(&help));
+	str_free(&help);
 }
 
 static void strip(char *str)
@@ -140,7 +140,7 @@ int conf_string(struct menu *menu)
 		case '?':
 			/* print help */
 			if (line[1] == '\n') {
-				printf("\n%s\n", get_help(menu));
+				print_help(menu);
 				def = NULL;
 				break;
 			}
@@ -220,7 +220,7 @@ static int conf_sym(struct menu *menu)
 		if (sym_set_tristate_value(sym, newval))
 			return 0;
 help:
-		printf("\n%s\n", get_help(menu));
+		print_help(menu);
 	}
 }
 
@@ -307,7 +307,7 @@ static int conf_choice(struct menu *menu)
 			fgets(line, 128, stdin);
 			strip(line);
 			if (line[0] == '?') {
-				printf("\n%s\n", get_help(menu));
+				print_help(menu);
 				continue;
 			}
 			if (!line[0])
@@ -331,7 +331,7 @@ static int conf_choice(struct menu *menu)
 		if (!child)
 			continue;
 		if (line[strlen(line) - 1] == '?') {
-			printf("\n%s\n", get_help(child));
+			print_help(child);
 			continue;
 		}
 		sym_set_choice_value(sym, child->sym);
-- 
1.6.3.3

