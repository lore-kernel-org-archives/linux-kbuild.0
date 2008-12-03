Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-vbr5.xs4all.nl ([194.109.24.25]:4021 "EHLO
	smtp-vbr5.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751005AbYLCPxs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Dec 2008 10:53:48 -0500
Date: Wed, 3 Dec 2008 16:52:34 +0100 (CET)
From: Roman Zippel <zippel@linux-m68k.org>
Subject: Re: [patch 5/8] kconfig: add module_name shortcut
In-Reply-To: <200812012221.mB1ML5ZW013101@imap1.linux-foundation.org>
Message-ID: <Pine.LNX.4.64.0812031619150.24668@localhost.localdomain>
References: <200812012221.mB1ML5ZW013101@imap1.linux-foundation.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: sam@ravnborg.org, linux-kbuild@vger.kernel.org, adobriyan@gmail.com

Hi,

On Mon, 1 Dec 2008, akpm@linux-foundation.org wrote:

> From: Alexey Dobriyan <adobriyan@gmail.com>
> 
> As correctly noticed in bug 11446
> (http://bugzilla.kernel.org/show_bug.cgi?id=11446) "To compile this driver
> as a module, blah-blah" boilerplate is being copy-pasted to death with
> slight variations.
> 
> Add Kconfig token "module_name" to supply module's name. Example:
> 
> 	config FOO
> 		tristate "foo"
> 		module_name foo
> 		---help---
> 		  foo

This syntax is a little inflexible.
Below is a patch, which integrates modules fully into the kconfig syntax,
so this is enough:

module foo
	tristate "foo"

The config symbol is derived from the module name or can be specified 
after the name. I also added the option to specify the sources, so that 
these can be used to generate the Kbuild information.
As a bonus feature the behaviour of boolean modules regarding their
dependencies is a little different, so that the module is only visible 
when all its dependencies are builtin.

I didn't modify the help text, but it short quite simply to do on top of 
this patch.

> @@ -115,6 +116,7 @@ struct property {
>  	struct symbol *sym;
>  	enum prop_type type;
>  	const char *text;
> +	char *module_name;
>  	struct expr_value visible;
>  	struct expr *expr;
>  	struct menu *menu;

A short comment about this one: I try to keep the property structure as 
generic as possible, so adding new fields should be avoided. Simple string 
values can also be added as expressions by using a constant symbol:

	menu_add_symbol(P_MODULE, sym_lookup($2, SYMBOL_CONST), NULL);

bye, Roman


[PATCH] add module syntax

Add specific syntax for defining a kernel module:

module foo
	tristate "foo support"
	sources foo1.c foo2.c

This information can be used by Kbuild to generate the necessary build
information.

Signed-off-by: Roman Zippel <zippel@linux-m68k.org>

---
 Documentation/kbuild/kconfig-language.txt |   18 
 scripts/kconfig/expr.h                    |    3 
 scripts/kconfig/menu.c                    |    2 
 scripts/kconfig/qconf.cc                  |    2 
 scripts/kconfig/symbol.c                  |    4 
 scripts/kconfig/zconf.gperf               |    2 
 scripts/kconfig/zconf.hash.c_shipped      |  187 ++++---
 scripts/kconfig/zconf.tab.c_shipped       |  714 ++++++++++++++++--------------
 scripts/kconfig/zconf.y                   |   61 ++
 9 files changed, 587 insertions(+), 406 deletions(-)

Index: linux-2.6/Documentation/kbuild/kconfig-language.txt
===================================================================
--- linux-2.6.orig/Documentation/kbuild/kconfig-language.txt
+++ linux-2.6/Documentation/kbuild/kconfig-language.txt
@@ -150,6 +150,10 @@ applicable everywhere (see syntax).
     to the build environment (if this is desired, it can be done via
     another symbol).
 
+- sources: "source" <name> ... ["if" <expr>]
+  This is only valid for modules and allows to specify the source files
+  to be used for building the module.
+
 Menu dependencies
 -----------------
 
@@ -243,6 +247,7 @@ line starts with a keyword (except help 
 end a menu entry:
 - config
 - menuconfig
+- module
 - choice/endchoice
 - comment
 - menu/endmenu
@@ -266,6 +271,19 @@ This is similar to the simple config ent
 hint to front ends, that all suboptions should be displayed as a
 separate list of options.
 
+module:
+	"module" <name> [<symbol>]
+	<module options>
+
+This is similiar to a normal config option, but allows to specify
+additional information, which are used to build modules. The config
+symbol is optional and it's generated from the module name by
+capitalizing it.
+There is an important difference for boolean modules, their dependencies
+are modified so that the module is only visible when all it's
+dependencies are 'y' (i.e. builtin) unlike other boolean config option,
+which are when it's dependecies are not 'n'.
+
 choices:
 
 	"choice"
Index: linux-2.6/scripts/kconfig/expr.h
===================================================================
--- linux-2.6.orig/scripts/kconfig/expr.h
+++ linux-2.6/scripts/kconfig/expr.h
@@ -88,6 +88,7 @@ struct symbol {
 #define SYMBOL_CHECK		0x0008
 #define SYMBOL_CHOICE		0x0010
 #define SYMBOL_CHOICEVAL	0x0020
+#define SYMBOL_MODULE		0x0040
 #define SYMBOL_VALID		0x0080
 #define SYMBOL_OPTIONAL		0x0100
 #define SYMBOL_WRITE		0x0200
@@ -107,7 +108,7 @@ struct symbol {
 
 enum prop_type {
 	P_UNKNOWN, P_PROMPT, P_COMMENT, P_MENU, P_DEFAULT, P_CHOICE,
-	P_SELECT, P_RANGE, P_ENV
+	P_SELECT, P_RANGE, P_ENV, P_MODULE, P_SOURCES
 };
 
 struct property {
Index: linux-2.6/scripts/kconfig/menu.c
===================================================================
--- linux-2.6.orig/scripts/kconfig/menu.c
+++ linux-2.6/scripts/kconfig/menu.c
@@ -272,6 +272,8 @@ void menu_finalize(struct menu *parent)
 				dep = expr_transform(prop->visible.expr);
 				dep = expr_alloc_and(expr_copy(basedep), dep);
 				dep = expr_eliminate_dups(dep);
+				if (menu->sym && (menu->sym->flags & SYMBOL_MODULE))
+					dep = expr_trans_compare(dep, E_EQUAL, &symbol_yes);
 				if (menu->sym && menu->sym->type != S_TRISTATE)
 					dep = expr_trans_bool(dep);
 				prop->visible.expr = dep;
Index: linux-2.6/scripts/kconfig/qconf.cc
===================================================================
--- linux-2.6.orig/scripts/kconfig/qconf.cc
+++ linux-2.6/scripts/kconfig/qconf.cc
@@ -1091,6 +1091,8 @@ QString ConfigInfoView::debug_info(struc
 		case P_SELECT:
 		case P_RANGE:
 		case P_ENV:
+		case P_MODULE:
+		case P_SOURCES:
 			debug += prop_get_type_name(prop->type);
 			debug += ": ";
 			expr_print(prop->expr, expr_print_help, &debug, E_NONE);
Index: linux-2.6/scripts/kconfig/symbol.c
===================================================================
--- linux-2.6.orig/scripts/kconfig/symbol.c
+++ linux-2.6/scripts/kconfig/symbol.c
@@ -937,6 +937,10 @@ const char *prop_get_type_name(enum prop
 		return "select";
 	case P_RANGE:
 		return "range";
+	case P_MODULE:
+		return "module";
+	case P_SOURCES:
+		return "sources";
 	case P_UNKNOWN:
 		break;
 	}
Index: linux-2.6/scripts/kconfig/zconf.gperf
===================================================================
--- linux-2.6.orig/scripts/kconfig/zconf.gperf
+++ linux-2.6/scripts/kconfig/zconf.gperf
@@ -19,6 +19,7 @@ endchoice,	T_ENDCHOICE,	TF_COMMAND
 comment,	T_COMMENT,	TF_COMMAND
 config,		T_CONFIG,	TF_COMMAND
 menuconfig,	T_MENUCONFIG,	TF_COMMAND
+module,		T_MODULE,	TF_COMMAND
 help,		T_HELP,		TF_COMMAND
 if,		T_IF,		TF_COMMAND|TF_PARAM
 endif,		T_ENDIF,	TF_COMMAND
@@ -37,6 +38,7 @@ string,		T_TYPE,		TF_COMMAND, S_STRING
 select,		T_SELECT,	TF_COMMAND
 range,		T_RANGE,	TF_COMMAND
 option,		T_OPTION,	TF_COMMAND
+sources,	T_SOURCES,	TF_COMMAND
 on,		T_ON,		TF_PARAM
 modules,	T_OPT_MODULES,	TF_OPTION
 defconfig_list,	T_OPT_DEFCONFIG_LIST,TF_OPTION
Index: linux-2.6/scripts/kconfig/zconf.hash.c_shipped
===================================================================
--- linux-2.6.orig/scripts/kconfig/zconf.hash.c_shipped
+++ linux-2.6/scripts/kconfig/zconf.hash.c_shipped
@@ -30,7 +30,7 @@
 #endif
 
 struct kconf_id;
-/* maximum key range = 47, duplicates = 0 */
+/* maximum key range = 55, duplicates = 0 */
 
 #ifdef __GNUC__
 __inline
@@ -44,32 +44,32 @@ kconf_id_hash (register const char *str,
 {
   static unsigned char asso_values[] =
     {
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 11,  5,
-       0,  0,  5, 49,  5, 20, 49, 49,  5, 20,
-       5,  0, 30, 49,  0, 15,  0, 10,  0, 49,
-      25, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57,  0, 10,
+       0,  0,  5, 57,  0,  0, 57, 57,  0, 25,
+       0, 20, 30, 57,  5,  0,  0, 40, 20, 57,
+      15, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57, 57, 57, 57, 57,
+      57, 57, 57, 57, 57, 57
     };
   register int hval = len;
 
@@ -88,71 +88,75 @@ kconf_id_hash (register const char *str,
 
 struct kconf_id_strings_t
   {
-    char kconf_id_strings_str2[sizeof("on")];
-    char kconf_id_strings_str3[sizeof("env")];
+    char kconf_id_strings_str2[sizeof("if")];
+    char kconf_id_strings_str3[sizeof("int")];
+    char kconf_id_strings_str4[sizeof("help")];
     char kconf_id_strings_str5[sizeof("endif")];
-    char kconf_id_strings_str6[sizeof("option")];
+    char kconf_id_strings_str6[sizeof("select")];
     char kconf_id_strings_str7[sizeof("endmenu")];
-    char kconf_id_strings_str8[sizeof("optional")];
+    char kconf_id_strings_str8[sizeof("tristate")];
     char kconf_id_strings_str9[sizeof("endchoice")];
     char kconf_id_strings_str10[sizeof("range")];
-    char kconf_id_strings_str11[sizeof("choice")];
+    char kconf_id_strings_str11[sizeof("string")];
     char kconf_id_strings_str12[sizeof("default")];
     char kconf_id_strings_str13[sizeof("def_bool")];
-    char kconf_id_strings_str14[sizeof("help")];
-    char kconf_id_strings_str15[sizeof("bool")];
     char kconf_id_strings_str16[sizeof("config")];
     char kconf_id_strings_str17[sizeof("def_tristate")];
-    char kconf_id_strings_str18[sizeof("boolean")];
+    char kconf_id_strings_str18[sizeof("hex")];
     char kconf_id_strings_str19[sizeof("defconfig_list")];
-    char kconf_id_strings_str21[sizeof("string")];
-    char kconf_id_strings_str22[sizeof("if")];
-    char kconf_id_strings_str23[sizeof("int")];
-    char kconf_id_strings_str26[sizeof("select")];
-    char kconf_id_strings_str27[sizeof("modules")];
-    char kconf_id_strings_str28[sizeof("tristate")];
+    char kconf_id_strings_str22[sizeof("on")];
+    char kconf_id_strings_str23[sizeof("env")];
+    char kconf_id_strings_str24[sizeof("bool")];
+    char kconf_id_strings_str26[sizeof("option")];
+    char kconf_id_strings_str27[sizeof("boolean")];
+    char kconf_id_strings_str28[sizeof("optional")];
     char kconf_id_strings_str29[sizeof("menu")];
-    char kconf_id_strings_str31[sizeof("source")];
-    char kconf_id_strings_str32[sizeof("comment")];
-    char kconf_id_strings_str33[sizeof("hex")];
+    char kconf_id_strings_str31[sizeof("module")];
+    char kconf_id_strings_str32[sizeof("modules")];
+    char kconf_id_strings_str33[sizeof("mainmenu")];
     char kconf_id_strings_str35[sizeof("menuconfig")];
-    char kconf_id_strings_str36[sizeof("prompt")];
+    char kconf_id_strings_str36[sizeof("choice")];
     char kconf_id_strings_str37[sizeof("depends")];
-    char kconf_id_strings_str48[sizeof("mainmenu")];
+    char kconf_id_strings_str42[sizeof("comment")];
+    char kconf_id_strings_str46[sizeof("source")];
+    char kconf_id_strings_str47[sizeof("sources")];
+    char kconf_id_strings_str56[sizeof("prompt")];
   };
 static struct kconf_id_strings_t kconf_id_strings_contents =
   {
-    "on",
-    "env",
+    "if",
+    "int",
+    "help",
     "endif",
-    "option",
+    "select",
     "endmenu",
-    "optional",
+    "tristate",
     "endchoice",
     "range",
-    "choice",
+    "string",
     "default",
     "def_bool",
-    "help",
-    "bool",
     "config",
     "def_tristate",
-    "boolean",
+    "hex",
     "defconfig_list",
-    "string",
-    "if",
-    "int",
-    "select",
-    "modules",
-    "tristate",
+    "on",
+    "env",
+    "bool",
+    "option",
+    "boolean",
+    "optional",
     "menu",
-    "source",
-    "comment",
-    "hex",
+    "module",
+    "modules",
+    "mainmenu",
     "menuconfig",
-    "prompt",
+    "choice",
     "depends",
-    "mainmenu"
+    "comment",
+    "source",
+    "sources",
+    "prompt"
   };
 #define kconf_id_strings ((const char *) &kconf_id_strings_contents)
 #ifdef __GNUC__
@@ -166,54 +170,57 @@ kconf_id_lookup (register const char *st
 {
   enum
     {
-      TOTAL_KEYWORDS = 31,
+      TOTAL_KEYWORDS = 33,
       MIN_WORD_LENGTH = 2,
       MAX_WORD_LENGTH = 14,
       MIN_HASH_VALUE = 2,
-      MAX_HASH_VALUE = 48
+      MAX_HASH_VALUE = 56
     };
 
   static struct kconf_id wordlist[] =
     {
       {-1}, {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str2,		T_ON,		TF_PARAM},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str3,		T_OPT_ENV,	TF_OPTION},
-      {-1},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str2,		T_IF,		TF_COMMAND|TF_PARAM},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str3,		T_TYPE,		TF_COMMAND, S_INT},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str4,		T_HELP,		TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str5,		T_ENDIF,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str6,		T_OPTION,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str6,		T_SELECT,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str7,	T_ENDMENU,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str8,	T_OPTIONAL,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str8,	T_TYPE,		TF_COMMAND, S_TRISTATE},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str9,	T_ENDCHOICE,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str10,		T_RANGE,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str11,		T_CHOICE,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str11,		T_TYPE,		TF_COMMAND, S_STRING},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str12,	T_DEFAULT,	TF_COMMAND, S_UNKNOWN},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str13,	T_DEFAULT,	TF_COMMAND, S_BOOLEAN},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str14,		T_HELP,		TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str15,		T_TYPE,		TF_COMMAND, S_BOOLEAN},
+      {-1}, {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str16,		T_CONFIG,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str17,	T_DEFAULT,	TF_COMMAND, S_TRISTATE},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str18,	T_TYPE,		TF_COMMAND, S_BOOLEAN},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str18,		T_TYPE,		TF_COMMAND, S_HEX},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str19,	T_OPT_DEFCONFIG_LIST,TF_OPTION},
-      {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str21,		T_TYPE,		TF_COMMAND, S_STRING},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str22,		T_IF,		TF_COMMAND|TF_PARAM},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str23,		T_TYPE,		TF_COMMAND, S_INT},
       {-1}, {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str26,		T_SELECT,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str27,	T_OPT_MODULES,	TF_OPTION},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str28,	T_TYPE,		TF_COMMAND, S_TRISTATE},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str22,		T_ON,		TF_PARAM},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str23,		T_OPT_ENV,	TF_OPTION},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str24,		T_TYPE,		TF_COMMAND, S_BOOLEAN},
+      {-1},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str26,		T_OPTION,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str27,	T_TYPE,		TF_COMMAND, S_BOOLEAN},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str28,	T_OPTIONAL,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str29,		T_MENU,		TF_COMMAND},
       {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str31,		T_SOURCE,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str32,	T_COMMENT,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str33,		T_TYPE,		TF_COMMAND, S_HEX},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str31,		T_MODULE,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str32,	T_OPT_MODULES,	TF_OPTION},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str33,	T_MAINMENU,	TF_COMMAND},
       {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str35,	T_MENUCONFIG,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str36,		T_PROMPT,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str36,		T_CHOICE,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str37,	T_DEPENDS,	TF_COMMAND},
-      {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1},
-      {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str48,	T_MAINMENU,	TF_COMMAND}
+      {-1}, {-1}, {-1}, {-1},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str42,	T_COMMENT,	TF_COMMAND},
+      {-1}, {-1}, {-1},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str46,		T_SOURCE,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str47,	T_SOURCES,	TF_COMMAND},
+      {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str56,		T_PROMPT,	TF_COMMAND}
     };
 
   if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
Index: linux-2.6/scripts/kconfig/zconf.tab.c_shipped
===================================================================
--- linux-2.6.orig/scripts/kconfig/zconf.tab.c_shipped
+++ linux-2.6/scripts/kconfig/zconf.tab.c_shipped
@@ -83,29 +83,31 @@
      T_COMMENT = 264,
      T_CONFIG = 265,
      T_MENUCONFIG = 266,
-     T_HELP = 267,
-     T_HELPTEXT = 268,
-     T_IF = 269,
-     T_ENDIF = 270,
-     T_DEPENDS = 271,
-     T_OPTIONAL = 272,
-     T_PROMPT = 273,
-     T_TYPE = 274,
-     T_DEFAULT = 275,
-     T_SELECT = 276,
-     T_RANGE = 277,
-     T_OPTION = 278,
-     T_ON = 279,
-     T_WORD = 280,
-     T_WORD_QUOTE = 281,
-     T_UNEQUAL = 282,
-     T_CLOSE_PAREN = 283,
-     T_OPEN_PAREN = 284,
-     T_EOL = 285,
-     T_OR = 286,
-     T_AND = 287,
-     T_EQUAL = 288,
-     T_NOT = 289
+     T_MODULE = 267,
+     T_HELP = 268,
+     T_HELPTEXT = 269,
+     T_IF = 270,
+     T_ENDIF = 271,
+     T_DEPENDS = 272,
+     T_OPTIONAL = 273,
+     T_PROMPT = 274,
+     T_TYPE = 275,
+     T_DEFAULT = 276,
+     T_SELECT = 277,
+     T_RANGE = 278,
+     T_OPTION = 279,
+     T_SOURCES = 280,
+     T_ON = 281,
+     T_WORD = 282,
+     T_WORD_QUOTE = 283,
+     T_UNEQUAL = 284,
+     T_CLOSE_PAREN = 285,
+     T_OPEN_PAREN = 286,
+     T_EOL = 287,
+     T_OR = 288,
+     T_AND = 289,
+     T_EQUAL = 290,
+     T_NOT = 291
    };
 #endif
 /* Tokens.  */
@@ -118,29 +120,31 @@
 #define T_COMMENT 264
 #define T_CONFIG 265
 #define T_MENUCONFIG 266
-#define T_HELP 267
-#define T_HELPTEXT 268
-#define T_IF 269
-#define T_ENDIF 270
-#define T_DEPENDS 271
-#define T_OPTIONAL 272
-#define T_PROMPT 273
-#define T_TYPE 274
-#define T_DEFAULT 275
-#define T_SELECT 276
-#define T_RANGE 277
-#define T_OPTION 278
-#define T_ON 279
-#define T_WORD 280
-#define T_WORD_QUOTE 281
-#define T_UNEQUAL 282
-#define T_CLOSE_PAREN 283
-#define T_OPEN_PAREN 284
-#define T_EOL 285
-#define T_OR 286
-#define T_AND 287
-#define T_EQUAL 288
-#define T_NOT 289
+#define T_MODULE 267
+#define T_HELP 268
+#define T_HELPTEXT 269
+#define T_IF 270
+#define T_ENDIF 271
+#define T_DEPENDS 272
+#define T_OPTIONAL 273
+#define T_PROMPT 274
+#define T_TYPE 275
+#define T_DEFAULT 276
+#define T_SELECT 277
+#define T_RANGE 278
+#define T_OPTION 279
+#define T_SOURCES 280
+#define T_ON 281
+#define T_WORD 282
+#define T_WORD_QUOTE 283
+#define T_UNEQUAL 284
+#define T_CLOSE_PAREN 285
+#define T_OPEN_PAREN 286
+#define T_EOL 287
+#define T_OR 288
+#define T_AND 289
+#define T_EQUAL 290
+#define T_NOT 291
 
 
 
@@ -446,20 +450,20 @@ union yyalloc
 /* YYFINAL -- State number of the termination state.  */
 #define YYFINAL  3
 /* YYLAST -- Last index in YYTABLE.  */
-#define YYLAST   259
+#define YYLAST   301
 
 /* YYNTOKENS -- Number of terminals.  */
-#define YYNTOKENS  35
+#define YYNTOKENS  37
 /* YYNNTS -- Number of nonterminals.  */
-#define YYNNTS  46
+#define YYNNTS  51
 /* YYNRULES -- Number of rules.  */
-#define YYNRULES  110
+#define YYNRULES  124
 /* YYNRULES -- Number of states.  */
-#define YYNSTATES  180
+#define YYNSTATES  199
 
 /* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
 #define YYUNDEFTOK  2
-#define YYMAXUTOK   289
+#define YYMAXUTOK   291
 
 #define YYTRANSLATE(YYX)						\
   ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)
@@ -495,7 +499,8 @@ static const yytype_uint8 yytranslate[] 
        2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
        5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
       15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
-      25,    26,    27,    28,    29,    30,    31,    32,    33,    34
+      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
+      35,    36
 };
 
 #if YYDEBUG
@@ -505,71 +510,77 @@ static const yytype_uint16 yyprhs[] =
 {
        0,     0,     3,     5,     6,     9,    12,    15,    20,    23,
       28,    33,    37,    39,    41,    43,    45,    47,    49,    51,
-      53,    55,    57,    59,    61,    63,    67,    70,    74,    77,
-      81,    84,    85,    88,    91,    94,    97,   100,   103,   107,
-     112,   117,   122,   128,   132,   133,   137,   138,   141,   145,
-     148,   150,   154,   155,   158,   161,   164,   167,   170,   175,
-     179,   182,   187,   188,   191,   195,   197,   201,   202,   205,
-     208,   211,   215,   218,   220,   224,   225,   228,   231,   234,
-     238,   242,   245,   248,   251,   252,   255,   258,   261,   266,
-     267,   270,   272,   274,   277,   280,   283,   285,   288,   289,
-     292,   294,   298,   302,   306,   309,   313,   317,   319,   321,
-     322
+      53,    55,    57,    59,    61,    63,    65,    69,    72,    76,
+      79,    83,    86,    87,    90,    93,    96,    99,   102,   105,
+     109,   112,   113,   116,   119,   122,   125,   128,   131,   134,
+     138,   143,   148,   153,   159,   163,   164,   168,   169,   172,
+     177,   179,   182,   186,   189,   191,   195,   196,   199,   202,
+     205,   208,   211,   216,   220,   223,   228,   229,   232,   236,
+     238,   242,   243,   246,   249,   252,   256,   259,   261,   265,
+     266,   269,   272,   275,   279,   283,   286,   289,   292,   293,
+     296,   299,   302,   307,   308,   311,   313,   315,   318,   321,
+     324,   326,   329,   330,   333,   335,   339,   343,   347,   350,
+     354,   358,   360,   362,   363
 };
 
 /* YYRHS -- A `-1'-separated list of the rules' RHS.  */
 static const yytype_int8 yyrhs[] =
 {
-      36,     0,    -1,    37,    -1,    -1,    37,    39,    -1,    37,
-      53,    -1,    37,    64,    -1,    37,     3,    74,    76,    -1,
-      37,    75,    -1,    37,    25,     1,    30,    -1,    37,    38,
-       1,    30,    -1,    37,     1,    30,    -1,    16,    -1,    18,
-      -1,    19,    -1,    21,    -1,    17,    -1,    22,    -1,    20,
-      -1,    30,    -1,    59,    -1,    68,    -1,    42,    -1,    44,
-      -1,    66,    -1,    25,     1,    30,    -1,     1,    30,    -1,
-      10,    25,    30,    -1,    41,    45,    -1,    11,    25,    30,
-      -1,    43,    45,    -1,    -1,    45,    46,    -1,    45,    47,
-      -1,    45,    72,    -1,    45,    70,    -1,    45,    40,    -1,
-      45,    30,    -1,    19,    73,    30,    -1,    18,    74,    77,
-      30,    -1,    20,    78,    77,    30,    -1,    21,    25,    77,
-      30,    -1,    22,    79,    79,    77,    30,    -1,    23,    48,
-      30,    -1,    -1,    48,    25,    49,    -1,    -1,    33,    74,
-      -1,     7,    80,    30,    -1,    50,    54,    -1,    75,    -1,
-      51,    56,    52,    -1,    -1,    54,    55,    -1,    54,    72,
-      -1,    54,    70,    -1,    54,    30,    -1,    54,    40,    -1,
-      18,    74,    77,    30,    -1,    19,    73,    30,    -1,    17,
-      30,    -1,    20,    25,    77,    30,    -1,    -1,    56,    39,
-      -1,    14,    78,    76,    -1,    75,    -1,    57,    60,    58,
-      -1,    -1,    60,    39,    -1,    60,    64,    -1,    60,    53,
-      -1,     4,    74,    30,    -1,    61,    71,    -1,    75,    -1,
-      62,    65,    63,    -1,    -1,    65,    39,    -1,    65,    64,
-      -1,    65,    53,    -1,     6,    74,    30,    -1,     9,    74,
-      30,    -1,    67,    71,    -1,    12,    30,    -1,    69,    13,
-      -1,    -1,    71,    72,    -1,    71,    30,    -1,    71,    40,
-      -1,    16,    24,    78,    30,    -1,    -1,    74,    77,    -1,
-      25,    -1,    26,    -1,     5,    30,    -1,     8,    30,    -1,
-      15,    30,    -1,    30,    -1,    76,    30,    -1,    -1,    14,
-      78,    -1,    79,    -1,    79,    33,    79,    -1,    79,    27,
-      79,    -1,    29,    78,    28,    -1,    34,    78,    -1,    78,
-      31,    78,    -1,    78,    32,    78,    -1,    25,    -1,    26,
-      -1,    -1,    25,    -1
+      38,     0,    -1,    39,    -1,    -1,    39,    41,    -1,    39,
+      60,    -1,    39,    71,    -1,    39,     3,    81,    83,    -1,
+      39,    82,    -1,    39,    27,     1,    32,    -1,    39,    40,
+       1,    32,    -1,    39,     1,    32,    -1,    17,    -1,    19,
+      -1,    20,    -1,    22,    -1,    18,    -1,    23,    -1,    21,
+      -1,    32,    -1,    66,    -1,    75,    -1,    44,    -1,    46,
+      -1,    49,    -1,    73,    -1,    27,     1,    32,    -1,     1,
+      32,    -1,    10,    27,    32,    -1,    43,    47,    -1,    11,
+      27,    32,    -1,    45,    47,    -1,    -1,    47,    51,    -1,
+      47,    52,    -1,    47,    79,    -1,    47,    77,    -1,    47,
+      42,    -1,    47,    32,    -1,    12,    27,    87,    -1,    48,
+      50,    -1,    -1,    50,    51,    -1,    50,    52,    -1,    50,
+      79,    -1,    50,    77,    -1,    50,    42,    -1,    50,    55,
+      -1,    50,    32,    -1,    20,    80,    32,    -1,    19,    81,
+      84,    32,    -1,    21,    85,    84,    32,    -1,    22,    27,
+      84,    32,    -1,    23,    86,    86,    84,    32,    -1,    24,
+      53,    32,    -1,    -1,    53,    27,    54,    -1,    -1,    35,
+      81,    -1,    25,    56,    84,    32,    -1,    81,    -1,    56,
+      81,    -1,     7,    87,    32,    -1,    57,    61,    -1,    82,
+      -1,    58,    63,    59,    -1,    -1,    61,    62,    -1,    61,
+      79,    -1,    61,    77,    -1,    61,    32,    -1,    61,    42,
+      -1,    19,    81,    84,    32,    -1,    20,    80,    32,    -1,
+      18,    32,    -1,    21,    27,    84,    32,    -1,    -1,    63,
+      41,    -1,    15,    85,    83,    -1,    82,    -1,    64,    67,
+      65,    -1,    -1,    67,    41,    -1,    67,    71,    -1,    67,
+      60,    -1,     4,    81,    32,    -1,    68,    78,    -1,    82,
+      -1,    69,    72,    70,    -1,    -1,    72,    41,    -1,    72,
+      71,    -1,    72,    60,    -1,     6,    81,    32,    -1,     9,
+      81,    32,    -1,    74,    78,    -1,    13,    32,    -1,    76,
+      14,    -1,    -1,    78,    79,    -1,    78,    32,    -1,    78,
+      42,    -1,    17,    26,    85,    32,    -1,    -1,    81,    84,
+      -1,    27,    -1,    28,    -1,     5,    32,    -1,     8,    32,
+      -1,    16,    32,    -1,    32,    -1,    83,    32,    -1,    -1,
+      15,    85,    -1,    86,    -1,    86,    35,    86,    -1,    86,
+      29,    86,    -1,    31,    85,    30,    -1,    36,    85,    -1,
+      85,    33,    85,    -1,    85,    34,    85,    -1,    27,    -1,
+      28,    -1,    -1,    27,    -1
 };
 
 /* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
 static const yytype_uint16 yyrline[] =
 {
-       0,   104,   104,   106,   108,   109,   110,   111,   112,   113,
-     114,   118,   122,   122,   122,   122,   122,   122,   122,   126,
-     127,   128,   129,   130,   131,   135,   136,   142,   150,   156,
-     164,   174,   176,   177,   178,   179,   180,   181,   184,   192,
-     198,   208,   214,   220,   223,   225,   236,   237,   242,   251,
-     256,   264,   267,   269,   270,   271,   272,   273,   276,   282,
-     293,   299,   309,   311,   316,   324,   332,   335,   337,   338,
-     339,   344,   351,   356,   364,   367,   369,   370,   371,   374,
-     382,   389,   396,   402,   409,   411,   412,   413,   416,   424,
-     426,   431,   432,   435,   436,   437,   441,   442,   445,   446,
-     449,   450,   451,   452,   453,   454,   455,   458,   459,   462,
-     463
+       0,   107,   107,   109,   111,   112,   113,   114,   115,   116,
+     117,   121,   125,   125,   125,   125,   125,   125,   125,   129,
+     130,   131,   132,   133,   134,   135,   139,   140,   146,   154,
+     160,   168,   178,   180,   181,   182,   183,   184,   185,   188,
+     209,   215,   217,   218,   219,   220,   221,   222,   223,   226,
+     234,   240,   250,   256,   262,   265,   267,   278,   279,   282,
+     288,   293,   301,   310,   315,   323,   326,   328,   329,   330,
+     331,   332,   335,   341,   352,   358,   368,   370,   375,   383,
+     391,   394,   396,   397,   398,   403,   410,   415,   423,   426,
+     428,   429,   430,   433,   441,   448,   455,   461,   468,   470,
+     471,   472,   475,   483,   485,   490,   491,   494,   495,   496,
+     500,   501,   504,   505,   508,   509,   510,   511,   512,   513,
+     514,   517,   518,   521,   522
 };
 #endif
 
@@ -580,21 +591,22 @@ static const char *const yytname[] =
 {
   "$end", "error", "$undefined", "T_MAINMENU", "T_MENU", "T_ENDMENU",
   "T_SOURCE", "T_CHOICE", "T_ENDCHOICE", "T_COMMENT", "T_CONFIG",
-  "T_MENUCONFIG", "T_HELP", "T_HELPTEXT", "T_IF", "T_ENDIF", "T_DEPENDS",
-  "T_OPTIONAL", "T_PROMPT", "T_TYPE", "T_DEFAULT", "T_SELECT", "T_RANGE",
-  "T_OPTION", "T_ON", "T_WORD", "T_WORD_QUOTE", "T_UNEQUAL",
-  "T_CLOSE_PAREN", "T_OPEN_PAREN", "T_EOL", "T_OR", "T_AND", "T_EQUAL",
-  "T_NOT", "$accept", "input", "stmt_list", "option_name", "common_stmt",
-  "option_error", "config_entry_start", "config_stmt",
+  "T_MENUCONFIG", "T_MODULE", "T_HELP", "T_HELPTEXT", "T_IF", "T_ENDIF",
+  "T_DEPENDS", "T_OPTIONAL", "T_PROMPT", "T_TYPE", "T_DEFAULT", "T_SELECT",
+  "T_RANGE", "T_OPTION", "T_SOURCES", "T_ON", "T_WORD", "T_WORD_QUOTE",
+  "T_UNEQUAL", "T_CLOSE_PAREN", "T_OPEN_PAREN", "T_EOL", "T_OR", "T_AND",
+  "T_EQUAL", "T_NOT", "$accept", "input", "stmt_list", "option_name",
+  "common_stmt", "option_error", "config_entry_start", "config_stmt",
   "menuconfig_entry_start", "menuconfig_stmt", "config_option_list",
+  "module_entry_start", "module_stmt", "module_option_list",
   "config_option", "symbol_option", "symbol_option_list",
-  "symbol_option_arg", "choice", "choice_entry", "choice_end",
-  "choice_stmt", "choice_option_list", "choice_option", "choice_block",
-  "if_entry", "if_end", "if_stmt", "if_block", "menu", "menu_entry",
-  "menu_end", "menu_stmt", "menu_block", "source_stmt", "comment",
-  "comment_stmt", "help_start", "help", "depends_list", "depends",
-  "prompt_stmt_opt", "prompt", "end", "nl", "if_expr", "expr", "symbol",
-  "word_opt", 0
+  "symbol_option_arg", "sources_option", "sources_list", "choice",
+  "choice_entry", "choice_end", "choice_stmt", "choice_option_list",
+  "choice_option", "choice_block", "if_entry", "if_end", "if_stmt",
+  "if_block", "menu", "menu_entry", "menu_end", "menu_stmt", "menu_block",
+  "source_stmt", "comment", "comment_stmt", "help_start", "help",
+  "depends_list", "depends", "prompt_stmt_opt", "prompt", "end", "nl",
+  "if_expr", "expr", "symbol", "word_opt", 0
 };
 #endif
 
@@ -606,25 +618,26 @@ static const yytype_uint16 yytoknum[] =
        0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
      265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
      275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
-     285,   286,   287,   288,   289
+     285,   286,   287,   288,   289,   290,   291
 };
 # endif
 
 /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
 static const yytype_uint8 yyr1[] =
 {
-       0,    35,    36,    37,    37,    37,    37,    37,    37,    37,
-      37,    37,    38,    38,    38,    38,    38,    38,    38,    39,
-      39,    39,    39,    39,    39,    40,    40,    41,    42,    43,
-      44,    45,    45,    45,    45,    45,    45,    45,    46,    46,
-      46,    46,    46,    47,    48,    48,    49,    49,    50,    51,
-      52,    53,    54,    54,    54,    54,    54,    54,    55,    55,
-      55,    55,    56,    56,    57,    58,    59,    60,    60,    60,
-      60,    61,    62,    63,    64,    65,    65,    65,    65,    66,
-      67,    68,    69,    70,    71,    71,    71,    71,    72,    73,
-      73,    74,    74,    75,    75,    75,    76,    76,    77,    77,
-      78,    78,    78,    78,    78,    78,    78,    79,    79,    80,
-      80
+       0,    37,    38,    39,    39,    39,    39,    39,    39,    39,
+      39,    39,    40,    40,    40,    40,    40,    40,    40,    41,
+      41,    41,    41,    41,    41,    41,    42,    42,    43,    44,
+      45,    46,    47,    47,    47,    47,    47,    47,    47,    48,
+      49,    50,    50,    50,    50,    50,    50,    50,    50,    51,
+      51,    51,    51,    51,    52,    53,    53,    54,    54,    55,
+      56,    56,    57,    58,    59,    60,    61,    61,    61,    61,
+      61,    61,    62,    62,    62,    62,    63,    63,    64,    65,
+      66,    67,    67,    67,    67,    68,    69,    70,    71,    72,
+      72,    72,    72,    73,    74,    75,    76,    77,    78,    78,
+      78,    78,    79,    80,    80,    81,    81,    82,    82,    82,
+      83,    83,    84,    84,    85,    85,    85,    85,    85,    85,
+      85,    86,    86,    87,    87
 };
 
 /* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
@@ -632,16 +645,17 @@ static const yytype_uint8 yyr2[] =
 {
        0,     2,     1,     0,     2,     2,     2,     4,     2,     4,
        4,     3,     1,     1,     1,     1,     1,     1,     1,     1,
-       1,     1,     1,     1,     1,     3,     2,     3,     2,     3,
-       2,     0,     2,     2,     2,     2,     2,     2,     3,     4,
-       4,     4,     5,     3,     0,     3,     0,     2,     3,     2,
-       1,     3,     0,     2,     2,     2,     2,     2,     4,     3,
-       2,     4,     0,     2,     3,     1,     3,     0,     2,     2,
-       2,     3,     2,     1,     3,     0,     2,     2,     2,     3,
-       3,     2,     2,     2,     0,     2,     2,     2,     4,     0,
-       2,     1,     1,     2,     2,     2,     1,     2,     0,     2,
-       1,     3,     3,     3,     2,     3,     3,     1,     1,     0,
-       1
+       1,     1,     1,     1,     1,     1,     3,     2,     3,     2,
+       3,     2,     0,     2,     2,     2,     2,     2,     2,     3,
+       2,     0,     2,     2,     2,     2,     2,     2,     2,     3,
+       4,     4,     4,     5,     3,     0,     3,     0,     2,     4,
+       1,     2,     3,     2,     1,     3,     0,     2,     2,     2,
+       2,     2,     4,     3,     2,     4,     0,     2,     3,     1,
+       3,     0,     2,     2,     2,     3,     2,     1,     3,     0,
+       2,     2,     2,     3,     3,     2,     2,     2,     0,     2,
+       2,     2,     4,     0,     2,     1,     1,     2,     2,     2,
+       1,     2,     0,     2,     1,     3,     3,     3,     2,     3,
+       3,     1,     1,     0,     1
 };
 
 /* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
@@ -649,158 +663,176 @@ static const yytype_uint8 yyr2[] =
    means the default is an error.  */
 static const yytype_uint8 yydefact[] =
 {
-       3,     0,     0,     1,     0,     0,     0,     0,     0,   109,
-       0,     0,     0,     0,     0,     0,    12,    16,    13,    14,
-      18,    15,    17,     0,    19,     0,     4,    31,    22,    31,
-      23,    52,    62,     5,    67,    20,    84,    75,     6,    24,
-      84,    21,     8,    11,    91,    92,     0,     0,    93,     0,
-     110,     0,    94,     0,     0,     0,   107,   108,     0,     0,
-       0,   100,    95,     0,     0,     0,     0,     0,     0,     0,
-       0,     0,     0,    96,     7,    71,    79,    48,    80,    27,
-      29,     0,   104,     0,     0,    64,     0,     0,     9,    10,
-       0,     0,     0,     0,    89,     0,     0,     0,    44,     0,
-      37,    36,    32,    33,     0,    35,    34,     0,     0,    89,
-       0,    56,    57,    53,    55,    54,    63,    51,    50,    68,
-      70,    66,    69,    65,    86,    87,    85,    76,    78,    74,
-      77,    73,    97,   103,   105,   106,   102,   101,    26,    82,
-       0,    98,     0,    98,    98,    98,     0,     0,     0,    83,
-      60,    98,     0,    98,     0,     0,     0,    38,    90,     0,
-       0,    98,    46,    43,    25,     0,    59,     0,    88,    99,
-      39,    40,    41,     0,     0,    45,    58,    61,    42,    47
+       3,     0,     0,     1,     0,     0,     0,     0,     0,   123,
+       0,     0,     0,     0,     0,     0,     0,    12,    16,    13,
+      14,    18,    15,    17,     0,    19,     0,     4,    32,    22,
+      32,    23,    41,    24,    66,    76,     5,    81,    20,    98,
+      89,     6,    25,    98,    21,     8,    11,   105,   106,     0,
+       0,   107,     0,   124,     0,   108,     0,     0,     0,   123,
+     121,   122,     0,     0,     0,   114,   109,     0,     0,     0,
+       0,     0,     0,     0,     0,     0,     0,     0,   110,     7,
+      85,    93,    62,    94,    28,    30,    39,     0,   118,     0,
+       0,    78,     0,     0,     9,    10,     0,     0,     0,     0,
+     103,     0,     0,     0,    55,     0,    38,    37,    33,    34,
+       0,    36,    35,     0,    48,    46,    42,    43,    47,    45,
+      44,     0,     0,   103,     0,    70,    71,    67,    69,    68,
+      77,    65,    64,    82,    84,    80,    83,    79,   100,   101,
+      99,    90,    92,    88,    91,    87,   111,   117,   119,   120,
+     116,   115,    27,    96,     0,   112,     0,   112,   112,   112,
+       0,     0,     0,    97,   112,    60,    74,   112,     0,   112,
+       0,     0,     0,    49,   104,     0,     0,   112,    57,    54,
+      26,    61,     0,     0,    73,     0,   102,   113,    50,    51,
+      52,     0,     0,    56,    59,    72,    75,    53,    58
 };
 
 /* YYDEFGOTO[NTERM-NUM].  */
 static const yytype_int16 yydefgoto[] =
 {
-      -1,     1,     2,    25,    26,   101,    27,    28,    29,    30,
-      65,   102,   103,   147,   175,    31,    32,   117,    33,    67,
-     113,    68,    34,   121,    35,    69,    36,    37,   129,    38,
-      71,    39,    40,    41,   104,   105,    70,   106,   142,   143,
-      42,    74,   156,    60,    61,    51
+      -1,     1,     2,    26,    27,   107,    28,    29,    30,    31,
+      69,    32,    33,    71,   108,   109,   161,   193,   118,   164,
+      34,    35,   131,    36,    72,   127,    73,    37,   135,    38,
+      74,    39,    40,   143,    41,    76,    42,    43,    44,   110,
+     111,    75,   112,   156,   157,    45,    79,   172,    64,    65,
+      54
 };
 
 /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
    STATE-NUM.  */
-#define YYPACT_NINF -80
+#define YYPACT_NINF -86
 static const yytype_int16 yypact[] =
 {
-     -80,     2,   132,   -80,   -13,    -1,    -1,    -2,    -1,     9,
-      33,    -1,    27,    40,    -3,    38,   -80,   -80,   -80,   -80,
-     -80,   -80,   -80,    71,   -80,    77,   -80,   -80,   -80,   -80,
-     -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,
-     -80,   -80,   -80,   -80,   -80,   -80,    57,    61,   -80,    63,
-     -80,    76,   -80,    87,   101,   133,   -80,   -80,    -3,    -3,
-     195,    -6,   -80,   136,   149,    39,   104,    65,   150,     5,
-     194,     5,   167,   -80,   176,   -80,   -80,   -80,   -80,   -80,
-     -80,    68,   -80,    -3,    -3,   176,    72,    72,   -80,   -80,
-     177,   187,    78,    -1,    -1,    -3,   196,    72,   -80,   222,
-     -80,   -80,   -80,   -80,   221,   -80,   -80,   205,    -1,    -1,
-     211,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,
-     -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,
-     -80,   -80,   -80,   -80,   206,   -80,   -80,   -80,   -80,   -80,
-      -3,   223,   209,   223,   197,   223,    72,     7,   210,   -80,
-     -80,   223,   212,   223,   201,    -3,   213,   -80,   -80,   214,
-     215,   223,   208,   -80,   -80,   216,   -80,   217,   -80,   113,
-     -80,   -80,   -80,   218,    -1,   -80,   -80,   -80,   -80,   -80
+     -86,     2,   185,   -86,   -13,    -1,    -1,    -2,    -1,    11,
+      23,    -1,    40,    51,    58,    -3,    70,   -86,   -86,   -86,
+     -86,   -86,   -86,   -86,    98,   -86,   113,   -86,   -86,   -86,
+     -86,   -86,   -86,   -86,   -86,   -86,   -86,   -86,   -86,   -86,
+     -86,   -86,   -86,   -86,   -86,   -86,   -86,   -86,   -86,    97,
+     112,   -86,   141,   -86,   143,   -86,   148,   181,   182,    11,
+     -86,   -86,    -3,    -3,   150,    -6,   -86,   196,   197,   115,
+     145,    41,    71,   257,     5,   244,     5,   215,   -86,   207,
+     -86,   -86,   -86,   -86,   -86,   -86,   -86,     6,   -86,    -3,
+      -3,   207,    43,    43,   -86,   -86,   208,   209,   217,    -1,
+      -1,    -3,   219,    43,   -86,   243,   -86,   -86,   -86,   -86,
+     250,   -86,   -86,    -1,   -86,   -86,   -86,   -86,   -86,   -86,
+     -86,   225,    -1,    -1,   231,   -86,   -86,   -86,   -86,   -86,
+     -86,   -86,   -86,   -86,   -86,   -86,   -86,   -86,   -86,   -86,
+     -86,   -86,   -86,   -86,   -86,   -86,   -86,   -86,   236,   -86,
+     -86,   -86,   -86,   -86,    -3,   259,   245,   259,    78,   259,
+      43,    42,   249,   -86,     7,   -86,   -86,   259,   251,   259,
+     177,    -3,   252,   -86,   -86,   254,   255,   259,   240,   -86,
+     -86,   -86,   260,   261,   -86,   262,   -86,    76,   -86,   -86,
+     -86,   263,    -1,   -86,   -86,   -86,   -86,   -86,   -86
 };
 
 /* YYPGOTO[NTERM-NUM].  */
 static const yytype_int16 yypgoto[] =
 {
-     -80,   -80,   -80,   -80,   122,   -34,   -80,   -80,   -80,   -80,
-     220,   -80,   -80,   -80,   -80,   -80,   -80,   -80,    59,   -80,
-     -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   125,
-     -80,   -80,   -80,   -80,   -80,   183,   219,    22,   142,    -5,
-     147,   192,    69,   -54,   -79,   -80
+     -86,   -86,   -86,   -86,    67,    29,   -86,   -86,   -86,   -86,
+     266,   -86,   -86,   -86,   211,   220,   -86,   -86,   -86,   -86,
+     -86,   -86,   -86,    21,   -86,   -86,   -86,   -86,   -86,   -86,
+     -86,   -86,   -86,   -86,    31,   -86,   -86,   -86,   -86,   -86,
+     127,   256,    99,   174,    -5,   105,   237,   121,   -58,   -85,
+     241
 };
 
 /* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
    positive, shift that token.  If negative, reduce the rule which
    number is the opposite.  If zero, do what YYDEFACT says.
    If YYTABLE_NINF, syntax error.  */
-#define YYTABLE_NINF -82
+#define YYTABLE_NINF -96
 static const yytype_int16 yytable[] =
 {
-      46,    47,     3,    49,    81,    82,    53,   136,   137,     6,
-       7,     8,     9,    10,    11,    12,    13,    43,   146,    14,
-      15,    86,    56,    57,    44,    45,    58,    87,    48,   134,
-     135,    59,   162,   112,    50,    24,   125,   163,   125,   -28,
-      90,   144,   -28,   -28,   -28,   -28,   -28,   -28,   -28,   -28,
-     -28,    91,    54,   -28,   -28,    92,   -28,    93,    94,    95,
-      96,    97,    98,    52,    99,    55,    90,   161,    62,   100,
-     -49,   -49,    63,   -49,   -49,   -49,   -49,    91,    64,   -49,
-     -49,    92,   107,   108,   109,   110,   154,    73,   141,   115,
-      99,    75,   126,    76,   126,   111,   133,    56,    57,    83,
-      84,   169,   140,   151,   -30,    90,    77,   -30,   -30,   -30,
-     -30,   -30,   -30,   -30,   -30,   -30,    91,    78,   -30,   -30,
-      92,   -30,    93,    94,    95,    96,    97,    98,   120,    99,
-     128,    79,    -2,     4,   100,     5,     6,     7,     8,     9,
-      10,    11,    12,    13,    83,    84,    14,    15,    16,    17,
-      18,    19,    20,    21,    22,     7,     8,    23,    10,    11,
-      12,    13,    24,    80,    14,    15,    88,   -81,    90,   179,
-     -81,   -81,   -81,   -81,   -81,   -81,   -81,   -81,   -81,    89,
-      24,   -81,   -81,    92,   -81,   -81,   -81,   -81,   -81,   -81,
-     116,   119,    99,   127,   122,    90,   130,   124,   -72,   -72,
-     -72,   -72,   -72,   -72,   -72,   -72,   132,   138,   -72,   -72,
-      92,   155,   158,   159,   160,   118,   123,   139,   131,    99,
-     165,   145,   167,   148,   124,    73,    83,    84,    83,    84,
-     173,   168,    83,    84,   149,   150,   153,   155,    84,   157,
-     164,   174,   166,   170,   171,   172,   176,   177,   178,    66,
-     114,   152,    85,     0,     0,     0,     0,     0,     0,    72
+      49,    50,     3,    52,    87,    88,    56,   150,   151,     6,
+       7,     8,     9,    10,    11,    12,    13,    14,   160,    46,
+      15,    16,   171,    92,    60,    61,    47,    48,    62,    93,
+      51,   148,   149,    63,    47,    48,   147,    25,    53,    89,
+      90,   -40,    96,   158,   -40,   -40,   -40,   -40,   -40,   -40,
+     -40,   -40,   -40,   -40,    97,    55,   -40,   -40,    98,   -40,
+      99,   100,   101,   102,   103,   104,   113,    57,   105,   178,
+      60,    61,    96,   114,   179,   177,   -63,   -63,    58,   -63,
+     -63,   -63,   -63,   -63,    97,    59,   -63,   -63,    98,   121,
+     122,   123,   124,   171,   155,   134,   170,   142,   105,    67,
+     115,   126,    66,   125,   139,   136,   139,   144,   165,    89,
+      90,    89,    90,   187,    68,   -29,    96,   167,   -29,   -29,
+     -29,   -29,   -29,   -29,   -29,   -29,   -29,   -29,    97,    78,
+     -29,   -29,    98,   -29,    99,   100,   101,   102,   103,   104,
+     130,   133,   105,   141,    80,   -31,    96,   106,   -31,   -31,
+     -31,   -31,   -31,   -31,   -31,   -31,   -31,   -31,    97,   181,
+     -31,   -31,    98,   -31,    99,   100,   101,   102,   103,   104,
+     120,   129,   105,    81,   140,    82,   140,   106,   132,   137,
+      83,   145,    78,    89,    90,    -2,     4,   198,     5,     6,
+       7,     8,     9,    10,    11,    12,    13,    14,   119,   128,
+      15,    16,    17,    18,    19,    20,    21,    22,    23,   186,
+      89,    90,    24,    84,    85,   -95,    96,    25,   -95,   -95,
+     -95,   -95,   -95,   -95,   -95,   -95,   -95,   -95,    94,    95,
+     -95,   -95,    98,   -95,   -95,   -95,   -95,   -95,   -95,   146,
+     152,   153,   105,   154,   162,    96,   159,   138,   -86,   -86,
+     -86,   -86,   -86,   -86,   -86,   -86,   -86,   166,   169,   -86,
+     -86,    98,     7,     8,   163,    10,    11,    12,    13,    14,
+      90,   105,    15,    16,   171,   192,   138,   173,   174,   175,
+     176,   180,   116,   184,   188,   182,   189,   190,   183,    25,
+     185,   117,   194,   195,   196,   197,    70,   168,   191,    77,
+      86,    91
 };
 
-static const yytype_int16 yycheck[] =
+static const yytype_uint8 yycheck[] =
 {
-       5,     6,     0,     8,    58,    59,    11,    86,    87,     4,
-       5,     6,     7,     8,     9,    10,    11,    30,    97,    14,
-      15,    27,    25,    26,    25,    26,    29,    33,    30,    83,
-      84,    34,    25,    67,    25,    30,    70,    30,    72,     0,
-       1,    95,     3,     4,     5,     6,     7,     8,     9,    10,
-      11,    12,    25,    14,    15,    16,    17,    18,    19,    20,
-      21,    22,    23,    30,    25,    25,     1,   146,    30,    30,
-       5,     6,     1,     8,     9,    10,    11,    12,     1,    14,
-      15,    16,    17,    18,    19,    20,   140,    30,    93,    67,
-      25,    30,    70,    30,    72,    30,    28,    25,    26,    31,
-      32,   155,    24,   108,     0,     1,    30,     3,     4,     5,
-       6,     7,     8,     9,    10,    11,    12,    30,    14,    15,
-      16,    17,    18,    19,    20,    21,    22,    23,    69,    25,
-      71,    30,     0,     1,    30,     3,     4,     5,     6,     7,
-       8,     9,    10,    11,    31,    32,    14,    15,    16,    17,
-      18,    19,    20,    21,    22,     5,     6,    25,     8,     9,
-      10,    11,    30,    30,    14,    15,    30,     0,     1,   174,
-       3,     4,     5,     6,     7,     8,     9,    10,    11,    30,
-      30,    14,    15,    16,    17,    18,    19,    20,    21,    22,
-      68,    69,    25,    71,    69,     1,    71,    30,     4,     5,
-       6,     7,     8,     9,    10,    11,    30,    30,    14,    15,
-      16,    14,   143,   144,   145,    68,    69,    30,    71,    25,
-     151,    25,   153,     1,    30,    30,    31,    32,    31,    32,
-     161,    30,    31,    32,    13,    30,    25,    14,    32,    30,
-      30,    33,    30,    30,    30,    30,    30,    30,    30,    29,
-      67,   109,    60,    -1,    -1,    -1,    -1,    -1,    -1,    40
+       5,     6,     0,     8,    62,    63,    11,    92,    93,     4,
+       5,     6,     7,     8,     9,    10,    11,    12,   103,    32,
+      15,    16,    15,    29,    27,    28,    27,    28,    31,    35,
+      32,    89,    90,    36,    27,    28,    30,    32,    27,    33,
+      34,     0,     1,   101,     3,     4,     5,     6,     7,     8,
+       9,    10,    11,    12,    13,    32,    15,    16,    17,    18,
+      19,    20,    21,    22,    23,    24,    25,    27,    27,    27,
+      27,    28,     1,    32,    32,   160,     5,     6,    27,     8,
+       9,    10,    11,    12,    13,    27,    15,    16,    17,    18,
+      19,    20,    21,    15,    99,    74,   154,    76,    27,     1,
+      71,    72,    32,    32,    75,    74,    77,    76,   113,    33,
+      34,    33,    34,   171,     1,     0,     1,   122,     3,     4,
+       5,     6,     7,     8,     9,    10,    11,    12,    13,    32,
+      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
+      73,    74,    27,    76,    32,     0,     1,    32,     3,     4,
+       5,     6,     7,     8,     9,    10,    11,    12,    13,   164,
+      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
+      71,    72,    27,    32,    75,    32,    77,    32,    73,    74,
+      32,    76,    32,    33,    34,     0,     1,   192,     3,     4,
+       5,     6,     7,     8,     9,    10,    11,    12,    71,    72,
+      15,    16,    17,    18,    19,    20,    21,    22,    23,    32,
+      33,    34,    27,    32,    32,     0,     1,    32,     3,     4,
+       5,     6,     7,     8,     9,    10,    11,    12,    32,    32,
+      15,    16,    17,    18,    19,    20,    21,    22,    23,    32,
+      32,    32,    27,    26,     1,     1,    27,    32,     4,     5,
+       6,     7,     8,     9,    10,    11,    12,    32,    27,    15,
+      16,    17,     5,     6,    14,     8,     9,    10,    11,    12,
+      34,    27,    15,    16,    15,    35,    32,    32,   157,   158,
+     159,    32,    71,    32,    32,   164,    32,    32,   167,    32,
+     169,    71,    32,    32,    32,    32,    30,   123,   177,    43,
+      59,    64
 };
 
 /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
    symbol of state STATE-NUM.  */
 static const yytype_uint8 yystos[] =
 {
-       0,    36,    37,     0,     1,     3,     4,     5,     6,     7,
-       8,     9,    10,    11,    14,    15,    16,    17,    18,    19,
-      20,    21,    22,    25,    30,    38,    39,    41,    42,    43,
-      44,    50,    51,    53,    57,    59,    61,    62,    64,    66,
-      67,    68,    75,    30,    25,    26,    74,    74,    30,    74,
-      25,    80,    30,    74,    25,    25,    25,    26,    29,    34,
-      78,    79,    30,     1,     1,    45,    45,    54,    56,    60,
-      71,    65,    71,    30,    76,    30,    30,    30,    30,    30,
-      30,    78,    78,    31,    32,    76,    27,    33,    30,    30,
-       1,    12,    16,    18,    19,    20,    21,    22,    23,    25,
-      30,    40,    46,    47,    69,    70,    72,    17,    18,    19,
-      20,    30,    40,    55,    70,    72,    39,    52,    75,    39,
-      53,    58,    64,    75,    30,    40,    72,    39,    53,    63,
-      64,    75,    30,    28,    78,    78,    79,    79,    30,    30,
-      24,    74,    73,    74,    78,    25,    79,    48,     1,    13,
-      30,    74,    73,    25,    78,    14,    77,    30,    77,    77,
-      77,    79,    25,    30,    30,    77,    30,    77,    30,    78,
-      30,    30,    30,    77,    33,    49,    30,    30,    30,    74
+       0,    38,    39,     0,     1,     3,     4,     5,     6,     7,
+       8,     9,    10,    11,    12,    15,    16,    17,    18,    19,
+      20,    21,    22,    23,    27,    32,    40,    41,    43,    44,
+      45,    46,    48,    49,    57,    58,    60,    64,    66,    68,
+      69,    71,    73,    74,    75,    82,    32,    27,    28,    81,
+      81,    32,    81,    27,    87,    32,    81,    27,    27,    27,
+      27,    28,    31,    36,    85,    86,    32,     1,     1,    47,
+      47,    50,    61,    63,    67,    78,    72,    78,    32,    83,
+      32,    32,    32,    32,    32,    32,    87,    85,    85,    33,
+      34,    83,    29,    35,    32,    32,     1,    13,    17,    19,
+      20,    21,    22,    23,    24,    27,    32,    42,    51,    52,
+      76,    77,    79,    25,    32,    42,    51,    52,    55,    77,
+      79,    18,    19,    20,    21,    32,    42,    62,    77,    79,
+      41,    59,    82,    41,    60,    65,    71,    82,    32,    42,
+      79,    41,    60,    70,    71,    82,    32,    30,    85,    85,
+      86,    86,    32,    32,    26,    81,    80,    81,    85,    27,
+      86,    53,     1,    14,    56,    81,    32,    81,    80,    27,
+      85,    15,    84,    32,    84,    84,    84,    86,    27,    32,
+      32,    81,    84,    84,    32,    84,    32,    85,    32,    32,
+      32,    84,    35,    54,    32,    32,    32,    32,    81
 };
 
 #define yyerrok		(yyerrstatus = 0)
@@ -1308,7 +1340,7 @@ yydestruct (yymsg, yytype, yyvaluep)
 
   switch (yytype)
     {
-      case 51: /* "choice_entry" */
+      case 58: /* "choice_entry" */
 
 	{
 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
@@ -1318,7 +1350,7 @@ yydestruct (yymsg, yytype, yyvaluep)
 };
 
 	break;
-      case 57: /* "if_entry" */
+      case 64: /* "if_entry" */
 
 	{
 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
@@ -1328,7 +1360,7 @@ yydestruct (yymsg, yytype, yyvaluep)
 };
 
 	break;
-      case 62: /* "menu_entry" */
+      case 69: /* "menu_entry" */
 
 	{
 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
@@ -1666,17 +1698,17 @@ yyreduce:
     { zconf_error("invalid statement"); ;}
     break;
 
-  case 25:
+  case 26:
 
     { zconf_error("unknown option \"%s\"", (yyvsp[(1) - (3)].string)); ;}
     break;
 
-  case 26:
+  case 27:
 
     { zconf_error("invalid option"); ;}
     break;
 
-  case 27:
+  case 28:
 
     {
 	struct symbol *sym = sym_lookup((yyvsp[(2) - (3)].string), 0);
@@ -1686,7 +1718,7 @@ yyreduce:
 ;}
     break;
 
-  case 28:
+  case 29:
 
     {
 	menu_end_entry();
@@ -1694,7 +1726,7 @@ yyreduce:
 ;}
     break;
 
-  case 29:
+  case 30:
 
     {
 	struct symbol *sym = sym_lookup((yyvsp[(2) - (3)].string), 0);
@@ -1704,7 +1736,7 @@ yyreduce:
 ;}
     break;
 
-  case 30:
+  case 31:
 
     {
 	if (current_entry->prompt)
@@ -1716,7 +1748,38 @@ yyreduce:
 ;}
     break;
 
-  case 38:
+  case 39:
+
+    {
+	struct symbol *sym;
+	char name[128];
+	int i, len;
+
+	if (!(yyvsp[(3) - (3)].string)) {
+		len = strlen((yyvsp[(2) - (3)].string));
+		for (i = 0; i < len; i++)
+			name[i] = toupper((yyvsp[(2) - (3)].string)[i]);
+		name[i] = 0;
+		(yyvsp[(3) - (3)].string) = name;
+	}
+
+	sym = sym_lookup((yyvsp[(3) - (3)].string), 0);
+	sym->flags |= SYMBOL_OPTIONAL | SYMBOL_MODULE;
+	menu_add_entry(sym);
+	menu_add_symbol(P_MODULE, sym_lookup((yyvsp[(2) - (3)].string), SYMBOL_CONST), NULL);
+	printd(DEBUG_PARSE, "%s:%d:module %s\n", zconf_curname(), zconf_lineno(), (yyvsp[(2) - (3)].string));
+;}
+    break;
+
+  case 40:
+
+    {
+	menu_end_entry();
+	printd(DEBUG_PARSE, "%s:%d:endmodule\n", zconf_curname(), zconf_lineno());
+;}
+    break;
+
+  case 49:
 
     {
 	menu_set_type((yyvsp[(1) - (3)].id)->stype);
@@ -1726,7 +1789,7 @@ yyreduce:
 ;}
     break;
 
-  case 39:
+  case 50:
 
     {
 	menu_add_prompt(P_PROMPT, (yyvsp[(2) - (4)].string), (yyvsp[(3) - (4)].expr));
@@ -1734,7 +1797,7 @@ yyreduce:
 ;}
     break;
 
-  case 40:
+  case 51:
 
     {
 	menu_add_expr(P_DEFAULT, (yyvsp[(2) - (4)].expr), (yyvsp[(3) - (4)].expr));
@@ -1746,7 +1809,7 @@ yyreduce:
 ;}
     break;
 
-  case 41:
+  case 52:
 
     {
 	menu_add_symbol(P_SELECT, sym_lookup((yyvsp[(2) - (4)].string), 0), (yyvsp[(3) - (4)].expr));
@@ -1754,7 +1817,7 @@ yyreduce:
 ;}
     break;
 
-  case 42:
+  case 53:
 
     {
 	menu_add_expr(P_RANGE, expr_alloc_comp(E_RANGE,(yyvsp[(2) - (5)].symbol), (yyvsp[(3) - (5)].symbol)), (yyvsp[(4) - (5)].expr));
@@ -1762,7 +1825,7 @@ yyreduce:
 ;}
     break;
 
-  case 45:
+  case 56:
 
     {
 	struct kconf_id *id = kconf_id_lookup((yyvsp[(2) - (3)].string), strlen((yyvsp[(2) - (3)].string)));
@@ -1774,17 +1837,40 @@ yyreduce:
 ;}
     break;
 
-  case 46:
+  case 57:
 
     { (yyval.string) = NULL; ;}
     break;
 
-  case 47:
+  case 58:
 
     { (yyval.string) = (yyvsp[(2) - (2)].string); ;}
     break;
 
-  case 48:
+  case 59:
+
+    {
+	menu_add_expr(P_SOURCES, (yyvsp[(2) - (4)].expr), (yyvsp[(3) - (4)].expr));
+;}
+    break;
+
+  case 60:
+
+    {
+	(yyval.expr) = expr_alloc_one(E_LIST, NULL);
+	(yyval.expr)->right.sym = sym_lookup((yyvsp[(1) - (1)].string), SYMBOL_CONST);
+;}
+    break;
+
+  case 61:
+
+    {
+	(yyval.expr) = expr_alloc_one(E_LIST, (yyvsp[(1) - (2)].expr));
+	(yyval.expr)->right.sym = sym_lookup((yyvsp[(2) - (2)].string), SYMBOL_CONST);
+;}
+    break;
+
+  case 62:
 
     {
 	struct symbol *sym = sym_lookup((yyvsp[(2) - (3)].string), SYMBOL_CHOICE);
@@ -1795,14 +1881,14 @@ yyreduce:
 ;}
     break;
 
-  case 49:
+  case 63:
 
     {
 	(yyval.menu) = menu_add_menu();
 ;}
     break;
 
-  case 50:
+  case 64:
 
     {
 	if (zconf_endtoken((yyvsp[(1) - (1)].id), T_CHOICE, T_ENDCHOICE)) {
@@ -1812,7 +1898,7 @@ yyreduce:
 ;}
     break;
 
-  case 58:
+  case 72:
 
     {
 	menu_add_prompt(P_PROMPT, (yyvsp[(2) - (4)].string), (yyvsp[(3) - (4)].expr));
@@ -1820,7 +1906,7 @@ yyreduce:
 ;}
     break;
 
-  case 59:
+  case 73:
 
     {
 	if ((yyvsp[(1) - (3)].id)->stype == S_BOOLEAN || (yyvsp[(1) - (3)].id)->stype == S_TRISTATE) {
@@ -1833,7 +1919,7 @@ yyreduce:
 ;}
     break;
 
-  case 60:
+  case 74:
 
     {
 	current_entry->sym->flags |= SYMBOL_OPTIONAL;
@@ -1841,7 +1927,7 @@ yyreduce:
 ;}
     break;
 
-  case 61:
+  case 75:
 
     {
 	if ((yyvsp[(1) - (4)].id)->stype == S_UNKNOWN) {
@@ -1853,7 +1939,7 @@ yyreduce:
 ;}
     break;
 
-  case 64:
+  case 78:
 
     {
 	printd(DEBUG_PARSE, "%s:%d:if\n", zconf_curname(), zconf_lineno());
@@ -1863,7 +1949,7 @@ yyreduce:
 ;}
     break;
 
-  case 65:
+  case 79:
 
     {
 	if (zconf_endtoken((yyvsp[(1) - (1)].id), T_IF, T_ENDIF)) {
@@ -1873,7 +1959,7 @@ yyreduce:
 ;}
     break;
 
-  case 71:
+  case 85:
 
     {
 	menu_add_entry(NULL);
@@ -1882,14 +1968,14 @@ yyreduce:
 ;}
     break;
 
-  case 72:
+  case 86:
 
     {
 	(yyval.menu) = menu_add_menu();
 ;}
     break;
 
-  case 73:
+  case 87:
 
     {
 	if (zconf_endtoken((yyvsp[(1) - (1)].id), T_MENU, T_ENDMENU)) {
@@ -1899,7 +1985,7 @@ yyreduce:
 ;}
     break;
 
-  case 79:
+  case 93:
 
     {
 	printd(DEBUG_PARSE, "%s:%d:source %s\n", zconf_curname(), zconf_lineno(), (yyvsp[(2) - (3)].string));
@@ -1907,7 +1993,7 @@ yyreduce:
 ;}
     break;
 
-  case 80:
+  case 94:
 
     {
 	menu_add_entry(NULL);
@@ -1916,14 +2002,14 @@ yyreduce:
 ;}
     break;
 
-  case 81:
+  case 95:
 
     {
 	menu_end_entry();
 ;}
     break;
 
-  case 82:
+  case 96:
 
     {
 	printd(DEBUG_PARSE, "%s:%d:help\n", zconf_curname(), zconf_lineno());
@@ -1931,14 +2017,14 @@ yyreduce:
 ;}
     break;
 
-  case 83:
+  case 97:
 
     {
 	current_entry->help = (yyvsp[(2) - (2)].string);
 ;}
     break;
 
-  case 88:
+  case 102:
 
     {
 	menu_add_dep((yyvsp[(3) - (4)].expr));
@@ -1946,84 +2032,84 @@ yyreduce:
 ;}
     break;
 
-  case 90:
+  case 104:
 
     {
 	menu_add_prompt(P_PROMPT, (yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].expr));
 ;}
     break;
 
-  case 93:
+  case 107:
 
     { (yyval.id) = (yyvsp[(1) - (2)].id); ;}
     break;
 
-  case 94:
+  case 108:
 
     { (yyval.id) = (yyvsp[(1) - (2)].id); ;}
     break;
 
-  case 95:
+  case 109:
 
     { (yyval.id) = (yyvsp[(1) - (2)].id); ;}
     break;
 
-  case 98:
+  case 112:
 
     { (yyval.expr) = NULL; ;}
     break;
 
-  case 99:
+  case 113:
 
     { (yyval.expr) = (yyvsp[(2) - (2)].expr); ;}
     break;
 
-  case 100:
+  case 114:
 
     { (yyval.expr) = expr_alloc_symbol((yyvsp[(1) - (1)].symbol)); ;}
     break;
 
-  case 101:
+  case 115:
 
     { (yyval.expr) = expr_alloc_comp(E_EQUAL, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); ;}
     break;
 
-  case 102:
+  case 116:
 
     { (yyval.expr) = expr_alloc_comp(E_UNEQUAL, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); ;}
     break;
 
-  case 103:
+  case 117:
 
     { (yyval.expr) = (yyvsp[(2) - (3)].expr); ;}
     break;
 
-  case 104:
+  case 118:
 
     { (yyval.expr) = expr_alloc_one(E_NOT, (yyvsp[(2) - (2)].expr)); ;}
     break;
 
-  case 105:
+  case 119:
 
     { (yyval.expr) = expr_alloc_two(E_OR, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
     break;
 
-  case 106:
+  case 120:
 
     { (yyval.expr) = expr_alloc_two(E_AND, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
     break;
 
-  case 107:
+  case 121:
 
     { (yyval.symbol) = sym_lookup((yyvsp[(1) - (1)].string), 0); free((yyvsp[(1) - (1)].string)); ;}
     break;
 
-  case 108:
+  case 122:
 
     { (yyval.symbol) = sym_lookup((yyvsp[(1) - (1)].string), SYMBOL_CONST); free((yyvsp[(1) - (1)].string)); ;}
     break;
 
-  case 109:
+  case 123:
 
     { (yyval.string) = NULL; ;}
     break;
Index: linux-2.6/scripts/kconfig/zconf.y
===================================================================
--- linux-2.6.orig/scripts/kconfig/zconf.y
+++ linux-2.6/scripts/kconfig/zconf.y
@@ -38,7 +38,7 @@ static struct menu *current_menu, *curre
 #define YYERROR_VERBOSE
 #endif
 %}
-%expect 26
+%expect 36
 
 %union
 {
@@ -59,6 +59,7 @@ static struct menu *current_menu, *curre
 %token <id>T_COMMENT
 %token <id>T_CONFIG
 %token <id>T_MENUCONFIG
+%token <id>T_MODULE
 %token <id>T_HELP
 %token <string> T_HELPTEXT
 %token <id>T_IF
@@ -71,6 +72,7 @@ static struct menu *current_menu, *curre
 %token <id>T_SELECT
 %token <id>T_RANGE
 %token <id>T_OPTION
+%token <id>T_SOURCES
 %token <id>T_ON
 %token <string> T_WORD
 %token <string> T_WORD_QUOTE
@@ -88,6 +90,7 @@ static struct menu *current_menu, *curre
 %type <symbol> symbol
 %type <expr> expr
 %type <expr> if_expr
+%type <expr> sources_list
 %type <id> end
 %type <id> option_name
 %type <menu> if_entry menu_entry choice_entry
@@ -128,6 +131,7 @@ common_stmt:
 	| comment_stmt
 	| config_stmt
 	| menuconfig_stmt
+	| module_stmt
 	| source_stmt
 ;
 
@@ -181,6 +185,44 @@ config_option_list:
 	| config_option_list T_EOL
 ;
 
+module_entry_start: T_MODULE T_WORD word_opt
+{
+	struct symbol *sym;
+	char name[128];
+	int i, len;
+
+	if (!$3) {
+		len = strlen($2);
+		for (i = 0; i < len; i++)
+			name[i] = toupper($2[i]);
+		name[i] = 0;
+		$3 = name;
+	}
+
+	sym = sym_lookup($3, 0);
+	sym->flags |= SYMBOL_OPTIONAL | SYMBOL_MODULE;
+	menu_add_entry(sym);
+	menu_add_symbol(P_MODULE, sym_lookup($2, SYMBOL_CONST), NULL);
+	printd(DEBUG_PARSE, "%s:%d:module %s\n", zconf_curname(), zconf_lineno(), $2);
+}
+
+module_stmt: module_entry_start module_option_list
+{
+	menu_end_entry();
+	printd(DEBUG_PARSE, "%s:%d:endmodule\n", zconf_curname(), zconf_lineno());
+}
+
+module_option_list:
+	  /* empty */
+	| module_option_list config_option
+	| module_option_list symbol_option
+	| module_option_list depends
+	| module_option_list help
+	| module_option_list option_error
+	| module_option_list sources_option
+	| module_option_list T_EOL
+;
+
 config_option: T_TYPE prompt_stmt_opt T_EOL
 {
 	menu_set_type($1->stype);
@@ -237,6 +279,23 @@ symbol_option_arg:
 	| T_EQUAL prompt	{ $$ = $2; }
 ;
 
+sources_option: T_SOURCES sources_list if_expr T_EOL
+{
+	menu_add_expr(P_SOURCES, $2, $3);
+};
+
+sources_list:
+	  prompt
+{
+	$$ = expr_alloc_one(E_LIST, NULL);
+	$$->right.sym = sym_lookup($1, SYMBOL_CONST);
+}
+	| sources_list prompt
+{
+	$$ = expr_alloc_one(E_LIST, $1);
+	$$->right.sym = sym_lookup($2, SYMBOL_CONST);
+};
+
 /* choice entry */
 
 choice: T_CHOICE word_opt T_EOL
