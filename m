Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:44950 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752473Ab1EECDm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2011 22:03:42 -0400
Received: by mail-iy0-f174.google.com with SMTP id 14so1449065iyb.19
        for <linux-kbuild@vger.kernel.org>; Wed, 04 May 2011 19:03:42 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFC 6/9] kconfig: regen parsers
Date: Wed,  4 May 2011 22:03:21 -0400
Message-Id: <1304561004-2684-7-git-send-email-lacombar@gmail.com>
In-Reply-To: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
References: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/kconfig/lex.zconf.c_shipped  |   26 +---
 scripts/kconfig/zconf.hash.c_shipped |  273 +++++++++++++++++++--------------
 scripts/kconfig/zconf.tab.c_shipped  |   32 +++--
 3 files changed, 183 insertions(+), 148 deletions(-)

diff --git a/scripts/kconfig/lex.zconf.c_shipped b/scripts/kconfig/lex.zconf.c_shipped
index 6eb0397..f14c57c 100644
--- a/scripts/kconfig/lex.zconf.c_shipped
+++ b/scripts/kconfig/lex.zconf.c_shipped
@@ -1,5 +1,5 @@
 
-#line 3 "scripts/kconfig/lex.zconf.c"
+#line 3 "scripts/kconfig/lex.zconf.c_shipped"
 
 #define  YY_INT_ALIGNED short int
 
@@ -72,6 +72,7 @@ typedef int flex_int32_t;
 typedef unsigned char flex_uint8_t; 
 typedef unsigned short int flex_uint16_t;
 typedef unsigned int flex_uint32_t;
+#endif /* ! C99 */
 
 /* Limits of integral types. */
 #ifndef INT8_MIN
@@ -102,8 +103,6 @@ typedef unsigned int flex_uint32_t;
 #define UINT32_MAX             (4294967295U)
 #endif
 
-#endif /* ! C99 */
-
 #endif /* ! FLEXINT_H */
 
 #ifdef __cplusplus
@@ -160,15 +159,7 @@ typedef unsigned int flex_uint32_t;
 
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
@@ -922,12 +913,7 @@ static int input (void );
 
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
@@ -1100,7 +1086,7 @@ YY_RULE_SETUP
 case 6:
 YY_RULE_SETUP
 {
-		struct kconf_id *id = kconf_id_lookup(zconftext, zconfleng);
+		const struct kconf_id *id = kconf_id_lookup(zconftext, zconfleng);
 		BEGIN(PARAM);
 		current_pos.file = current_file;
 		current_pos.lineno = current_file->lineno;
@@ -1175,7 +1161,7 @@ YY_RULE_SETUP
 case 19:
 YY_RULE_SETUP
 {
-		struct kconf_id *id = kconf_id_lookup(zconftext, zconfleng);
+		const struct kconf_id *id = kconf_id_lookup(zconftext, zconfleng);
 		if (id && id->flags & TF_PARAM) {
 			zconflval.id = id;
 			return id->token;
@@ -2073,8 +2059,8 @@ YY_BUFFER_STATE zconf_scan_string (yyconst char * yystr )
 
 /** Setup the input buffer state to scan the given bytes. The next call to zconflex() will
  * scan from a @e copy of @a bytes.
- * @param yybytes the byte buffer to scan
- * @param _yybytes_len the number of bytes in the buffer pointed to by @a bytes.
+ * @param bytes the byte buffer to scan
+ * @param len the number of bytes in the buffer pointed to by @a bytes.
  * 
  * @return the newly allocated buffer state object.
  */
diff --git a/scripts/kconfig/zconf.hash.c_shipped b/scripts/kconfig/zconf.hash.c_shipped
index 4055d5d..96bbec5 100644
--- a/scripts/kconfig/zconf.hash.c_shipped
+++ b/scripts/kconfig/zconf.hash.c_shipped
@@ -1,6 +1,5 @@
-/* ANSI-C code produced by gperf version 3.0.3 */
-/* Command-line: gperf  */
-/* Computed positions: -k'1,3' */
+/* ANSI-C code produced by gperf version 3.0.4 */
+/* Command-line: gperf -t --output-file scripts/kconfig/zconf.hash.c_shipped -L ANSI-C -a -C -E -g -k '1,3,$' -p -t scripts/kconfig/zconf.gperf  */
 
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
 
diff --git a/scripts/kconfig/zconf.tab.c_shipped b/scripts/kconfig/zconf.tab.c_shipped
index 4c5495e..a2cb969 100644
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
@@ -102,7 +101,7 @@ extern int zconflex(void);
 static void zconfprint(const char *err, ...);
 static void zconf_error(const char *err, ...);
 static void zconferror(const char *err);
-static bool zconf_endtoken(struct kconf_id *id, int starttoken, int endtoken);
+static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtoken);
 
 struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 
@@ -188,7 +187,7 @@ typedef union YYSTYPE
 	struct symbol *symbol;
 	struct expr *expr;
 	struct menu *menu;
-	struct kconf_id *id;
+	const struct kconf_id *id;
 
 
 
@@ -255,7 +254,7 @@ typedef short int yytype_int16;
 #define YYSIZE_MAXIMUM ((YYSIZE_T) -1)
 
 #ifndef YY_
-# if YYENABLE_NLS
+# if defined YYENABLE_NLS && YYENABLE_NLS
 #  if ENABLE_NLS
 #   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
 #   define YY_(msgid) dgettext ("bison-runtime", msgid)
@@ -806,9 +805,18 @@ static const yytype_uint8 yystos[] =
 
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
 
@@ -865,7 +873,7 @@ while (YYID (0))
    we won't break user code: when these are the locations we know.  */
 
 #ifndef YY_LOCATION_PRINT
-# if YYLTYPE_IS_TRIVIAL
+# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
 #  define YY_LOCATION_PRINT(File, Loc)			\
      fprintf (File, "%d.%d-%d.%d",			\
 	      (Loc).first_line, (Loc).first_column,	\
@@ -1753,7 +1761,7 @@ yyreduce:
   case 48:
 
     {
-	struct kconf_id *id = kconf_id_lookup((yyvsp[(2) - (3)].string), strlen((yyvsp[(2) - (3)].string)));
+	const struct kconf_id *id = kconf_id_lookup((yyvsp[(2) - (3)].string), strlen((yyvsp[(2) - (3)].string)));
 	if (id && id->flags & TF_OPTION)
 		menu_add_option(id->token, (yyvsp[(3) - (3)].string));
 	else
@@ -2300,7 +2308,7 @@ static const char *zconf_tokenname(int token)
 	return "<token>";
 }
 
-static bool zconf_endtoken(struct kconf_id *id, int starttoken, int endtoken)
+static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtoken)
 {
 	if (id->token != endtoken) {
 		zconf_error("unexpected '%s' within %s block",
-- 
1.7.3.4.574.g608b.dirty

