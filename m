Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:45855 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753933Ab1EWILO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 04:11:14 -0400
Received: by mail-iy0-f174.google.com with SMTP id 14so4457027iyb.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2011 01:11:13 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFCv2 10/13] kconfig: regen parser
Date: Mon, 23 May 2011 04:10:36 -0400
Message-Id: <1306138239-13440-11-git-send-email-lacombar@gmail.com>
In-Reply-To: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/kconfig/Makefile                           |    6 +-
 scripts/kconfig/zconf.hash.c_shipped               |  273 +++++++-----
 .../{lex.zconf.c_shipped => zconf.lex.c_shipped}   |  493 +++++++++-----------
 scripts/kconfig/zconf.tab.c_shipped                |  102 ++---
 4 files changed, 438 insertions(+), 436 deletions(-)
 rename scripts/kconfig/{lex.zconf.c_shipped => zconf.lex.c_shipped} (81%)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index c9ec4d6..f34f4d1 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -197,7 +197,7 @@ gconf-objs	:= gconf.o kconfig_load.o zconf.tab.o
 endif
 
 clean-files	:= lkc_defs.h qconf.moc .tmp_qtcheck \
-		   .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
+		   .tmp_gtkcheck zconf.tab.c zconf.lex.c zconf.hash.c gconf.glade.h
 clean-files     += mconf qconf gconf nconf
 clean-files     += config.pot linux.pot
 
@@ -213,7 +213,7 @@ always := dochecklxdialog
 HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCC) $(HOSTCFLAGS))
 
 # generated files seem to need this to find local include files
-HOSTCFLAGS_lex.zconf.o	:= -I$(src)
+HOSTCFLAGS_zconf.lex.o	:= -I$(src)
 HOSTCFLAGS_zconf.tab.o	:= -I$(src)
 
 HOSTLOADLIBES_qconf	= $(KC_QT_LIBS) -ldl
@@ -309,7 +309,7 @@ $(obj)/.tmp_gtkcheck:
 	fi
 endif
 
-$(obj)/zconf.tab.o: $(obj)/lex.zconf.c $(obj)/zconf.hash.c
+$(obj)/zconf.tab.o: $(obj)/zconf.lex.c $(obj)/zconf.hash.c
 
 $(obj)/kconfig_load.o: $(obj)/lkc_defs.h
 
diff --git a/scripts/kconfig/zconf.hash.c_shipped b/scripts/kconfig/zconf.hash.c_shipped
index 4055d5d..40df000 100644
--- a/scripts/kconfig/zconf.hash.c_shipped
+++ b/scripts/kconfig/zconf.hash.c_shipped
@@ -1,6 +1,5 @@
-/* ANSI-C code produced by gperf version 3.0.3 */
-/* Command-line: gperf  */
-/* Computed positions: -k'1,3' */
+/* ANSI-C code produced by gperf version 3.0.4 */
+/* Command-line: gperf -t --output-file scripts/kconfig/zconf.hash.c_shipped -a -C -E -g -k '1,3,$' -p -t scripts/kconfig/zconf.gperf  */
 
 #if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
       && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
@@ -29,10 +28,11 @@
 #error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
 #endif
 
+#line 10 "scripts/kconfig/zconf.gperf"
 struct kconf_id;
 
-static struct kconf_id *kconf_id_lookup(register const char *str, register unsigned int len);
-/* maximum key range = 50, duplicates = 0 */
+static const struct kconf_id *kconf_id_lookup(register const char *str, register unsigned int len);
+/* maximum key range = 71, duplicates = 0 */
 
 #ifdef __GNUC__
 __inline
@@ -44,34 +44,34 @@ inline
 static unsigned int
 kconf_id_hash (register const char *str, register unsigned int len)
 {
-  static unsigned char asso_values[] =
+  static const unsigned char asso_values[] =
     {
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 40,  5,
-       0,  0,  5, 52,  0, 20, 52, 52, 10, 20,
-       5,  0, 35, 52,  0, 30,  0, 15,  0, 52,
-      15, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 25, 25,
+       0,  0,  0,  5,  0,  0, 73, 73,  5,  0,
+      10,  5, 45, 73, 20, 20,  0, 15, 15, 73,
+      20, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73
     };
   register int hval = len;
 
@@ -85,87 +85,87 @@ kconf_id_hash (register const char *str, register unsigned int len)
         hval += asso_values[(unsigned char)str[0]];
         break;
     }
-  return hval;
+  return hval + asso_values[(unsigned char)str[len - 1]];
 }
 
 struct kconf_id_strings_t
   {
-    char kconf_id_strings_str2[sizeof("on")];
-    char kconf_id_strings_str3[sizeof("env")];
+    char kconf_id_strings_str2[sizeof("if")];
+    char kconf_id_strings_str3[sizeof("int")];
     char kconf_id_strings_str5[sizeof("endif")];
-    char kconf_id_strings_str6[sizeof("option")];
-    char kconf_id_strings_str7[sizeof("endmenu")];
-    char kconf_id_strings_str8[sizeof("optional")];
+    char kconf_id_strings_str7[sizeof("default")];
+    char kconf_id_strings_str8[sizeof("tristate")];
     char kconf_id_strings_str9[sizeof("endchoice")];
-    char kconf_id_strings_str10[sizeof("range")];
-    char kconf_id_strings_str11[sizeof("choice")];
-    char kconf_id_strings_str12[sizeof("default")];
+    char kconf_id_strings_str12[sizeof("def_tristate")];
     char kconf_id_strings_str13[sizeof("def_bool")];
-    char kconf_id_strings_str14[sizeof("help")];
-    char kconf_id_strings_str16[sizeof("config")];
-    char kconf_id_strings_str17[sizeof("def_tristate")];
-    char kconf_id_strings_str18[sizeof("hex")];
-    char kconf_id_strings_str19[sizeof("defconfig_list")];
-    char kconf_id_strings_str22[sizeof("if")];
-    char kconf_id_strings_str23[sizeof("int")];
+    char kconf_id_strings_str14[sizeof("defconfig_list")];
+    char kconf_id_strings_str17[sizeof("on")];
+    char kconf_id_strings_str18[sizeof("optional")];
+    char kconf_id_strings_str21[sizeof("option")];
+    char kconf_id_strings_str22[sizeof("endmenu")];
+    char kconf_id_strings_str23[sizeof("mainmenu")];
+    char kconf_id_strings_str25[sizeof("menuconfig")];
     char kconf_id_strings_str27[sizeof("modules")];
-    char kconf_id_strings_str28[sizeof("tristate")];
     char kconf_id_strings_str29[sizeof("menu")];
+    char kconf_id_strings_str31[sizeof("select")];
     char kconf_id_strings_str32[sizeof("comment")];
-    char kconf_id_strings_str35[sizeof("menuconfig")];
-    char kconf_id_strings_str36[sizeof("string")];
-    char kconf_id_strings_str37[sizeof("visible")];
-    char kconf_id_strings_str41[sizeof("prompt")];
-    char kconf_id_strings_str42[sizeof("depends")];
-    char kconf_id_strings_str44[sizeof("bool")];
-    char kconf_id_strings_str46[sizeof("select")];
+    char kconf_id_strings_str33[sizeof("env")];
+    char kconf_id_strings_str35[sizeof("range")];
+    char kconf_id_strings_str36[sizeof("choice")];
+    char kconf_id_strings_str39[sizeof("bool")];
+    char kconf_id_strings_str41[sizeof("source")];
+    char kconf_id_strings_str42[sizeof("visible")];
+    char kconf_id_strings_str43[sizeof("hex")];
+    char kconf_id_strings_str46[sizeof("config")];
     char kconf_id_strings_str47[sizeof("boolean")];
-    char kconf_id_strings_str48[sizeof("mainmenu")];
-    char kconf_id_strings_str51[sizeof("source")];
+    char kconf_id_strings_str51[sizeof("string")];
+    char kconf_id_strings_str54[sizeof("help")];
+    char kconf_id_strings_str56[sizeof("prompt")];
+    char kconf_id_strings_str72[sizeof("depends")];
   };
-static struct kconf_id_strings_t kconf_id_strings_contents =
+static const struct kconf_id_strings_t kconf_id_strings_contents =
   {
-    "on",
-    "env",
+    "if",
+    "int",
     "endif",
-    "option",
-    "endmenu",
-    "optional",
-    "endchoice",
-    "range",
-    "choice",
     "default",
-    "def_bool",
-    "help",
-    "config",
+    "tristate",
+    "endchoice",
     "def_tristate",
-    "hex",
+    "def_bool",
     "defconfig_list",
-    "if",
-    "int",
+    "on",
+    "optional",
+    "option",
+    "endmenu",
+    "mainmenu",
+    "menuconfig",
     "modules",
-    "tristate",
     "menu",
+    "select",
     "comment",
-    "menuconfig",
-    "string",
-    "visible",
-    "prompt",
-    "depends",
+    "env",
+    "range",
+    "choice",
     "bool",
-    "select",
+    "source",
+    "visible",
+    "hex",
+    "config",
     "boolean",
-    "mainmenu",
-    "source"
+    "string",
+    "help",
+    "prompt",
+    "depends"
   };
 #define kconf_id_strings ((const char *) &kconf_id_strings_contents)
 #ifdef __GNUC__
 __inline
-#ifdef __GNUC_STDC_INLINE__
+#if defined __GNUC_STDC_INLINE__ || defined __GNUC_GNU_INLINE__
 __attribute__ ((__gnu_inline__))
 #endif
 #endif
-struct kconf_id *
+const struct kconf_id *
 kconf_id_lookup (register const char *str, register unsigned int len)
 {
   enum
@@ -174,54 +174,94 @@ kconf_id_lookup (register const char *str, register unsigned int len)
       MIN_WORD_LENGTH = 2,
       MAX_WORD_LENGTH = 14,
       MIN_HASH_VALUE = 2,
-      MAX_HASH_VALUE = 51
+      MAX_HASH_VALUE = 72
     };
 
-  static struct kconf_id wordlist[] =
+  static const struct kconf_id wordlist[] =
     {
       {-1}, {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str2,		T_ON,		TF_PARAM},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str3,		T_OPT_ENV,	TF_OPTION},
+#line 25 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str2,		T_IF,		TF_COMMAND|TF_PARAM},
+#line 36 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str3,		T_TYPE,		TF_COMMAND, S_INT},
       {-1},
+#line 26 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str5,		T_ENDIF,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str6,		T_OPTION,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str7,	T_ENDMENU,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str8,	T_OPTIONAL,	TF_COMMAND},
+      {-1},
+#line 29 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str7,	T_DEFAULT,	TF_COMMAND, S_UNKNOWN},
+#line 31 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str8,	T_TYPE,		TF_COMMAND, S_TRISTATE},
+#line 20 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str9,	T_ENDCHOICE,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str10,		T_RANGE,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str11,		T_CHOICE,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str12,	T_DEFAULT,	TF_COMMAND, S_UNKNOWN},
+      {-1}, {-1},
+#line 32 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str12,	T_DEFAULT,	TF_COMMAND, S_TRISTATE},
+#line 35 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str13,	T_DEFAULT,	TF_COMMAND, S_BOOLEAN},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str14,		T_HELP,		TF_COMMAND},
-      {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str16,		T_CONFIG,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str17,	T_DEFAULT,	TF_COMMAND, S_TRISTATE},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str18,		T_TYPE,		TF_COMMAND, S_HEX},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str19,	T_OPT_DEFCONFIG_LIST,TF_OPTION},
+#line 45 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str14,	T_OPT_DEFCONFIG_LIST,TF_OPTION},
       {-1}, {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str22,		T_IF,		TF_COMMAND|TF_PARAM},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str23,		T_TYPE,		TF_COMMAND, S_INT},
-      {-1}, {-1}, {-1},
+#line 43 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str17,		T_ON,		TF_PARAM},
+#line 28 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str18,	T_OPTIONAL,	TF_COMMAND},
+      {-1}, {-1},
+#line 42 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str21,		T_OPTION,	TF_COMMAND},
+#line 17 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str22,	T_ENDMENU,	TF_COMMAND},
+#line 15 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str23,	T_MAINMENU,	TF_COMMAND},
+      {-1},
+#line 23 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str25,	T_MENUCONFIG,	TF_COMMAND},
+      {-1},
+#line 44 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str27,	T_OPT_MODULES,	TF_OPTION},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str28,	T_TYPE,		TF_COMMAND, S_TRISTATE},
+      {-1},
+#line 16 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str29,		T_MENU,		TF_COMMAND},
-      {-1}, {-1},
+      {-1},
+#line 39 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str31,		T_SELECT,	TF_COMMAND},
+#line 21 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str32,	T_COMMENT,	TF_COMMAND},
-      {-1}, {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str35,	T_MENUCONFIG,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str36,		T_TYPE,		TF_COMMAND, S_STRING},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str37,	T_VISIBLE,	TF_COMMAND},
-      {-1}, {-1}, {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str41,		T_PROMPT,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str42,	T_DEPENDS,	TF_COMMAND},
+#line 46 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str33,		T_OPT_ENV,	TF_OPTION},
       {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str44,		T_TYPE,		TF_COMMAND, S_BOOLEAN},
+#line 40 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str35,		T_RANGE,	TF_COMMAND},
+#line 19 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str36,		T_CHOICE,	TF_COMMAND},
+      {-1}, {-1},
+#line 33 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str39,		T_TYPE,		TF_COMMAND, S_BOOLEAN},
       {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str46,		T_SELECT,	TF_COMMAND},
+#line 18 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str41,		T_SOURCE,	TF_COMMAND},
+#line 41 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str42,	T_VISIBLE,	TF_COMMAND},
+#line 37 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str43,		T_TYPE,		TF_COMMAND, S_HEX},
+      {-1}, {-1},
+#line 22 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str46,		T_CONFIG,	TF_COMMAND},
+#line 34 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str47,	T_TYPE,		TF_COMMAND, S_BOOLEAN},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str48,	T_MAINMENU,	TF_COMMAND},
+      {-1}, {-1}, {-1},
+#line 38 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str51,		T_TYPE,		TF_COMMAND, S_STRING},
       {-1}, {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str51,		T_SOURCE,	TF_COMMAND}
+#line 24 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str54,		T_HELP,		TF_COMMAND},
+      {-1},
+#line 30 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str56,		T_PROMPT,	TF_COMMAND},
+      {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1},
+      {-1}, {-1}, {-1}, {-1}, {-1}, {-1},
+#line 27 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str72,	T_DEPENDS,	TF_COMMAND}
     };
 
   if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
@@ -242,4 +282,5 @@ kconf_id_lookup (register const char *str, register unsigned int len)
     }
   return 0;
 }
+#line 47 "scripts/kconfig/zconf.gperf"
 
diff --git a/scripts/kconfig/lex.zconf.c_shipped b/scripts/kconfig/zconf.lex.c_shipped
similarity index 81%
rename from scripts/kconfig/lex.zconf.c_shipped
rename to scripts/kconfig/zconf.lex.c_shipped
index 6eb0397..2a97008 100644
--- a/scripts/kconfig/lex.zconf.c_shipped
+++ b/scripts/kconfig/zconf.lex.c_shipped
@@ -1,29 +1,10 @@
 
-#line 3 "scripts/kconfig/lex.zconf.c"
+#line 3 "scripts/kconfig/zconf.lex.c_shipped"
 
 #define  YY_INT_ALIGNED short int
 
 /* A lexical scanner generated by flex */
 
-#define yy_create_buffer zconf_create_buffer
-#define yy_delete_buffer zconf_delete_buffer
-#define yy_flex_debug zconf_flex_debug
-#define yy_init_buffer zconf_init_buffer
-#define yy_flush_buffer zconf_flush_buffer
-#define yy_load_buffer_state zconf_load_buffer_state
-#define yy_switch_to_buffer zconf_switch_to_buffer
-#define yyin zconfin
-#define yyleng zconfleng
-#define yylex zconflex
-#define yylineno zconflineno
-#define yyout zconfout
-#define yyrestart zconfrestart
-#define yytext zconftext
-#define yywrap zconfwrap
-#define yyalloc zconfalloc
-#define yyrealloc zconfrealloc
-#define yyfree zconffree
-
 #define FLEX_SCANNER
 #define YY_FLEX_MAJOR_VERSION 2
 #define YY_FLEX_MINOR_VERSION 5
@@ -72,6 +53,7 @@ typedef int flex_int32_t;
 typedef unsigned char flex_uint8_t; 
 typedef unsigned short int flex_uint16_t;
 typedef unsigned int flex_uint32_t;
+#endif /* ! C99 */
 
 /* Limits of integral types. */
 #ifndef INT8_MIN
@@ -102,8 +84,6 @@ typedef unsigned int flex_uint32_t;
 #define UINT32_MAX             (4294967295U)
 #endif
 
-#endif /* ! C99 */
-
 #endif /* ! FLEXINT_H */
 
 #ifdef __cplusplus
@@ -154,21 +134,13 @@ typedef unsigned int flex_uint32_t;
 #define YY_STATE_EOF(state) (YY_END_OF_BUFFER + state + 1)
 
 /* Special action meaning "start processing a new file". */
-#define YY_NEW_FILE zconfrestart(zconfin  )
+#define YY_NEW_FILE yyrestart(yyin  )
 
 #define YY_END_OF_BUFFER_CHAR 0
 
 /* Size of default input buffer. */
 #ifndef YY_BUF_SIZE
-#ifdef __ia64__
-/* On IA-64, the buffer size is 16k, not 8k.
- * Moreover, YY_BUF_SIZE is 2*YY_READ_BUF_SIZE in the general case.
- * Ditto for the __ia64__ case accordingly.
- */
-#define YY_BUF_SIZE 32768
-#else
 #define YY_BUF_SIZE 16384
-#endif /* __ia64__ */
 #endif
 
 /* The state buf must be large enough to hold one state per character in the main buffer.
@@ -180,9 +152,9 @@ typedef unsigned int flex_uint32_t;
 typedef struct yy_buffer_state *YY_BUFFER_STATE;
 #endif
 
-extern int zconfleng;
+extern int yyleng;
 
-extern FILE *zconfin, *zconfout;
+extern FILE *yyin, *yyout;
 
 #define EOB_ACT_CONTINUE_SCAN 0
 #define EOB_ACT_END_OF_FILE 1
@@ -194,13 +166,13 @@ extern FILE *zconfin, *zconfout;
 #define yyless(n) \
 	do \
 		{ \
-		/* Undo effects of setting up zconftext. */ \
+		/* Undo effects of setting up yytext. */ \
         int yyless_macro_arg = (n); \
         YY_LESS_LINENO(yyless_macro_arg);\
 		*yy_cp = (yy_hold_char); \
 		YY_RESTORE_YY_MORE_OFFSET \
 		(yy_c_buf_p) = yy_cp = yy_bp + yyless_macro_arg - YY_MORE_ADJ; \
-		YY_DO_BEFORE_ACTION; /* set up zconftext again */ \
+		YY_DO_BEFORE_ACTION; /* set up yytext again */ \
 		} \
 	while ( 0 )
 
@@ -268,8 +240,8 @@ struct yy_buffer_state
 	 * possible backing-up.
 	 *
 	 * When we actually see the EOF, we change the status to "new"
-	 * (via zconfrestart()), so that the user can continue scanning by
-	 * just pointing zconfin at a new input file.
+	 * (via yyrestart()), so that the user can continue scanning by
+	 * just pointing yyin at a new input file.
 	 */
 #define YY_BUFFER_EOF_PENDING 2
 
@@ -296,51 +268,51 @@ static YY_BUFFER_STATE * yy_buffer_stack = 0; /**< Stack as an array. */
  */
 #define YY_CURRENT_BUFFER_LVALUE (yy_buffer_stack)[(yy_buffer_stack_top)]
 
-/* yy_hold_char holds the character lost when zconftext is formed. */
+/* yy_hold_char holds the character lost when yytext is formed. */
 static char yy_hold_char;
 static int yy_n_chars;		/* number of characters read into yy_ch_buf */
-int zconfleng;
+int yyleng;
 
 /* Points to current character in buffer. */
 static char *yy_c_buf_p = (char *) 0;
 static int yy_init = 0;		/* whether we need to initialize */
 static int yy_start = 0;	/* start state number */
 
-/* Flag which is used to allow zconfwrap()'s to do buffer switches
- * instead of setting up a fresh zconfin.  A bit of a hack ...
+/* Flag which is used to allow yywrap()'s to do buffer switches
+ * instead of setting up a fresh yyin.  A bit of a hack ...
  */
 static int yy_did_buffer_switch_on_eof;
 
-void zconfrestart (FILE *input_file  );
-void zconf_switch_to_buffer (YY_BUFFER_STATE new_buffer  );
-YY_BUFFER_STATE zconf_create_buffer (FILE *file,int size  );
-void zconf_delete_buffer (YY_BUFFER_STATE b  );
-void zconf_flush_buffer (YY_BUFFER_STATE b  );
-void zconfpush_buffer_state (YY_BUFFER_STATE new_buffer  );
-void zconfpop_buffer_state (void );
+void yyrestart (FILE *input_file  );
+void yy_switch_to_buffer (YY_BUFFER_STATE new_buffer  );
+YY_BUFFER_STATE yy_create_buffer (FILE *file,int size  );
+void yy_delete_buffer (YY_BUFFER_STATE b  );
+void yy_flush_buffer (YY_BUFFER_STATE b  );
+void yypush_buffer_state (YY_BUFFER_STATE new_buffer  );
+void yypop_buffer_state (void );
 
-static void zconfensure_buffer_stack (void );
-static void zconf_load_buffer_state (void );
-static void zconf_init_buffer (YY_BUFFER_STATE b,FILE *file  );
+static void yyensure_buffer_stack (void );
+static void yy_load_buffer_state (void );
+static void yy_init_buffer (YY_BUFFER_STATE b,FILE *file  );
 
-#define YY_FLUSH_BUFFER zconf_flush_buffer(YY_CURRENT_BUFFER )
+#define YY_FLUSH_BUFFER yy_flush_buffer(YY_CURRENT_BUFFER )
 
-YY_BUFFER_STATE zconf_scan_buffer (char *base,yy_size_t size  );
-YY_BUFFER_STATE zconf_scan_string (yyconst char *yy_str  );
-YY_BUFFER_STATE zconf_scan_bytes (yyconst char *bytes,int len  );
+YY_BUFFER_STATE yy_scan_buffer (char *base,yy_size_t size  );
+YY_BUFFER_STATE yy_scan_string (yyconst char *yy_str  );
+YY_BUFFER_STATE yy_scan_bytes (yyconst char *bytes,int len  );
 
-void *zconfalloc (yy_size_t  );
-void *zconfrealloc (void *,yy_size_t  );
-void zconffree (void *  );
+void *yyalloc (yy_size_t  );
+void *yyrealloc (void *,yy_size_t  );
+void yyfree (void *  );
 
-#define yy_new_buffer zconf_create_buffer
+#define yy_new_buffer yy_create_buffer
 
 #define yy_set_interactive(is_interactive) \
 	{ \
 	if ( ! YY_CURRENT_BUFFER ){ \
-        zconfensure_buffer_stack (); \
+        yyensure_buffer_stack (); \
 		YY_CURRENT_BUFFER_LVALUE =    \
-            zconf_create_buffer(zconfin,YY_BUF_SIZE ); \
+            yy_create_buffer(yyin,YY_BUF_SIZE ); \
 	} \
 	YY_CURRENT_BUFFER_LVALUE->yy_is_interactive = is_interactive; \
 	}
@@ -348,9 +320,9 @@ void zconffree (void *  );
 #define yy_set_bol(at_bol) \
 	{ \
 	if ( ! YY_CURRENT_BUFFER ){\
-        zconfensure_buffer_stack (); \
+        yyensure_buffer_stack (); \
 		YY_CURRENT_BUFFER_LVALUE =    \
-            zconf_create_buffer(zconfin,YY_BUF_SIZE ); \
+            yy_create_buffer(yyin,YY_BUF_SIZE ); \
 	} \
 	YY_CURRENT_BUFFER_LVALUE->yy_at_bol = at_bol; \
 	}
@@ -359,21 +331,21 @@ void zconffree (void *  );
 
 /* Begin user sect3 */
 
-#define zconfwrap(n) 1
+#define yywrap(n) 1
 #define YY_SKIP_YYWRAP
 
 typedef unsigned char YY_CHAR;
 
-FILE *zconfin = (FILE *) 0, *zconfout = (FILE *) 0;
+FILE *yyin = (FILE *) 0, *yyout = (FILE *) 0;
 
 typedef int yy_state_type;
 
-extern int zconflineno;
+extern int yylineno;
 
-int zconflineno = 1;
+int yylineno = 1;
 
-extern char *zconftext;
-#define yytext_ptr zconftext
+extern char *yytext;
+#define yytext_ptr yytext
 static yyconst flex_int16_t yy_nxt[][17] =
     {
     {
@@ -701,11 +673,11 @@ static int yy_get_next_buffer (void );
 static void yy_fatal_error (yyconst char msg[]  );
 
 /* Done after the current pattern has been matched and before the
- * corresponding action - sets up zconftext.
+ * corresponding action - sets up yytext.
  */
 #define YY_DO_BEFORE_ACTION \
 	(yytext_ptr) = yy_bp; \
-	zconfleng = (size_t) (yy_cp - yy_bp); \
+	yyleng = (size_t) (yy_cp - yy_bp); \
 	(yy_hold_char) = *yy_cp; \
 	*yy_cp = '\0'; \
 	(yy_c_buf_p) = yy_cp;
@@ -761,8 +733,8 @@ static yyconst flex_int32_t yy_ec[256] =
         1,    1,    1,    1,    1
     } ;
 
-extern int zconf_flex_debug;
-int zconf_flex_debug = 0;
+extern int yy_flex_debug;
+int yy_flex_debug = 0;
 
 /* The intent behind this definition is that it'll catch
  * any uses of REJECT which flex missed.
@@ -771,7 +743,7 @@ int zconf_flex_debug = 0;
 #define yymore() yymore_used_but_not_detected
 #define YY_MORE_ADJ 0
 #define YY_RESTORE_YY_MORE_OFFSET
-char *zconftext;
+char *yytext;
 #define YY_NO_INPUT 1
 
 /*
@@ -862,31 +834,31 @@ static int yy_init_globals (void );
 /* Accessor methods to globals.
    These are made visible to non-reentrant scanners for convenience. */
 
-int zconflex_destroy (void );
+int yylex_destroy (void );
 
-int zconfget_debug (void );
+int yyget_debug (void );
 
-void zconfset_debug (int debug_flag  );
+void yyset_debug (int debug_flag  );
 
-YY_EXTRA_TYPE zconfget_extra (void );
+YY_EXTRA_TYPE yyget_extra (void );
 
-void zconfset_extra (YY_EXTRA_TYPE user_defined  );
+void yyset_extra (YY_EXTRA_TYPE user_defined  );
 
-FILE *zconfget_in (void );
+FILE *yyget_in (void );
 
-void zconfset_in  (FILE * in_str  );
+void yyset_in  (FILE * in_str  );
 
-FILE *zconfget_out (void );
+FILE *yyget_out (void );
 
-void zconfset_out  (FILE * out_str  );
+void yyset_out  (FILE * out_str  );
 
-int zconfget_leng (void );
+int yyget_leng (void );
 
-char *zconfget_text (void );
+char *yyget_text (void );
 
-int zconfget_lineno (void );
+int yyget_lineno (void );
 
-void zconfset_lineno (int line_number  );
+void yyset_lineno (int line_number  );
 
 /* Macros after this point can all be overridden by user definitions in
  * section 1.
@@ -894,9 +866,9 @@ void zconfset_lineno (int line_number  );
 
 #ifndef YY_SKIP_YYWRAP
 #ifdef __cplusplus
-extern "C" int zconfwrap (void );
+extern "C" int yywrap (void );
 #else
-extern int zconfwrap (void );
+extern int yywrap (void );
 #endif
 #endif
 
@@ -922,12 +894,7 @@ static int input (void );
 
 /* Amount of stuff to slurp up with each read. */
 #ifndef YY_READ_BUF_SIZE
-#ifdef __ia64__
-/* On IA-64, the buffer size is 16k, not 8k */
-#define YY_READ_BUF_SIZE 16384
-#else
 #define YY_READ_BUF_SIZE 8192
-#endif /* __ia64__ */
 #endif
 
 /* Copy whatever the last rule matched to the standard output. */
@@ -935,7 +902,7 @@ static int input (void );
 /* This used to be an fputs(), but since the string might contain NUL's,
  * we now use fwrite().
  */
-#define ECHO do { if (fwrite( zconftext, zconfleng, 1, zconfout )) {} } while (0)
+#define ECHO do { if (fwrite( yytext, yyleng, 1, yyout )) {} } while (0)
 #endif
 
 /* Gets input and stuffs it into "buf".  number of characters read, or YY_NULL,
@@ -944,7 +911,7 @@ static int input (void );
 #ifndef YY_INPUT
 #define YY_INPUT(buf,result,max_size) \
 	errno=0; \
-	while ( (result = read( fileno(zconfin), (char *) buf, max_size )) < 0 ) \
+	while ( (result = read( fileno(yyin), (char *) buf, max_size )) < 0 ) \
 	{ \
 		if( errno != EINTR) \
 		{ \
@@ -952,7 +919,7 @@ static int input (void );
 			break; \
 		} \
 		errno=0; \
-		clearerr(zconfin); \
+		clearerr(yyin); \
 	}\
 \
 
@@ -984,12 +951,12 @@ static int input (void );
 #ifndef YY_DECL
 #define YY_DECL_IS_OURS 1
 
-extern int zconflex (void);
+extern int yylex (void);
 
-#define YY_DECL int zconflex (void)
+#define YY_DECL int yylex (void)
 #endif /* !YY_DECL */
 
-/* Code executed at the beginning of each rule, after zconftext and zconfleng
+/* Code executed at the beginning of each rule, after yytext and yyleng
  * have been set up.
  */
 #ifndef YY_USER_ACTION
@@ -1026,26 +993,26 @@ YY_DECL
 		if ( ! (yy_start) )
 			(yy_start) = 1;	/* first start state */
 
-		if ( ! zconfin )
-			zconfin = stdin;
+		if ( ! yyin )
+			yyin = stdin;
 
-		if ( ! zconfout )
-			zconfout = stdout;
+		if ( ! yyout )
+			yyout = stdout;
 
 		if ( ! YY_CURRENT_BUFFER ) {
-			zconfensure_buffer_stack ();
+			yyensure_buffer_stack ();
 			YY_CURRENT_BUFFER_LVALUE =
-				zconf_create_buffer(zconfin,YY_BUF_SIZE );
+				yy_create_buffer(yyin,YY_BUF_SIZE );
 		}
 
-		zconf_load_buffer_state( );
+		yy_load_buffer_state( );
 		}
 
 	while ( 1 )		/* loops until end-of-file is reached */
 		{
 		yy_cp = (yy_c_buf_p);
 
-		/* Support of zconftext. */
+		/* Support of yytext. */
 		*yy_cp = (yy_hold_char);
 
 		/* yy_bp points to the position in yy_ch_buf of the start of
@@ -1092,7 +1059,7 @@ YY_RULE_SETUP
 case 5:
 YY_RULE_SETUP
 {
-	unput(zconftext[0]);
+	unput(yytext[0]);
 	BEGIN(COMMAND);
 }
 	YY_BREAK
@@ -1100,16 +1067,16 @@ YY_RULE_SETUP
 case 6:
 YY_RULE_SETUP
 {
-		struct kconf_id *id = kconf_id_lookup(zconftext, zconfleng);
+		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
 		BEGIN(PARAM);
 		current_pos.file = current_file;
 		current_pos.lineno = current_file->lineno;
 		if (id && id->flags & TF_COMMAND) {
-			zconflval.id = id;
+			yylval.id = id;
 			return id->token;
 		}
-		alloc_string(zconftext, zconfleng);
-		zconflval.string = text;
+		alloc_string(yytext, yyleng);
+		yylval.string = text;
 		return T_WORD;
 	}
 	YY_BREAK
@@ -1158,7 +1125,7 @@ return T_UNEQUAL;
 case 16:
 YY_RULE_SETUP
 {
-		str = zconftext[0];
+		str = yytext[0];
 		new_string();
 		BEGIN(STRING);
 	}
@@ -1175,13 +1142,13 @@ YY_RULE_SETUP
 case 19:
 YY_RULE_SETUP
 {
-		struct kconf_id *id = kconf_id_lookup(zconftext, zconfleng);
+		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
 		if (id && id->flags & TF_PARAM) {
-			zconflval.id = id;
+			yylval.id = id;
 			return id->token;
 		}
-		alloc_string(zconftext, zconfleng);
-		zconflval.string = text;
+		alloc_string(yytext, yyleng);
+		yylval.string = text;
 		return T_WORD;
 	}
 	YY_BREAK
@@ -1206,49 +1173,49 @@ case YY_STATE_EOF(PARAM):
 
 case 23:
 /* rule 23 can match eol */
-*yy_cp = (yy_hold_char); /* undo effects of setting up zconftext */
+*yy_cp = (yy_hold_char); /* undo effects of setting up yytext */
 (yy_c_buf_p) = yy_cp -= 1;
-YY_DO_BEFORE_ACTION; /* set up zconftext again */
+YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
 {
-		append_string(zconftext, zconfleng);
-		zconflval.string = text;
+		append_string(yytext, yyleng);
+		yylval.string = text;
 		return T_WORD_QUOTE;
 	}
 	YY_BREAK
 case 24:
 YY_RULE_SETUP
 {
-		append_string(zconftext, zconfleng);
+		append_string(yytext, yyleng);
 	}
 	YY_BREAK
 case 25:
 /* rule 25 can match eol */
-*yy_cp = (yy_hold_char); /* undo effects of setting up zconftext */
+*yy_cp = (yy_hold_char); /* undo effects of setting up yytext */
 (yy_c_buf_p) = yy_cp -= 1;
-YY_DO_BEFORE_ACTION; /* set up zconftext again */
+YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
 {
-		append_string(zconftext + 1, zconfleng - 1);
-		zconflval.string = text;
+		append_string(yytext + 1, yyleng - 1);
+		yylval.string = text;
 		return T_WORD_QUOTE;
 	}
 	YY_BREAK
 case 26:
 YY_RULE_SETUP
 {
-		append_string(zconftext + 1, zconfleng - 1);
+		append_string(yytext + 1, yyleng - 1);
 	}
 	YY_BREAK
 case 27:
 YY_RULE_SETUP
 {
-		if (str == zconftext[0]) {
+		if (str == yytext[0]) {
 			BEGIN(PARAM);
-			zconflval.string = text;
+			yylval.string = text;
 			return T_WORD_QUOTE;
 		} else
-			append_string(zconftext, 1);
+			append_string(yytext, 1);
 	}
 	YY_BREAK
 case 28:
@@ -1271,8 +1238,8 @@ case 29:
 YY_RULE_SETUP
 {
 		ts = 0;
-		for (i = 0; i < zconfleng; i++) {
-			if (zconftext[i] == '\t')
+		for (i = 0; i < yyleng; i++) {
+			if (yytext[i] == '\t')
 				ts = (ts & ~7) + 8;
 			else
 				ts++;
@@ -1294,9 +1261,9 @@ YY_RULE_SETUP
 	YY_BREAK
 case 30:
 /* rule 30 can match eol */
-*yy_cp = (yy_hold_char); /* undo effects of setting up zconftext */
+*yy_cp = (yy_hold_char); /* undo effects of setting up yytext */
 (yy_c_buf_p) = yy_cp -= 1;
-YY_DO_BEFORE_ACTION; /* set up zconftext again */
+YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
 {
 		current_file->lineno++;
@@ -1315,12 +1282,12 @@ YY_RULE_SETUP
 case 32:
 YY_RULE_SETUP
 {
-		while (zconfleng) {
-			if ((zconftext[zconfleng-1] != ' ') && (zconftext[zconfleng-1] != '\t'))
+		while (yyleng) {
+			if ((yytext[yyleng-1] != ' ') && (yytext[yyleng-1] != '\t'))
 				break;
-			zconfleng--;
+			yyleng--;
 		}
-		append_string(zconftext, zconfleng);
+		append_string(yytext, yyleng);
 		if (!first_ts)
 			first_ts = last_ts;
 	}
@@ -1339,7 +1306,7 @@ case YY_STATE_EOF(COMMAND):
 		zconf_endfile();
 		return T_EOL;
 	}
-	fclose(zconfin);
+	fclose(yyin);
 	yyterminate();
 }
 	YY_BREAK
@@ -1361,15 +1328,15 @@ YY_FATAL_ERROR( "flex scanner jammed" );
 			{
 			/* We're scanning a new file or input source.  It's
 			 * possible that this happened because the user
-			 * just pointed zconfin at a new source and called
-			 * zconflex().  If so, then we have to assure
+			 * just pointed yyin at a new source and called
+			 * yylex().  If so, then we have to assure
 			 * consistency between YY_CURRENT_BUFFER and our
 			 * globals.  Here is the right place to do so, because
 			 * this is the first action (other than possibly a
 			 * back-up) that will match for the new input source.
 			 */
 			(yy_n_chars) = YY_CURRENT_BUFFER_LVALUE->yy_n_chars;
-			YY_CURRENT_BUFFER_LVALUE->yy_input_file = zconfin;
+			YY_CURRENT_BUFFER_LVALUE->yy_input_file = yyin;
 			YY_CURRENT_BUFFER_LVALUE->yy_buffer_status = YY_BUFFER_NORMAL;
 			}
 
@@ -1422,11 +1389,11 @@ YY_FATAL_ERROR( "flex scanner jammed" );
 				{
 				(yy_did_buffer_switch_on_eof) = 0;
 
-				if ( zconfwrap( ) )
+				if ( yywrap( ) )
 					{
 					/* Note: because we've taken care in
 					 * yy_get_next_buffer() to have set up
-					 * zconftext, we can now set up
+					 * yytext, we can now set up
 					 * yy_c_buf_p so that if some total
 					 * hoser (like flex itself) wants to
 					 * call the scanner after we return the
@@ -1475,7 +1442,7 @@ YY_FATAL_ERROR( "flex scanner jammed" );
 			"fatal flex scanner internal error--no action found" );
 	} /* end of action switch */
 		} /* end of scanning one token */
-} /* end of zconflex */
+} /* end of yylex */
 
 /* yy_get_next_buffer - try to read in a new buffer
  *
@@ -1553,7 +1520,7 @@ static int yy_get_next_buffer (void)
 
 				b->yy_ch_buf = (char *)
 					/* Include room in for 2 EOB chars. */
-					zconfrealloc((void *) b->yy_ch_buf,b->yy_buf_size + 2  );
+					yyrealloc((void *) b->yy_ch_buf,b->yy_buf_size + 2  );
 				}
 			else
 				/* Can't grow it, we don't own it. */
@@ -1585,7 +1552,7 @@ static int yy_get_next_buffer (void)
 		if ( number_to_move == YY_MORE_ADJ )
 			{
 			ret_val = EOB_ACT_END_OF_FILE;
-			zconfrestart(zconfin  );
+			yyrestart(yyin  );
 			}
 
 		else
@@ -1602,7 +1569,7 @@ static int yy_get_next_buffer (void)
 	if ((yy_size_t) ((yy_n_chars) + number_to_move) > YY_CURRENT_BUFFER_LVALUE->yy_buf_size) {
 		/* Extend the array by 50%, plus the number we really need. */
 		yy_size_t new_size = (yy_n_chars) + number_to_move + ((yy_n_chars) >> 1);
-		YY_CURRENT_BUFFER_LVALUE->yy_ch_buf = (char *) zconfrealloc((void *) YY_CURRENT_BUFFER_LVALUE->yy_ch_buf,new_size  );
+		YY_CURRENT_BUFFER_LVALUE->yy_ch_buf = (char *) yyrealloc((void *) YY_CURRENT_BUFFER_LVALUE->yy_ch_buf,new_size  );
 		if ( ! YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
 			YY_FATAL_ERROR( "out of dynamic memory in yy_get_next_buffer()" );
 	}
@@ -1654,7 +1621,7 @@ static int yy_get_next_buffer (void)
     
     yy_cp = (yy_c_buf_p);
 
-	/* undo effects of setting up zconftext */
+	/* undo effects of setting up yytext */
 	*yy_cp = (yy_hold_char);
 
 	if ( yy_cp < YY_CURRENT_BUFFER_LVALUE->yy_ch_buf + 2 )
@@ -1726,13 +1693,13 @@ static int yy_get_next_buffer (void)
 					 */
 
 					/* Reset buffer status. */
-					zconfrestart(zconfin );
+					yyrestart(yyin );
 
 					/*FALLTHROUGH*/
 
 				case EOB_ACT_END_OF_FILE:
 					{
-					if ( zconfwrap( ) )
+					if ( yywrap( ) )
 						return EOF;
 
 					if ( ! (yy_did_buffer_switch_on_eof) )
@@ -1752,7 +1719,7 @@ static int yy_get_next_buffer (void)
 		}
 
 	c = *(unsigned char *) (yy_c_buf_p);	/* cast for 8-bit char's */
-	*(yy_c_buf_p) = '\0';	/* preserve zconftext */
+	*(yy_c_buf_p) = '\0';	/* preserve yytext */
 	(yy_hold_char) = *++(yy_c_buf_p);
 
 	return c;
@@ -1764,32 +1731,32 @@ static int yy_get_next_buffer (void)
  * 
  * @note This function does not reset the start condition to @c INITIAL .
  */
-    void zconfrestart  (FILE * input_file )
+    void yyrestart  (FILE * input_file )
 {
     
 	if ( ! YY_CURRENT_BUFFER ){
-        zconfensure_buffer_stack ();
+        yyensure_buffer_stack ();
 		YY_CURRENT_BUFFER_LVALUE =
-            zconf_create_buffer(zconfin,YY_BUF_SIZE );
+            yy_create_buffer(yyin,YY_BUF_SIZE );
 	}
 
-	zconf_init_buffer(YY_CURRENT_BUFFER,input_file );
-	zconf_load_buffer_state( );
+	yy_init_buffer(YY_CURRENT_BUFFER,input_file );
+	yy_load_buffer_state( );
 }
 
 /** Switch to a different input buffer.
  * @param new_buffer The new input buffer.
  * 
  */
-    void zconf_switch_to_buffer  (YY_BUFFER_STATE  new_buffer )
+    void yy_switch_to_buffer  (YY_BUFFER_STATE  new_buffer )
 {
     
 	/* TODO. We should be able to replace this entire function body
 	 * with
-	 *		zconfpop_buffer_state();
-	 *		zconfpush_buffer_state(new_buffer);
+	 *		yypop_buffer_state();
+	 *		yypush_buffer_state(new_buffer);
      */
-	zconfensure_buffer_stack ();
+	yyensure_buffer_stack ();
 	if ( YY_CURRENT_BUFFER == new_buffer )
 		return;
 
@@ -1802,21 +1769,21 @@ static int yy_get_next_buffer (void)
 		}
 
 	YY_CURRENT_BUFFER_LVALUE = new_buffer;
-	zconf_load_buffer_state( );
+	yy_load_buffer_state( );
 
 	/* We don't actually know whether we did this switch during
-	 * EOF (zconfwrap()) processing, but the only time this flag
-	 * is looked at is after zconfwrap() is called, so it's safe
+	 * EOF (yywrap()) processing, but the only time this flag
+	 * is looked at is after yywrap() is called, so it's safe
 	 * to go ahead and always set it.
 	 */
 	(yy_did_buffer_switch_on_eof) = 1;
 }
 
-static void zconf_load_buffer_state  (void)
+static void yy_load_buffer_state  (void)
 {
     	(yy_n_chars) = YY_CURRENT_BUFFER_LVALUE->yy_n_chars;
 	(yytext_ptr) = (yy_c_buf_p) = YY_CURRENT_BUFFER_LVALUE->yy_buf_pos;
-	zconfin = YY_CURRENT_BUFFER_LVALUE->yy_input_file;
+	yyin = YY_CURRENT_BUFFER_LVALUE->yy_input_file;
 	(yy_hold_char) = *(yy_c_buf_p);
 }
 
@@ -1826,35 +1793,35 @@ static void zconf_load_buffer_state  (void)
  * 
  * @return the allocated buffer state.
  */
-    YY_BUFFER_STATE zconf_create_buffer  (FILE * file, int  size )
+    YY_BUFFER_STATE yy_create_buffer  (FILE * file, int  size )
 {
 	YY_BUFFER_STATE b;
     
-	b = (YY_BUFFER_STATE) zconfalloc(sizeof( struct yy_buffer_state )  );
+	b = (YY_BUFFER_STATE) yyalloc(sizeof( struct yy_buffer_state )  );
 	if ( ! b )
-		YY_FATAL_ERROR( "out of dynamic memory in zconf_create_buffer()" );
+		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
 
 	b->yy_buf_size = size;
 
 	/* yy_ch_buf has to be 2 characters longer than the size given because
 	 * we need to put in 2 end-of-buffer characters.
 	 */
-	b->yy_ch_buf = (char *) zconfalloc(b->yy_buf_size + 2  );
+	b->yy_ch_buf = (char *) yyalloc(b->yy_buf_size + 2  );
 	if ( ! b->yy_ch_buf )
-		YY_FATAL_ERROR( "out of dynamic memory in zconf_create_buffer()" );
+		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
 
 	b->yy_is_our_buffer = 1;
 
-	zconf_init_buffer(b,file );
+	yy_init_buffer(b,file );
 
 	return b;
 }
 
 /** Destroy the buffer.
- * @param b a buffer created with zconf_create_buffer()
+ * @param b a buffer created with yy_create_buffer()
  * 
  */
-    void zconf_delete_buffer (YY_BUFFER_STATE  b )
+    void yy_delete_buffer (YY_BUFFER_STATE  b )
 {
     
 	if ( ! b )
@@ -1864,27 +1831,27 @@ static void zconf_load_buffer_state  (void)
 		YY_CURRENT_BUFFER_LVALUE = (YY_BUFFER_STATE) 0;
 
 	if ( b->yy_is_our_buffer )
-		zconffree((void *) b->yy_ch_buf  );
+		yyfree((void *) b->yy_ch_buf  );
 
-	zconffree((void *) b  );
+	yyfree((void *) b  );
 }
 
 /* Initializes or reinitializes a buffer.
  * This function is sometimes called more than once on the same buffer,
- * such as during a zconfrestart() or at EOF.
+ * such as during a yyrestart() or at EOF.
  */
-    static void zconf_init_buffer  (YY_BUFFER_STATE  b, FILE * file )
+    static void yy_init_buffer  (YY_BUFFER_STATE  b, FILE * file )
 
 {
 	int oerrno = errno;
     
-	zconf_flush_buffer(b );
+	yy_flush_buffer(b );
 
 	b->yy_input_file = file;
 	b->yy_fill_buffer = 1;
 
-    /* If b is the current buffer, then zconf_init_buffer was _probably_
-     * called from zconfrestart() or through yy_get_next_buffer.
+    /* If b is the current buffer, then yy_init_buffer was _probably_
+     * called from yyrestart() or through yy_get_next_buffer.
      * In that case, we don't want to reset the lineno or column.
      */
     if (b != YY_CURRENT_BUFFER){
@@ -1901,7 +1868,7 @@ static void zconf_load_buffer_state  (void)
  * @param b the buffer state to be flushed, usually @c YY_CURRENT_BUFFER.
  * 
  */
-    void zconf_flush_buffer (YY_BUFFER_STATE  b )
+    void yy_flush_buffer (YY_BUFFER_STATE  b )
 {
     	if ( ! b )
 		return;
@@ -1921,7 +1888,7 @@ static void zconf_load_buffer_state  (void)
 	b->yy_buffer_status = YY_BUFFER_NEW;
 
 	if ( b == YY_CURRENT_BUFFER )
-		zconf_load_buffer_state( );
+		yy_load_buffer_state( );
 }
 
 /** Pushes the new state onto the stack. The new state becomes
@@ -1930,14 +1897,14 @@ static void zconf_load_buffer_state  (void)
  *  @param new_buffer The new state.
  *  
  */
-void zconfpush_buffer_state (YY_BUFFER_STATE new_buffer )
+void yypush_buffer_state (YY_BUFFER_STATE new_buffer )
 {
     	if (new_buffer == NULL)
 		return;
 
-	zconfensure_buffer_stack();
+	yyensure_buffer_stack();
 
-	/* This block is copied from zconf_switch_to_buffer. */
+	/* This block is copied from yy_switch_to_buffer. */
 	if ( YY_CURRENT_BUFFER )
 		{
 		/* Flush out information for old buffer. */
@@ -1951,8 +1918,8 @@ void zconfpush_buffer_state (YY_BUFFER_STATE new_buffer )
 		(yy_buffer_stack_top)++;
 	YY_CURRENT_BUFFER_LVALUE = new_buffer;
 
-	/* copied from zconf_switch_to_buffer. */
-	zconf_load_buffer_state( );
+	/* copied from yy_switch_to_buffer. */
+	yy_load_buffer_state( );
 	(yy_did_buffer_switch_on_eof) = 1;
 }
 
@@ -1960,18 +1927,18 @@ void zconfpush_buffer_state (YY_BUFFER_STATE new_buffer )
  *  The next element becomes the new top.
  *  
  */
-void zconfpop_buffer_state (void)
+void yypop_buffer_state (void)
 {
     	if (!YY_CURRENT_BUFFER)
 		return;
 
-	zconf_delete_buffer(YY_CURRENT_BUFFER );
+	yy_delete_buffer(YY_CURRENT_BUFFER );
 	YY_CURRENT_BUFFER_LVALUE = NULL;
 	if ((yy_buffer_stack_top) > 0)
 		--(yy_buffer_stack_top);
 
 	if (YY_CURRENT_BUFFER) {
-		zconf_load_buffer_state( );
+		yy_load_buffer_state( );
 		(yy_did_buffer_switch_on_eof) = 1;
 	}
 }
@@ -1979,7 +1946,7 @@ void zconfpop_buffer_state (void)
 /* Allocates the stack if it does not exist.
  *  Guarantees space for at least one push.
  */
-static void zconfensure_buffer_stack (void)
+static void yyensure_buffer_stack (void)
 {
 	int num_to_alloc;
     
@@ -1990,11 +1957,11 @@ static void zconfensure_buffer_stack (void)
 		 * immediate realloc on the next call.
          */
 		num_to_alloc = 1;
-		(yy_buffer_stack) = (struct yy_buffer_state**)zconfalloc
+		(yy_buffer_stack) = (struct yy_buffer_state**)yyalloc
 								(num_to_alloc * sizeof(struct yy_buffer_state*)
 								);
 		if ( ! (yy_buffer_stack) )
-			YY_FATAL_ERROR( "out of dynamic memory in zconfensure_buffer_stack()" );
+			YY_FATAL_ERROR( "out of dynamic memory in yyensure_buffer_stack()" );
 								  
 		memset((yy_buffer_stack), 0, num_to_alloc * sizeof(struct yy_buffer_state*));
 				
@@ -2009,12 +1976,12 @@ static void zconfensure_buffer_stack (void)
 		int grow_size = 8 /* arbitrary grow size */;
 
 		num_to_alloc = (yy_buffer_stack_max) + grow_size;
-		(yy_buffer_stack) = (struct yy_buffer_state**)zconfrealloc
+		(yy_buffer_stack) = (struct yy_buffer_state**)yyrealloc
 								((yy_buffer_stack),
 								num_to_alloc * sizeof(struct yy_buffer_state*)
 								);
 		if ( ! (yy_buffer_stack) )
-			YY_FATAL_ERROR( "out of dynamic memory in zconfensure_buffer_stack()" );
+			YY_FATAL_ERROR( "out of dynamic memory in yyensure_buffer_stack()" );
 
 		/* zero only the new slots.*/
 		memset((yy_buffer_stack) + (yy_buffer_stack_max), 0, grow_size * sizeof(struct yy_buffer_state*));
@@ -2028,7 +1995,7 @@ static void zconfensure_buffer_stack (void)
  * 
  * @return the newly allocated buffer state object. 
  */
-YY_BUFFER_STATE zconf_scan_buffer  (char * base, yy_size_t  size )
+YY_BUFFER_STATE yy_scan_buffer  (char * base, yy_size_t  size )
 {
 	YY_BUFFER_STATE b;
     
@@ -2038,9 +2005,9 @@ YY_BUFFER_STATE zconf_scan_buffer  (char * base, yy_size_t  size )
 		/* They forgot to leave room for the EOB's. */
 		return 0;
 
-	b = (YY_BUFFER_STATE) zconfalloc(sizeof( struct yy_buffer_state )  );
+	b = (YY_BUFFER_STATE) yyalloc(sizeof( struct yy_buffer_state )  );
 	if ( ! b )
-		YY_FATAL_ERROR( "out of dynamic memory in zconf_scan_buffer()" );
+		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_buffer()" );
 
 	b->yy_buf_size = size - 2;	/* "- 2" to take care of EOB's */
 	b->yy_buf_pos = b->yy_ch_buf = base;
@@ -2052,33 +2019,33 @@ YY_BUFFER_STATE zconf_scan_buffer  (char * base, yy_size_t  size )
 	b->yy_fill_buffer = 0;
 	b->yy_buffer_status = YY_BUFFER_NEW;
 
-	zconf_switch_to_buffer(b  );
+	yy_switch_to_buffer(b  );
 
 	return b;
 }
 
-/** Setup the input buffer state to scan a string. The next call to zconflex() will
+/** Setup the input buffer state to scan a string. The next call to yylex() will
  * scan from a @e copy of @a str.
  * @param yystr a NUL-terminated string to scan
  * 
  * @return the newly allocated buffer state object.
  * @note If you want to scan bytes that may contain NUL values, then use
- *       zconf_scan_bytes() instead.
+ *       yy_scan_bytes() instead.
  */
-YY_BUFFER_STATE zconf_scan_string (yyconst char * yystr )
+YY_BUFFER_STATE yy_scan_string (yyconst char * yystr )
 {
     
-	return zconf_scan_bytes(yystr,strlen(yystr) );
+	return yy_scan_bytes(yystr,strlen(yystr) );
 }
 
-/** Setup the input buffer state to scan the given bytes. The next call to zconflex() will
+/** Setup the input buffer state to scan the given bytes. The next call to yylex() will
  * scan from a @e copy of @a bytes.
- * @param yybytes the byte buffer to scan
- * @param _yybytes_len the number of bytes in the buffer pointed to by @a bytes.
+ * @param bytes the byte buffer to scan
+ * @param len the number of bytes in the buffer pointed to by @a bytes.
  * 
  * @return the newly allocated buffer state object.
  */
-YY_BUFFER_STATE zconf_scan_bytes  (yyconst char * yybytes, int  _yybytes_len )
+YY_BUFFER_STATE yy_scan_bytes  (yyconst char * yybytes, int  _yybytes_len )
 {
 	YY_BUFFER_STATE b;
 	char *buf;
@@ -2087,18 +2054,18 @@ YY_BUFFER_STATE zconf_scan_bytes  (yyconst char * yybytes, int  _yybytes_len )
     
 	/* Get memory for full buffer, including space for trailing EOB's. */
 	n = _yybytes_len + 2;
-	buf = (char *) zconfalloc(n  );
+	buf = (char *) yyalloc(n  );
 	if ( ! buf )
-		YY_FATAL_ERROR( "out of dynamic memory in zconf_scan_bytes()" );
+		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_bytes()" );
 
 	for ( i = 0; i < _yybytes_len; ++i )
 		buf[i] = yybytes[i];
 
 	buf[_yybytes_len] = buf[_yybytes_len+1] = YY_END_OF_BUFFER_CHAR;
 
-	b = zconf_scan_buffer(buf,n );
+	b = yy_scan_buffer(buf,n );
 	if ( ! b )
-		YY_FATAL_ERROR( "bad buffer in zconf_scan_bytes()" );
+		YY_FATAL_ERROR( "bad buffer in yy_scan_bytes()" );
 
 	/* It's okay to grow etc. this buffer, and we should throw it
 	 * away when we're done.
@@ -2124,14 +2091,14 @@ static void yy_fatal_error (yyconst char* msg )
 #define yyless(n) \
 	do \
 		{ \
-		/* Undo effects of setting up zconftext. */ \
+		/* Undo effects of setting up yytext. */ \
         int yyless_macro_arg = (n); \
         YY_LESS_LINENO(yyless_macro_arg);\
-		zconftext[zconfleng] = (yy_hold_char); \
-		(yy_c_buf_p) = zconftext + yyless_macro_arg; \
+		yytext[yyleng] = (yy_hold_char); \
+		(yy_c_buf_p) = yytext + yyless_macro_arg; \
 		(yy_hold_char) = *(yy_c_buf_p); \
 		*(yy_c_buf_p) = '\0'; \
-		zconfleng = yyless_macro_arg; \
+		yyleng = yyless_macro_arg; \
 		} \
 	while ( 0 )
 
@@ -2140,85 +2107,85 @@ static void yy_fatal_error (yyconst char* msg )
 /** Get the current line number.
  * 
  */
-int zconfget_lineno  (void)
+int yyget_lineno  (void)
 {
         
-    return zconflineno;
+    return yylineno;
 }
 
 /** Get the input stream.
  * 
  */
-FILE *zconfget_in  (void)
+FILE *yyget_in  (void)
 {
-        return zconfin;
+        return yyin;
 }
 
 /** Get the output stream.
  * 
  */
-FILE *zconfget_out  (void)
+FILE *yyget_out  (void)
 {
-        return zconfout;
+        return yyout;
 }
 
 /** Get the length of the current token.
  * 
  */
-int zconfget_leng  (void)
+int yyget_leng  (void)
 {
-        return zconfleng;
+        return yyleng;
 }
 
 /** Get the current token.
  * 
  */
 
-char *zconfget_text  (void)
+char *yyget_text  (void)
 {
-        return zconftext;
+        return yytext;
 }
 
 /** Set the current line number.
  * @param line_number
  * 
  */
-void zconfset_lineno (int  line_number )
+void yyset_lineno (int  line_number )
 {
     
-    zconflineno = line_number;
+    yylineno = line_number;
 }
 
 /** Set the input stream. This does not discard the current
  * input buffer.
  * @param in_str A readable stream.
  * 
- * @see zconf_switch_to_buffer
+ * @see yy_switch_to_buffer
  */
-void zconfset_in (FILE *  in_str )
+void yyset_in (FILE *  in_str )
 {
-        zconfin = in_str ;
+        yyin = in_str ;
 }
 
-void zconfset_out (FILE *  out_str )
+void yyset_out (FILE *  out_str )
 {
-        zconfout = out_str ;
+        yyout = out_str ;
 }
 
-int zconfget_debug  (void)
+int yyget_debug  (void)
 {
-        return zconf_flex_debug;
+        return yy_flex_debug;
 }
 
-void zconfset_debug (int  bdebug )
+void yyset_debug (int  bdebug )
 {
-        zconf_flex_debug = bdebug ;
+        yy_flex_debug = bdebug ;
 }
 
 static int yy_init_globals (void)
 {
         /* Initialization is the same as for the non-reentrant scanner.
-     * This function is called from zconflex_destroy(), so don't allocate here.
+     * This function is called from yylex_destroy(), so don't allocate here.
      */
 
     (yy_buffer_stack) = 0;
@@ -2230,36 +2197,36 @@ static int yy_init_globals (void)
 
 /* Defined in main.c */
 #ifdef YY_STDINIT
-    zconfin = stdin;
-    zconfout = stdout;
+    yyin = stdin;
+    yyout = stdout;
 #else
-    zconfin = (FILE *) 0;
-    zconfout = (FILE *) 0;
+    yyin = (FILE *) 0;
+    yyout = (FILE *) 0;
 #endif
 
     /* For future reference: Set errno on error, since we are called by
-     * zconflex_init()
+     * yylex_init()
      */
     return 0;
 }
 
-/* zconflex_destroy is for both reentrant and non-reentrant scanners. */
-int zconflex_destroy  (void)
+/* yylex_destroy is for both reentrant and non-reentrant scanners. */
+int yylex_destroy  (void)
 {
     
     /* Pop the buffer stack, destroying each element. */
 	while(YY_CURRENT_BUFFER){
-		zconf_delete_buffer(YY_CURRENT_BUFFER  );
+		yy_delete_buffer(YY_CURRENT_BUFFER  );
 		YY_CURRENT_BUFFER_LVALUE = NULL;
-		zconfpop_buffer_state();
+		yypop_buffer_state();
 	}
 
 	/* Destroy the stack itself. */
-	zconffree((yy_buffer_stack) );
+	yyfree((yy_buffer_stack) );
 	(yy_buffer_stack) = NULL;
 
     /* Reset the globals. This is important in a non-reentrant scanner so the next time
-     * zconflex() is called, initialization will occur. */
+     * yylex() is called, initialization will occur. */
     yy_init_globals( );
 
     return 0;
@@ -2289,12 +2256,12 @@ static int yy_flex_strlen (yyconst char * s )
 }
 #endif
 
-void *zconfalloc (yy_size_t  size )
+void *yyalloc (yy_size_t  size )
 {
 	return (void *) malloc( size );
 }
 
-void *zconfrealloc  (void * ptr, yy_size_t  size )
+void *yyrealloc  (void * ptr, yy_size_t  size )
 {
 	/* The cast to (char *) in the following accommodates both
 	 * implementations that use char* generic pointers, and those
@@ -2306,9 +2273,9 @@ void *zconfrealloc  (void * ptr, yy_size_t  size )
 	return (void *) realloc( (char *) ptr, size );
 }
 
-void zconffree (void * ptr )
+void yyfree (void * ptr )
 {
-	free( (char *) ptr );	/* see zconfrealloc() for (char *) cast */
+	free( (char *) ptr );	/* see yyrealloc() for (char *) cast */
 }
 
 #define YYTABLES_NAME "yytables"
@@ -2322,7 +2289,7 @@ void zconf_starthelp(void)
 
 static void zconf_endhelp(void)
 {
-	zconflval.string = text;
+	yylval.string = text;
 	BEGIN(INITIAL);
 }
 
@@ -2352,8 +2319,8 @@ FILE *zconf_fopen(const char *name)
 
 void zconf_initscan(const char *name)
 {
-	zconfin = zconf_fopen(name);
-	if (!zconfin) {
+	yyin = zconf_fopen(name);
+	if (!yyin) {
 		printf("can't find file %s\n", name);
 		exit(1);
 	}
@@ -2373,13 +2340,13 @@ void zconf_nextfile(const char *name)
 	memset(buf, 0, sizeof(*buf));
 
 	current_buf->state = YY_CURRENT_BUFFER;
-	zconfin = zconf_fopen(file->name);
-	if (!zconfin) {
+	yyin = zconf_fopen(file->name);
+	if (!yyin) {
 		printf("%s:%d: can't open file \"%s\"\n",
 		    zconf_curname(), zconf_lineno(), file->name);
 		exit(1);
 	}
-	zconf_switch_to_buffer(zconf_create_buffer(zconfin,YY_BUF_SIZE));
+	yy_switch_to_buffer(yy_create_buffer(yyin,YY_BUF_SIZE));
 	buf->parent = current_buf;
 	current_buf = buf;
 
@@ -2410,9 +2377,9 @@ static void zconf_endfile(void)
 
 	parent = current_buf->parent;
 	if (parent) {
-		fclose(zconfin);
-		zconf_delete_buffer(YY_CURRENT_BUFFER);
-		zconf_switch_to_buffer(parent->state);
+		fclose(yyin);
+		yy_delete_buffer(YY_CURRENT_BUFFER);
+		yy_switch_to_buffer(parent->state);
 	}
 	free(current_buf);
 	current_buf = parent;
diff --git a/scripts/kconfig/zconf.tab.c_shipped b/scripts/kconfig/zconf.tab.c_shipped
index 4c5495e..1bff55f 100644
--- a/scripts/kconfig/zconf.tab.c_shipped
+++ b/scripts/kconfig/zconf.tab.c_shipped
@@ -1,10 +1,9 @@
-
-/* A Bison parser, made by GNU Bison 2.4.1.  */
+/* A Bison parser, made by GNU Bison 2.4.3.  */
 
 /* Skeleton implementation for Bison's Yacc-like parsers in C
    
-      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
-   Free Software Foundation, Inc.
+      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006,
+   2009, 2010 Free Software Foundation, Inc.
    
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
@@ -46,7 +45,7 @@
 #define YYBISON 1
 
 /* Bison version.  */
-#define YYBISON_VERSION "2.4.1"
+#define YYBISON_VERSION "2.4.3"
 
 /* Skeleton name.  */
 #define YYSKELETON_NAME "yacc.c"
@@ -63,14 +62,6 @@
 /* Using locations.  */
 #define YYLSP_NEEDED 0
 
-/* Substitute the variable and function names.  */
-#define yyparse         zconfparse
-#define yylex           zconflex
-#define yyerror         zconferror
-#define yylval          zconflval
-#define yychar          zconfchar
-#define yydebug         zconfdebug
-#define yynerrs         zconfnerrs
 
 
 /* Copy the first part of user declarations.  */
@@ -98,26 +89,22 @@
 
 int cdebug = PRINTD;
 
-extern int zconflex(void);
+extern int yylex(void);
 static void zconfprint(const char *err, ...);
 static void zconf_error(const char *err, ...);
-static void zconferror(const char *err);
-static bool zconf_endtoken(struct kconf_id *id, int starttoken, int endtoken);
+static void yyerror(const char *err);
+static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtoken);
 
 struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 
 static struct menu *current_menu, *current_entry;
 
-#define YYDEBUG 0
-#if YYDEBUG
-#define YYERROR_VERBOSE
-#endif
 
 
 
 /* Enabling traces.  */
 #ifndef YYDEBUG
-# define YYDEBUG 0
+# define YYDEBUG 1
 #endif
 
 /* Enabling verbose error messages.  */
@@ -188,7 +175,7 @@ typedef union YYSTYPE
 	struct symbol *symbol;
 	struct expr *expr;
 	struct menu *menu;
-	struct kconf_id *id;
+	const struct kconf_id *id;
 
 
 
@@ -255,7 +242,7 @@ typedef short int yytype_int16;
 #define YYSIZE_MAXIMUM ((YYSIZE_T) -1)
 
 #ifndef YY_
-# if YYENABLE_NLS
+# if defined YYENABLE_NLS && YYENABLE_NLS
 #  if ENABLE_NLS
 #   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
 #   define YY_(msgid) dgettext ("bison-runtime", msgid)
@@ -535,18 +522,18 @@ static const yytype_int8 yyrhs[] =
 /* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
 static const yytype_uint16 yyrline[] =
 {
-       0,   108,   108,   108,   110,   110,   112,   114,   115,   116,
-     117,   118,   119,   123,   127,   127,   127,   127,   127,   127,
-     127,   127,   131,   132,   133,   134,   135,   136,   140,   141,
-     147,   155,   161,   169,   179,   181,   182,   183,   184,   185,
-     186,   189,   197,   203,   213,   219,   225,   228,   230,   241,
-     242,   247,   256,   261,   269,   272,   274,   275,   276,   277,
-     278,   281,   287,   298,   304,   314,   316,   321,   329,   337,
-     340,   342,   343,   344,   349,   356,   363,   368,   376,   379,
-     381,   382,   383,   386,   394,   401,   408,   414,   421,   423,
-     424,   425,   428,   436,   438,   439,   442,   449,   451,   456,
-     457,   460,   461,   462,   466,   467,   470,   471,   474,   475,
-     476,   477,   478,   479,   480,   483,   484,   487,   488
+       0,   104,   104,   104,   106,   106,   108,   110,   111,   112,
+     113,   114,   115,   119,   123,   123,   123,   123,   123,   123,
+     123,   123,   127,   128,   129,   130,   131,   132,   136,   137,
+     143,   151,   157,   165,   175,   177,   178,   179,   180,   181,
+     182,   185,   193,   199,   209,   215,   221,   224,   226,   237,
+     238,   243,   252,   257,   265,   268,   270,   271,   272,   273,
+     274,   277,   283,   294,   300,   310,   312,   317,   325,   333,
+     336,   338,   339,   340,   345,   352,   359,   364,   372,   375,
+     377,   378,   379,   382,   390,   397,   404,   410,   417,   419,
+     420,   421,   424,   432,   434,   435,   438,   445,   447,   452,
+     453,   456,   457,   458,   462,   463,   466,   467,   470,   471,
+     472,   473,   474,   475,   476,   479,   480,   483,   484
 };
 #endif
 
@@ -806,9 +793,18 @@ static const yytype_uint8 yystos[] =
 
 /* Like YYERROR except do call yyerror.  This remains here temporarily
    to ease the transition to the new meaning of YYERROR, for GCC.
-   Once GCC version 2 has supplanted version 1, this can go.  */
+   Once GCC version 2 has supplanted version 1, this can go.  However,
+   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
+   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
+   discussed.  */
 
 #define YYFAIL		goto yyerrlab
+#if defined YYFAIL
+  /* This is here to suppress warnings from the GCC cpp's
+     -Wunused-macros.  Normally we don't worry about that warning, but
+     some users do, and we want to make it easy for users to remove
+     YYFAIL uses, which will produce warnings from Bison 2.5.  */
+#endif
 
 #define YYRECOVERING()  (!!yyerrstatus)
 
@@ -865,7 +861,7 @@ while (YYID (0))
    we won't break user code: when these are the locations we know.  */
 
 #ifndef YY_LOCATION_PRINT
-# if YYLTYPE_IS_TRIVIAL
+# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
 #  define YY_LOCATION_PRINT(File, Loc)			\
      fprintf (File, "%d.%d-%d.%d",			\
 	      (Loc).first_line, (Loc).first_column,	\
@@ -1753,7 +1749,7 @@ yyreduce:
   case 48:
 
     {
-	struct kconf_id *id = kconf_id_lookup((yyvsp[(2) - (3)].string), strlen((yyvsp[(2) - (3)].string)));
+	const struct kconf_id *id = kconf_id_lookup((yyvsp[(2) - (3)].string), strlen((yyvsp[(2) - (3)].string)));
 	if (id && id->flags & TF_OPTION)
 		menu_add_option(id->token, (yyvsp[(3) - (3)].string));
 	else
@@ -2258,12 +2254,12 @@ void conf_parse(const char *name)
 	modules_sym->flags |= SYMBOL_AUTO;
 	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
 
-#if YYDEBUG
-	if (getenv("ZCONF_DEBUG"))
-		zconfdebug = 1;
-#endif
-	zconfparse();
-	if (zconfnerrs)
+	if (getenv("ZCONF_DEBUG")) {
+		extern int yydebug;
+		yydebug = 1;
+	}
+	yyparse();
+	if (yynerrs)
 		exit(1);
 	if (!modules_sym->prop) {
 		struct property *prop;
@@ -2278,9 +2274,9 @@ void conf_parse(const char *name)
 	menu_finalize(&rootmenu);
 	for_all_symbols(i, sym) {
 		if (sym_check_deps(sym))
-			zconfnerrs++;
+			yynerrs++;
         }
-	if (zconfnerrs)
+	if (yynerrs)
 		exit(1);
 	sym_set_change_count(1);
 }
@@ -2300,12 +2296,12 @@ static const char *zconf_tokenname(int token)
 	return "<token>";
 }
 
-static bool zconf_endtoken(struct kconf_id *id, int starttoken, int endtoken)
+static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtoken)
 {
 	if (id->token != endtoken) {
 		zconf_error("unexpected '%s' within %s block",
 			kconf_id_strings + id->name, zconf_tokenname(starttoken));
-		zconfnerrs++;
+		yynerrs++;
 		return false;
 	}
 	if (current_menu->file != current_file) {
@@ -2314,7 +2310,7 @@ static bool zconf_endtoken(struct kconf_id *id, int starttoken, int endtoken)
 		fprintf(stderr, "%s:%d: location of the '%s'\n",
 			current_menu->file->name, current_menu->lineno,
 			zconf_tokenname(starttoken));
-		zconfnerrs++;
+		yynerrs++;
 		return false;
 	}
 	return true;
@@ -2335,7 +2331,7 @@ static void zconf_error(const char *err, ...)
 {
 	va_list ap;
 
-	zconfnerrs++;
+	yynerrs++;
 	fprintf(stderr, "%s:%d: ", zconf_curname(), zconf_lineno());
 	va_start(ap, err);
 	vfprintf(stderr, err, ap);
@@ -2343,11 +2339,9 @@ static void zconf_error(const char *err, ...)
 	fprintf(stderr, "\n");
 }
 
-static void zconferror(const char *err)
+static void yyerror(const char *err)
 {
-#if YYDEBUG
 	fprintf(stderr, "%s:%d: %s\n", zconf_curname(), zconf_lineno() + 1, err);
-#endif
 }
 
 static void print_quoted_string(FILE *out, const char *str)
@@ -2496,7 +2490,7 @@ void zconfdump(FILE *out)
 	}
 }
 
-#include "lex.zconf.c"
+#include "zconf.lex.c"
 #include "util.c"
 #include "confdata.c"
 #include "expr.c"
-- 
1.7.3.4.574.g608b.dirty

