Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:53064 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752394Ab0IKPxz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Sep 2010 11:53:55 -0400
Received: by mail-gw0-f46.google.com with SMTP id 17so1555732gwj.19
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 08:53:55 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 03/15] kconfig: allow build-time definition of the internal config prefix
Date: Sat, 11 Sep 2010 11:51:10 -0400
Message-Id: <1284220282-3500-4-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/conf.c     |    2 +-
 scripts/kconfig/confdata.c |   48 ++++++++++++++++++++++++-------------------
 scripts/kconfig/lkc.h      |    3 ++
 scripts/kconfig/mconf.c    |   10 ++++----
 scripts/kconfig/menu.c     |    2 +-
 scripts/kconfig/nconf.c    |   12 +++++-----
 6 files changed, 43 insertions(+), 34 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 6968f5b..b62d020 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -425,7 +425,7 @@ static void check_conf(struct menu *menu)
 		    (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes)) {
 			if (input_mode == listnewconfig) {
 				if (sym->name && !sym_is_choice_value(sym)) {
-					printf("CONFIG_%s\n", sym->name);
+					printf("%s%s\n", CONFIG_, sym->name);
 				}
 			} else if (input_mode != oldnoconfig) {
 				if (!conf_cnt++)
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index d9181de..9f3c889 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -222,22 +222,22 @@ load:
 		conf_lineno++;
 		sym = NULL;
 		if (line[0] == '#') {
-			if (memcmp(line + 2, "CONFIG_", 7))
+			if (memcmp(line + 2, CONFIG_, strlen(CONFIG_)))
 				continue;
-			p = strchr(line + 9, ' ');
+			p = strchr(line + 2 + strlen(CONFIG_), ' ');
 			if (!p)
 				continue;
 			*p++ = 0;
 			if (strncmp(p, "is not set", 10))
 				continue;
 			if (def == S_DEF_USER) {
-				sym = sym_find(line + 9);
+				sym = sym_find(line + 2 + strlen(CONFIG_));
 				if (!sym) {
 					sym_add_change_count(1);
 					break;
 				}
 			} else {
-				sym = sym_lookup(line + 9, 0);
+				sym = sym_lookup(line + 2 + strlen(CONFIG_), 0);
 				if (sym->type == S_UNKNOWN)
 					sym->type = S_BOOLEAN;
 			}
@@ -253,8 +253,8 @@ load:
 			default:
 				;
 			}
-		} else if (memcmp(line, "CONFIG_", 7) == 0) {
-			p = strchr(line + 7, '=');
+		} else if (memcmp(line, CONFIG_, strlen(CONFIG_)) == 0) {
+			p = strchr(line + strlen(CONFIG_), '=');
 			if (!p)
 				continue;
 			*p++ = 0;
@@ -265,13 +265,13 @@ load:
 					*p2 = 0;
 			}
 			if (def == S_DEF_USER) {
-				sym = sym_find(line + 7);
+				sym = sym_find(line + strlen(CONFIG_));
 				if (!sym) {
 					sym_add_change_count(1);
 					break;
 				}
 			} else {
-				sym = sym_lookup(line + 7, 0);
+				sym = sym_lookup(line + strlen(CONFIG_), 0);
 				if (sym->type == S_UNKNOWN)
 					sym->type = S_OTHER;
 			}
@@ -397,9 +397,9 @@ static void conf_write_string(bool headerfile, const char *name,
 {
 	int l;
 	if (headerfile)
-		fprintf(out, "#define CONFIG_%s \"", name);
+		fprintf(out, "#define %s%s \"", CONFIG_, name);
 	else
-		fprintf(out, "CONFIG_%s=\"", name);
+		fprintf(out, "%s%s=\"", CONFIG_, name);
 
 	while (1) {
 		l = strcspn(str, "\"\\");
@@ -425,13 +425,14 @@ static void conf_write_symbol(struct symbol *sym, enum symbol_type type,
 		switch (sym_get_tristate_value(sym)) {
 		case no:
 			if (write_no)
-				fprintf(out, "# CONFIG_%s is not set\n", sym->name);
+				fprintf(out, "# %s%s is not set\n",
+				    CONFIG_, sym->name);
 			break;
 		case mod:
-			fprintf(out, "CONFIG_%s=m\n", sym->name);
+			fprintf(out, "%s%s=m\n", CONFIG_, sym->name);
 			break;
 		case yes:
-			fprintf(out, "CONFIG_%s=y\n", sym->name);
+			fprintf(out, "%s%s=y\n", CONFIG_, sym->name);
 			break;
 		}
 		break;
@@ -441,7 +442,7 @@ static void conf_write_symbol(struct symbol *sym, enum symbol_type type,
 	case S_HEX:
 	case S_INT:
 		str = sym_get_string_value(sym);
-		fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
+		fprintf(out, "%s%s=%s\n", CONFIG_, sym->name, str);
 		break;
 	case S_OTHER:
 	case S_UNKNOWN:
@@ -832,14 +833,17 @@ int conf_write_autoconf(void)
 			case no:
 				break;
 			case mod:
-				fprintf(tristate, "CONFIG_%s=M\n", sym->name);
-				fprintf(out_h, "#define CONFIG_%s_MODULE 1\n", sym->name);
+				fprintf(tristate, "%s%s=M\n",
+				    CONFIG_, sym->name);
+				fprintf(out_h, "#define %s%s_MODULE 1\n",
+				    CONFIG_, sym->name);
 				break;
 			case yes:
 				if (sym->type == S_TRISTATE)
-					fprintf(tristate, "CONFIG_%s=Y\n",
-							sym->name);
-				fprintf(out_h, "#define CONFIG_%s 1\n", sym->name);
+					fprintf(tristate,"%s%s=Y\n",
+					    CONFIG_, sym->name);
+				fprintf(out_h, "#define %s%s 1\n",
+				    CONFIG_, sym->name);
 				break;
 			}
 			break;
@@ -849,12 +853,14 @@ int conf_write_autoconf(void)
 		case S_HEX:
 			str = sym_get_string_value(sym);
 			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
-				fprintf(out_h, "#define CONFIG_%s 0x%s\n", sym->name, str);
+				fprintf(out_h, "#define %s%s 0x%s\n",
+				    CONFIG_, sym->name, str);
 				break;
 			}
 		case S_INT:
 			str = sym_get_string_value(sym);
-			fprintf(out_h, "#define CONFIG_%s %s\n", sym->name, str);
+			fprintf(out_h, "#define %s%s %s\n",
+			    CONFIG_, sym->name, str);
 			break;
 		default:
 			break;
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index bdf71bd..1b966bf 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -37,6 +37,9 @@ extern "C" {
 #define _(text) gettext(text)
 #define N_(text) (text)
 
+#ifndef CONFIG_
+#define CONFIG_ "CONFIG_"
+#endif
 
 #define TF_COMMAND	0x0001
 #define TF_PARAM	0x0002
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 5c3d0c4..17ba222 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -316,8 +316,8 @@ static void search_conf(void)
 again:
 	dialog_clear();
 	dres = dialog_inputbox(_("Search Configuration Parameter"),
-			      _("Enter CONFIG_ (sub)string to search for "
-				"(with or without \"CONFIG\")"),
+			      _("Enter " CONFIG_ " (sub)string to search for "
+				"(with or without \"" CONFIG_ "\")"),
 			      10, 75, "");
 	switch (dres) {
 	case 0:
@@ -329,10 +329,10 @@ again:
 		return;
 	}
 
-	/* strip CONFIG_ if necessary */
+	/* strip the prefix if necessary */
 	dialog_input = dialog_input_result;
-	if (strncasecmp(dialog_input_result, "CONFIG_", 7) == 0)
-		dialog_input += 7;
+	if (strncasecmp(dialog_input_result, CONFIG_, strlen(CONFIG_)) == 0)
+		dialog_input += strlen(CONFIG_);
 
 	sym_arr = sym_re_search(dialog_input);
 	res = get_relations_str(sym_arr);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 4fb5902..64da30c 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -566,7 +566,7 @@ void menu_get_ext_help(struct menu *menu, struct gstr *help)
 
 	if (menu_has_help(menu)) {
 		if (sym->name) {
-			str_printf(help, "CONFIG_%s:\n\n", sym->name);
+			str_printf(help, "%s%s:\n\n", CONFIG_, sym->name);
 			str_append(help, _(menu_get_help(menu)));
 			str_append(help, "\n");
 		}
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index b8a9f37..da5e45d 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -744,8 +744,8 @@ static void search_conf(void)
 again:
 	dres = dialog_inputbox(main_window,
 			_("Search Configuration Parameter"),
-			_("Enter CONFIG_ (sub)string to search for "
-				"(with or without \"CONFIG\")"),
+			_("Enter " CONFIG_ " (sub)string to search for "
+				"(with or without \"" CONFIG_ "\")"),
 			"", dialog_input_result, 99);
 	switch (dres) {
 	case 0:
@@ -758,10 +758,10 @@ again:
 		return;
 	}
 
-	/* strip CONFIG_ if necessary */
+	/* strip the prefix if necessary */
 	dialog_input = dialog_input_result;
-	if (strncasecmp(dialog_input_result, "CONFIG_", 7) == 0)
-		dialog_input += 7;
+	if (strncasecmp(dialog_input_result, CONFIG_, strlen(CONFIG_)) == 0)
+		dialog_input += strlen(CONFIG_);
 
 	sym_arr = sym_re_search(dialog_input);
 	res = get_relations_str(sym_arr);
@@ -1261,7 +1261,7 @@ static void show_help(struct menu *menu)
 
 	if (menu && menu->sym && menu_has_help(menu)) {
 		if (menu->sym->name) {
-			str_printf(&help, "CONFIG_%s:\n\n", menu->sym->name);
+			str_printf(&help, "%s%s:\n\n", CONFIG_, menu->sym->name);
 			str_append(&help, _(menu_get_help(menu)));
 			str_append(&help, "\n");
 			get_symbol_str(&help, menu->sym);
-- 
1.7.2.30.gc37d7.dirty

