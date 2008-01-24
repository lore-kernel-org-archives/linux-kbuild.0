Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37437 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756767AbYAXWEO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:14 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 53/77] kconfig: gettext support for config
Date: Thu, 24 Jan 2008 23:03:34 +0100
Message-Id: <1201212238-4369-53-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: EGRY Gabor <gaboregry1@t-online.hu>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>, Kyle McMartin <kyle@mcmartin.ca>

From: EGRY Gabor <gaboregry1@t-online.hu>

Gettext support for conf.c

[Include locale.h by Kyle].

Signed-off-by: Egry Gabor <gaboregry1@t-online.hu>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
Cc: Kyle McMartin <kyle@mcmartin.ca>
---
 scripts/kconfig/conf.c |   35 ++++++++++++++++++++---------------
 1 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 01c2f35..d1a0368 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -3,6 +3,7 @@
  * Released under the terms of the GNU GPL v2.0.
  */
 
+#include <locale.h>
 #include <ctype.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -40,7 +41,7 @@ static char nohelp_text[] = N_("Sorry, no help available for this option yet.\n"
 static const char *get_help(struct menu *menu)
 {
 	if (menu_has_help(menu))
-		return menu_get_help(menu);
+		return _(menu_get_help(menu));
 	else
 		return nohelp_text;
 }
@@ -78,7 +79,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 	tristate val;
 
 	if (!sym_has_value(sym))
-		printf("(NEW) ");
+		printf(_("(NEW) "));
 
 	line[0] = '\n';
 	line[1] = 0;
@@ -183,7 +184,7 @@ int conf_string(struct menu *menu)
 	const char *def;
 
 	while (1) {
-		printf("%*s%s ", indent - 1, "", menu->prompt->text);
+		printf("%*s%s ", indent - 1, "", _(menu->prompt->text));
 		printf("(%s) ", sym->name);
 		def = sym_get_string_value(sym);
 		if (sym_get_string_value(sym))
@@ -216,7 +217,7 @@ static int conf_sym(struct menu *menu)
 	tristate oldval, newval;
 
 	while (1) {
-		printf("%*s%s ", indent - 1, "", menu->prompt->text);
+		printf("%*s%s ", indent - 1, "", _(menu->prompt->text));
 		if (sym->name)
 			printf("(%s) ", sym->name);
 		type = sym_get_type(sym);
@@ -306,7 +307,7 @@ static int conf_choice(struct menu *menu)
 		case no:
 			return 1;
 		case mod:
-			printf("%*s%s\n", indent - 1, "", menu_get_prompt(menu));
+			printf("%*s%s\n", indent - 1, "", _(menu_get_prompt(menu)));
 			return 0;
 		case yes:
 			break;
@@ -316,7 +317,7 @@ static int conf_choice(struct menu *menu)
 	while (1) {
 		int cnt, def;
 
-		printf("%*s%s\n", indent - 1, "", menu_get_prompt(menu));
+		printf("%*s%s\n", indent - 1, "", _(menu_get_prompt(menu)));
 		def_sym = sym_get_choice_value(sym);
 		cnt = def = 0;
 		line[0] = 0;
@@ -324,7 +325,7 @@ static int conf_choice(struct menu *menu)
 			if (!menu_is_visible(child))
 				continue;
 			if (!child->sym) {
-				printf("%*c %s\n", indent, '*', menu_get_prompt(child));
+				printf("%*c %s\n", indent, '*', _(menu_get_prompt(child)));
 				continue;
 			}
 			cnt++;
@@ -333,14 +334,14 @@ static int conf_choice(struct menu *menu)
 				printf("%*c", indent, '>');
 			} else
 				printf("%*c", indent, ' ');
-			printf(" %d. %s", cnt, menu_get_prompt(child));
+			printf(" %d. %s", cnt, _(menu_get_prompt(child)));
 			if (child->sym->name)
 				printf(" (%s)", child->sym->name);
 			if (!sym_has_value(child->sym))
-				printf(" (NEW)");
+				printf(_(" (NEW)"));
 			printf("\n");
 		}
-		printf("%*schoice", indent - 1, "");
+		printf(_("%*schoice"), indent - 1, "");
 		if (cnt == 1) {
 			printf("[1]: 1\n");
 			goto conf_childs;
@@ -433,7 +434,7 @@ static void conf(struct menu *menu)
 			if (prompt)
 				printf("%*c\n%*c %s\n%*c\n",
 					indent, '*',
-					indent, '*', prompt,
+					indent, '*', _(prompt),
 					indent, '*');
 		default:
 			;
@@ -499,6 +500,10 @@ int main(int ac, char **av)
 	const char *name;
 	struct stat tmpstat;
 
+	setlocale(LC_ALL, "");
+	bindtextdomain(PACKAGE, LOCALEDIR);
+	textdomain(PACKAGE);
+
 	while ((opt = getopt(ac, av, "osdD:nmyrh")) != -1) {
 		switch (opt) {
 		case 'o':
@@ -529,11 +534,11 @@ int main(int ac, char **av)
 			srand(time(NULL));
 			break;
 		case 'h':
-			printf("See README for usage info\n");
+			printf(_("See README for usage info\n"));
 			exit(0);
 			break;
 		default:
-			fprintf(stderr, "See README for usage info\n");
+			fprintf(stderr, _("See README for usage info\n"));
 			exit(1);
 		}
 	}
@@ -549,9 +554,9 @@ int main(int ac, char **av)
 		if (!defconfig_file)
 			defconfig_file = conf_get_default_confname();
 		if (conf_read(defconfig_file)) {
-			printf("***\n"
+			printf(_("***\n"
 				"*** Can't find default configuration \"%s\"!\n"
-				"***\n", defconfig_file);
+				"***\n"), defconfig_file);
 			exit(1);
 		}
 		break;
-- 
1.5.4.rc3.14.g44397

