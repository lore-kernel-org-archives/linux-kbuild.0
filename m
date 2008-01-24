Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37484 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754183AbYAXWEN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:13 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 56/77] kconfig: environment symbol support
Date: Thu, 24 Jan 2008 23:03:37 +0100
Message-Id: <1201212238-4369-56-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Roman Zippel <zippel@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>

From: Roman Zippel <zippel@linux-m68k.org>

Add the possibility to import a value from the environment into kconfig
via the option syntax. Beside flexibility this has the advantage
providing proper dependencies.
Documented the options syntax.

Signed-off-by: Roman Zippel <zippel@linux-m68k.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 Documentation/kbuild/kconfig-language.txt |   21 +++++++++++++
 scripts/kconfig/expr.h                    |    3 +-
 scripts/kconfig/lkc.h                     |    5 +++
 scripts/kconfig/menu.c                    |    5 ++-
 scripts/kconfig/qconf.cc                  |   16 +++-------
 scripts/kconfig/symbol.c                  |   45 +++++++++++++++++++++++++++++
 scripts/kconfig/util.c                    |   23 +++++++++++++-
 scripts/kconfig/zconf.gperf               |    1 +
 scripts/kconfig/zconf.hash.c_shipped      |   45 ++++++++++++++++-------------
 9 files changed, 129 insertions(+), 35 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
index 53ca12f..a43fcc6 100644
--- a/Documentation/kbuild/kconfig-language.txt
+++ b/Documentation/kbuild/kconfig-language.txt
@@ -127,6 +127,27 @@ applicable everywhere (see syntax).
   used to help visually separate configuration logic from help within
   the file as an aid to developers.
 
+- misc options: "option" <symbol>[=<value>]
+  Various less common options can be defined via this option syntax,
+  which can modify the behaviour of the menu entry and its config
+  symbol. These options are currently possible:
+
+  - "defconfig_list"
+    This declares a list of default entries which can be used when
+    looking for the default configuration (which is used when the main
+    .config doesn't exists yet.)
+
+  - "modules"
+    This declares the symbol to be used as the MODULES symbol, which
+    enables the third modular state for all config symbols.
+
+  - "env"=<value>
+    This imports the environment variable into Kconfig. It behaves like
+    a default, except that the value comes from the environment, this
+    also means that the behaviour when mixing it with normal defaults is
+    undefined at this point. The symbol is currently not exported back
+    to the build environment (if this is desired, it can be done via
+    another symbol).
 
 Menu dependencies
 -----------------
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index b6f922c..9d4cba1 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -106,7 +106,8 @@ struct symbol {
 #define SYMBOL_HASHMASK		0xff
 
 enum prop_type {
-	P_UNKNOWN, P_PROMPT, P_COMMENT, P_MENU, P_DEFAULT, P_CHOICE, P_SELECT, P_RANGE
+	P_UNKNOWN, P_PROMPT, P_COMMENT, P_MENU, P_DEFAULT, P_CHOICE,
+	P_SELECT, P_RANGE, P_ENV
 };
 
 struct property {
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 8a07ee4..4bc68f2 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -44,6 +44,7 @@ extern "C" {
 
 #define T_OPT_MODULES		1
 #define T_OPT_DEFCONFIG_LIST	2
+#define T_OPT_ENV		3
 
 struct kconf_id {
 	int name;
@@ -74,6 +75,7 @@ void kconfig_load(void);
 
 /* menu.c */
 void menu_init(void);
+void menu_warn(struct menu *menu, const char *fmt, ...);
 struct menu *menu_add_menu(void);
 void menu_end_menu(void);
 void menu_add_entry(struct symbol *sym);
@@ -103,6 +105,8 @@ void str_printf(struct gstr *gs, const char *fmt, ...);
 const char *str_get(struct gstr *gs);
 
 /* symbol.c */
+extern struct expr *sym_env_list;
+
 void sym_init(void);
 void sym_clear_all_valid(void);
 void sym_set_all_changed(void);
@@ -110,6 +114,7 @@ void sym_set_changed(struct symbol *sym);
 struct symbol *sym_check_deps(struct symbol *sym);
 struct property *prop_alloc(enum prop_type type, struct symbol *sym);
 struct symbol *prop_get_symbol(struct property *prop);
+struct property *sym_get_env_prop(struct symbol *sym);
 
 static inline tristate sym_get_tristate_value(struct symbol *sym)
 {
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 3637d10..e6ef171 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -15,7 +15,7 @@ static struct menu **last_entry_ptr;
 struct file *file_list;
 struct file *current_file;
 
-static void menu_warn(struct menu *menu, const char *fmt, ...)
+void menu_warn(struct menu *menu, const char *fmt, ...)
 {
 	va_list ap;
 	va_start(ap, fmt);
@@ -172,6 +172,9 @@ void menu_add_option(int token, char *arg)
 		else if (sym_defconfig_list != current_entry->sym)
 			zconf_error("trying to redefine defconfig symbol");
 		break;
+	case T_OPT_ENV:
+		prop_add_env(arg);
+		break;
 	}
 }
 
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 9fe27ca..5d0fd38 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1088,7 +1088,11 @@ QString ConfigInfoView::debug_info(struct symbol *sym)
 			debug += "</a><br>";
 			break;
 		case P_DEFAULT:
-			debug += "default: ";
+		case P_SELECT:
+		case P_RANGE:
+		case P_ENV:
+			debug += prop_get_type_name(prop->type);
+			debug += ": ";
 			expr_print(prop->expr, expr_print_help, &debug, E_NONE);
 			debug += "<br>";
 			break;
@@ -1099,16 +1103,6 @@ QString ConfigInfoView::debug_info(struct symbol *sym)
 				debug += "<br>";
 			}
 			break;
-		case P_SELECT:
-			debug += "select: ";
-			expr_print(prop->expr, expr_print_help, &debug, E_NONE);
-			debug += "<br>";
-			break;
-		case P_RANGE:
-			debug += "range: ";
-			expr_print(prop->expr, expr_print_help, &debug, E_NONE);
-			debug += "<br>";
-			break;
 		default:
 			debug += "unknown property: ";
 			debug += prop_get_type_name(prop->type);
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index a7dfc82..99e3d02 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -34,6 +34,8 @@ struct symbol *sym_defconfig_list;
 struct symbol *modules_sym;
 tristate modules_val;
 
+struct expr *sym_env_list;
+
 void sym_add_default(struct symbol *sym, const char *def)
 {
 	struct property *prop = prop_alloc(P_DEFAULT, sym);
@@ -117,6 +119,15 @@ struct property *sym_get_choice_prop(struct symbol *sym)
 	return NULL;
 }
 
+struct property *sym_get_env_prop(struct symbol *sym)
+{
+	struct property *prop;
+
+	for_all_properties(sym, prop, P_ENV)
+		return prop;
+	return NULL;
+}
+
 struct property *sym_get_default_prop(struct symbol *sym)
 {
 	struct property *prop;
@@ -346,6 +357,9 @@ void sym_calc_value(struct symbol *sym)
 		;
 	}
 
+	if (sym->flags & SYMBOL_AUTO)
+		sym->flags &= ~SYMBOL_WRITE;
+
 	sym->curr = newval;
 	if (sym_is_choice(sym) && newval.tri == yes)
 		sym->curr.val = sym_calc_choice(sym);
@@ -860,6 +874,8 @@ const char *prop_get_type_name(enum prop_type type)
 	switch (type) {
 	case P_PROMPT:
 		return "prompt";
+	case P_ENV:
+		return "env";
 	case P_COMMENT:
 		return "comment";
 	case P_MENU:
@@ -877,3 +893,32 @@ const char *prop_get_type_name(enum prop_type type)
 	}
 	return "unknown";
 }
+
+void prop_add_env(const char *env)
+{
+	struct symbol *sym, *sym2;
+	struct property *prop;
+	char *p;
+
+	sym = current_entry->sym;
+	sym->flags |= SYMBOL_AUTO;
+	for_all_properties(sym, prop, P_ENV) {
+		sym2 = prop_get_symbol(prop);
+		if (strcmp(sym2->name, env))
+			menu_warn(current_entry, "redefining environment symbol from %s",
+				  sym2->name);
+		return;
+	}
+
+	prop = prop_alloc(P_ENV, sym);
+	prop->expr = expr_alloc_symbol(sym_lookup(env, 1));
+
+	sym_env_list = expr_alloc_one(E_LIST, sym_env_list);
+	sym_env_list->right.sym = sym;
+
+	p = getenv(env);
+	if (p)
+		sym_add_default(sym, p);
+	else
+		menu_warn(current_entry, "environment variable %s undefined", env);
+}
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index e1cad92..f8e73c0 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -29,6 +29,8 @@ struct file *file_lookup(const char *name)
 /* write a dependency file as used by kbuild to track dependencies */
 int file_write_dep(const char *name)
 {
+	struct symbol *sym, *env_sym;
+	struct expr *e;
 	struct file *file;
 	FILE *out;
 
@@ -45,8 +47,25 @@ int file_write_dep(const char *name)
 			fprintf(out, "\t%s\n", file->name);
 	}
 	fprintf(out, "\ninclude/config/auto.conf: \\\n"
-		     "\t$(deps_config)\n\n"
-		     "$(deps_config): ;\n");
+		     "\t$(deps_config)\n\n");
+
+	expr_list_for_each_sym(sym_env_list, e, sym) {
+		struct property *prop;
+		const char *value;
+
+		prop = sym_get_env_prop(sym);
+		env_sym = prop_get_symbol(prop);
+		if (!env_sym)
+			continue;
+		value = getenv(env_sym->name);
+		if (!value)
+			value = "";
+		fprintf(out, "ifneq \"$(%s)\" \"%s\"\n", env_sym->name, value);
+		fprintf(out, "include/config/auto.conf: FORCE\n");
+		fprintf(out, "endif\n");
+	}
+
+	fprintf(out, "\n$(deps_config): ;\n");
 	fclose(out);
 	rename("..config.tmp", name);
 	return 0;
diff --git a/scripts/kconfig/zconf.gperf b/scripts/kconfig/zconf.gperf
index 93538e5..4051639 100644
--- a/scripts/kconfig/zconf.gperf
+++ b/scripts/kconfig/zconf.gperf
@@ -41,4 +41,5 @@ option,		T_OPTION,	TF_COMMAND
 on,		T_ON,		TF_PARAM
 modules,	T_OPT_MODULES,	TF_OPTION
 defconfig_list,	T_OPT_DEFCONFIG_LIST,TF_OPTION
+env,		T_OPT_ENV,	TF_OPTION
 %%
diff --git a/scripts/kconfig/zconf.hash.c_shipped b/scripts/kconfig/zconf.hash.c_shipped
index ab28b18..c9d26bc 100644
--- a/scripts/kconfig/zconf.hash.c_shipped
+++ b/scripts/kconfig/zconf.hash.c_shipped
@@ -53,10 +53,10 @@ kconf_id_hash (register const char *str, register unsigned int len)
       49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
       49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
       49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 18, 11,  5,
+      49, 49, 49, 49, 49, 49, 49, 35, 35,  5,
        0,  0,  5, 49,  5, 20, 49, 49,  5, 20,
-       5,  0, 30, 49,  0, 15,  0, 10, 49, 49,
-      25, 49, 49, 49, 49, 49, 49, 49, 49, 49,
+       5,  0, 30, 49,  0, 15,  0, 10,  0, 49,
+      10, 49, 49, 49, 49, 49, 49, 49, 49, 49,
       49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
       49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
       49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
@@ -89,6 +89,7 @@ kconf_id_hash (register const char *str, register unsigned int len)
 struct kconf_id_strings_t
   {
     char kconf_id_strings_str2[sizeof("on")];
+    char kconf_id_strings_str3[sizeof("env")];
     char kconf_id_strings_str5[sizeof("endif")];
     char kconf_id_strings_str6[sizeof("option")];
     char kconf_id_strings_str7[sizeof("endmenu")];
@@ -99,30 +100,31 @@ struct kconf_id_strings_t
     char kconf_id_strings_str12[sizeof("default")];
     char kconf_id_strings_str13[sizeof("def_bool")];
     char kconf_id_strings_str14[sizeof("help")];
-    char kconf_id_strings_str15[sizeof("bool")];
     char kconf_id_strings_str16[sizeof("config")];
     char kconf_id_strings_str17[sizeof("def_tristate")];
-    char kconf_id_strings_str18[sizeof("boolean")];
+    char kconf_id_strings_str18[sizeof("hex")];
     char kconf_id_strings_str19[sizeof("defconfig_list")];
     char kconf_id_strings_str21[sizeof("string")];
     char kconf_id_strings_str22[sizeof("if")];
     char kconf_id_strings_str23[sizeof("int")];
-    char kconf_id_strings_str24[sizeof("enable")];
     char kconf_id_strings_str26[sizeof("select")];
     char kconf_id_strings_str27[sizeof("modules")];
     char kconf_id_strings_str28[sizeof("tristate")];
     char kconf_id_strings_str29[sizeof("menu")];
     char kconf_id_strings_str31[sizeof("source")];
     char kconf_id_strings_str32[sizeof("comment")];
-    char kconf_id_strings_str33[sizeof("hex")];
     char kconf_id_strings_str35[sizeof("menuconfig")];
     char kconf_id_strings_str36[sizeof("prompt")];
     char kconf_id_strings_str37[sizeof("depends")];
+    char kconf_id_strings_str39[sizeof("bool")];
+    char kconf_id_strings_str41[sizeof("enable")];
+    char kconf_id_strings_str42[sizeof("boolean")];
     char kconf_id_strings_str48[sizeof("mainmenu")];
   };
 static struct kconf_id_strings_t kconf_id_strings_contents =
   {
     "on",
+    "env",
     "endif",
     "option",
     "endmenu",
@@ -133,25 +135,25 @@ static struct kconf_id_strings_t kconf_id_strings_contents =
     "default",
     "def_bool",
     "help",
-    "bool",
     "config",
     "def_tristate",
-    "boolean",
+    "hex",
     "defconfig_list",
     "string",
     "if",
     "int",
-    "enable",
     "select",
     "modules",
     "tristate",
     "menu",
     "source",
     "comment",
-    "hex",
     "menuconfig",
     "prompt",
     "depends",
+    "bool",
+    "enable",
+    "boolean",
     "mainmenu"
   };
 #define kconf_id_strings ((const char *) &kconf_id_strings_contents)
@@ -163,7 +165,7 @@ kconf_id_lookup (register const char *str, register unsigned int len)
 {
   enum
     {
-      TOTAL_KEYWORDS = 31,
+      TOTAL_KEYWORDS = 32,
       MIN_WORD_LENGTH = 2,
       MAX_WORD_LENGTH = 14,
       MIN_HASH_VALUE = 2,
@@ -174,7 +176,8 @@ kconf_id_lookup (register const char *str, register unsigned int len)
     {
       {-1}, {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str2,		T_ON,		TF_PARAM},
-      {-1}, {-1},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str3,		T_OPT_ENV,	TF_OPTION},
+      {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str5,		T_ENDIF,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str6,		T_OPTION,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str7,	T_ENDMENU,	TF_COMMAND},
@@ -185,17 +188,16 @@ kconf_id_lookup (register const char *str, register unsigned int len)
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str12,	T_DEFAULT,	TF_COMMAND, S_UNKNOWN},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str13,	T_DEFAULT,	TF_COMMAND, S_BOOLEAN},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str14,		T_HELP,		TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str15,		T_TYPE,		TF_COMMAND, S_BOOLEAN},
+      {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str16,		T_CONFIG,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str17,	T_DEFAULT,	TF_COMMAND, S_TRISTATE},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str18,	T_TYPE,		TF_COMMAND, S_BOOLEAN},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str18,		T_TYPE,		TF_COMMAND, S_HEX},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str19,	T_OPT_DEFCONFIG_LIST,TF_OPTION},
       {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str21,		T_TYPE,		TF_COMMAND, S_STRING},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str22,		T_IF,		TF_COMMAND|TF_PARAM},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str23,		T_TYPE,		TF_COMMAND, S_INT},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str24,		T_SELECT,	TF_COMMAND},
-      {-1},
+      {-1}, {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str26,		T_SELECT,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str27,	T_OPT_MODULES,	TF_OPTION},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str28,	T_TYPE,		TF_COMMAND, S_TRISTATE},
@@ -203,13 +205,16 @@ kconf_id_lookup (register const char *str, register unsigned int len)
       {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str31,		T_SOURCE,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str32,	T_COMMENT,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str33,		T_TYPE,		TF_COMMAND, S_HEX},
-      {-1},
+      {-1}, {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str35,	T_MENUCONFIG,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str36,		T_PROMPT,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str37,	T_DEPENDS,	TF_COMMAND},
-      {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1},
       {-1},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str39,		T_TYPE,		TF_COMMAND, S_BOOLEAN},
+      {-1},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str41,		T_SELECT,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str42,	T_TYPE,		TF_COMMAND, S_BOOLEAN},
+      {-1}, {-1}, {-1}, {-1}, {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str48,	T_MAINMENU,	TF_COMMAND}
     };
 
-- 
1.5.4.rc3.14.g44397

