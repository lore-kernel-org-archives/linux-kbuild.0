Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:48903 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750854AbdHSIwQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Aug 2017 04:52:16 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RFC PATCH 1/3] kbuild: generate *.hash.c during build
Date: Sat, 19 Aug 2017 17:49:35 +0900
Message-Id: <1503132577-24423-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com>
References: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Richard Purdie <richard.purdie@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>

*.hash.c files are artifacts generated from *.gperf by using gperf.
Instead of running gperf, we conventionally version-control
*.hash.c_shipped files and copy them to *.hash.c during build.

It is true that this approach can minimize external tool dependency,
but we need to update the shipped files from time to time.  This
commit switches to build-time generation of the intermediate C files.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/process/changes.rst        |  12 ++
 scripts/Makefile.lib                     |  11 +-
 scripts/genksyms/Makefile                |   1 +
 scripts/genksyms/keywords.hash.c_shipped | 230 ------------------------
 scripts/kconfig/Makefile                 |   1 +
 scripts/kconfig/zconf.hash.c_shipped     | 297 -------------------------------
 6 files changed, 19 insertions(+), 533 deletions(-)
 delete mode 100644 scripts/genksyms/keywords.hash.c_shipped
 delete mode 100644 scripts/kconfig/zconf.hash.c_shipped

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index adbb50ae5246..793e96fe47e3 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -31,6 +31,7 @@ you probably needn't concern yourself with isdn4k-utils.
 ====================== ===============  ========================================
 GNU C                  3.2              gcc --version
 GNU make               3.81             make --version
+gperf                  3.0.4            gperf --version
 binutils               2.20             ld -v
 util-linux             2.10o            fdformat --version
 module-init-tools      0.9.10           depmod -V
@@ -72,6 +73,12 @@ Make
 
 You will need GNU make 3.81 or later to build the kernel.
 
+gperf
+-----
+
+Since Linux 4.14, the build system generates perfect hash functions
+during build.  This requires gperf 3.04 or later.
+
 Binutils
 --------
 
@@ -338,6 +345,11 @@ Make
 
 - <ftp://ftp.gnu.org/gnu/make/>
 
+gperf
+-----
+
+- <ftp://ftp.gnu.org/gnu/gperf/>
+
 Binutils
 --------
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 58c05e5d9870..da7b42f7a5b8 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -192,16 +192,15 @@ $(foreach m, $(notdir $1), \
 	$(addprefix $(obj)/, $(foreach s, $3, $($(m:%$(strip $2)=%$(s)))))))
 endef
 
-ifdef REGENERATE_PARSERS
-
 # GPERF
 # ---------------------------------------------------------------------------
-quiet_cmd_gperf = GPERF $@
+quiet_cmd_gperf = GPERF   $@
       cmd_gperf = gperf -t --output-file $@ -a -C -E -g -k 1,3,$$ -p -t $<
 
-.PRECIOUS: $(src)/%.hash.c_shipped
-$(src)/%.hash.c_shipped: $(src)/%.gperf
-	$(call cmd,gperf)
+$(src)/%.hash.c: $(src)/%.gperf FORCE
+	$(call if_changed,gperf)
+
+ifdef REGENERATE_PARSERS
 
 # LEX
 # ---------------------------------------------------------------------------
diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index aca33b98bf63..ce09b96fcb7b 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -11,4 +11,5 @@ HOSTCFLAGS_lex.lex.o := -I$(src)
 # dependencies on generated files need to be listed explicitly
 $(obj)/lex.lex.o: $(obj)/keywords.hash.c $(obj)/parse.tab.h
 
+targets		:= keywords.hash.c
 clean-files	:= keywords.hash.c lex.lex.c parse.tab.c parse.tab.h
diff --git a/scripts/genksyms/keywords.hash.c_shipped b/scripts/genksyms/keywords.hash.c_shipped
deleted file mode 100644
index 738018ba7375..000000000000
--- a/scripts/genksyms/keywords.hash.c_shipped
+++ /dev/null
@@ -1,230 +0,0 @@
-/* ANSI-C code produced by gperf version 3.0.4 */
-/* Command-line: gperf -t --output-file scripts/genksyms/keywords.hash.c_shipped -a -C -E -g -k '1,3,$' -p -t scripts/genksyms/keywords.gperf  */
-
-#if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
-      && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
-      && (')' == 41) && ('*' == 42) && ('+' == 43) && (',' == 44) \
-      && ('-' == 45) && ('.' == 46) && ('/' == 47) && ('0' == 48) \
-      && ('1' == 49) && ('2' == 50) && ('3' == 51) && ('4' == 52) \
-      && ('5' == 53) && ('6' == 54) && ('7' == 55) && ('8' == 56) \
-      && ('9' == 57) && (':' == 58) && (';' == 59) && ('<' == 60) \
-      && ('=' == 61) && ('>' == 62) && ('?' == 63) && ('A' == 65) \
-      && ('B' == 66) && ('C' == 67) && ('D' == 68) && ('E' == 69) \
-      && ('F' == 70) && ('G' == 71) && ('H' == 72) && ('I' == 73) \
-      && ('J' == 74) && ('K' == 75) && ('L' == 76) && ('M' == 77) \
-      && ('N' == 78) && ('O' == 79) && ('P' == 80) && ('Q' == 81) \
-      && ('R' == 82) && ('S' == 83) && ('T' == 84) && ('U' == 85) \
-      && ('V' == 86) && ('W' == 87) && ('X' == 88) && ('Y' == 89) \
-      && ('Z' == 90) && ('[' == 91) && ('\\' == 92) && (']' == 93) \
-      && ('^' == 94) && ('_' == 95) && ('a' == 97) && ('b' == 98) \
-      && ('c' == 99) && ('d' == 100) && ('e' == 101) && ('f' == 102) \
-      && ('g' == 103) && ('h' == 104) && ('i' == 105) && ('j' == 106) \
-      && ('k' == 107) && ('l' == 108) && ('m' == 109) && ('n' == 110) \
-      && ('o' == 111) && ('p' == 112) && ('q' == 113) && ('r' == 114) \
-      && ('s' == 115) && ('t' == 116) && ('u' == 117) && ('v' == 118) \
-      && ('w' == 119) && ('x' == 120) && ('y' == 121) && ('z' == 122) \
-      && ('{' == 123) && ('|' == 124) && ('}' == 125) && ('~' == 126))
-/* The character set is not based on ISO-646.  */
-#error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
-#endif
-
-#line 4 "scripts/genksyms/keywords.gperf"
-
-struct resword;
-static const struct resword *is_reserved_word(register const char *str, register unsigned int len);
-#line 8 "scripts/genksyms/keywords.gperf"
-struct resword { const char *name; int token; };
-/* maximum key range = 98, duplicates = 0 */
-
-#ifdef __GNUC__
-__inline
-#else
-#ifdef __cplusplus
-inline
-#endif
-#endif
-static unsigned int
-is_reserved_hash (register const char *str, register unsigned int len)
-{
-  static const unsigned char asso_values[] =
-    {
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101,   0,
-      101, 101, 101, 101, 101, 101,  15, 101, 101, 101,
-        0, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101,   0, 101,   0,   0,   5,
-       25,  20,  55,  30, 101,  15, 101, 101,  10,   0,
-       10,  40,  10, 101,  10,   5,   0,  10,  15, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101, 101, 101, 101, 101,
-      101, 101, 101, 101, 101, 101
-    };
-  return len + asso_values[(unsigned char)str[2]] + asso_values[(unsigned char)str[0]] + asso_values[(unsigned char)str[len - 1]];
-}
-
-#ifdef __GNUC__
-__inline
-#if defined __GNUC_STDC_INLINE__ || defined __GNUC_GNU_INLINE__
-__attribute__ ((__gnu_inline__))
-#endif
-#endif
-const struct resword *
-is_reserved_word (register const char *str, register unsigned int len)
-{
-  enum
-    {
-      TOTAL_KEYWORDS = 47,
-      MIN_WORD_LENGTH = 3,
-      MAX_WORD_LENGTH = 24,
-      MIN_HASH_VALUE = 3,
-      MAX_HASH_VALUE = 100
-    };
-
-  static const struct resword wordlist[] =
-    {
-      {""}, {""}, {""},
-#line 36 "scripts/genksyms/keywords.gperf"
-      {"asm", ASM_KEYW},
-      {""},
-#line 15 "scripts/genksyms/keywords.gperf"
-      {"__asm", ASM_KEYW},
-      {""},
-#line 16 "scripts/genksyms/keywords.gperf"
-      {"__asm__", ASM_KEYW},
-      {""}, {""},
-#line 27 "scripts/genksyms/keywords.gperf"
-      {"__typeof__", TYPEOF_KEYW},
-      {""},
-#line 19 "scripts/genksyms/keywords.gperf"
-      {"__const", CONST_KEYW},
-#line 18 "scripts/genksyms/keywords.gperf"
-      {"__attribute__", ATTRIBUTE_KEYW},
-#line 20 "scripts/genksyms/keywords.gperf"
-      {"__const__", CONST_KEYW},
-#line 25 "scripts/genksyms/keywords.gperf"
-      {"__signed__", SIGNED_KEYW},
-#line 54 "scripts/genksyms/keywords.gperf"
-      {"static", STATIC_KEYW},
-#line 30 "scripts/genksyms/keywords.gperf"
-      {"__builtin_va_list", VA_LIST_KEYW},
-#line 49 "scripts/genksyms/keywords.gperf"
-      {"int", INT_KEYW},
-#line 42 "scripts/genksyms/keywords.gperf"
-      {"char", CHAR_KEYW},
-#line 43 "scripts/genksyms/keywords.gperf"
-      {"const", CONST_KEYW},
-#line 55 "scripts/genksyms/keywords.gperf"
-      {"struct", STRUCT_KEYW},
-#line 34 "scripts/genksyms/keywords.gperf"
-      {"__restrict__", RESTRICT_KEYW},
-#line 35 "scripts/genksyms/keywords.gperf"
-      {"restrict", RESTRICT_KEYW},
-#line 12 "scripts/genksyms/keywords.gperf"
-      {"EXPORT_SYMBOL_GPL_FUTURE", EXPORT_SYMBOL_KEYW},
-#line 23 "scripts/genksyms/keywords.gperf"
-      {"__inline__", INLINE_KEYW},
-      {""},
-#line 29 "scripts/genksyms/keywords.gperf"
-      {"__volatile__", VOLATILE_KEYW},
-#line 10 "scripts/genksyms/keywords.gperf"
-      {"EXPORT_SYMBOL", EXPORT_SYMBOL_KEYW},
-#line 33 "scripts/genksyms/keywords.gperf"
-      {"_restrict", RESTRICT_KEYW},
-      {""},
-#line 17 "scripts/genksyms/keywords.gperf"
-      {"__attribute", ATTRIBUTE_KEYW},
-#line 11 "scripts/genksyms/keywords.gperf"
-      {"EXPORT_SYMBOL_GPL", EXPORT_SYMBOL_KEYW},
-#line 21 "scripts/genksyms/keywords.gperf"
-      {"__extension__", EXTENSION_KEYW},
-#line 45 "scripts/genksyms/keywords.gperf"
-      {"enum", ENUM_KEYW},
-#line 13 "scripts/genksyms/keywords.gperf"
-      {"EXPORT_UNUSED_SYMBOL", EXPORT_SYMBOL_KEYW},
-#line 46 "scripts/genksyms/keywords.gperf"
-      {"extern", EXTERN_KEYW},
-      {""},
-#line 24 "scripts/genksyms/keywords.gperf"
-      {"__signed", SIGNED_KEYW},
-#line 14 "scripts/genksyms/keywords.gperf"
-      {"EXPORT_UNUSED_SYMBOL_GPL", EXPORT_SYMBOL_KEYW},
-#line 58 "scripts/genksyms/keywords.gperf"
-      {"union", UNION_KEYW},
-      {""}, {""},
-#line 22 "scripts/genksyms/keywords.gperf"
-      {"__inline", INLINE_KEYW},
-#line 41 "scripts/genksyms/keywords.gperf"
-      {"auto", AUTO_KEYW},
-#line 28 "scripts/genksyms/keywords.gperf"
-      {"__volatile", VOLATILE_KEYW},
-      {""}, {""},
-#line 59 "scripts/genksyms/keywords.gperf"
-      {"unsigned", UNSIGNED_KEYW},
-      {""},
-#line 52 "scripts/genksyms/keywords.gperf"
-      {"short", SHORT_KEYW},
-#line 48 "scripts/genksyms/keywords.gperf"
-      {"inline", INLINE_KEYW},
-      {""},
-#line 61 "scripts/genksyms/keywords.gperf"
-      {"volatile", VOLATILE_KEYW},
-#line 50 "scripts/genksyms/keywords.gperf"
-      {"long", LONG_KEYW},
-#line 32 "scripts/genksyms/keywords.gperf"
-      {"_Bool", BOOL_KEYW},
-      {""}, {""},
-#line 51 "scripts/genksyms/keywords.gperf"
-      {"register", REGISTER_KEYW},
-#line 60 "scripts/genksyms/keywords.gperf"
-      {"void", VOID_KEYW},
-      {""},
-#line 44 "scripts/genksyms/keywords.gperf"
-      {"double", DOUBLE_KEYW},
-      {""},
-#line 26 "scripts/genksyms/keywords.gperf"
-      {"__typeof", TYPEOF_KEYW},
-      {""}, {""},
-#line 53 "scripts/genksyms/keywords.gperf"
-      {"signed", SIGNED_KEYW},
-      {""}, {""}, {""}, {""},
-#line 57 "scripts/genksyms/keywords.gperf"
-      {"typeof", TYPEOF_KEYW},
-#line 56 "scripts/genksyms/keywords.gperf"
-      {"typedef", TYPEDEF_KEYW},
-      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
-      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
-      {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""}, {""},
-#line 47 "scripts/genksyms/keywords.gperf"
-      {"float", FLOAT_KEYW}
-    };
-
-  if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
-    {
-      register int key = is_reserved_hash (str, len);
-
-      if (key <= MAX_HASH_VALUE && key >= 0)
-        {
-          register const char *s = wordlist[key].name;
-
-          if (*str == *s && !strcmp (str + 1, s + 1))
-            return &wordlist[key];
-        }
-    }
-  return 0;
-}
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index eb8144643b78..a00fa0b1e8d3 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -190,6 +190,7 @@ gconf-objs	:= gconf.o zconf.tab.o
 
 hostprogs-y := conf nconf mconf kxgettext qconf gconf
 
+targets		:= zconf.hash.c
 clean-files	:= qconf.moc .tmp_qtcheck .tmp_gtkcheck
 clean-files	+= zconf.tab.c zconf.lex.c zconf.hash.c gconf.glade.h
 clean-files     += config.pot linux.pot
diff --git a/scripts/kconfig/zconf.hash.c_shipped b/scripts/kconfig/zconf.hash.c_shipped
deleted file mode 100644
index d51b15de074a..000000000000
--- a/scripts/kconfig/zconf.hash.c_shipped
+++ /dev/null
@@ -1,297 +0,0 @@
-/* ANSI-C code produced by gperf version 3.0.4 */
-/* Command-line: gperf -t --output-file scripts/kconfig/zconf.hash.c_shipped -a -C -E -g -k '1,3,$' -p -t scripts/kconfig/zconf.gperf  */
-
-#if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
-      && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
-      && (')' == 41) && ('*' == 42) && ('+' == 43) && (',' == 44) \
-      && ('-' == 45) && ('.' == 46) && ('/' == 47) && ('0' == 48) \
-      && ('1' == 49) && ('2' == 50) && ('3' == 51) && ('4' == 52) \
-      && ('5' == 53) && ('6' == 54) && ('7' == 55) && ('8' == 56) \
-      && ('9' == 57) && (':' == 58) && (';' == 59) && ('<' == 60) \
-      && ('=' == 61) && ('>' == 62) && ('?' == 63) && ('A' == 65) \
-      && ('B' == 66) && ('C' == 67) && ('D' == 68) && ('E' == 69) \
-      && ('F' == 70) && ('G' == 71) && ('H' == 72) && ('I' == 73) \
-      && ('J' == 74) && ('K' == 75) && ('L' == 76) && ('M' == 77) \
-      && ('N' == 78) && ('O' == 79) && ('P' == 80) && ('Q' == 81) \
-      && ('R' == 82) && ('S' == 83) && ('T' == 84) && ('U' == 85) \
-      && ('V' == 86) && ('W' == 87) && ('X' == 88) && ('Y' == 89) \
-      && ('Z' == 90) && ('[' == 91) && ('\\' == 92) && (']' == 93) \
-      && ('^' == 94) && ('_' == 95) && ('a' == 97) && ('b' == 98) \
-      && ('c' == 99) && ('d' == 100) && ('e' == 101) && ('f' == 102) \
-      && ('g' == 103) && ('h' == 104) && ('i' == 105) && ('j' == 106) \
-      && ('k' == 107) && ('l' == 108) && ('m' == 109) && ('n' == 110) \
-      && ('o' == 111) && ('p' == 112) && ('q' == 113) && ('r' == 114) \
-      && ('s' == 115) && ('t' == 116) && ('u' == 117) && ('v' == 118) \
-      && ('w' == 119) && ('x' == 120) && ('y' == 121) && ('z' == 122) \
-      && ('{' == 123) && ('|' == 124) && ('}' == 125) && ('~' == 126))
-/* The character set is not based on ISO-646.  */
-#error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
-#endif
-
-#line 10 "scripts/kconfig/zconf.gperf"
-struct kconf_id;
-
-static const struct kconf_id *kconf_id_lookup(register const char *str, register unsigned int len);
-/* maximum key range = 71, duplicates = 0 */
-
-#ifdef __GNUC__
-__inline
-#else
-#ifdef __cplusplus
-inline
-#endif
-#endif
-static unsigned int
-kconf_id_hash (register const char *str, register unsigned int len)
-{
-  static const unsigned char asso_values[] =
-    {
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73,  0, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 10, 25, 25,
-       0,  0,  0,  5,  0,  0, 73, 73,  5,  0,
-      10,  5, 45, 73, 20, 20,  0, 15, 15, 73,
-      20,  0, 73, 73, 73, 73, 73, 73, 73, 73,
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
-    };
-  register int hval = len;
-
-  switch (hval)
-    {
-      default:
-        hval += asso_values[(unsigned char)str[2]];
-      /*FALLTHROUGH*/
-      case 2:
-      case 1:
-        hval += asso_values[(unsigned char)str[0]];
-        break;
-    }
-  return hval + asso_values[(unsigned char)str[len - 1]];
-}
-
-struct kconf_id_strings_t
-  {
-    char kconf_id_strings_str2[sizeof("if")];
-    char kconf_id_strings_str3[sizeof("int")];
-    char kconf_id_strings_str5[sizeof("endif")];
-    char kconf_id_strings_str7[sizeof("default")];
-    char kconf_id_strings_str8[sizeof("tristate")];
-    char kconf_id_strings_str9[sizeof("endchoice")];
-    char kconf_id_strings_str10[sizeof("---help---")];
-    char kconf_id_strings_str12[sizeof("def_tristate")];
-    char kconf_id_strings_str13[sizeof("def_bool")];
-    char kconf_id_strings_str14[sizeof("defconfig_list")];
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
-    char kconf_id_strings_str39[sizeof("bool")];
-    char kconf_id_strings_str41[sizeof("source")];
-    char kconf_id_strings_str42[sizeof("visible")];
-    char kconf_id_strings_str43[sizeof("hex")];
-    char kconf_id_strings_str46[sizeof("config")];
-    char kconf_id_strings_str47[sizeof("boolean")];
-    char kconf_id_strings_str50[sizeof("imply")];
-    char kconf_id_strings_str51[sizeof("string")];
-    char kconf_id_strings_str54[sizeof("help")];
-    char kconf_id_strings_str56[sizeof("prompt")];
-    char kconf_id_strings_str72[sizeof("depends")];
-  };
-static const struct kconf_id_strings_t kconf_id_strings_contents =
-  {
-    "if",
-    "int",
-    "endif",
-    "default",
-    "tristate",
-    "endchoice",
-    "---help---",
-    "def_tristate",
-    "def_bool",
-    "defconfig_list",
-    "on",
-    "optional",
-    "option",
-    "endmenu",
-    "mainmenu",
-    "menuconfig",
-    "modules",
-    "allnoconfig_y",
-    "menu",
-    "select",
-    "comment",
-    "env",
-    "range",
-    "choice",
-    "bool",
-    "source",
-    "visible",
-    "hex",
-    "config",
-    "boolean",
-    "imply",
-    "string",
-    "help",
-    "prompt",
-    "depends"
-  };
-#define kconf_id_strings ((const char *) &kconf_id_strings_contents)
-#ifdef __GNUC__
-__inline
-#if defined __GNUC_STDC_INLINE__ || defined __GNUC_GNU_INLINE__
-__attribute__ ((__gnu_inline__))
-#endif
-#endif
-const struct kconf_id *
-kconf_id_lookup (register const char *str, register unsigned int len)
-{
-  enum
-    {
-      TOTAL_KEYWORDS = 35,
-      MIN_WORD_LENGTH = 2,
-      MAX_WORD_LENGTH = 14,
-      MIN_HASH_VALUE = 2,
-      MAX_HASH_VALUE = 72
-    };
-
-  static const struct kconf_id wordlist[] =
-    {
-      {-1}, {-1},
-#line 26 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str2,		T_IF,		TF_COMMAND|TF_PARAM},
-#line 37 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str3,		T_TYPE,		TF_COMMAND, S_INT},
-      {-1},
-#line 27 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str5,		T_ENDIF,	TF_COMMAND},
-      {-1},
-#line 30 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str7,	T_DEFAULT,	TF_COMMAND, S_UNKNOWN},
-#line 32 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str8,	T_TYPE,		TF_COMMAND, S_TRISTATE},
-#line 20 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str9,	T_ENDCHOICE,	TF_COMMAND},
-#line 25 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str10,	T_HELP,		TF_COMMAND},
-      {-1},
-#line 33 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str12,	T_DEFAULT,	TF_COMMAND, S_TRISTATE},
-#line 36 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str13,	T_DEFAULT,	TF_COMMAND, S_BOOLEAN},
-#line 47 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str14,	T_OPT_DEFCONFIG_LIST,TF_OPTION},
-      {-1}, {-1},
-#line 45 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str17,		T_ON,		TF_PARAM},
-#line 29 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str18,	T_OPTIONAL,	TF_COMMAND},
-      {-1}, {-1},
-#line 44 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str21,		T_OPTION,	TF_COMMAND},
-#line 17 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str22,	T_ENDMENU,	TF_COMMAND},
-#line 15 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str23,	T_MAINMENU,	TF_COMMAND},
-      {-1},
-#line 23 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str25,	T_MENUCONFIG,	TF_COMMAND},
-      {-1},
-#line 46 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str27,	T_OPT_MODULES,	TF_OPTION},
-#line 49 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str28,	T_OPT_ALLNOCONFIG_Y,TF_OPTION},
-#line 16 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str29,		T_MENU,		TF_COMMAND},
-      {-1},
-#line 40 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str31,		T_SELECT,	TF_COMMAND},
-#line 21 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str32,	T_COMMENT,	TF_COMMAND},
-#line 48 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str33,		T_OPT_ENV,	TF_OPTION},
-      {-1},
-#line 42 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str35,		T_RANGE,	TF_COMMAND},
-#line 19 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str36,		T_CHOICE,	TF_COMMAND},
-      {-1}, {-1},
-#line 34 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str39,		T_TYPE,		TF_COMMAND, S_BOOLEAN},
-      {-1},
-#line 18 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str41,		T_SOURCE,	TF_COMMAND},
-#line 43 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str42,	T_VISIBLE,	TF_COMMAND},
-#line 38 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str43,		T_TYPE,		TF_COMMAND, S_HEX},
-      {-1}, {-1},
-#line 22 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str46,		T_CONFIG,	TF_COMMAND},
-#line 35 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str47,	T_TYPE,		TF_COMMAND, S_BOOLEAN},
-      {-1}, {-1},
-#line 41 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str50,		T_IMPLY,	TF_COMMAND},
-#line 39 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str51,		T_TYPE,		TF_COMMAND, S_STRING},
-      {-1}, {-1},
-#line 24 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str54,		T_HELP,		TF_COMMAND},
-      {-1},
-#line 31 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str56,		T_PROMPT,	TF_COMMAND},
-      {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1},
-      {-1}, {-1}, {-1}, {-1}, {-1}, {-1},
-#line 28 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str72,	T_DEPENDS,	TF_COMMAND}
-    };
-
-  if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
-    {
-      register int key = kconf_id_hash (str, len);
-
-      if (key <= MAX_HASH_VALUE && key >= 0)
-        {
-          register int o = wordlist[key].name;
-          if (o >= 0)
-            {
-              register const char *s = o + kconf_id_strings;
-
-              if (*str == *s && !strncmp (str + 1, s + 1, len - 1) && s[len] == '\0')
-                return &wordlist[key];
-            }
-        }
-    }
-  return 0;
-}
-#line 50 "scripts/kconfig/zconf.gperf"
-
-- 
2.7.4

