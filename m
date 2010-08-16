Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:37372 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750797Ab0HPE7o (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 00:59:44 -0400
Received: by gwj17 with SMTP id 17so779354gwj.19
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Aug 2010 21:59:44 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFC 2/2] kbuild: genericizes kbuild's config prefix
Date: Mon, 16 Aug 2010 00:54:17 -0400
Message-Id: <1281934457-4225-3-git-send-email-lacombar@gmail.com>
In-Reply-To: <1281934457-4225-1-git-send-email-lacombar@gmail.com>
References: <1281934457-4225-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/kconfig/confdata.c |   40 ++++++++++++++++++++--------------------
 scripts/kconfig/mconf.c    |   10 +++++-----
 scripts/kconfig/menu.c     |    2 +-
 scripts/kconfig/nconf.c    |   20 ++++++++++----------
 4 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 74327c3..f0f6cdc 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -222,22 +222,22 @@ load:
 		sym = NULL;
 		switch (line[0]) {
 		case '#':
-			if (memcmp(line + 2, "CONFIG_", 7))
+			if (memcmp(line + 2, KBUILD_PREFIX, KBUILD_PREFIX_LEN))
 				continue;
-			p = strchr(line + 9, ' ');
+			p = strchr(line + 2 + KBUILD_PREFIX_LEN, ' ');
 			if (!p)
 				continue;
 			*p++ = 0;
 			if (strncmp(p, "is not set", 10))
 				continue;
 			if (def == S_DEF_USER) {
-				sym = sym_find(line + 9);
+				sym = sym_find(line + 2 + KBUILD_PREFIX_LEN);
 				if (!sym) {
 					sym_add_change_count(1);
 					break;
 				}
 			} else {
-				sym = sym_lookup(line + 9, 0);
+				sym = sym_lookup(line + 2 + KBUILD_PREFIX_LEN, 0);
 				if (sym->type == S_UNKNOWN)
 					sym->type = S_BOOLEAN;
 			}
@@ -255,11 +255,11 @@ load:
 			}
 			break;
 		case 'C':
-			if (memcmp(line, "CONFIG_", 7)) {
+			if (memcmp(line, KBUILD_PREFIX, KBUILD_PREFIX_LEN)) {
 				conf_warning("unexpected data");
 				continue;
 			}
-			p = strchr(line + 7, '=');
+			p = strchr(line + KBUILD_PREFIX_LEN, '=');
 			if (!p)
 				continue;
 			*p++ = 0;
@@ -270,13 +270,13 @@ load:
 					*p2 = 0;
 			}
 			if (def == S_DEF_USER) {
-				sym = sym_find(line + 7);
+				sym = sym_find(line + KBUILD_PREFIX_LEN);
 				if (!sym) {
 					sym_add_change_count(1);
 					break;
 				}
 			} else {
-				sym = sym_lookup(line + 7, 0);
+				sym = sym_lookup(line + KBUILD_PREFIX_LEN, 0);
 				if (sym->type == S_UNKNOWN)
 					sym->type = S_OTHER;
 			}
@@ -405,9 +405,9 @@ static void conf_write_string(bool headerfile, const char *name,
 {
 	int l;
 	if (headerfile)
-		fprintf(out, "#define CONFIG_%s \"", name);
+		fprintf(out, "#define " KBUILD_PREFIX "%s \"", name);
 	else
-		fprintf(out, "CONFIG_%s=\"", name);
+		fprintf(out, KBUILD_PREFIX "%s=\"", name);
 
 	while (1) {
 		l = strcspn(str, "\"\\");
@@ -433,13 +433,13 @@ static void conf_write_symbol(struct symbol *sym, enum symbol_type type,
 		switch (sym_get_tristate_value(sym)) {
 		case no:
 			if (write_no)
-				fprintf(out, "# CONFIG_%s is not set\n", sym->name);
+				fprintf(out, "# " KBUILD_PREFIX "%s is not set\n", sym->name);
 			break;
 		case mod:
-			fprintf(out, "CONFIG_%s=m\n", sym->name);
+			fprintf(out, KBUILD_PREFIX "%s=m\n", sym->name);
 			break;
 		case yes:
-			fprintf(out, "CONFIG_%s=y\n", sym->name);
+			fprintf(out, KBUILD_PREFIX "%s=y\n", sym->name);
 			break;
 		}
 		break;
@@ -449,7 +449,7 @@ static void conf_write_symbol(struct symbol *sym, enum symbol_type type,
 	case S_HEX:
 	case S_INT:
 		str = sym_get_string_value(sym);
-		fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
+		fprintf(out, KBUILD_PREFIX "%s=%s\n", sym->name, str);
 		break;
 	case S_OTHER:
 	case S_UNKNOWN:
@@ -838,14 +838,14 @@ int conf_write_autoconf(void)
 			case no:
 				break;
 			case mod:
-				fprintf(tristate, "CONFIG_%s=M\n", sym->name);
-				fprintf(out_h, "#define CONFIG_%s_MODULE 1\n", sym->name);
+				fprintf(tristate, KBUILD_PREFIX "%s=M\n", sym->name);
+				fprintf(out_h, "#define " KBUILD_PREFIX "%s_MODULE 1\n", sym->name);
 				break;
 			case yes:
 				if (sym->type == S_TRISTATE)
-					fprintf(tristate, "CONFIG_%s=Y\n",
+					fprintf(tristate, KBUILD_PREFIX "%s=Y\n",
 							sym->name);
-				fprintf(out_h, "#define CONFIG_%s 1\n", sym->name);
+				fprintf(out_h, "#define " KBUILD_PREFIX "%s 1\n", sym->name);
 				break;
 			}
 			break;
@@ -855,12 +855,12 @@ int conf_write_autoconf(void)
 		case S_HEX:
 			str = sym_get_string_value(sym);
 			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
-				fprintf(out_h, "#define CONFIG_%s 0x%s\n", sym->name, str);
+				fprintf(out_h, "#define " KBUILD_PREFIX "%s 0x%s\n", sym->name, str);
 				break;
 			}
 		case S_INT:
 			str = sym_get_string_value(sym);
-			fprintf(out_h, "#define CONFIG_%s %s\n", sym->name, str);
+			fprintf(out_h, "#define " KBUILD_PREFIX "%s %s\n", sym->name, str);
 			break;
 		default:
 			break;
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index c2caf0c..b9b08cd 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -232,7 +232,7 @@ save_config_help[] = N_(
 	"leave this blank.\n"),
 search_help[] = N_(
 	"\n"
-	"Search for CONFIG_ symbols and display their relations.\n"
+	"Search for " KBUILD_PREFIX " symbols and display their relations.\n"
 	"Regular expressions are allowed.\n"
 	"Example: search for \"^FOO\"\n"
 	"Result:\n"
@@ -249,7 +249,7 @@ search_help[] = N_(
 	"Selected by: BAR\n"
 	"-----------------------------------------------------------------\n"
 	"o The line 'Prompt:' shows the text used in the menu structure for\n"
-	"  this CONFIG_ symbol\n"
+	"  this " KBUILD_PREFIX " symbol\n"
 	"o The 'Defined at' line tell at what file / line number the symbol\n"
 	"  is defined\n"
 	"o The 'Depends on:' line tell what symbols needs to be defined for\n"
@@ -316,7 +316,7 @@ static void search_conf(void)
 again:
 	dialog_clear();
 	dres = dialog_inputbox(_("Search Configuration Parameter"),
-			      _("Enter CONFIG_ (sub)string to search for "
+			      _("Enter " KBUILD_PREFIX " (sub)string to search for "
 				"(with or without \"CONFIG\")"),
 			      10, 75, "");
 	switch (dres) {
@@ -329,9 +329,9 @@ again:
 		return;
 	}
 
-	/* strip CONFIG_ if necessary */
+	/* strip the prefix if necessary */
 	dialog_input = dialog_input_result;
-	if (strncasecmp(dialog_input_result, "CONFIG_", 7) == 0)
+	if (strncasecmp(dialog_input_result, KBUILD_PREFIX, KBUILD_PREFIX_LEN) == 0)
 		dialog_input += 7;
 
 	sym_arr = sym_re_search(dialog_input);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 4fb5902..b4800d8 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -566,7 +566,7 @@ void menu_get_ext_help(struct menu *menu, struct gstr *help)
 
 	if (menu_has_help(menu)) {
 		if (sym->name) {
-			str_printf(help, "CONFIG_%s:\n\n", sym->name);
+			str_printf(help, KBUILD_PREFIX "%s:\n\n", sym->name);
 			str_append(help, _(menu_get_help(menu)));
 			str_append(help, "\n");
 		}
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index f5550a9..6cb19dc 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -210,7 +210,7 @@ save_config_help[] = N_(
 "leave this blank.\n"),
 search_help[] = N_(
 "\n"
-"Search for CONFIG_ symbols and display their relations.\n"
+"Search for " KBUILD_PREFIX " symbols and display their relations.\n"
 "Regular expressions are allowed.\n"
 "Example: search for \"^FOO\"\n"
 "Result:\n"
@@ -227,7 +227,7 @@ search_help[] = N_(
 "Selected by: BAR\n"
 "-----------------------------------------------------------------\n"
 "o The line 'Prompt:' shows the text used in the menu structure for\n"
-"  this CONFIG_ symbol\n"
+"  this " KBUILD_PREFIX " symbol\n"
 "o The 'Defined at' line tell at what file / line number the symbol\n"
 "  is defined\n"
 "o The 'Depends on:' line tell what symbols needs to be defined for\n"
@@ -243,9 +243,9 @@ search_help[] = N_(
 "Only relevant lines are shown.\n"
 "\n\n"
 "Search examples:\n"
-"Examples: USB   = > find all CONFIG_ symbols containing USB\n"
-"          ^USB => find all CONFIG_ symbols starting with USB\n"
-"          USB$ => find all CONFIG_ symbols ending with USB\n"
+"Examples: USB   = > find all " KBUILD_PREFIX " symbols containing USB\n"
+"          ^USB => find all " KBUILD_PREFIX " symbols starting with USB\n"
+"          USB$ => find all " KBUILD_PREFIX " symbols ending with USB\n"
 "\n");
 
 struct mitem {
@@ -800,8 +800,8 @@ static void search_conf(void)
 again:
 	dres = dialog_inputbox(main_window,
 			_("Search Configuration Parameter"),
-			_("Enter CONFIG_ (sub)string to search for "
-				"(with or without \"CONFIG\")"),
+			_("Enter " KBUILD_PREFIX " (sub)string to search for "
+				"(with or without \"" KBUILD_PREFIX "\")"),
 			"", dialog_input_result, 99);
 	switch (dres) {
 	case 0:
@@ -814,9 +814,9 @@ again:
 		return;
 	}
 
-	/* strip CONFIG_ if necessary */
+	/* strip the prefix if necessary */
 	dialog_input = dialog_input_result;
-	if (strncasecmp(dialog_input_result, "CONFIG_", 7) == 0)
+	if (strncasecmp(dialog_input_result, KBUILD_PREFIX, KBUILD_PREFIX_LEN) == 0)
 		dialog_input += 7;
 
 	sym_arr = sym_re_search(dialog_input);
@@ -1246,7 +1246,7 @@ static void show_help(struct menu *menu)
 
 	if (menu && menu->sym && menu_has_help(menu)) {
 		if (menu->sym->name) {
-			str_printf(&help, "CONFIG_%s:\n\n", menu->sym->name);
+			str_printf(&help, KBUILD_PREFIX "%s:\n\n", menu->sym->name);
 			str_append(&help, _(menu_get_help(menu)));
 			str_append(&help, "\n");
 			get_symbol_str(&help, menu->sym);
-- 
1.7.2.30.gc37d7.dirty

