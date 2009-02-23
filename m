Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ti-out-0910.google.com ([209.85.142.188]:24359 "EHLO
	ti-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755625AbZBWPKb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Feb 2009 10:10:31 -0500
From: Cheng Renquan <crquan@gmail.com>
Subject: [PATCH 6/6] [KBUILD] make use of menu_get_ext_help in "make config"
Date: Mon, 23 Feb 2009 23:10:04 +0800
Message-Id: <1235401804-8136-7-git-send-email-crquan@gmail.com>
In-Reply-To: <1235401804-8136-6-git-send-email-crquan@gmail.com>
References: <1235401804-8136-1-git-send-email-crquan@gmail.com>
 <1235401804-8136-2-git-send-email-crquan@gmail.com>
 <1235401804-8136-3-git-send-email-crquan@gmail.com>
 <1235401804-8136-4-git-send-email-crquan@gmail.com>
 <1235401804-8136-5-git-send-email-crquan@gmail.com>
 <1235401804-8136-6-git-send-email-crquan@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, cr_quan@163.com

Signed-off-by: Cheng Renquan <crquan@gmail.com>
---
 scripts/kconfig/conf.c |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 3e1057f..8ec35c9 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -37,14 +37,14 @@ static int conf_cnt;
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
@@ -139,7 +139,7 @@ int conf_string(struct menu *menu)
 		case '?':
 			/* print help */
 			if (line[1] == '\n') {
-				printf("\n%s\n", get_help(menu));
+				print_help(menu);
 				def = NULL;
 				break;
 			}
@@ -219,7 +219,7 @@ static int conf_sym(struct menu *menu)
 		if (sym_set_tristate_value(sym, newval))
 			return 0;
 help:
-		printf("\n%s\n", get_help(menu));
+		print_help(menu);
 	}
 }
 
@@ -306,7 +306,7 @@ static int conf_choice(struct menu *menu)
 			fgets(line, 128, stdin);
 			strip(line);
 			if (line[0] == '?') {
-				printf("\n%s\n", get_help(menu));
+				print_help(menu);
 				continue;
 			}
 			if (!line[0])
@@ -330,7 +330,7 @@ static int conf_choice(struct menu *menu)
 		if (!child)
 			continue;
 		if (line[strlen(line) - 1] == '?') {
-			printf("\n%s\n", get_help(child));
+			print_help(child);
 			continue;
 		}
 		sym_set_choice_value(sym, child->sym);
-- 
1.6.0.6

