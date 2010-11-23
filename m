Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:37179 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750699Ab0KWFAF convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Nov 2010 00:00:05 -0500
From: Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Date: Tue, 23 Nov 2010 04:59:57 +0000
Message-ID: <1290488397.6770.1404.camel@localhost>
Mime-Version: 1.0
Subject: [PATCH] Kbuild: kconfig: Verbose version of --listnewconfig
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>

If the KBUILD_VERBOSE environment variable is set to non-zero, show
the default values of new symbols and not just their names.

Based on work by Bastian Blank <waldi@debian.org> and
maximilian attems <max@stro.at>.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/kconfig/conf.c     |   90 +++++++++++++++++++++++++++++++++++++++-----
 scripts/kconfig/confdata.c |    1 +
 scripts/kconfig/expr.h     |    2 +
 3 files changed, 83 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 5459a38..6d37d5c 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -363,7 +363,6 @@ static void conf(struct menu *menu)
 		switch (prop->type) {
 		case P_MENU:
 			if ((input_mode == silentoldconfig ||
-			     input_mode == listnewconfig ||
 			     input_mode == oldnoconfig) &&
 			    rootEntry != menu) {
 				check_conf(menu);
@@ -423,11 +422,7 @@ static void check_conf(struct menu *menu)
 	if (sym && !sym_has_value(sym)) {
 		if (sym_is_changable(sym) ||
 		    (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes)) {
-			if (input_mode == listnewconfig) {
-				if (sym->name && !sym_is_choice_value(sym)) {
-					printf("%s%s\n", CONFIG_, sym->name);
-				}
-			} else if (input_mode != oldnoconfig) {
+			if (input_mode != oldnoconfig) {
 				if (!conf_cnt++)
 					printf(_("*\n* Restart config...\n*\n"));
 				rootEntry = menu_get_parent_menu(menu);
@@ -440,6 +435,78 @@ static void check_conf(struct menu *menu)
 		check_conf(child);
 }
 
+static void report_conf(struct menu *menu, bool verbose)
+{
+	struct symbol *sym;
+	struct menu *child;
+	int l;
+	const char *str;
+
+	if (!menu_is_visible(menu))
+		return;
+
+	if (verbose && menu == &rootmenu) {
+		printf("\n#\n"
+		       "# Changes:\n"
+		       "#\n");
+	}
+
+	sym = menu->sym;
+	if (sym && (sym->flags & SYMBOL_NEW) &&
+	    sym_is_changable(sym) && sym->name && !sym_is_choice_value(sym)) {
+		if (verbose) {
+			switch (sym->type) {
+			case S_BOOLEAN:
+			case S_TRISTATE:
+				switch (sym_get_tristate_value(sym)) {
+				case no:
+					printf("# CONFIG_%s is not set\n", sym->name);
+					break;
+				case mod:
+					printf("CONFIG_%s=m\n", sym->name);
+					break;
+				case yes:
+					printf("CONFIG_%s=y\n", sym->name);
+					break;
+				}
+				break;
+			case S_STRING:
+				str = sym_get_string_value(sym);
+				printf("CONFIG_%s=\"", sym->name);
+				while (1) {
+					l = strcspn(str, "\"\\");
+					if (l) {
+						fwrite(str, l, 1, stdout);
+						str += l;
+					}
+					if (!*str)
+						break;
+					printf("\\%c", *str++);
+				}
+				fputs("\"\n", stdout);
+				break;
+			case S_HEX:
+				str = sym_get_string_value(sym);
+				if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
+					printf("CONFIG_%s=%s\n", sym->name, str);
+					break;
+				}
+			case S_INT:
+				str = sym_get_string_value(sym);
+				printf("CONFIG_%s=%s\n", sym->name, str);
+				break;
+			default:
+				break;
+			}
+		} else {
+			printf("CONFIG_%s\n", sym->name);
+		}
+	}
+
+	for (child = menu->list; child; child = child->next)
+		report_conf(child, verbose);
+}
+
 static struct option long_opts[] = {
 	{"oldaskconfig",    no_argument,       NULL, oldaskconfig},
 	{"oldconfig",       no_argument,       NULL, oldconfig},
@@ -460,6 +527,7 @@ int main(int ac, char **av)
 {
 	int opt;
 	const char *name;
+	const char *value;
 	struct stat tmpstat;
 
 	setlocale(LC_ALL, "");
@@ -604,16 +672,18 @@ int main(int ac, char **av)
 		input_mode = silentoldconfig;
 		/* fall through */
 	case oldconfig:
-	case listnewconfig:
 	case oldnoconfig:
 	case silentoldconfig:
 		/* Update until a loop caused no more changes */
 		do {
 			conf_cnt = 0;
 			check_conf(&rootmenu);
-		} while (conf_cnt &&
-			 (input_mode != listnewconfig &&
-			  input_mode != oldnoconfig));
+		} while (conf_cnt && input_mode != oldnoconfig);
+		break;
+	case listnewconfig:
+		conf_set_all_new_symbols(def_default);
+		value = getenv("KBUILD_VERBOSE");
+		report_conf(&rootmenu, value && atoi(value));
 		break;
 	}
 
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index c06f150..3682ef5 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -1009,6 +1009,7 @@ void conf_set_all_new_symbols(enum conf_def_mode mode)
 	for_all_symbols(i, sym) {
 		if (sym_has_value(sym))
 			continue;
+		sym->flags |= SYMBOL_NEW;
 		switch (sym_get_type(sym)) {
 		case S_BOOLEAN:
 		case S_TRISTATE:
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 184eb6a..b267933 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -108,6 +108,8 @@ struct symbol {
 #define SYMBOL_DEF3       0x40000  /* symbol.def[S_DEF_3] is valid */
 #define SYMBOL_DEF4       0x80000  /* symbol.def[S_DEF_4] is valid */
 
+#define SYMBOL_NEW        0x100000 /* symbol is new (loaded config did not provide a value) */
+
 #define SYMBOL_MAXLENGTH	256
 #define SYMBOL_HASHSIZE		9973
 
-- 
1.7.2.3


