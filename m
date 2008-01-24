Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42828 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754391AbYAXWEI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:08 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 72/77] kconfig: remove "enable"
Date: Thu, 24 Jan 2008 23:03:53 +0100
Message-Id: <1201212238-4369-72-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Adrian Bunk <bunk@kernel.org>, Roman Zippel <zippel@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>

From: Adrian Bunk <bunk@kernel.org>

Kconfig had a synonym "enable" for "select" that was neither documented
nor used.

Signed-off-by: Adrian Bunk <bunk@kernel.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/kconfig/zconf.gperf          |    1 -
 scripts/kconfig/zconf.hash.c_shipped |   38 ++++++++++++++++-----------------
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/scripts/kconfig/zconf.gperf b/scripts/kconfig/zconf.gperf
index 4051639..25ef5d0 100644
--- a/scripts/kconfig/zconf.gperf
+++ b/scripts/kconfig/zconf.gperf
@@ -35,7 +35,6 @@ int,		T_TYPE,		TF_COMMAND, S_INT
 hex,		T_TYPE,		TF_COMMAND, S_HEX
 string,		T_TYPE,		TF_COMMAND, S_STRING
 select,		T_SELECT,	TF_COMMAND
-enable,		T_SELECT,	TF_COMMAND
 range,		T_RANGE,	TF_COMMAND
 option,		T_OPTION,	TF_COMMAND
 on,		T_ON,		TF_PARAM
diff --git a/scripts/kconfig/zconf.hash.c_shipped b/scripts/kconfig/zconf.hash.c_shipped
index c9d26bc..5c73d51 100644
--- a/scripts/kconfig/zconf.hash.c_shipped
+++ b/scripts/kconfig/zconf.hash.c_shipped
@@ -1,4 +1,4 @@
-/* ANSI-C code produced by gperf version 3.0.2 */
+/* ANSI-C code produced by gperf version 3.0.3 */
 /* Command-line: gperf  */
 /* Computed positions: -k'1,3' */
 
@@ -53,10 +53,10 @@ kconf_id_hash (register const char *str, register unsigned int len)
       49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
       49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
       49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 35, 35,  5,
+      49, 49, 49, 49, 49, 49, 49, 49, 11,  5,
        0,  0,  5, 49,  5, 20, 49, 49,  5, 20,
        5,  0, 30, 49,  0, 15,  0, 10,  0, 49,
-      10, 49, 49, 49, 49, 49, 49, 49, 49, 49,
+      25, 49, 49, 49, 49, 49, 49, 49, 49, 49,
       49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
       49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
       49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
@@ -100,9 +100,10 @@ struct kconf_id_strings_t
     char kconf_id_strings_str12[sizeof("default")];
     char kconf_id_strings_str13[sizeof("def_bool")];
     char kconf_id_strings_str14[sizeof("help")];
+    char kconf_id_strings_str15[sizeof("bool")];
     char kconf_id_strings_str16[sizeof("config")];
     char kconf_id_strings_str17[sizeof("def_tristate")];
-    char kconf_id_strings_str18[sizeof("hex")];
+    char kconf_id_strings_str18[sizeof("boolean")];
     char kconf_id_strings_str19[sizeof("defconfig_list")];
     char kconf_id_strings_str21[sizeof("string")];
     char kconf_id_strings_str22[sizeof("if")];
@@ -113,12 +114,10 @@ struct kconf_id_strings_t
     char kconf_id_strings_str29[sizeof("menu")];
     char kconf_id_strings_str31[sizeof("source")];
     char kconf_id_strings_str32[sizeof("comment")];
+    char kconf_id_strings_str33[sizeof("hex")];
     char kconf_id_strings_str35[sizeof("menuconfig")];
     char kconf_id_strings_str36[sizeof("prompt")];
     char kconf_id_strings_str37[sizeof("depends")];
-    char kconf_id_strings_str39[sizeof("bool")];
-    char kconf_id_strings_str41[sizeof("enable")];
-    char kconf_id_strings_str42[sizeof("boolean")];
     char kconf_id_strings_str48[sizeof("mainmenu")];
   };
 static struct kconf_id_strings_t kconf_id_strings_contents =
@@ -135,9 +134,10 @@ static struct kconf_id_strings_t kconf_id_strings_contents =
     "default",
     "def_bool",
     "help",
+    "bool",
     "config",
     "def_tristate",
-    "hex",
+    "boolean",
     "defconfig_list",
     "string",
     "if",
@@ -148,24 +148,25 @@ static struct kconf_id_strings_t kconf_id_strings_contents =
     "menu",
     "source",
     "comment",
+    "hex",
     "menuconfig",
     "prompt",
     "depends",
-    "bool",
-    "enable",
-    "boolean",
     "mainmenu"
   };
 #define kconf_id_strings ((const char *) &kconf_id_strings_contents)
 #ifdef __GNUC__
 __inline
+#ifdef __GNUC_STDC_INLINE__
+__attribute__ ((__gnu_inline__))
+#endif
 #endif
 struct kconf_id *
 kconf_id_lookup (register const char *str, register unsigned int len)
 {
   enum
     {
-      TOTAL_KEYWORDS = 32,
+      TOTAL_KEYWORDS = 31,
       MIN_WORD_LENGTH = 2,
       MAX_WORD_LENGTH = 14,
       MIN_HASH_VALUE = 2,
@@ -188,10 +189,10 @@ kconf_id_lookup (register const char *str, register unsigned int len)
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str12,	T_DEFAULT,	TF_COMMAND, S_UNKNOWN},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str13,	T_DEFAULT,	TF_COMMAND, S_BOOLEAN},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str14,		T_HELP,		TF_COMMAND},
-      {-1},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str15,		T_TYPE,		TF_COMMAND, S_BOOLEAN},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str16,		T_CONFIG,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str17,	T_DEFAULT,	TF_COMMAND, S_TRISTATE},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str18,		T_TYPE,		TF_COMMAND, S_HEX},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str18,	T_TYPE,		TF_COMMAND, S_BOOLEAN},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str19,	T_OPT_DEFCONFIG_LIST,TF_OPTION},
       {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str21,		T_TYPE,		TF_COMMAND, S_STRING},
@@ -205,16 +206,13 @@ kconf_id_lookup (register const char *str, register unsigned int len)
       {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str31,		T_SOURCE,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str32,	T_COMMENT,	TF_COMMAND},
-      {-1}, {-1},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str33,		T_TYPE,		TF_COMMAND, S_HEX},
+      {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str35,	T_MENUCONFIG,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str36,		T_PROMPT,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str37,	T_DEPENDS,	TF_COMMAND},
+      {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1},
       {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str39,		T_TYPE,		TF_COMMAND, S_BOOLEAN},
-      {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str41,		T_SELECT,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str42,	T_TYPE,		TF_COMMAND, S_BOOLEAN},
-      {-1}, {-1}, {-1}, {-1}, {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str48,	T_MAINMENU,	TF_COMMAND}
     };
 
-- 
1.5.4.rc3.14.g44397

