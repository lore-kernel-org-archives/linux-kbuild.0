Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:57710 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752177Ab0INDwQ convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Sep 2010 23:52:16 -0400
From: Ben Hutchings <ben@decadent.org.uk>
In-Reply-To: <4C8E3B15.2040807@suse.cz>
References: <20100913143830.GK2919@stro.at>  <4C8E3B15.2040807@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Date: Tue, 14 Sep 2010 04:52:10 +0100
Message-ID: <1284436330.5323.746.camel@localhost>
Mime-Version: 1.0
Subject: [PATCH 2/2] Kbuild: kconfig: Verbose version of --listnewconfig
 and --defconfig
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: maximilian attems <max@stro.at>, linux-kbuild@vger.kernel.org, Bastian Blank <waldi@debian.org>

If the KBUILD_VERBOSE environment variable is set to non-zero, show
the default values of new symbols and not just their names.

Also do that for --defconfig if KBUILD_VERBOSE is set.

Based on work by Bastian Blank <waldi@debian.org> and
maximilian attems <max@stro.at>.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
This should work as a substitute for Debian's reportoldconfig.

Ben.

 scripts/kconfig/conf.c     |   97 +++++++++++++++++++++++++++++++++++++++-----
 scripts/kconfig/confdata.c |    1 +
 scripts/kconfig/expr.h     |    2 +
 3 files changed, 90 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 6968f5b..5bc4e16 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -35,6 +35,8 @@ enum input_mode {
 	oldnoconfig,
 } input_mode = oldaskconfig;
 
+static bool verbose;
+
 char *defconfig_file;
 
 static int indent = 1;
@@ -363,7 +365,6 @@ static void conf(struct menu *menu)
 		switch (prop->type) {
 		case P_MENU:
 			if ((input_mode == silentoldconfig ||
-			     input_mode == listnewconfig ||
 			     input_mode == oldnoconfig) &&
 			    rootEntry != menu) {
 				check_conf(menu);
@@ -423,11 +424,7 @@ static void check_conf(struct menu *menu)
 	if (sym && !sym_has_value(sym)) {
 		if (sym_is_changable(sym) ||
 		    (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes)) {
-			if (input_mode == listnewconfig) {
-				if (sym->name && !sym_is_choice_value(sym)) {
-					printf("CONFIG_%s\n", sym->name);
-				}
-			} else if (input_mode != oldnoconfig) {
+			if (input_mode != oldnoconfig) {
 				if (!conf_cnt++)
 					printf(_("*\n* Restart config...\n*\n"));
 				rootEntry = menu_get_parent_menu(menu);
@@ -440,6 +437,78 @@ static void check_conf(struct menu *menu)
 		check_conf(child);
 }
 
+static void report_conf(struct menu *menu)
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
+                        default:
+                                break;
+			}
+		} else {
+			printf("CONFIG_%s\n", sym->name);
+		}
+	}
+
+	for (child = menu->list; child; child = child->next)
+		report_conf(child);
+}
+
 static struct option long_opts[] = {
 	{"oldaskconfig",    no_argument,       NULL, oldaskconfig},
 	{"oldconfig",       no_argument,       NULL, oldconfig},
@@ -460,12 +529,17 @@ int main(int ac, char **av)
 {
 	int opt;
 	const char *name;
+	const char *value;
 	struct stat tmpstat;
 
 	setlocale(LC_ALL, "");
 	bindtextdomain(PACKAGE, LOCALEDIR);
 	textdomain(PACKAGE);
 
+	value = getenv("KBUILD_VERBOSE");
+	if (value && atoi(value))
+		verbose = true;
+
 	while ((opt = getopt_long(ac, av, "", long_opts, NULL)) != -1) {
 		input_mode = (enum input_mode)opt;
 		switch (opt) {
@@ -596,6 +670,8 @@ int main(int ac, char **av)
 		break;
 	case defconfig:
 		conf_set_all_new_symbols(def_default);
+		if (verbose)
+			report_conf(&rootmenu);
 		break;
 	case savedefconfig:
 		break;
@@ -605,16 +681,17 @@ int main(int ac, char **av)
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
+		report_conf(&rootmenu);
 		break;
 	}
 
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index dc11d51..c626060 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -992,6 +992,7 @@ void conf_set_all_new_symbols(enum conf_def_mode mode)
 	for_all_symbols(i, sym) {
 		if (sym_has_value(sym))
 			continue;
+		sym->flags |= SYMBOL_NEW;
 		switch (sym_get_type(sym)) {
 		case S_BOOLEAN:
 		case S_TRISTATE:
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 6ee2e4f..c8f1934 100644
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
1.7.1


-- 
Ben Hutchings
Once a job is fouled up, anything done to improve it makes it worse.
