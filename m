Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:42139 "EHLO
	relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933014AbbENPgW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 14 May 2015 11:36:22 -0400
Date: Thu, 14 May 2015 08:36:09 -0700
From: Josh Triplett <josh@joshtriplett.org>
Subject: [PATCH 4/5] kconfig: Introduce "showif" to factor out conditions on
 visibility
Message-ID: <760264ebf529ba3b0aa007144e2862bc73807dad.1431589089.git.josh@joshtriplett.org>
References: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431589089.git.josh@joshtriplett.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e71aeef65671f2b60ce10b0b871585fd2baf850a.1431589089.git.josh@joshtriplett.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Michal Hocko <mhocko@suse.cz>, Josh Triplett <josh@joshtriplett.org>, Vladimir Davydov <vdavydov@parallels.com>, Johannes Weiner <hannes@cmpxchg.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Andy Lutomirski <luto@amacapital.net>, Bertrand Jacquin <beber@meleeweb.net>, "Luis R. Rodriguez" <mcgrof@suse.com>, Iulia Manda <iulia.manda21@gmail.com>, Pranith Kumar <bobby.prani@gmail.com>, Clark Williams <clark.williams@gmail.com>, Mel Gorman <mgorman@suse.de>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

kconfig implicitly creates a submenu whenever a series of symbols all
have dependencies or prompt-visibility expressions that all depend on a
preceeding symbol.  For instance, the series of symbols following
"menuconfig EXPERT" that all have "if EXPERT" on their prompt will all
appear as a submenu of EXPERT.

However, this implicit submenuing will break if any intervening symbol
loses its "if EXPERT"; doing so causes the subsequent symbols to appear
in the parent menu ("General setup").  This has happened many times, and
it's easy to miss that the entire block should have that same
expression.

For submenus created from "depends" dependencies, these can be converted
to a single wrapping "if expr ... endif" block around all the submenu
items.  However, there's no equivalent for invisible items, for which
the prompt is hidden but the symbol may potentially be enabled.  For
instance, many items in the EXPERT menu are hidden if EXPERT is
disabled, but they have "default y" or are determined by some other
expression.

To handle this case, introduce a new kconfig construct, "showif", which
does the same thing as "if" but for visibility expressions rather than
dependencies.  Every symbol in a "showif expr ... endif" block
effectively has "if expr" added to its prompt.

Signed-off-by: Josh Triplett <josh@joshtriplett.org>
Acked-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
---
 scripts/kconfig/menu.c               |   4 +-
 scripts/kconfig/zconf.gperf          |   1 +
 scripts/kconfig/zconf.hash.c_shipped | 258 ++++++++--------
 scripts/kconfig/zconf.tab.c_shipped  | 561 +++++++++++++++++++----------------
 scripts/kconfig/zconf.y              |  28 +-
 5 files changed, 459 insertions(+), 393 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index b05cc3d..75b7467 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -344,7 +344,9 @@ void menu_finalize(struct menu *parent)
 		basedep = expr_eliminate_dups(expr_transform(basedep));
 		last_menu = NULL;
 		for (menu = parent->next; menu; menu = menu->next) {
-			dep = menu->prompt ? menu->prompt->visible.expr : menu->dep;
+			dep = menu->prompt ? menu->prompt->visible.expr
+			    : menu->visibility ? menu->visibility
+			    : menu->dep;
 			if (!expr_contains_symbol(dep, sym))
 				break;
 			if (expr_depends_symbol(dep, sym))
diff --git a/scripts/kconfig/zconf.gperf b/scripts/kconfig/zconf.gperf
index b6ac02d..fd602b5 100644
--- a/scripts/kconfig/zconf.gperf
+++ b/scripts/kconfig/zconf.gperf
@@ -23,6 +23,7 @@ config,		T_CONFIG,	TF_COMMAND
 menuconfig,	T_MENUCONFIG,	TF_COMMAND
 help,		T_HELP,		TF_COMMAND
 if,		T_IF,		TF_COMMAND|TF_PARAM
+showif,		T_SHOWIF,	TF_COMMAND
 endif,		T_ENDIF,	TF_COMMAND
 depends,	T_DEPENDS,	TF_COMMAND
 optional,	T_OPTIONAL,	TF_COMMAND
diff --git a/scripts/kconfig/zconf.hash.c_shipped b/scripts/kconfig/zconf.hash.c_shipped
index c77a8ef..eab7830 100644
--- a/scripts/kconfig/zconf.hash.c_shipped
+++ b/scripts/kconfig/zconf.hash.c_shipped
@@ -32,7 +32,7 @@
 struct kconf_id;
 
 static const struct kconf_id *kconf_id_lookup(register const char *str, register unsigned int len);
-/* maximum key range = 71, duplicates = 0 */
+/* maximum key range = 53, duplicates = 0 */
 
 #ifdef __GNUC__
 __inline
@@ -46,32 +46,32 @@ kconf_id_hash (register const char *str, register unsigned int len)
 {
   static const unsigned char asso_values[] =
     {
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73,  5, 25, 25,
-       0,  0,  0,  5,  0,  0, 73, 73,  5,  0,
-      10,  5, 45, 73, 20, 20,  0, 15, 15, 73,
-      20,  5, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55,  5, 15, 15,
+       0,  0,  0,  0,  0,  0, 55, 55, 15, 15,
+      20,  5, 35, 55,  0,  0,  0, 10, 25, 55,
+       5,  5, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55, 55, 55, 55, 55,
+      55, 55, 55, 55, 55, 55
     };
   register int hval = len;
 
@@ -93,72 +93,74 @@ struct kconf_id_strings_t
     char kconf_id_strings_str2[sizeof("if")];
     char kconf_id_strings_str3[sizeof("int")];
     char kconf_id_strings_str5[sizeof("endif")];
+    char kconf_id_strings_str6[sizeof("string")];
     char kconf_id_strings_str7[sizeof("default")];
     char kconf_id_strings_str8[sizeof("tristate")];
     char kconf_id_strings_str9[sizeof("endchoice")];
+    char kconf_id_strings_str11[sizeof("showif")];
     char kconf_id_strings_str12[sizeof("def_tristate")];
-    char kconf_id_strings_str13[sizeof("def_bool")];
+    char kconf_id_strings_str13[sizeof("hex")];
     char kconf_id_strings_str14[sizeof("defconfig_list")];
-    char kconf_id_strings_str17[sizeof("on")];
-    char kconf_id_strings_str18[sizeof("optional")];
-    char kconf_id_strings_str21[sizeof("option")];
-    char kconf_id_strings_str22[sizeof("endmenu")];
-    char kconf_id_strings_str23[sizeof("mainmenu")];
-    char kconf_id_strings_str25[sizeof("menuconfig")];
-    char kconf_id_strings_str27[sizeof("modules")];
-    char kconf_id_strings_str28[sizeof("allnoconfig_y")];
-    char kconf_id_strings_str29[sizeof("menu")];
-    char kconf_id_strings_str31[sizeof("select")];
-    char kconf_id_strings_str32[sizeof("comment")];
-    char kconf_id_strings_str33[sizeof("env")];
-    char kconf_id_strings_str35[sizeof("range")];
-    char kconf_id_strings_str36[sizeof("choice")];
+    char kconf_id_strings_str16[sizeof("source")];
+    char kconf_id_strings_str17[sizeof("endmenu")];
+    char kconf_id_strings_str21[sizeof("select")];
+    char kconf_id_strings_str22[sizeof("modules")];
+    char kconf_id_strings_str23[sizeof("def_bool")];
+    char kconf_id_strings_str25[sizeof("range")];
+    char kconf_id_strings_str26[sizeof("choice")];
+    char kconf_id_strings_str27[sizeof("on")];
+    char kconf_id_strings_str28[sizeof("optional")];
+    char kconf_id_strings_str31[sizeof("option")];
+    char kconf_id_strings_str32[sizeof("visible")];
+    char kconf_id_strings_str33[sizeof("mainmenu")];
+    char kconf_id_strings_str37[sizeof("comment")];
+    char kconf_id_strings_str38[sizeof("allnoconfig_y")];
     char kconf_id_strings_str39[sizeof("bool")];
-    char kconf_id_strings_str41[sizeof("source")];
-    char kconf_id_strings_str42[sizeof("visible")];
-    char kconf_id_strings_str43[sizeof("hex")];
-    char kconf_id_strings_str46[sizeof("config")];
+    char kconf_id_strings_str41[sizeof("config")];
+    char kconf_id_strings_str42[sizeof("depends")];
+    char kconf_id_strings_str45[sizeof("menuconfig")];
+    char kconf_id_strings_str46[sizeof("prompt")];
     char kconf_id_strings_str47[sizeof("boolean")];
-    char kconf_id_strings_str51[sizeof("string")];
+    char kconf_id_strings_str49[sizeof("menu")];
+    char kconf_id_strings_str53[sizeof("env")];
     char kconf_id_strings_str54[sizeof("help")];
-    char kconf_id_strings_str56[sizeof("prompt")];
-    char kconf_id_strings_str72[sizeof("depends")];
   };
 static const struct kconf_id_strings_t kconf_id_strings_contents =
   {
     "if",
     "int",
     "endif",
+    "string",
     "default",
     "tristate",
     "endchoice",
+    "showif",
     "def_tristate",
-    "def_bool",
+    "hex",
     "defconfig_list",
+    "source",
+    "endmenu",
+    "select",
+    "modules",
+    "def_bool",
+    "range",
+    "choice",
     "on",
     "optional",
     "option",
-    "endmenu",
+    "visible",
     "mainmenu",
-    "menuconfig",
-    "modules",
-    "allnoconfig_y",
-    "menu",
-    "select",
     "comment",
-    "env",
-    "range",
-    "choice",
+    "allnoconfig_y",
     "bool",
-    "source",
-    "visible",
-    "hex",
     "config",
-    "boolean",
-    "string",
-    "help",
+    "depends",
+    "menuconfig",
     "prompt",
-    "depends"
+    "boolean",
+    "menu",
+    "env",
+    "help"
   };
 #define kconf_id_strings ((const char *) &kconf_id_strings_contents)
 #ifdef __GNUC__
@@ -172,11 +174,11 @@ kconf_id_lookup (register const char *str, register unsigned int len)
 {
   enum
     {
-      TOTAL_KEYWORDS = 33,
+      TOTAL_KEYWORDS = 34,
       MIN_WORD_LENGTH = 2,
       MAX_WORD_LENGTH = 14,
       MIN_HASH_VALUE = 2,
-      MAX_HASH_VALUE = 72
+      MAX_HASH_VALUE = 54
     };
 
   static const struct kconf_id wordlist[] =
@@ -184,87 +186,83 @@ kconf_id_lookup (register const char *str, register unsigned int len)
       {-1}, {-1},
 #line 25 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str2,		T_IF,		TF_COMMAND|TF_PARAM},
-#line 36 "scripts/kconfig/zconf.gperf"
+#line 37 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str3,		T_TYPE,		TF_COMMAND, S_INT},
       {-1},
-#line 26 "scripts/kconfig/zconf.gperf"
+#line 27 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str5,		T_ENDIF,	TF_COMMAND},
-      {-1},
-#line 29 "scripts/kconfig/zconf.gperf"
+#line 39 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str6,		T_TYPE,		TF_COMMAND, S_STRING},
+#line 30 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str7,	T_DEFAULT,	TF_COMMAND, S_UNKNOWN},
-#line 31 "scripts/kconfig/zconf.gperf"
+#line 32 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str8,	T_TYPE,		TF_COMMAND, S_TRISTATE},
 #line 20 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str9,	T_ENDCHOICE,	TF_COMMAND},
-      {-1}, {-1},
-#line 32 "scripts/kconfig/zconf.gperf"
+      {-1},
+#line 26 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str11,		T_SHOWIF,	TF_COMMAND},
+#line 33 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str12,	T_DEFAULT,	TF_COMMAND, S_TRISTATE},
-#line 35 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str13,	T_DEFAULT,	TF_COMMAND, S_BOOLEAN},
-#line 45 "scripts/kconfig/zconf.gperf"
+#line 38 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str13,		T_TYPE,		TF_COMMAND, S_HEX},
+#line 46 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str14,	T_OPT_DEFCONFIG_LIST,TF_OPTION},
+      {-1},
+#line 18 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str16,		T_SOURCE,	TF_COMMAND},
+#line 17 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str17,	T_ENDMENU,	TF_COMMAND},
+      {-1}, {-1}, {-1},
+#line 40 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str21,		T_SELECT,	TF_COMMAND},
+#line 45 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str22,	T_OPT_MODULES,	TF_OPTION},
+#line 36 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str23,	T_DEFAULT,	TF_COMMAND, S_BOOLEAN},
+      {-1},
+#line 41 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str25,		T_RANGE,	TF_COMMAND},
+#line 19 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str26,		T_CHOICE,	TF_COMMAND},
+#line 44 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str27,		T_ON,		TF_PARAM},
+#line 29 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str28,	T_OPTIONAL,	TF_COMMAND},
       {-1}, {-1},
 #line 43 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str17,		T_ON,		TF_PARAM},
-#line 28 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str18,	T_OPTIONAL,	TF_COMMAND},
-      {-1}, {-1},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str31,		T_OPTION,	TF_COMMAND},
 #line 42 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str21,		T_OPTION,	TF_COMMAND},
-#line 17 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str22,	T_ENDMENU,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str32,	T_VISIBLE,	TF_COMMAND},
 #line 15 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str23,	T_MAINMENU,	TF_COMMAND},
-      {-1},
-#line 23 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str25,	T_MENUCONFIG,	TF_COMMAND},
-      {-1},
-#line 44 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str27,	T_OPT_MODULES,	TF_OPTION},
-#line 47 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str28,	T_OPT_ALLNOCONFIG_Y,TF_OPTION},
-#line 16 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str29,		T_MENU,		TF_COMMAND},
-      {-1},
-#line 39 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str31,		T_SELECT,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str33,	T_MAINMENU,	TF_COMMAND},
+      {-1}, {-1}, {-1},
 #line 21 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str32,	T_COMMENT,	TF_COMMAND},
-#line 46 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str33,		T_OPT_ENV,	TF_OPTION},
-      {-1},
-#line 40 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str35,		T_RANGE,	TF_COMMAND},
-#line 19 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str36,		T_CHOICE,	TF_COMMAND},
-      {-1}, {-1},
-#line 33 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str37,	T_COMMENT,	TF_COMMAND},
+#line 48 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str38,	T_OPT_ALLNOCONFIG_Y,TF_OPTION},
+#line 34 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str39,		T_TYPE,		TF_COMMAND, S_BOOLEAN},
       {-1},
-#line 18 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str41,		T_SOURCE,	TF_COMMAND},
-#line 41 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str42,	T_VISIBLE,	TF_COMMAND},
-#line 37 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str43,		T_TYPE,		TF_COMMAND, S_HEX},
-      {-1}, {-1},
 #line 22 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str46,		T_CONFIG,	TF_COMMAND},
-#line 34 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str41,		T_CONFIG,	TF_COMMAND},
+#line 28 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str42,	T_DEPENDS,	TF_COMMAND},
+      {-1}, {-1},
+#line 23 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str45,	T_MENUCONFIG,	TF_COMMAND},
+#line 31 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str46,		T_PROMPT,	TF_COMMAND},
+#line 35 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str47,	T_TYPE,		TF_COMMAND, S_BOOLEAN},
+      {-1},
+#line 16 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str49,		T_MENU,		TF_COMMAND},
       {-1}, {-1}, {-1},
-#line 38 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str51,		T_TYPE,		TF_COMMAND, S_STRING},
-      {-1}, {-1},
+#line 47 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str53,		T_OPT_ENV,	TF_OPTION},
 #line 24 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str54,		T_HELP,		TF_COMMAND},
-      {-1},
-#line 30 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str56,		T_PROMPT,	TF_COMMAND},
-      {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1},
-      {-1}, {-1}, {-1}, {-1}, {-1}, {-1},
-#line 27 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str72,	T_DEPENDS,	TF_COMMAND}
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str54,		T_HELP,		TF_COMMAND}
     };
 
   if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
@@ -285,5 +283,5 @@ kconf_id_lookup (register const char *str, register unsigned int len)
     }
   return 0;
 }
-#line 48 "scripts/kconfig/zconf.gperf"
+#line 49 "scripts/kconfig/zconf.gperf"
 
diff --git a/scripts/kconfig/zconf.tab.c_shipped b/scripts/kconfig/zconf.tab.c_shipped
index 0864c7d..c7d6ced 100644
--- a/scripts/kconfig/zconf.tab.c_shipped
+++ b/scripts/kconfig/zconf.tab.c_shipped
@@ -148,27 +148,28 @@ extern int zconfdebug;
     T_HELP = 267,
     T_HELPTEXT = 268,
     T_IF = 269,
-    T_ENDIF = 270,
-    T_DEPENDS = 271,
-    T_OPTIONAL = 272,
-    T_PROMPT = 273,
-    T_TYPE = 274,
-    T_DEFAULT = 275,
-    T_SELECT = 276,
-    T_RANGE = 277,
-    T_VISIBLE = 278,
-    T_OPTION = 279,
-    T_ON = 280,
-    T_WORD = 281,
-    T_WORD_QUOTE = 282,
-    T_UNEQUAL = 283,
-    T_CLOSE_PAREN = 284,
-    T_OPEN_PAREN = 285,
-    T_EOL = 286,
-    T_OR = 287,
-    T_AND = 288,
-    T_EQUAL = 289,
-    T_NOT = 290
+    T_SHOWIF = 270,
+    T_ENDIF = 271,
+    T_DEPENDS = 272,
+    T_OPTIONAL = 273,
+    T_PROMPT = 274,
+    T_TYPE = 275,
+    T_DEFAULT = 276,
+    T_SELECT = 277,
+    T_RANGE = 278,
+    T_VISIBLE = 279,
+    T_OPTION = 280,
+    T_ON = 281,
+    T_WORD = 282,
+    T_WORD_QUOTE = 283,
+    T_UNEQUAL = 284,
+    T_CLOSE_PAREN = 285,
+    T_OPEN_PAREN = 286,
+    T_EOL = 287,
+    T_OR = 288,
+    T_AND = 289,
+    T_EQUAL = 290,
+    T_NOT = 291
   };
 #endif
 
@@ -447,21 +448,21 @@ union yyalloc
 /* YYFINAL -- State number of the termination state.  */
 #define YYFINAL  11
 /* YYLAST -- Last index in YYTABLE.  */
-#define YYLAST   290
+#define YYLAST   303
 
 /* YYNTOKENS -- Number of terminals.  */
-#define YYNTOKENS  36
+#define YYNTOKENS  37
 /* YYNNTS -- Number of nonterminals.  */
-#define YYNNTS  50
+#define YYNNTS  53
 /* YYNRULES -- Number of rules.  */
-#define YYNRULES  118
+#define YYNRULES  122
 /* YYNSTATES -- Number of states.  */
-#define YYNSTATES  191
+#define YYNSTATES  199
 
 /* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
    by yylex, with out-of-bounds checking.  */
 #define YYUNDEFTOK  2
-#define YYMAXUTOK   290
+#define YYMAXUTOK   291
 
 #define YYTRANSLATE(YYX)                                                \
   ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)
@@ -499,25 +500,26 @@ static const yytype_uint8 yytranslate[] =
        5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
       15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
-      35
+      35,    36
 };
 
 #if YYDEBUG
   /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
 static const yytype_uint16 yyrline[] =
 {
-       0,   103,   103,   103,   105,   105,   107,   109,   110,   111,
-     112,   113,   114,   118,   122,   122,   122,   122,   122,   122,
-     122,   122,   126,   127,   128,   129,   130,   131,   135,   136,
-     142,   150,   156,   164,   174,   176,   177,   178,   179,   180,
-     181,   184,   192,   198,   208,   214,   220,   223,   225,   236,
-     237,   242,   251,   256,   264,   267,   269,   270,   271,   272,
-     273,   276,   282,   293,   299,   309,   311,   316,   324,   332,
-     335,   337,   338,   339,   344,   351,   358,   363,   371,   374,
-     376,   377,   378,   381,   389,   396,   403,   409,   416,   418,
-     419,   420,   423,   431,   433,   434,   437,   444,   446,   451,
-     452,   455,   456,   457,   461,   462,   465,   466,   469,   470,
-     471,   472,   473,   474,   475,   478,   479,   482,   483
+       0,   104,   104,   104,   106,   106,   108,   110,   111,   112,
+     113,   114,   115,   119,   123,   123,   123,   123,   123,   123,
+     123,   123,   127,   128,   129,   130,   131,   132,   133,   137,
+     138,   144,   152,   158,   166,   176,   178,   179,   180,   181,
+     182,   183,   186,   194,   200,   210,   216,   222,   225,   227,
+     238,   239,   244,   253,   258,   266,   269,   271,   272,   273,
+     274,   275,   278,   284,   295,   301,   311,   313,   318,   326,
+     334,   342,   350,   353,   356,   358,   359,   360,   365,   372,
+     379,   384,   392,   395,   397,   398,   399,   402,   410,   417,
+     424,   430,   437,   439,   440,   441,   444,   452,   454,   455,
+     458,   465,   467,   472,   473,   476,   477,   478,   482,   483,
+     486,   487,   490,   491,   492,   493,   494,   495,   496,   499,
+     500,   503,   504
 };
 #endif
 
@@ -528,17 +530,18 @@ static const char *const yytname[] =
 {
   "$end", "error", "$undefined", "T_MAINMENU", "T_MENU", "T_ENDMENU",
   "T_SOURCE", "T_CHOICE", "T_ENDCHOICE", "T_COMMENT", "T_CONFIG",
-  "T_MENUCONFIG", "T_HELP", "T_HELPTEXT", "T_IF", "T_ENDIF", "T_DEPENDS",
-  "T_OPTIONAL", "T_PROMPT", "T_TYPE", "T_DEFAULT", "T_SELECT", "T_RANGE",
-  "T_VISIBLE", "T_OPTION", "T_ON", "T_WORD", "T_WORD_QUOTE", "T_UNEQUAL",
-  "T_CLOSE_PAREN", "T_OPEN_PAREN", "T_EOL", "T_OR", "T_AND", "T_EQUAL",
-  "T_NOT", "$accept", "input", "start", "stmt_list", "option_name",
-  "common_stmt", "option_error", "config_entry_start", "config_stmt",
-  "menuconfig_entry_start", "menuconfig_stmt", "config_option_list",
-  "config_option", "symbol_option", "symbol_option_list",
-  "symbol_option_arg", "choice", "choice_entry", "choice_end",
-  "choice_stmt", "choice_option_list", "choice_option", "choice_block",
-  "if_entry", "if_end", "if_stmt", "if_block", "mainmenu_stmt", "menu",
+  "T_MENUCONFIG", "T_HELP", "T_HELPTEXT", "T_IF", "T_SHOWIF", "T_ENDIF",
+  "T_DEPENDS", "T_OPTIONAL", "T_PROMPT", "T_TYPE", "T_DEFAULT", "T_SELECT",
+  "T_RANGE", "T_VISIBLE", "T_OPTION", "T_ON", "T_WORD", "T_WORD_QUOTE",
+  "T_UNEQUAL", "T_CLOSE_PAREN", "T_OPEN_PAREN", "T_EOL", "T_OR", "T_AND",
+  "T_EQUAL", "T_NOT", "$accept", "input", "start", "stmt_list",
+  "option_name", "common_stmt", "option_error", "config_entry_start",
+  "config_stmt", "menuconfig_entry_start", "menuconfig_stmt",
+  "config_option_list", "config_option", "symbol_option",
+  "symbol_option_list", "symbol_option_arg", "choice", "choice_entry",
+  "choice_end", "choice_stmt", "choice_option_list", "choice_option",
+  "choice_block", "if_entry", "showif_entry", "if_end", "showif_end",
+  "if_stmt", "showif_stmt", "if_block", "mainmenu_stmt", "menu",
   "menu_entry", "menu_end", "menu_stmt", "menu_block", "source_stmt",
   "comment", "comment_stmt", "help_start", "help", "depends_list",
   "depends", "visibility_list", "visible", "prompt_stmt_opt", "prompt",
@@ -554,16 +557,16 @@ static const yytype_uint16 yytoknum[] =
        0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
      265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
      275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
-     285,   286,   287,   288,   289,   290
+     285,   286,   287,   288,   289,   290,   291
 };
 # endif
 
-#define YYPACT_NINF -90
+#define YYPACT_NINF -105
 
 #define yypact_value_is_default(Yystate) \
-  (!!((Yystate) == (-90)))
+  (!!((Yystate) == (-105)))
 
-#define YYTABLE_NINF -86
+#define YYTABLE_NINF -90
 
 #define yytable_value_is_error(Yytable_value) \
   0
@@ -572,26 +575,26 @@ static const yytype_uint16 yytoknum[] =
      STATE-NUM.  */
 static const yytype_int16 yypact[] =
 {
-       4,    42,   -90,    96,   -90,   111,   -90,    15,   -90,   -90,
-      75,   -90,    82,    42,   104,    42,   110,   107,    42,   115,
-     125,    -4,   121,   -90,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   162,   -90,   163,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   139,   -90,   -90,   138,   -90,   142,   -90,   143,   -90,
-     152,   -90,   164,   167,   168,   -90,   -90,    -4,    -4,    77,
-     -18,   -90,   177,   185,    33,    71,   195,   247,   236,    -2,
-     236,   171,   -90,   -90,   -90,   -90,   -90,   -90,    41,   -90,
-      -4,    -4,   138,    97,    97,   -90,   -90,   186,   187,   194,
-      42,    42,    -4,   196,    97,   -90,   219,   -90,   -90,   -90,
-     -90,   210,   -90,   -90,   204,    42,    42,   199,   -90,   -90,
-     -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   222,   -90,   223,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   -90,   -90,   -90,   215,   -90,   -90,   -90,   -90,   -90,
-      -4,   222,   228,   222,    -5,   222,    97,    35,   229,   -90,
-     -90,   222,   232,   222,    -4,   -90,   135,   233,   -90,   -90,
-     234,   235,   222,   240,   -90,   -90,   237,   -90,   239,   -13,
-     -90,   -90,   -90,   -90,   244,    42,   -90,   -90,   -90,   -90,
-     -90
+      15,   -19,  -105,     6,  -105,   125,  -105,    29,  -105,  -105,
+      13,  -105,    20,   -19,    22,   -19,    33,    30,   -19,    36,
+      43,    50,    50,    48,  -105,  -105,  -105,  -105,  -105,  -105,
+    -105,  -105,    90,  -105,    93,  -105,  -105,  -105,  -105,  -105,
+    -105,  -105,  -105,  -105,  -105,  -105,  -105,  -105,  -105,  -105,
+    -105,  -105,  -105,  -105,   154,  -105,  -105,    58,  -105,    63,
+    -105,    86,  -105,    95,  -105,    96,   106,   118,  -105,  -105,
+      50,    50,    89,   -24,    89,  -105,   121,   124,    19,    92,
+     214,   271,   257,   257,    24,   257,   189,  -105,  -105,  -105,
+    -105,  -105,  -105,    55,  -105,    50,    50,    58,    -6,    -6,
+      58,  -105,  -105,   134,   135,   162,   -19,   -19,    50,   164,
+      -6,  -105,   200,  -105,  -105,  -105,  -105,   201,  -105,  -105,
+     170,   -19,   -19,   190,  -105,  -105,  -105,  -105,  -105,  -105,
+    -105,  -105,  -105,  -105,  -105,  -105,  -105,  -105,  -105,   204,
+    -105,   243,  -105,  -105,  -105,  -105,  -105,  -105,  -105,  -105,
+    -105,  -105,   193,  -105,  -105,  -105,  -105,  -105,    50,   204,
+     207,   204,    39,   204,    -6,    52,   223,  -105,  -105,   204,
+     224,   204,    50,  -105,   258,   237,  -105,  -105,   242,   246,
+     204,   248,  -105,  -105,   252,  -105,   256,    49,  -105,  -105,
+    -105,  -105,   261,   -19,  -105,  -105,  -105,  -105,  -105
 };
 
   /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
@@ -599,46 +602,48 @@ static const yytype_int16 yypact[] =
      means the default is an error.  */
 static const yytype_uint8 yydefact[] =
 {
-       6,     0,   104,     0,     3,     0,     6,     6,    99,   100,
-       0,     1,     0,     0,     0,     0,   117,     0,     0,     0,
-       0,     0,     0,    14,    18,    15,    16,    20,    17,    19,
-      21,     0,    22,     0,     7,    34,    25,    34,    26,    55,
-      65,     8,    70,    23,    93,    79,     9,    27,    88,    24,
-      10,     0,   105,     2,    74,    13,     0,   101,     0,   118,
-       0,   102,     0,     0,     0,   115,   116,     0,     0,     0,
-     108,   103,     0,     0,     0,     0,     0,     0,     0,    88,
-       0,     0,    75,    83,    51,    84,    30,    32,     0,   112,
-       0,     0,    67,     0,     0,    11,    12,     0,     0,     0,
-       0,    97,     0,     0,     0,    47,     0,    40,    39,    35,
-      36,     0,    38,    37,     0,     0,    97,     0,    59,    60,
-      56,    58,    57,    66,    54,    53,    71,    73,    69,    72,
-      68,   106,    95,     0,    94,    80,    82,    78,    81,    77,
-      90,    91,    89,   111,   113,   114,   110,   109,    29,    86,
-       0,   106,     0,   106,   106,   106,     0,     0,     0,    87,
-      63,   106,     0,   106,     0,    96,     0,     0,    41,    98,
-       0,     0,   106,    49,    46,    28,     0,    62,     0,   107,
-      92,    42,    43,    44,     0,     0,    48,    61,    64,    45,
-      50
+       6,     0,   108,     0,     3,     0,     6,     6,   103,   104,
+       0,     1,     0,     0,     0,     0,   121,     0,     0,     0,
+       0,     0,     0,     0,    14,    18,    15,    16,    20,    17,
+      19,    21,     0,    22,     0,     7,    35,    26,    35,    27,
+      56,    66,     8,    74,    74,    23,    24,    97,    83,     9,
+      28,    92,    25,    10,     0,   109,     2,    78,    13,     0,
+     105,     0,   122,     0,   106,     0,     0,     0,   119,   120,
+       0,     0,     0,   112,     0,   107,     0,     0,     0,     0,
+       0,     0,     0,     0,    92,     0,     0,    79,    87,    52,
+      88,    31,    33,     0,   116,     0,     0,    68,     0,     0,
+      69,    11,    12,     0,     0,     0,     0,   101,     0,     0,
+       0,    48,     0,    41,    40,    36,    37,     0,    39,    38,
+       0,     0,   101,     0,    60,    61,    57,    59,    58,    67,
+      55,    54,    75,    77,    72,    76,    70,    73,    71,   110,
+      99,     0,    98,    84,    86,    82,    85,    81,    94,    95,
+      93,   115,   117,   118,   114,   113,    30,    90,     0,   110,
+       0,   110,   110,   110,     0,     0,     0,    91,    64,   110,
+       0,   110,     0,   100,     0,     0,    42,   102,     0,     0,
+     110,    50,    47,    29,     0,    63,     0,   111,    96,    43,
+      44,    45,     0,     0,    49,    62,    65,    46,    51
 };
 
   /* YYPGOTO[NTERM-NUM].  */
 static const yytype_int16 yypgoto[] =
 {
-     -90,   -90,   269,   271,   -90,    23,   -70,   -90,   -90,   -90,
-     -90,   243,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -48,
-     -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   -20,   -90,   -90,   -90,   -90,   -90,   206,   205,   -68,
-     -90,   -90,   169,    -1,    27,    -7,   118,   -66,   -89,   -90
+    -105,  -105,   287,   289,  -105,   102,   -73,  -105,  -105,  -105,
+    -105,   259,  -105,  -105,  -105,  -105,  -105,  -105,  -105,    97,
+    -105,  -105,  -105,  -105,  -105,  -105,  -105,  -105,  -105,   254,
+    -105,  -105,  -105,  -105,   160,  -105,  -105,  -105,  -105,  -105,
+     216,   215,   -70,  -105,  -105,   178,    -1,   155,    -8,  -104,
+     -21,   -95,  -105
 };
 
   /* YYDEFGOTO[NTERM-NUM].  */
 static const yytype_int16 yydefgoto[] =
 {
-      -1,     3,     4,     5,    33,    34,   108,    35,    36,    37,
-      38,    74,   109,   110,   157,   186,    39,    40,   124,    41,
-      76,   120,    77,    42,   128,    43,    78,     6,    44,    45,
-     137,    46,    80,    47,    48,    49,   111,   112,    81,   113,
-      79,   134,   152,   153,    50,     7,   165,    69,    70,    60
+      -1,     3,     4,     5,    34,    35,   114,    36,    37,    38,
+      39,    78,   115,   116,   165,   194,    40,    41,   130,    42,
+      80,   126,    81,    43,    44,   134,   137,    45,    46,    82,
+       6,    47,    48,   145,    49,    85,    50,    51,    52,   117,
+     118,    86,   119,    84,   142,   160,   161,    53,     7,   173,
+      72,    73,    63
 };
 
   /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
@@ -646,113 +651,116 @@ static const yytype_int16 yydefgoto[] =
      number is the opposite.  If YYTABLE_NINF, syntax error.  */
 static const yytype_int16 yytable[] =
 {
-      10,    88,    89,    54,   146,   147,   119,     1,   122,   164,
-      93,   141,    56,   142,    58,   156,    94,    62,     1,    90,
-      91,   131,    65,    66,   144,   145,    67,    90,    91,   132,
-     127,    68,   136,   -31,    97,     2,   154,   -31,   -31,   -31,
-     -31,   -31,   -31,   -31,   -31,    98,    52,   -31,   -31,    99,
-     -31,   100,   101,   102,   103,   104,   -31,   105,   129,   106,
-     138,   173,    92,   141,   107,   142,   174,   172,     8,     9,
-     143,   -33,    97,    90,    91,   -33,   -33,   -33,   -33,   -33,
-     -33,   -33,   -33,    98,   166,   -33,   -33,    99,   -33,   100,
-     101,   102,   103,   104,   -33,   105,    11,   106,   179,   151,
-     123,   126,   107,   135,   125,   130,     2,   139,     2,    90,
-      91,    -5,    12,    55,   161,    13,    14,    15,    16,    17,
-      18,    19,    20,    65,    66,    21,    22,    23,    24,    25,
-      26,    27,    28,    29,    30,    57,    59,    31,    61,    -4,
-      12,    63,    32,    13,    14,    15,    16,    17,    18,    19,
-      20,    64,    71,    21,    22,    23,    24,    25,    26,    27,
-      28,    29,    30,    72,    73,    31,   180,    90,    91,    52,
-      32,   -85,    97,    82,    83,   -85,   -85,   -85,   -85,   -85,
-     -85,   -85,   -85,    84,   190,   -85,   -85,    99,   -85,   -85,
-     -85,   -85,   -85,   -85,   -85,    85,    97,   106,    86,    87,
-     -52,   -52,   140,   -52,   -52,   -52,   -52,    98,    95,   -52,
-     -52,    99,   114,   115,   116,   117,    96,   148,   149,   150,
-     158,   106,   155,   159,    97,   163,   118,   -76,   -76,   -76,
-     -76,   -76,   -76,   -76,   -76,   160,   164,   -76,   -76,    99,
-      13,    14,    15,    16,    17,    18,    19,    20,    91,   106,
-      21,    22,    14,    15,   140,    17,    18,    19,    20,   168,
-     175,    21,    22,   177,   181,   182,   183,    32,   187,   167,
-     188,   169,   170,   171,   185,   189,    53,    51,    32,   176,
-      75,   178,   121,     0,   133,   162,     0,     0,     0,     0,
-     184
+      10,    74,    57,   154,   155,    98,    11,   125,     8,     9,
+     128,    99,    59,   149,    61,   164,   150,    65,     1,   -32,
+     103,    68,    69,   -32,   -32,   -32,   -32,   -32,   -32,   -32,
+     -32,   104,     1,   -32,   -32,   -32,   105,   -32,   106,   107,
+     108,   109,   110,   -32,   111,     2,   112,     2,   139,    93,
+      94,   113,    58,   172,    60,   175,   140,   177,   178,   179,
+      62,    55,    64,    66,    97,   184,   100,   186,   149,   180,
+      67,   150,    95,    96,   152,   153,   192,    68,    69,   181,
+      75,    70,    95,    96,   182,   151,    71,   162,    95,    96,
+      55,    76,   -34,   103,    77,    87,   -34,   -34,   -34,   -34,
+     -34,   -34,   -34,   -34,   104,   159,   -34,   -34,   -34,   105,
+     -34,   106,   107,   108,   109,   110,   -34,   111,    88,   112,
+     169,     2,    95,    96,   113,    -5,    12,    89,    90,    13,
+      14,    15,    16,    17,    18,    19,    20,   174,    91,    21,
+      22,    23,    24,    25,    26,    27,    28,    29,    30,    31,
+      92,   187,    32,   101,    -4,    12,   102,    33,    13,    14,
+      15,    16,    17,    18,    19,    20,   156,   157,    21,    22,
+      23,    24,    25,    26,    27,    28,    29,    30,    31,   133,
+     133,    32,   144,   129,   132,   132,    33,   143,   158,   -89,
+     103,   163,   198,   -89,   -89,   -89,   -89,   -89,   -89,   -89,
+     -89,   166,   168,   -89,   -89,   -89,   105,   -89,   -89,   -89,
+     -89,   -89,   -89,   -89,   167,   103,   112,   171,   172,   -53,
+     -53,   148,   -53,   -53,   -53,   -53,   104,    96,   -53,   -53,
+     -53,   105,   120,   121,   122,   123,   131,   136,   138,   176,
+     147,   112,   135,   135,   103,   146,   124,   -80,   -80,   -80,
+     -80,   -80,   -80,   -80,   -80,   183,   185,   -80,   -80,   -80,
+     105,    13,    14,    15,    16,    17,    18,    19,    20,   189,
+     112,    21,    22,    23,   190,   148,    14,    15,   191,    17,
+      18,    19,    20,   193,   195,    21,    22,    23,   196,    33,
+     188,    95,    96,   197,    56,    54,   127,    79,    83,   141,
+     170,     0,     0,    33
 };
 
 static const yytype_int16 yycheck[] =
 {
-       1,    67,    68,    10,    93,    94,    76,     3,    76,    14,
-      28,    81,    13,    81,    15,   104,    34,    18,     3,    32,
-      33,    23,    26,    27,    90,    91,    30,    32,    33,    31,
-      78,    35,    80,     0,     1,    31,   102,     4,     5,     6,
-       7,     8,     9,    10,    11,    12,    31,    14,    15,    16,
-      17,    18,    19,    20,    21,    22,    23,    24,    78,    26,
-      80,    26,    69,   133,    31,   133,    31,   156,    26,    27,
-      29,     0,     1,    32,    33,     4,     5,     6,     7,     8,
-       9,    10,    11,    12,   150,    14,    15,    16,    17,    18,
-      19,    20,    21,    22,    23,    24,     0,    26,   164,   100,
-      77,    78,    31,    80,    77,    78,    31,    80,    31,    32,
-      33,     0,     1,    31,   115,     4,     5,     6,     7,     8,
-       9,    10,    11,    26,    27,    14,    15,    16,    17,    18,
-      19,    20,    21,    22,    23,    31,    26,    26,    31,     0,
-       1,    26,    31,     4,     5,     6,     7,     8,     9,    10,
-      11,    26,    31,    14,    15,    16,    17,    18,    19,    20,
-      21,    22,    23,     1,     1,    26,    31,    32,    33,    31,
-      31,     0,     1,    31,    31,     4,     5,     6,     7,     8,
-       9,    10,    11,    31,   185,    14,    15,    16,    17,    18,
-      19,    20,    21,    22,    23,    31,     1,    26,    31,    31,
-       5,     6,    31,     8,     9,    10,    11,    12,    31,    14,
-      15,    16,    17,    18,    19,    20,    31,    31,    31,    25,
-       1,    26,    26,    13,     1,    26,    31,     4,     5,     6,
-       7,     8,     9,    10,    11,    31,    14,    14,    15,    16,
-       4,     5,     6,     7,     8,     9,    10,    11,    33,    26,
-      14,    15,     5,     6,    31,     8,     9,    10,    11,    31,
-      31,    14,    15,    31,    31,    31,    31,    31,    31,   151,
-      31,   153,   154,   155,    34,    31,     7,     6,    31,   161,
-      37,   163,    76,    -1,    79,   116,    -1,    -1,    -1,    -1,
-     172
+       1,    22,    10,    98,    99,    29,     0,    80,    27,    28,
+      80,    35,    13,    86,    15,   110,    86,    18,     3,     0,
+       1,    27,    28,     4,     5,     6,     7,     8,     9,    10,
+      11,    12,     3,    14,    15,    16,    17,    18,    19,    20,
+      21,    22,    23,    24,    25,    32,    27,    32,    24,    70,
+      71,    32,    32,    14,    32,   159,    32,   161,   162,   163,
+      27,    32,    32,    27,    72,   169,    74,   171,   141,   164,
+      27,   141,    33,    34,    95,    96,   180,    27,    28,    27,
+      32,    31,    33,    34,    32,    30,    36,   108,    33,    34,
+      32,     1,     0,     1,     1,    32,     4,     5,     6,     7,
+       8,     9,    10,    11,    12,   106,    14,    15,    16,    17,
+      18,    19,    20,    21,    22,    23,    24,    25,    32,    27,
+     121,    32,    33,    34,    32,     0,     1,    32,    32,     4,
+       5,     6,     7,     8,     9,    10,    11,   158,    32,    14,
+      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
+      32,   172,    27,    32,     0,     1,    32,    32,     4,     5,
+       6,     7,     8,     9,    10,    11,    32,    32,    14,    15,
+      16,    17,    18,    19,    20,    21,    22,    23,    24,    82,
+      83,    27,    85,    81,    82,    83,    32,    85,    26,     0,
+       1,    27,   193,     4,     5,     6,     7,     8,     9,    10,
+      11,     1,    32,    14,    15,    16,    17,    18,    19,    20,
+      21,    22,    23,    24,    13,     1,    27,    27,    14,     5,
+       6,    32,     8,     9,    10,    11,    12,    34,    14,    15,
+      16,    17,    18,    19,    20,    21,    81,    82,    83,    32,
+      85,    27,    82,    83,     1,    85,    32,     4,     5,     6,
+       7,     8,     9,    10,    11,    32,    32,    14,    15,    16,
+      17,     4,     5,     6,     7,     8,     9,    10,    11,    32,
+      27,    14,    15,    16,    32,    32,     5,     6,    32,     8,
+       9,    10,    11,    35,    32,    14,    15,    16,    32,    32,
+      32,    33,    34,    32,     7,     6,    80,    38,    44,    84,
+     122,    -1,    -1,    32
 };
 
   /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
      symbol of state STATE-NUM.  */
 static const yytype_uint8 yystos[] =
 {
-       0,     3,    31,    37,    38,    39,    63,    81,    26,    27,
-      79,     0,     1,     4,     5,     6,     7,     8,     9,    10,
+       0,     3,    32,    38,    39,    40,    67,    85,    27,    28,
+      83,     0,     1,     4,     5,     6,     7,     8,     9,    10,
       11,    14,    15,    16,    17,    18,    19,    20,    21,    22,
-      23,    26,    31,    40,    41,    43,    44,    45,    46,    52,
-      53,    55,    59,    61,    64,    65,    67,    69,    70,    71,
-      80,    39,    31,    38,    81,    31,    79,    31,    79,    26,
-      85,    31,    79,    26,    26,    26,    27,    30,    35,    83,
-      84,    31,     1,     1,    47,    47,    56,    58,    62,    76,
-      68,    74,    31,    31,    31,    31,    31,    31,    83,    83,
-      32,    33,    81,    28,    34,    31,    31,     1,    12,    16,
-      18,    19,    20,    21,    22,    24,    26,    31,    42,    48,
-      49,    72,    73,    75,    17,    18,    19,    20,    31,    42,
-      57,    73,    75,    41,    54,    80,    41,    55,    60,    67,
-      80,    23,    31,    74,    77,    41,    55,    66,    67,    80,
-      31,    42,    75,    29,    83,    83,    84,    84,    31,    31,
-      25,    79,    78,    79,    83,    26,    84,    50,     1,    13,
-      31,    79,    78,    26,    14,    82,    83,    82,    31,    82,
-      82,    82,    84,    26,    31,    31,    82,    31,    82,    83,
-      31,    31,    31,    31,    82,    34,    51,    31,    31,    31,
-      79
+      23,    24,    27,    32,    41,    42,    44,    45,    46,    47,
+      53,    54,    56,    60,    61,    64,    65,    68,    69,    71,
+      73,    74,    75,    84,    40,    32,    39,    85,    32,    83,
+      32,    83,    27,    89,    32,    83,    27,    27,    27,    28,
+      31,    36,    87,    88,    87,    32,     1,     1,    48,    48,
+      57,    59,    66,    66,    80,    72,    78,    32,    32,    32,
+      32,    32,    32,    87,    87,    33,    34,    85,    29,    35,
+      85,    32,    32,     1,    12,    17,    19,    20,    21,    22,
+      23,    25,    27,    32,    43,    49,    50,    76,    77,    79,
+      18,    19,    20,    21,    32,    43,    58,    77,    79,    42,
+      55,    84,    42,    56,    62,    71,    84,    63,    84,    24,
+      32,    78,    81,    42,    56,    70,    71,    84,    32,    43,
+      79,    30,    87,    87,    88,    88,    32,    32,    26,    83,
+      82,    83,    87,    27,    88,    51,     1,    13,    32,    83,
+      82,    27,    14,    86,    87,    86,    32,    86,    86,    86,
+      88,    27,    32,    32,    86,    32,    86,    87,    32,    32,
+      32,    32,    86,    35,    52,    32,    32,    32,    83
 };
 
   /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
 static const yytype_uint8 yyr1[] =
 {
-       0,    36,    37,    37,    38,    38,    39,    39,    39,    39,
-      39,    39,    39,    39,    40,    40,    40,    40,    40,    40,
-      40,    40,    41,    41,    41,    41,    41,    41,    42,    42,
-      43,    44,    45,    46,    47,    47,    47,    47,    47,    47,
-      47,    48,    48,    48,    48,    48,    49,    50,    50,    51,
-      51,    52,    53,    54,    55,    56,    56,    56,    56,    56,
-      56,    57,    57,    57,    57,    58,    58,    59,    60,    61,
-      62,    62,    62,    62,    63,    64,    65,    66,    67,    68,
-      68,    68,    68,    69,    70,    71,    72,    73,    74,    74,
-      74,    74,    75,    76,    76,    76,    77,    78,    78,    79,
-      79,    80,    80,    80,    81,    81,    82,    82,    83,    83,
-      83,    83,    83,    83,    83,    84,    84,    85,    85
+       0,    37,    38,    38,    39,    39,    40,    40,    40,    40,
+      40,    40,    40,    40,    41,    41,    41,    41,    41,    41,
+      41,    41,    42,    42,    42,    42,    42,    42,    42,    43,
+      43,    44,    45,    46,    47,    48,    48,    48,    48,    48,
+      48,    48,    49,    49,    49,    49,    49,    50,    51,    51,
+      52,    52,    53,    54,    55,    56,    57,    57,    57,    57,
+      57,    57,    58,    58,    58,    58,    59,    59,    60,    61,
+      62,    63,    64,    65,    66,    66,    66,    66,    67,    68,
+      69,    70,    71,    72,    72,    72,    72,    73,    74,    75,
+      76,    77,    78,    78,    78,    78,    79,    80,    80,    80,
+      81,    82,    82,    83,    83,    84,    84,    84,    85,    85,
+      86,    86,    87,    87,    87,    87,    87,    87,    87,    88,
+      88,    89,    89
 };
 
   /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
@@ -760,16 +768,17 @@ static const yytype_uint8 yyr2[] =
 {
        0,     2,     2,     1,     2,     1,     0,     2,     2,     2,
        2,     4,     4,     3,     1,     1,     1,     1,     1,     1,
-       1,     1,     1,     1,     1,     1,     1,     1,     3,     2,
-       3,     2,     3,     2,     0,     2,     2,     2,     2,     2,
-       2,     3,     4,     4,     4,     5,     3,     0,     3,     0,
-       2,     3,     2,     1,     3,     0,     2,     2,     2,     2,
-       2,     4,     3,     2,     4,     0,     2,     3,     1,     3,
-       0,     2,     2,     2,     3,     3,     3,     1,     3,     0,
-       2,     2,     2,     3,     3,     2,     2,     2,     0,     2,
-       2,     2,     4,     0,     2,     2,     2,     0,     2,     1,
-       1,     2,     2,     2,     1,     2,     0,     2,     1,     3,
-       3,     3,     2,     3,     3,     1,     1,     0,     1
+       1,     1,     1,     1,     1,     1,     1,     1,     1,     3,
+       2,     3,     2,     3,     2,     0,     2,     2,     2,     2,
+       2,     2,     3,     4,     4,     4,     5,     3,     0,     3,
+       0,     2,     3,     2,     1,     3,     0,     2,     2,     2,
+       2,     2,     4,     3,     2,     4,     0,     2,     3,     3,
+       1,     1,     3,     3,     0,     2,     2,     2,     3,     3,
+       3,     1,     3,     0,     2,     2,     2,     3,     3,     2,
+       2,     2,     0,     2,     2,     2,     4,     0,     2,     2,
+       2,     0,     2,     1,     1,     2,     2,     2,     1,     2,
+       0,     2,     1,     3,     3,     3,     2,     3,     3,     1,
+       1,     0,     1
 };
 
 
@@ -1192,7 +1201,18 @@ yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
   YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
   switch (yytype)
     {
-          case 53: /* choice_entry  */
+          case 54: /* choice_entry  */
+
+      {
+	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
+		((*yyvaluep).menu)->file->name, ((*yyvaluep).menu)->lineno);
+	if (current_menu == ((*yyvaluep).menu))
+		menu_end_menu();
+}
+
+        break;
+
+    case 60: /* if_entry  */
 
       {
 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
@@ -1203,7 +1223,7 @@ yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
 
         break;
 
-    case 59: /* if_entry  */
+    case 61: /* showif_entry  */
 
       {
 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
@@ -1214,7 +1234,7 @@ yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
 
         break;
 
-    case 65: /* menu_entry  */
+    case 69: /* menu_entry  */
 
       {
 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
@@ -1509,19 +1529,19 @@ yyreduce:
 
     break;
 
-  case 28:
+  case 29:
 
     { zconf_error("unknown option \"%s\"", (yyvsp[-2].string)); }
 
     break;
 
-  case 29:
+  case 30:
 
     { zconf_error("invalid option"); }
 
     break;
 
-  case 30:
+  case 31:
 
     {
 	struct symbol *sym = sym_lookup((yyvsp[-1].string), 0);
@@ -1532,7 +1552,7 @@ yyreduce:
 
     break;
 
-  case 31:
+  case 32:
 
     {
 	menu_end_entry();
@@ -1541,7 +1561,7 @@ yyreduce:
 
     break;
 
-  case 32:
+  case 33:
 
     {
 	struct symbol *sym = sym_lookup((yyvsp[-1].string), 0);
@@ -1552,7 +1572,7 @@ yyreduce:
 
     break;
 
-  case 33:
+  case 34:
 
     {
 	if (current_entry->prompt)
@@ -1565,7 +1585,7 @@ yyreduce:
 
     break;
 
-  case 41:
+  case 42:
 
     {
 	menu_set_type((yyvsp[-2].id)->stype);
@@ -1576,7 +1596,7 @@ yyreduce:
 
     break;
 
-  case 42:
+  case 43:
 
     {
 	menu_add_prompt(P_PROMPT, (yyvsp[-2].string), (yyvsp[-1].expr));
@@ -1585,7 +1605,7 @@ yyreduce:
 
     break;
 
-  case 43:
+  case 44:
 
     {
 	menu_add_expr(P_DEFAULT, (yyvsp[-2].expr), (yyvsp[-1].expr));
@@ -1598,7 +1618,7 @@ yyreduce:
 
     break;
 
-  case 44:
+  case 45:
 
     {
 	menu_add_symbol(P_SELECT, sym_lookup((yyvsp[-2].string), 0), (yyvsp[-1].expr));
@@ -1607,7 +1627,7 @@ yyreduce:
 
     break;
 
-  case 45:
+  case 46:
 
     {
 	menu_add_expr(P_RANGE, expr_alloc_comp(E_RANGE,(yyvsp[-3].symbol), (yyvsp[-2].symbol)), (yyvsp[-1].expr));
@@ -1616,7 +1636,7 @@ yyreduce:
 
     break;
 
-  case 48:
+  case 49:
 
     {
 	const struct kconf_id *id = kconf_id_lookup((yyvsp[-1].string), strlen((yyvsp[-1].string)));
@@ -1629,19 +1649,19 @@ yyreduce:
 
     break;
 
-  case 49:
+  case 50:
 
     { (yyval.string) = NULL; }
 
     break;
 
-  case 50:
+  case 51:
 
     { (yyval.string) = (yyvsp[0].string); }
 
     break;
 
-  case 51:
+  case 52:
 
     {
 	struct symbol *sym = sym_lookup((yyvsp[-1].string), SYMBOL_CHOICE);
@@ -1653,7 +1673,7 @@ yyreduce:
 
     break;
 
-  case 52:
+  case 53:
 
     {
 	(yyval.menu) = menu_add_menu();
@@ -1661,7 +1681,7 @@ yyreduce:
 
     break;
 
-  case 53:
+  case 54:
 
     {
 	if (zconf_endtoken((yyvsp[0].id), T_CHOICE, T_ENDCHOICE)) {
@@ -1672,7 +1692,7 @@ yyreduce:
 
     break;
 
-  case 61:
+  case 62:
 
     {
 	menu_add_prompt(P_PROMPT, (yyvsp[-2].string), (yyvsp[-1].expr));
@@ -1681,7 +1701,7 @@ yyreduce:
 
     break;
 
-  case 62:
+  case 63:
 
     {
 	if ((yyvsp[-2].id)->stype == S_BOOLEAN || (yyvsp[-2].id)->stype == S_TRISTATE) {
@@ -1695,7 +1715,7 @@ yyreduce:
 
     break;
 
-  case 63:
+  case 64:
 
     {
 	current_entry->sym->flags |= SYMBOL_OPTIONAL;
@@ -1704,7 +1724,7 @@ yyreduce:
 
     break;
 
-  case 64:
+  case 65:
 
     {
 	if ((yyvsp[-3].id)->stype == S_UNKNOWN) {
@@ -1717,7 +1737,7 @@ yyreduce:
 
     break;
 
-  case 67:
+  case 68:
 
     {
 	printd(DEBUG_PARSE, "%s:%d:if\n", zconf_curname(), zconf_lineno());
@@ -1728,7 +1748,18 @@ yyreduce:
 
     break;
 
-  case 68:
+  case 69:
+
+    {
+	printd(DEBUG_PARSE, "%s:%d:showif\n", zconf_curname(), zconf_lineno());
+	menu_add_entry(NULL);
+	menu_add_visibility((yyvsp[-1].expr));
+	(yyval.menu) = menu_add_menu();
+}
+
+    break;
+
+  case 70:
 
     {
 	if (zconf_endtoken((yyvsp[0].id), T_IF, T_ENDIF)) {
@@ -1739,7 +1770,18 @@ yyreduce:
 
     break;
 
-  case 74:
+  case 71:
+
+    {
+	if (zconf_endtoken((yyvsp[0].id), T_SHOWIF, T_ENDIF)) {
+		menu_end_menu();
+		printd(DEBUG_PARSE, "%s:%d:endif\n", zconf_curname(), zconf_lineno());
+	}
+}
+
+    break;
+
+  case 78:
 
     {
 	menu_add_prompt(P_MENU, (yyvsp[-1].string), NULL);
@@ -1747,7 +1789,7 @@ yyreduce:
 
     break;
 
-  case 75:
+  case 79:
 
     {
 	menu_add_entry(NULL);
@@ -1757,7 +1799,7 @@ yyreduce:
 
     break;
 
-  case 76:
+  case 80:
 
     {
 	(yyval.menu) = menu_add_menu();
@@ -1765,7 +1807,7 @@ yyreduce:
 
     break;
 
-  case 77:
+  case 81:
 
     {
 	if (zconf_endtoken((yyvsp[0].id), T_MENU, T_ENDMENU)) {
@@ -1776,7 +1818,7 @@ yyreduce:
 
     break;
 
-  case 83:
+  case 87:
 
     {
 	printd(DEBUG_PARSE, "%s:%d:source %s\n", zconf_curname(), zconf_lineno(), (yyvsp[-1].string));
@@ -1785,7 +1827,7 @@ yyreduce:
 
     break;
 
-  case 84:
+  case 88:
 
     {
 	menu_add_entry(NULL);
@@ -1795,7 +1837,7 @@ yyreduce:
 
     break;
 
-  case 85:
+  case 89:
 
     {
 	menu_end_entry();
@@ -1803,7 +1845,7 @@ yyreduce:
 
     break;
 
-  case 86:
+  case 90:
 
     {
 	printd(DEBUG_PARSE, "%s:%d:help\n", zconf_curname(), zconf_lineno());
@@ -1812,7 +1854,7 @@ yyreduce:
 
     break;
 
-  case 87:
+  case 91:
 
     {
 	current_entry->help = (yyvsp[0].string);
@@ -1820,7 +1862,7 @@ yyreduce:
 
     break;
 
-  case 92:
+  case 96:
 
     {
 	menu_add_dep((yyvsp[-1].expr));
@@ -1829,7 +1871,7 @@ yyreduce:
 
     break;
 
-  case 96:
+  case 100:
 
     {
 	menu_add_visibility((yyvsp[0].expr));
@@ -1837,7 +1879,7 @@ yyreduce:
 
     break;
 
-  case 98:
+  case 102:
 
     {
 	menu_add_prompt(P_PROMPT, (yyvsp[-1].string), (yyvsp[0].expr));
@@ -1845,91 +1887,91 @@ yyreduce:
 
     break;
 
-  case 101:
+  case 105:
 
     { (yyval.id) = (yyvsp[-1].id); }
 
     break;
 
-  case 102:
+  case 106:
 
     { (yyval.id) = (yyvsp[-1].id); }
 
     break;
 
-  case 103:
+  case 107:
 
     { (yyval.id) = (yyvsp[-1].id); }
 
     break;
 
-  case 106:
+  case 110:
 
     { (yyval.expr) = NULL; }
 
     break;
 
-  case 107:
+  case 111:
 
     { (yyval.expr) = (yyvsp[0].expr); }
 
     break;
 
-  case 108:
+  case 112:
 
     { (yyval.expr) = expr_alloc_symbol((yyvsp[0].symbol)); }
 
     break;
 
-  case 109:
+  case 113:
 
     { (yyval.expr) = expr_alloc_comp(E_EQUAL, (yyvsp[-2].symbol), (yyvsp[0].symbol)); }
 
     break;
 
-  case 110:
+  case 114:
 
     { (yyval.expr) = expr_alloc_comp(E_UNEQUAL, (yyvsp[-2].symbol), (yyvsp[0].symbol)); }
 
     break;
 
-  case 111:
+  case 115:
 
     { (yyval.expr) = (yyvsp[-1].expr); }
 
     break;
 
-  case 112:
+  case 116:
 
     { (yyval.expr) = expr_alloc_one(E_NOT, (yyvsp[0].expr)); }
 
     break;
 
-  case 113:
+  case 117:
 
     { (yyval.expr) = expr_alloc_two(E_OR, (yyvsp[-2].expr), (yyvsp[0].expr)); }
 
     break;
 
-  case 114:
+  case 118:
 
     { (yyval.expr) = expr_alloc_two(E_AND, (yyvsp[-2].expr), (yyvsp[0].expr)); }
 
     break;
 
-  case 115:
+  case 119:
 
     { (yyval.symbol) = sym_lookup((yyvsp[0].string), 0); free((yyvsp[0].string)); }
 
     break;
 
-  case 116:
+  case 120:
 
     { (yyval.symbol) = sym_lookup((yyvsp[0].string), SYMBOL_CONST); free((yyvsp[0].string)); }
 
     break;
 
-  case 117:
+  case 121:
 
     { (yyval.string) = NULL; }
 
@@ -2207,6 +2249,7 @@ static const char *zconf_tokenname(int token)
 	case T_CHOICE:		return "choice";
 	case T_ENDCHOICE:	return "endchoice";
 	case T_IF:		return "if";
+	case T_SHOWIF:		return "showif";
 	case T_ENDIF:		return "endif";
 	case T_DEPENDS:		return "depends";
 	case T_VISIBLE:		return "visible";
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 0f683cf..bb314bd 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -31,7 +31,7 @@ struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 static struct menu *current_menu, *current_entry;
 
 %}
-%expect 30
+%expect 31
 
 %union
 {
@@ -55,6 +55,7 @@ static struct menu *current_menu, *current_entry;
 %token <id>T_HELP
 %token <string> T_HELPTEXT
 %token <id>T_IF
+%token <id>T_SHOWIF
 %token <id>T_ENDIF
 %token <id>T_DEPENDS
 %token <id>T_OPTIONAL
@@ -84,7 +85,7 @@ static struct menu *current_menu, *current_entry;
 %type <expr> if_expr
 %type <id> end
 %type <id> option_name
-%type <menu> if_entry menu_entry choice_entry
+%type <menu> if_entry showif_entry menu_entry choice_entry
 %type <string> symbol_option_arg word_opt
 
 %destructor {
@@ -92,7 +93,7 @@ static struct menu *current_menu, *current_entry;
 		$$->file->name, $$->lineno);
 	if (current_menu == $$)
 		menu_end_menu();
-} if_entry menu_entry choice_entry
+} if_entry showif_entry menu_entry choice_entry
 
 %{
 /* Include zconf.hash.c here so it can see the token constants. */
@@ -125,6 +126,7 @@ option_name:
 common_stmt:
 	  T_EOL
 	| if_stmt
+	| showif_stmt
 	| comment_stmt
 	| config_stmt
 	| menuconfig_stmt
@@ -321,6 +323,14 @@ if_entry: T_IF expr nl
 	$$ = menu_add_menu();
 };
 
+showif_entry: T_SHOWIF expr nl
+{
+	printd(DEBUG_PARSE, "%s:%d:showif\n", zconf_curname(), zconf_lineno());
+	menu_add_entry(NULL);
+	menu_add_visibility($2);
+	$$ = menu_add_menu();
+};
+
 if_end: end
 {
 	if (zconf_endtoken($1, T_IF, T_ENDIF)) {
@@ -329,9 +339,20 @@ if_end: end
 	}
 };
 
+showif_end: end
+{
+	if (zconf_endtoken($1, T_SHOWIF, T_ENDIF)) {
+		menu_end_menu();
+		printd(DEBUG_PARSE, "%s:%d:endif\n", zconf_curname(), zconf_lineno());
+	}
+};
+
 if_stmt: if_entry if_block if_end
 ;
 
+showif_stmt: showif_entry if_block showif_end
+;
+
 if_block:
 	  /* empty */
 	| if_block common_stmt
@@ -524,6 +545,7 @@ static const char *zconf_tokenname(int token)
 	case T_CHOICE:		return "choice";
 	case T_ENDCHOICE:	return "endchoice";
 	case T_IF:		return "if";
+	case T_SHOWIF:		return "showif";
 	case T_ENDIF:		return "endif";
 	case T_DEPENDS:		return "depends";
 	case T_VISIBLE:		return "visible";
-- 
2.1.4

