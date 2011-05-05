Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:44950 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752600Ab1EECDk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2011 22:03:40 -0400
Received: by mail-iy0-f174.google.com with SMTP id 14so1449065iyb.19
        for <linux-kbuild@vger.kernel.org>; Wed, 04 May 2011 19:03:40 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFC 4/9] genksyms: regen parser
Date: Wed,  4 May 2011 22:03:19 -0400
Message-Id: <1304561004-2684-5-git-send-email-lacombar@gmail.com>
In-Reply-To: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
References: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/genksyms/genksyms.hash.c_shipped |   96 ++--
 scripts/genksyms/genksyms.tab.c_shipped  |  537 +++++++++---------
 scripts/genksyms/genksyms.tab.h_shipped  |  139 -----
 scripts/genksyms/lex.genksyms.c_shipped  |  911 ++++++++----------------------
 4 files changed, 524 insertions(+), 1159 deletions(-)
 delete mode 100644 scripts/genksyms/genksyms.tab.h_shipped

diff --git a/scripts/genksyms/genksyms.hash.c_shipped b/scripts/genksyms/genksyms.hash.c_shipped
index 8060e06..04c6524 100644
--- a/scripts/genksyms/genksyms.hash.c_shipped
+++ b/scripts/genksyms/genksyms.hash.c_shipped
@@ -1,5 +1,5 @@
 /* ANSI-C code produced by gperf version 3.0.4 */
-/* Command-line: gperf -L ANSI-C -a -C -E -g -H is_reserved_hash -k '1,3,$' -N is_reserved_word -p -t scripts/genksyms/keywords.gperf  */
+/* Command-line: gperf -t --output-file scripts/genksyms/genksyms.hash.c -a -C -E -g -k '1,3,$' -p -t scripts/genksyms/genksyms.gperf  */
 
 #if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
       && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
@@ -28,11 +28,11 @@
 #error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
 #endif
 
-#line 1 "scripts/genksyms/keywords.gperf"
+#line 4 "scripts/genksyms/genksyms.gperf"
 
 struct resword;
 static const struct resword *is_reserved_word(register const char *str, register unsigned int len);
-#line 5 "scripts/genksyms/keywords.gperf"
+#line 8 "scripts/genksyms/genksyms.gperf"
 struct resword { const char *name; int token; };
 /* maximum key range = 64, duplicates = 0 */
 
@@ -99,108 +99,108 @@ is_reserved_word (register const char *str, register unsigned int len)
   static const struct resword wordlist[] =
     {
       {""}, {""}, {""},
-#line 30 "scripts/genksyms/keywords.gperf"
+#line 33 "scripts/genksyms/genksyms.gperf"
       {"asm", ASM_KEYW},
       {""},
-#line 12 "scripts/genksyms/keywords.gperf"
+#line 15 "scripts/genksyms/genksyms.gperf"
       {"__asm", ASM_KEYW},
       {""},
-#line 13 "scripts/genksyms/keywords.gperf"
+#line 16 "scripts/genksyms/genksyms.gperf"
       {"__asm__", ASM_KEYW},
       {""}, {""},
-#line 56 "scripts/genksyms/keywords.gperf"
+#line 59 "scripts/genksyms/genksyms.gperf"
       {"__typeof__", TYPEOF_KEYW},
       {""},
-#line 16 "scripts/genksyms/keywords.gperf"
+#line 19 "scripts/genksyms/genksyms.gperf"
       {"__const", CONST_KEYW},
-#line 15 "scripts/genksyms/keywords.gperf"
+#line 18 "scripts/genksyms/genksyms.gperf"
       {"__attribute__", ATTRIBUTE_KEYW},
-#line 17 "scripts/genksyms/keywords.gperf"
+#line 20 "scripts/genksyms/genksyms.gperf"
       {"__const__", CONST_KEYW},
-#line 22 "scripts/genksyms/keywords.gperf"
+#line 25 "scripts/genksyms/genksyms.gperf"
       {"__signed__", SIGNED_KEYW},
-#line 48 "scripts/genksyms/keywords.gperf"
+#line 51 "scripts/genksyms/genksyms.gperf"
       {"static", STATIC_KEYW},
       {""},
-#line 43 "scripts/genksyms/keywords.gperf"
+#line 46 "scripts/genksyms/genksyms.gperf"
       {"int", INT_KEYW},
-#line 36 "scripts/genksyms/keywords.gperf"
+#line 39 "scripts/genksyms/genksyms.gperf"
       {"char", CHAR_KEYW},
-#line 37 "scripts/genksyms/keywords.gperf"
+#line 40 "scripts/genksyms/genksyms.gperf"
       {"const", CONST_KEYW},
-#line 49 "scripts/genksyms/keywords.gperf"
+#line 52 "scripts/genksyms/genksyms.gperf"
       {"struct", STRUCT_KEYW},
-#line 28 "scripts/genksyms/keywords.gperf"
+#line 31 "scripts/genksyms/genksyms.gperf"
       {"__restrict__", RESTRICT_KEYW},
-#line 29 "scripts/genksyms/keywords.gperf"
+#line 32 "scripts/genksyms/genksyms.gperf"
       {"restrict", RESTRICT_KEYW},
-#line 9 "scripts/genksyms/keywords.gperf"
+#line 12 "scripts/genksyms/genksyms.gperf"
       {"EXPORT_SYMBOL_GPL_FUTURE", EXPORT_SYMBOL_KEYW},
-#line 20 "scripts/genksyms/keywords.gperf"
+#line 23 "scripts/genksyms/genksyms.gperf"
       {"__inline__", INLINE_KEYW},
       {""},
-#line 24 "scripts/genksyms/keywords.gperf"
+#line 27 "scripts/genksyms/genksyms.gperf"
       {"__volatile__", VOLATILE_KEYW},
-#line 7 "scripts/genksyms/keywords.gperf"
+#line 10 "scripts/genksyms/genksyms.gperf"
       {"EXPORT_SYMBOL", EXPORT_SYMBOL_KEYW},
-#line 27 "scripts/genksyms/keywords.gperf"
+#line 30 "scripts/genksyms/genksyms.gperf"
       {"_restrict", RESTRICT_KEYW},
       {""},
-#line 14 "scripts/genksyms/keywords.gperf"
+#line 17 "scripts/genksyms/genksyms.gperf"
       {"__attribute", ATTRIBUTE_KEYW},
-#line 8 "scripts/genksyms/keywords.gperf"
+#line 11 "scripts/genksyms/genksyms.gperf"
       {"EXPORT_SYMBOL_GPL", EXPORT_SYMBOL_KEYW},
-#line 18 "scripts/genksyms/keywords.gperf"
+#line 21 "scripts/genksyms/genksyms.gperf"
       {"__extension__", EXTENSION_KEYW},
-#line 39 "scripts/genksyms/keywords.gperf"
+#line 42 "scripts/genksyms/genksyms.gperf"
       {"enum", ENUM_KEYW},
-#line 10 "scripts/genksyms/keywords.gperf"
+#line 13 "scripts/genksyms/genksyms.gperf"
       {"EXPORT_UNUSED_SYMBOL", EXPORT_SYMBOL_KEYW},
-#line 40 "scripts/genksyms/keywords.gperf"
+#line 43 "scripts/genksyms/genksyms.gperf"
       {"extern", EXTERN_KEYW},
       {""},
-#line 21 "scripts/genksyms/keywords.gperf"
+#line 24 "scripts/genksyms/genksyms.gperf"
       {"__signed", SIGNED_KEYW},
-#line 11 "scripts/genksyms/keywords.gperf"
+#line 14 "scripts/genksyms/genksyms.gperf"
       {"EXPORT_UNUSED_SYMBOL_GPL", EXPORT_SYMBOL_KEYW},
-#line 51 "scripts/genksyms/keywords.gperf"
+#line 54 "scripts/genksyms/genksyms.gperf"
       {"union", UNION_KEYW},
-#line 55 "scripts/genksyms/keywords.gperf"
+#line 58 "scripts/genksyms/genksyms.gperf"
       {"typeof", TYPEOF_KEYW},
-#line 50 "scripts/genksyms/keywords.gperf"
+#line 53 "scripts/genksyms/genksyms.gperf"
       {"typedef", TYPEDEF_KEYW},
-#line 19 "scripts/genksyms/keywords.gperf"
+#line 22 "scripts/genksyms/genksyms.gperf"
       {"__inline", INLINE_KEYW},
-#line 35 "scripts/genksyms/keywords.gperf"
+#line 38 "scripts/genksyms/genksyms.gperf"
       {"auto", AUTO_KEYW},
-#line 23 "scripts/genksyms/keywords.gperf"
+#line 26 "scripts/genksyms/genksyms.gperf"
       {"__volatile", VOLATILE_KEYW},
       {""}, {""},
-#line 52 "scripts/genksyms/keywords.gperf"
+#line 55 "scripts/genksyms/genksyms.gperf"
       {"unsigned", UNSIGNED_KEYW},
       {""},
-#line 46 "scripts/genksyms/keywords.gperf"
+#line 49 "scripts/genksyms/genksyms.gperf"
       {"short", SHORT_KEYW},
-#line 42 "scripts/genksyms/keywords.gperf"
+#line 45 "scripts/genksyms/genksyms.gperf"
       {"inline", INLINE_KEYW},
       {""},
-#line 54 "scripts/genksyms/keywords.gperf"
+#line 57 "scripts/genksyms/genksyms.gperf"
       {"volatile", VOLATILE_KEYW},
-#line 44 "scripts/genksyms/keywords.gperf"
+#line 47 "scripts/genksyms/genksyms.gperf"
       {"long", LONG_KEYW},
-#line 26 "scripts/genksyms/keywords.gperf"
+#line 29 "scripts/genksyms/genksyms.gperf"
       {"_Bool", BOOL_KEYW},
       {""}, {""},
-#line 45 "scripts/genksyms/keywords.gperf"
+#line 48 "scripts/genksyms/genksyms.gperf"
       {"register", REGISTER_KEYW},
-#line 53 "scripts/genksyms/keywords.gperf"
+#line 56 "scripts/genksyms/genksyms.gperf"
       {"void", VOID_KEYW},
-#line 41 "scripts/genksyms/keywords.gperf"
+#line 44 "scripts/genksyms/genksyms.gperf"
       {"float", FLOAT_KEYW},
-#line 38 "scripts/genksyms/keywords.gperf"
+#line 41 "scripts/genksyms/genksyms.gperf"
       {"double", DOUBLE_KEYW},
       {""}, {""}, {""}, {""},
-#line 47 "scripts/genksyms/keywords.gperf"
+#line 50 "scripts/genksyms/genksyms.gperf"
       {"signed", SIGNED_KEYW}
     };
 
diff --git a/scripts/genksyms/genksyms.tab.c_shipped b/scripts/genksyms/genksyms.tab.c_shipped
index 809b949..ade41fe 100644
--- a/scripts/genksyms/genksyms.tab.c_shipped
+++ b/scripts/genksyms/genksyms.tab.c_shipped
@@ -1,24 +1,22 @@
-/* A Bison parser, made by GNU Bison 2.3.  */
+/* A Bison parser, made by GNU Bison 2.4.3.  */
 
 /* Skeleton implementation for Bison's Yacc-like parsers in C
-
-   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
-   Free Software Foundation, Inc.
-
-   This program is free software; you can redistribute it and/or modify
+   
+      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006,
+   2009, 2010 Free Software Foundation, Inc.
+   
+   This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
-   the Free Software Foundation; either version 2, or (at your option)
-   any later version.
-
+   the Free Software Foundation, either version 3 of the License, or
+   (at your option) any later version.
+   
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
-
+   
    You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 51 Franklin Street, Fifth Floor,
-   Boston, MA 02110-1301, USA.  */
+   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
 
 /* As a special exception, you may create a larger work that contains
    part or all of the Bison parser skeleton and distribute that work
@@ -29,7 +27,7 @@
    special exception, which will cause the skeleton and the resulting
    Bison output files to be licensed under the GNU General Public
    License without this special exception.
-
+   
    This special exception was added by the Free Software Foundation in
    version 2.2 of Bison.  */
 
@@ -47,7 +45,7 @@
 #define YYBISON 1
 
 /* Bison version.  */
-#define YYBISON_VERSION "2.3"
+#define YYBISON_VERSION "2.4.3"
 
 /* Skeleton name.  */
 #define YYSKELETON_NAME "yacc.c"
@@ -55,9 +53,76 @@
 /* Pure parsers.  */
 #define YYPURE 0
 
+/* Push parsers.  */
+#define YYPUSH 0
+
+/* Pull parsers.  */
+#define YYPULL 1
+
 /* Using locations.  */
 #define YYLSP_NEEDED 0
 
+/* Substitute the variable and function names.  */
+#define yyparse         genksymsparse
+#define yylex           genksymslex
+#define yyerror         genksymserror
+#define yylval          genksymslval
+#define yychar          genksymschar
+#define yydebug         genksymsdebug
+#define yynerrs         genksymsnerrs
+
+
+/* Copy the first part of user declarations.  */
+
+
+
+#include <assert.h>
+#include <stdlib.h>
+#include "genksyms.h"
+
+static int is_typedef;
+static int is_extern;
+static char *current_name;
+static struct string_list *decl_spec;
+
+static void yyerror(const char *);
+
+static inline void
+remove_node(struct string_list **p)
+{
+  struct string_list *node = *p;
+  *p = node->next;
+  free_node(node);
+}
+
+static inline void
+remove_list(struct string_list **pb, struct string_list **pe)
+{
+  struct string_list *b = *pb, *e = *pe;
+  *pb = e;
+  free_list(b, e);
+}
+
+
+
+
+/* Enabling traces.  */
+#ifndef YYDEBUG
+# define YYDEBUG 0
+#endif
+
+/* Enabling verbose error messages.  */
+#ifdef YYERROR_VERBOSE
+# undef YYERROR_VERBOSE
+# define YYERROR_VERBOSE 1
+#else
+# define YYERROR_VERBOSE 0
+#endif
+
+/* Enabling the token table.  */
+#ifndef YYTOKEN_TABLE
+# define YYTOKEN_TABLE 0
+#endif
 
 
 /* Tokens.  */
@@ -109,117 +174,20 @@
      FILENAME = 298
    };
 #endif
-/* Tokens.  */
-#define ASM_KEYW 258
-#define ATTRIBUTE_KEYW 259
-#define AUTO_KEYW 260
-#define BOOL_KEYW 261
-#define CHAR_KEYW 262
-#define CONST_KEYW 263
-#define DOUBLE_KEYW 264
-#define ENUM_KEYW 265
-#define EXTERN_KEYW 266
-#define EXTENSION_KEYW 267
-#define FLOAT_KEYW 268
-#define INLINE_KEYW 269
-#define INT_KEYW 270
-#define LONG_KEYW 271
-#define REGISTER_KEYW 272
-#define RESTRICT_KEYW 273
-#define SHORT_KEYW 274
-#define SIGNED_KEYW 275
-#define STATIC_KEYW 276
-#define STRUCT_KEYW 277
-#define TYPEDEF_KEYW 278
-#define UNION_KEYW 279
-#define UNSIGNED_KEYW 280
-#define VOID_KEYW 281
-#define VOLATILE_KEYW 282
-#define TYPEOF_KEYW 283
-#define EXPORT_SYMBOL_KEYW 284
-#define ASM_PHRASE 285
-#define ATTRIBUTE_PHRASE 286
-#define BRACE_PHRASE 287
-#define BRACKET_PHRASE 288
-#define EXPRESSION_PHRASE 289
-#define CHAR 290
-#define DOTS 291
-#define IDENT 292
-#define INT 293
-#define REAL 294
-#define STRING 295
-#define TYPE 296
-#define OTHER 297
-#define FILENAME 298
-
-
-
-
-/* Copy the first part of user declarations.  */
-#line 24 "scripts/genksyms/parse.y"
-
-
-#include <assert.h>
-#include <stdlib.h>
-#include "genksyms.h"
-
-static int is_typedef;
-static int is_extern;
-static char *current_name;
-static struct string_list *decl_spec;
 
-static void yyerror(const char *);
 
-static inline void
-remove_node(struct string_list **p)
-{
-  struct string_list *node = *p;
-  *p = node->next;
-  free_node(node);
-}
-
-static inline void
-remove_list(struct string_list **pb, struct string_list **pe)
-{
-  struct string_list *b = *pb, *e = *pe;
-  *pb = e;
-  free_list(b, e);
-}
-
-
-
-/* Enabling traces.  */
-#ifndef YYDEBUG
-# define YYDEBUG 1
-#endif
-
-/* Enabling verbose error messages.  */
-#ifdef YYERROR_VERBOSE
-# undef YYERROR_VERBOSE
-# define YYERROR_VERBOSE 1
-#else
-# define YYERROR_VERBOSE 0
-#endif
-
-/* Enabling the token table.  */
-#ifndef YYTOKEN_TABLE
-# define YYTOKEN_TABLE 0
-#endif
 
 #if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
 typedef int YYSTYPE;
+# define YYSTYPE_IS_TRIVIAL 1
 # define yystype YYSTYPE /* obsolescent; will be withdrawn */
 # define YYSTYPE_IS_DECLARED 1
-# define YYSTYPE_IS_TRIVIAL 1
 #endif
 
 
-
 /* Copy the second part of user declarations.  */
 
 
-/* Line 216 of yacc.c.  */
-#line 223 "scripts/genksyms/parse.c"
 
 #ifdef short
 # undef short
@@ -269,7 +237,7 @@ typedef short int yytype_int16;
 #define YYSIZE_MAXIMUM ((YYSIZE_T) -1)
 
 #ifndef YY_
-# if YYENABLE_NLS
+# if defined YYENABLE_NLS && YYENABLE_NLS
 #  if ENABLE_NLS
 #   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
 #   define YY_(msgid) dgettext ("bison-runtime", msgid)
@@ -294,14 +262,14 @@ typedef short int yytype_int16;
 #if (defined __STDC__ || defined __C99__FUNC__ \
      || defined __cplusplus || defined _MSC_VER)
 static int
-YYID (int i)
+YYID (int yyi)
 #else
 static int
-YYID (i)
-    int i;
+YYID (yyi)
+    int yyi;
 #endif
 {
-  return i;
+  return yyi;
 }
 #endif
 
@@ -382,9 +350,9 @@ void free (void *); /* INFRINGES ON USER NAME SPACE */
 /* A type that is properly aligned for any stack member.  */
 union yyalloc
 {
-  yytype_int16 yyss;
-  YYSTYPE yyvs;
-  };
+  yytype_int16 yyss_alloc;
+  YYSTYPE yyvs_alloc;
+};
 
 /* The size of the maximum gap between one aligned stack and the next.  */
 # define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)
@@ -418,12 +386,12 @@ union yyalloc
    elements in the stack, and YYPTR gives the new location of the
    stack.  Advance YYPTR to a properly aligned location for the next
    stack.  */
-# define YYSTACK_RELOCATE(Stack)					\
+# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
     do									\
       {									\
 	YYSIZE_T yynewbytes;						\
-	YYCOPY (&yyptr->Stack, Stack, yysize);				\
-	Stack = &yyptr->Stack;						\
+	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
+	Stack = &yyptr->Stack_alloc;					\
 	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
 	yyptr += yynewbytes / sizeof (*yyptr);				\
       }									\
@@ -581,8 +549,8 @@ static const char *const yytname[] =
   "ATTRIBUTE_PHRASE", "BRACE_PHRASE", "BRACKET_PHRASE",
   "EXPRESSION_PHRASE", "CHAR", "DOTS", "IDENT", "INT", "REAL", "STRING",
   "TYPE", "OTHER", "FILENAME", "';'", "'}'", "','", "'('", "'*'", "')'",
-  "'='", "'{'", "':'", "$accept", "declaration_seq", "declaration", "@1",
-  "declaration1", "@2", "@3", "simple_declaration",
+  "'='", "'{'", "':'", "$accept", "declaration_seq", "declaration", "$@1",
+  "declaration1", "$@2", "$@3", "simple_declaration",
   "init_declarator_list_opt", "init_declarator_list", "init_declarator",
   "decl_specifier_seq_opt", "decl_specifier_seq", "decl_specifier",
   "storage_class_specifier", "type_specifier", "simple_type_specifier",
@@ -875,9 +843,18 @@ static const yytype_uint8 yystos[] =
 
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
 
@@ -934,7 +911,7 @@ while (YYID (0))
    we won't break user code: when these are the locations we know.  */
 
 #ifndef YY_LOCATION_PRINT
-# if YYLTYPE_IS_TRIVIAL
+# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
 #  define YY_LOCATION_PRINT(File, Loc)			\
      fprintf (File, "%d.%d-%d.%d",			\
 	      (Loc).first_line, (Loc).first_column,	\
@@ -1045,17 +1022,20 @@ yy_symbol_print (yyoutput, yytype, yyvaluep)
 #if (defined __STDC__ || defined __C99__FUNC__ \
      || defined __cplusplus || defined _MSC_VER)
 static void
-yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
+yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
 #else
 static void
-yy_stack_print (bottom, top)
-    yytype_int16 *bottom;
-    yytype_int16 *top;
+yy_stack_print (yybottom, yytop)
+    yytype_int16 *yybottom;
+    yytype_int16 *yytop;
 #endif
 {
   YYFPRINTF (stderr, "Stack now");
-  for (; bottom <= top; ++bottom)
-    YYFPRINTF (stderr, " %d", *bottom);
+  for (; yybottom <= yytop; yybottom++)
+    {
+      int yybot = *yybottom;
+      YYFPRINTF (stderr, " %d", yybot);
+    }
   YYFPRINTF (stderr, "\n");
 }
 
@@ -1089,11 +1069,11 @@ yy_reduce_print (yyvsp, yyrule)
   /* The symbols being reduced.  */
   for (yyi = 0; yyi < yynrhs; yyi++)
     {
-      fprintf (stderr, "   $%d = ", yyi + 1);
+      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
       yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
 		       &(yyvsp[(yyi + 1) - (yynrhs)])
 		       		       );
-      fprintf (stderr, "\n");
+      YYFPRINTF (stderr, "\n");
     }
 }
 
@@ -1373,10 +1353,8 @@ yydestruct (yymsg, yytype, yyvaluep)
 	break;
     }
 }
-
 
 /* Prevent warnings from -Wmissing-prototypes.  */
-
 #ifdef YYPARSE_PARAM
 #if defined __STDC__ || defined __cplusplus
 int yyparse (void *YYPARSE_PARAM);
@@ -1392,11 +1370,10 @@ int yyparse ();
 #endif /* ! YYPARSE_PARAM */
 
 
-
-/* The look-ahead symbol.  */
+/* The lookahead symbol.  */
 int yychar;
 
-/* The semantic value of the look-ahead symbol.  */
+/* The semantic value of the lookahead symbol.  */
 YYSTYPE yylval;
 
 /* Number of syntax errors so far.  */
@@ -1404,9 +1381,9 @@ int yynerrs;
 
 
 
-/*----------.
-| yyparse.  |
-`----------*/
+/*-------------------------.
+| yyparse or yypush_parse.  |
+`-------------------------*/
 
 #ifdef YYPARSE_PARAM
 #if (defined __STDC__ || defined __C99__FUNC__ \
@@ -1430,66 +1407,68 @@ yyparse ()
 #endif
 #endif
 {
-  
-  int yystate;
-  int yyn;
-  int yyresult;
-  /* Number of tokens to shift before error messages enabled.  */
-  int yyerrstatus;
-  /* Look-ahead token as an internal (translated) token number.  */
-  int yytoken = 0;
-#if YYERROR_VERBOSE
-  /* Buffer for error messages, and its allocated size.  */
-  char yymsgbuf[128];
-  char *yymsg = yymsgbuf;
-  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
-#endif
 
-  /* Three stacks and their tools:
-     `yyss': related to states,
-     `yyvs': related to semantic values,
-     `yyls': related to locations.
 
-     Refer to the stacks thru separate pointers, to allow yyoverflow
-     to reallocate them elsewhere.  */
+    int yystate;
+    /* Number of tokens to shift before error messages enabled.  */
+    int yyerrstatus;
 
-  /* The state stack.  */
-  yytype_int16 yyssa[YYINITDEPTH];
-  yytype_int16 *yyss = yyssa;
-  yytype_int16 *yyssp;
+    /* The stacks and their tools:
+       `yyss': related to states.
+       `yyvs': related to semantic values.
 
-  /* The semantic value stack.  */
-  YYSTYPE yyvsa[YYINITDEPTH];
-  YYSTYPE *yyvs = yyvsa;
-  YYSTYPE *yyvsp;
+       Refer to the stacks thru separate pointers, to allow yyoverflow
+       to reallocate them elsewhere.  */
 
+    /* The state stack.  */
+    yytype_int16 yyssa[YYINITDEPTH];
+    yytype_int16 *yyss;
+    yytype_int16 *yyssp;
 
+    /* The semantic value stack.  */
+    YYSTYPE yyvsa[YYINITDEPTH];
+    YYSTYPE *yyvs;
+    YYSTYPE *yyvsp;
 
-#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))
-
-  YYSIZE_T yystacksize = YYINITDEPTH;
+    YYSIZE_T yystacksize;
 
+  int yyn;
+  int yyresult;
+  /* Lookahead token as an internal (translated) token number.  */
+  int yytoken;
   /* The variables used to return semantic value and location from the
      action routines.  */
   YYSTYPE yyval;
 
+#if YYERROR_VERBOSE
+  /* Buffer for error messages, and its allocated size.  */
+  char yymsgbuf[128];
+  char *yymsg = yymsgbuf;
+  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
+#endif
+
+#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))
 
   /* The number of symbols on the RHS of the reduced rule.
      Keep to zero when no symbol should be popped.  */
   int yylen = 0;
 
+  yytoken = 0;
+  yyss = yyssa;
+  yyvs = yyvsa;
+  yystacksize = YYINITDEPTH;
+
   YYDPRINTF ((stderr, "Starting parse\n"));
 
   yystate = 0;
   yyerrstatus = 0;
   yynerrs = 0;
-  yychar = YYEMPTY;		/* Cause a token to be read.  */
+  yychar = YYEMPTY; /* Cause a token to be read.  */
 
   /* Initialize stack pointers.
      Waste one element of value and location stack
      so that they stay on the same level as the state stack.
      The wasted elements are never initialized.  */
-
   yyssp = yyss;
   yyvsp = yyvs;
 
@@ -1519,7 +1498,6 @@ yyparse ()
 	YYSTYPE *yyvs1 = yyvs;
 	yytype_int16 *yyss1 = yyss;
 
-
 	/* Each stack pointer address is followed by the size of the
 	   data in use in that stack, in bytes.  This used to be a
 	   conditional around just the two extra args, but that might
@@ -1527,7 +1505,6 @@ yyparse ()
 	yyoverflow (YY_("memory exhausted"),
 		    &yyss1, yysize * sizeof (*yyssp),
 		    &yyvs1, yysize * sizeof (*yyvsp),
-
 		    &yystacksize);
 
 	yyss = yyss1;
@@ -1550,9 +1527,8 @@ yyparse ()
 	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
 	if (! yyptr)
 	  goto yyexhaustedlab;
-	YYSTACK_RELOCATE (yyss);
-	YYSTACK_RELOCATE (yyvs);
-
+	YYSTACK_RELOCATE (yyss_alloc, yyss);
+	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
 #  undef YYSTACK_RELOCATE
 	if (yyss1 != yyssa)
 	  YYSTACK_FREE (yyss1);
@@ -1563,7 +1539,6 @@ yyparse ()
       yyssp = yyss + yysize - 1;
       yyvsp = yyvs + yysize - 1;
 
-
       YYDPRINTF ((stderr, "Stack size increased to %lu\n",
 		  (unsigned long int) yystacksize));
 
@@ -1573,6 +1548,9 @@ yyparse ()
 
   YYDPRINTF ((stderr, "Entering state %d\n", yystate));
 
+  if (yystate == YYFINAL)
+    YYACCEPT;
+
   goto yybackup;
 
 /*-----------.
@@ -1581,16 +1559,16 @@ yyparse ()
 yybackup:
 
   /* Do appropriate processing given the current state.  Read a
-     look-ahead token if we need one and don't already have one.  */
+     lookahead token if we need one and don't already have one.  */
 
-  /* First try to decide what to do without reference to look-ahead token.  */
+  /* First try to decide what to do without reference to lookahead token.  */
   yyn = yypact[yystate];
   if (yyn == YYPACT_NINF)
     goto yydefault;
 
-  /* Not known => get a look-ahead token if don't already have one.  */
+  /* Not known => get a lookahead token if don't already have one.  */
 
-  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
+  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
   if (yychar == YYEMPTY)
     {
       YYDPRINTF ((stderr, "Reading a token: "));
@@ -1622,20 +1600,16 @@ yybackup:
       goto yyreduce;
     }
 
-  if (yyn == YYFINAL)
-    YYACCEPT;
-
   /* Count tokens shifted since error; after three, turn off error
      status.  */
   if (yyerrstatus)
     yyerrstatus--;
 
-  /* Shift the look-ahead token.  */
+  /* Shift the lookahead token.  */
   YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
 
-  /* Discard the shifted token unless it is eof.  */
-  if (yychar != YYEOF)
-    yychar = YYEMPTY;
+  /* Discard the shifted token.  */
+  yychar = YYEMPTY;
 
   yystate = yyn;
   *++yyvsp = yylval;
@@ -1675,47 +1649,47 @@ yyreduce:
   switch (yyn)
     {
         case 4:
-#line 108 "scripts/genksyms/parse.y"
+
     { is_typedef = 0; is_extern = 0; current_name = NULL; decl_spec = NULL; ;}
     break;
 
   case 5:
-#line 110 "scripts/genksyms/parse.y"
+
     { free_list(*(yyvsp[(2) - (2)]), NULL); *(yyvsp[(2) - (2)]) = NULL; ;}
     break;
 
   case 6:
-#line 114 "scripts/genksyms/parse.y"
+
     { is_typedef = 1; ;}
     break;
 
   case 7:
-#line 115 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(4) - (4)]); ;}
     break;
 
   case 8:
-#line 116 "scripts/genksyms/parse.y"
+
     { is_typedef = 1; ;}
     break;
 
   case 9:
-#line 117 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 14:
-#line 122 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 15:
-#line 123 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 16:
-#line 128 "scripts/genksyms/parse.y"
+
     { if (current_name) {
 		    struct string_list *decl = (*(yyvsp[(3) - (3)]))->next;
 		    (*(yyvsp[(3) - (3)]))->next = NULL;
@@ -1729,12 +1703,12 @@ yyreduce:
     break;
 
   case 17:
-#line 141 "scripts/genksyms/parse.y"
+
     { (yyval) = NULL; ;}
     break;
 
   case 19:
-#line 147 "scripts/genksyms/parse.y"
+
     { struct string_list *decl = *(yyvsp[(1) - (1)]);
 		  *(yyvsp[(1) - (1)]) = NULL;
 		  add_symbol(current_name,
@@ -1745,7 +1719,7 @@ yyreduce:
     break;
 
   case 20:
-#line 155 "scripts/genksyms/parse.y"
+
     { struct string_list *decl = *(yyvsp[(3) - (3)]);
 		  *(yyvsp[(3) - (3)]) = NULL;
 		  free_list(*(yyvsp[(2) - (3)]), NULL);
@@ -1758,27 +1732,27 @@ yyreduce:
     break;
 
   case 21:
-#line 168 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(4) - (4)]) ? (yyvsp[(4) - (4)]) : (yyvsp[(3) - (4)]) ? (yyvsp[(3) - (4)]) : (yyvsp[(2) - (4)]) ? (yyvsp[(2) - (4)]) : (yyvsp[(1) - (4)]); ;}
     break;
 
   case 22:
-#line 173 "scripts/genksyms/parse.y"
+
     { decl_spec = NULL; ;}
     break;
 
   case 24:
-#line 178 "scripts/genksyms/parse.y"
+
     { decl_spec = *(yyvsp[(1) - (1)]); ;}
     break;
 
   case 25:
-#line 179 "scripts/genksyms/parse.y"
+
     { decl_spec = *(yyvsp[(2) - (2)]); ;}
     break;
 
   case 26:
-#line 184 "scripts/genksyms/parse.y"
+
     { /* Version 2 checksumming ignores storage class, as that
 		     is really irrelevant to the linkage.  */
 		  remove_node((yyvsp[(1) - (1)]));
@@ -1787,32 +1761,32 @@ yyreduce:
     break;
 
   case 31:
-#line 196 "scripts/genksyms/parse.y"
+
     { is_extern = 1; (yyval) = (yyvsp[(1) - (1)]); ;}
     break;
 
   case 32:
-#line 197 "scripts/genksyms/parse.y"
+
     { is_extern = 0; (yyval) = (yyvsp[(1) - (1)]); ;}
     break;
 
   case 37:
-#line 209 "scripts/genksyms/parse.y"
+
     { remove_node((yyvsp[(1) - (2)])); (*(yyvsp[(2) - (2)]))->tag = SYM_STRUCT; (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 38:
-#line 211 "scripts/genksyms/parse.y"
+
     { remove_node((yyvsp[(1) - (2)])); (*(yyvsp[(2) - (2)]))->tag = SYM_UNION; (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 39:
-#line 213 "scripts/genksyms/parse.y"
+
     { remove_node((yyvsp[(1) - (2)])); (*(yyvsp[(2) - (2)]))->tag = SYM_ENUM; (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 40:
-#line 217 "scripts/genksyms/parse.y"
+
     { struct string_list *s = *(yyvsp[(3) - (3)]), *i = *(yyvsp[(2) - (3)]), *r;
 		  r = copy_node(i); r->tag = SYM_STRUCT;
 		  r->next = (*(yyvsp[(1) - (3)]))->next; *(yyvsp[(3) - (3)]) = r; (*(yyvsp[(1) - (3)]))->next = NULL;
@@ -1822,7 +1796,7 @@ yyreduce:
     break;
 
   case 41:
-#line 224 "scripts/genksyms/parse.y"
+
     { struct string_list *s = *(yyvsp[(3) - (3)]), *i = *(yyvsp[(2) - (3)]), *r;
 		  r = copy_node(i); r->tag = SYM_UNION;
 		  r->next = (*(yyvsp[(1) - (3)]))->next; *(yyvsp[(3) - (3)]) = r; (*(yyvsp[(1) - (3)]))->next = NULL;
@@ -1832,7 +1806,7 @@ yyreduce:
     break;
 
   case 42:
-#line 231 "scripts/genksyms/parse.y"
+
     { struct string_list *s = *(yyvsp[(3) - (3)]), *i = *(yyvsp[(2) - (3)]), *r;
 		  r = copy_node(i); r->tag = SYM_ENUM;
 		  r->next = (*(yyvsp[(1) - (3)]))->next; *(yyvsp[(3) - (3)]) = r; (*(yyvsp[(1) - (3)]))->next = NULL;
@@ -1842,42 +1816,42 @@ yyreduce:
     break;
 
   case 43:
-#line 239 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 44:
-#line 240 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 45:
-#line 241 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 56:
-#line 255 "scripts/genksyms/parse.y"
+
     { (*(yyvsp[(1) - (1)]))->tag = SYM_TYPEDEF; (yyval) = (yyvsp[(1) - (1)]); ;}
     break;
 
   case 57:
-#line 260 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]) ? (yyvsp[(2) - (2)]) : (yyvsp[(1) - (2)]); ;}
     break;
 
   case 58:
-#line 264 "scripts/genksyms/parse.y"
+
     { (yyval) = NULL; ;}
     break;
 
   case 61:
-#line 270 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 65:
-#line 276 "scripts/genksyms/parse.y"
+
     { /* restrict has no effect in prototypes so ignore it */
 		  remove_node((yyvsp[(1) - (1)]));
 		  (yyval) = (yyvsp[(1) - (1)]);
@@ -1885,12 +1859,12 @@ yyreduce:
     break;
 
   case 66:
-#line 283 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 68:
-#line 289 "scripts/genksyms/parse.y"
+
     { if (current_name != NULL) {
 		    error_with_pos("unexpected second declaration name");
 		    YYERROR;
@@ -1902,97 +1876,97 @@ yyreduce:
     break;
 
   case 69:
-#line 298 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(4) - (4)]); ;}
     break;
 
   case 70:
-#line 300 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(4) - (4)]); ;}
     break;
 
   case 71:
-#line 302 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 72:
-#line 304 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 73:
-#line 306 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 74:
-#line 312 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 78:
-#line 320 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(4) - (4)]); ;}
     break;
 
   case 79:
-#line 322 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(4) - (4)]); ;}
     break;
 
   case 80:
-#line 324 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 81:
-#line 326 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 82:
-#line 328 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 83:
-#line 332 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 85:
-#line 334 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 86:
-#line 338 "scripts/genksyms/parse.y"
+
     { (yyval) = NULL; ;}
     break;
 
   case 89:
-#line 345 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 90:
-#line 350 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]) ? (yyvsp[(2) - (2)]) : (yyvsp[(1) - (2)]); ;}
     break;
 
   case 91:
-#line 355 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]) ? (yyvsp[(2) - (2)]) : (yyvsp[(1) - (2)]); ;}
     break;
 
   case 93:
-#line 360 "scripts/genksyms/parse.y"
+
     { (yyval) = NULL; ;}
     break;
 
   case 94:
-#line 362 "scripts/genksyms/parse.y"
+
     { /* For version 2 checksums, we don't want to remember
 		     private parameter names.  */
 		  remove_node((yyvsp[(1) - (1)]));
@@ -2001,39 +1975,39 @@ yyreduce:
     break;
 
   case 95:
-#line 370 "scripts/genksyms/parse.y"
+
     { remove_node((yyvsp[(1) - (1)]));
 		  (yyval) = (yyvsp[(1) - (1)]);
 		;}
     break;
 
   case 96:
-#line 374 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(4) - (4)]); ;}
     break;
 
   case 97:
-#line 376 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(4) - (4)]); ;}
     break;
 
   case 98:
-#line 378 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 99:
-#line 380 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 100:
-#line 382 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 101:
-#line 387 "scripts/genksyms/parse.y"
+
     { struct string_list *decl = *(yyvsp[(2) - (3)]);
 		  *(yyvsp[(2) - (3)]) = NULL;
 		  add_symbol(current_name, SYM_NORMAL, decl, is_extern);
@@ -2042,93 +2016,92 @@ yyreduce:
     break;
 
   case 102:
-#line 395 "scripts/genksyms/parse.y"
+
     { (yyval) = NULL; ;}
     break;
 
   case 104:
-#line 402 "scripts/genksyms/parse.y"
+
     { remove_list((yyvsp[(2) - (2)]), &(*(yyvsp[(1) - (2)]))->next); (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 105:
-#line 406 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 106:
-#line 407 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 107:
-#line 411 "scripts/genksyms/parse.y"
+
     { (yyval) = NULL; ;}
     break;
 
   case 110:
-#line 417 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 111:
-#line 422 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 112:
-#line 424 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 113:
-#line 428 "scripts/genksyms/parse.y"
+
     { (yyval) = NULL; ;}
     break;
 
   case 116:
-#line 434 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 117:
-#line 438 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]) ? (yyvsp[(2) - (2)]) : (yyvsp[(1) - (2)]); ;}
     break;
 
   case 118:
-#line 439 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 120:
-#line 444 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 121:
-#line 448 "scripts/genksyms/parse.y"
+
     { (yyval) = NULL; ;}
     break;
 
   case 123:
-#line 453 "scripts/genksyms/parse.y"
+
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 124:
-#line 457 "scripts/genksyms/parse.y"
+
     { (yyval) = NULL; ;}
     break;
 
   case 126:
-#line 463 "scripts/genksyms/parse.y"
+
     { export_symbol((*(yyvsp[(3) - (5)]))->string); (yyval) = (yyvsp[(5) - (5)]); ;}
     break;
 
 
-/* Line 1267 of yacc.c.  */
-#line 2132 "scripts/genksyms/parse.c"
+
       default: break;
     }
   YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);
@@ -2139,7 +2112,6 @@ yyreduce:
 
   *++yyvsp = yyval;
 
-
   /* Now `shift' the result of the reduction.  Determine what state
      that goes to, based on the state we popped back to and the rule
      number reduced by.  */
@@ -2204,7 +2176,7 @@ yyerrlab:
 
   if (yyerrstatus == 3)
     {
-      /* If just tried and failed to reuse look-ahead token after an
+      /* If just tried and failed to reuse lookahead token after an
 	 error, discard it.  */
 
       if (yychar <= YYEOF)
@@ -2221,7 +2193,7 @@ yyerrlab:
 	}
     }
 
-  /* Else will try to reuse look-ahead token after shifting the error
+  /* Else will try to reuse lookahead token after shifting the error
      token.  */
   goto yyerrlab1;
 
@@ -2278,9 +2250,6 @@ yyerrlab1:
       YY_STACK_PRINT (yyss, yyssp);
     }
 
-  if (yyn == YYFINAL)
-    YYACCEPT;
-
   *++yyvsp = yylval;
 
 
@@ -2305,7 +2274,7 @@ yyabortlab:
   yyresult = 1;
   goto yyreturn;
 
-#ifndef yyoverflow
+#if !defined(yyoverflow) || YYERROR_VERBOSE
 /*-------------------------------------------------.
 | yyexhaustedlab -- memory exhaustion comes here.  |
 `-------------------------------------------------*/
@@ -2316,7 +2285,7 @@ yyexhaustedlab:
 #endif
 
 yyreturn:
-  if (yychar != YYEOF && yychar != YYEMPTY)
+  if (yychar != YYEMPTY)
      yydestruct ("Cleanup: discarding lookahead",
 		 yytoken, &yylval);
   /* Do not reclaim the symbols of the rule which action triggered
@@ -2342,7 +2311,7 @@ yyreturn:
 }
 
 
-#line 467 "scripts/genksyms/parse.y"
+
 
 
 static void
@@ -2351,3 +2320,5 @@ yyerror(const char *e)
   error_with_pos("%s", e);
 }
 
+#include "lex.genksyms.c"
+
diff --git a/scripts/genksyms/genksyms.tab.h_shipped b/scripts/genksyms/genksyms.tab.h_shipped
deleted file mode 100644
index c4eeec6..0000000
--- a/scripts/genksyms/genksyms.tab.h_shipped
+++ /dev/null
@@ -1,139 +0,0 @@
-/* A Bison parser, made by GNU Bison 2.3.  */
-
-/* Skeleton interface for Bison's Yacc-like parsers in C
-
-   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
-   Free Software Foundation, Inc.
-
-   This program is free software; you can redistribute it and/or modify
-   it under the terms of the GNU General Public License as published by
-   the Free Software Foundation; either version 2, or (at your option)
-   any later version.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 51 Franklin Street, Fifth Floor,
-   Boston, MA 02110-1301, USA.  */
-
-/* As a special exception, you may create a larger work that contains
-   part or all of the Bison parser skeleton and distribute that work
-   under terms of your choice, so long as that work isn't itself a
-   parser generator using the skeleton or a modified version thereof
-   as a parser skeleton.  Alternatively, if you modify or redistribute
-   the parser skeleton itself, you may (at your option) remove this
-   special exception, which will cause the skeleton and the resulting
-   Bison output files to be licensed under the GNU General Public
-   License without this special exception.
-
-   This special exception was added by the Free Software Foundation in
-   version 2.2 of Bison.  */
-
-/* Tokens.  */
-#ifndef YYTOKENTYPE
-# define YYTOKENTYPE
-   /* Put the tokens into the symbol table, so that GDB and other debuggers
-      know about them.  */
-   enum yytokentype {
-     ASM_KEYW = 258,
-     ATTRIBUTE_KEYW = 259,
-     AUTO_KEYW = 260,
-     BOOL_KEYW = 261,
-     CHAR_KEYW = 262,
-     CONST_KEYW = 263,
-     DOUBLE_KEYW = 264,
-     ENUM_KEYW = 265,
-     EXTERN_KEYW = 266,
-     EXTENSION_KEYW = 267,
-     FLOAT_KEYW = 268,
-     INLINE_KEYW = 269,
-     INT_KEYW = 270,
-     LONG_KEYW = 271,
-     REGISTER_KEYW = 272,
-     RESTRICT_KEYW = 273,
-     SHORT_KEYW = 274,
-     SIGNED_KEYW = 275,
-     STATIC_KEYW = 276,
-     STRUCT_KEYW = 277,
-     TYPEDEF_KEYW = 278,
-     UNION_KEYW = 279,
-     UNSIGNED_KEYW = 280,
-     VOID_KEYW = 281,
-     VOLATILE_KEYW = 282,
-     TYPEOF_KEYW = 283,
-     EXPORT_SYMBOL_KEYW = 284,
-     ASM_PHRASE = 285,
-     ATTRIBUTE_PHRASE = 286,
-     BRACE_PHRASE = 287,
-     BRACKET_PHRASE = 288,
-     EXPRESSION_PHRASE = 289,
-     CHAR = 290,
-     DOTS = 291,
-     IDENT = 292,
-     INT = 293,
-     REAL = 294,
-     STRING = 295,
-     TYPE = 296,
-     OTHER = 297,
-     FILENAME = 298
-   };
-#endif
-/* Tokens.  */
-#define ASM_KEYW 258
-#define ATTRIBUTE_KEYW 259
-#define AUTO_KEYW 260
-#define BOOL_KEYW 261
-#define CHAR_KEYW 262
-#define CONST_KEYW 263
-#define DOUBLE_KEYW 264
-#define ENUM_KEYW 265
-#define EXTERN_KEYW 266
-#define EXTENSION_KEYW 267
-#define FLOAT_KEYW 268
-#define INLINE_KEYW 269
-#define INT_KEYW 270
-#define LONG_KEYW 271
-#define REGISTER_KEYW 272
-#define RESTRICT_KEYW 273
-#define SHORT_KEYW 274
-#define SIGNED_KEYW 275
-#define STATIC_KEYW 276
-#define STRUCT_KEYW 277
-#define TYPEDEF_KEYW 278
-#define UNION_KEYW 279
-#define UNSIGNED_KEYW 280
-#define VOID_KEYW 281
-#define VOLATILE_KEYW 282
-#define TYPEOF_KEYW 283
-#define EXPORT_SYMBOL_KEYW 284
-#define ASM_PHRASE 285
-#define ATTRIBUTE_PHRASE 286
-#define BRACE_PHRASE 287
-#define BRACKET_PHRASE 288
-#define EXPRESSION_PHRASE 289
-#define CHAR 290
-#define DOTS 291
-#define IDENT 292
-#define INT 293
-#define REAL 294
-#define STRING 295
-#define TYPE 296
-#define OTHER 297
-#define FILENAME 298
-
-
-
-
-#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
-typedef int YYSTYPE;
-# define yystype YYSTYPE /* obsolescent; will be withdrawn */
-# define YYSTYPE_IS_DECLARED 1
-# define YYSTYPE_IS_TRIVIAL 1
-#endif
-
-extern YYSTYPE yylval;
-
diff --git a/scripts/genksyms/lex.genksyms.c_shipped b/scripts/genksyms/lex.genksyms.c_shipped
index 2ac23bc..9a827a2 100644
--- a/scripts/genksyms/lex.genksyms.c_shipped
+++ b/scripts/genksyms/lex.genksyms.c_shipped
@@ -1,19 +1,28 @@
-#line 2 "scripts/genksyms/lex.c"
 
-#line 4 "scripts/genksyms/lex.c"
+#line 3 "scripts/genksyms/lex.genksyms.c"
 
 #define  YY_INT_ALIGNED short int
 
 /* A lexical scanner generated by flex */
 
-/* %not-for-header */
-
-/* %if-c-only */
-/* %if-not-reentrant */
-
-/* %endif */
-/* %endif */
-/* %ok-for-header */
+#define yy_create_buffer genksyms_create_buffer
+#define yy_delete_buffer genksyms_delete_buffer
+#define yy_flex_debug genksyms_flex_debug
+#define yy_init_buffer genksyms_init_buffer
+#define yy_flush_buffer genksyms_flush_buffer
+#define yy_load_buffer_state genksyms_load_buffer_state
+#define yy_switch_to_buffer genksyms_switch_to_buffer
+#define yyin genksymsin
+#define yyleng genksymsleng
+#define yylex genksymslex
+#define yylineno genksymslineno
+#define yyout genksymsout
+#define yyrestart genksymsrestart
+#define yytext genksymstext
+#define yywrap genksymswrap
+#define yyalloc genksymsalloc
+#define yyrealloc genksymsrealloc
+#define yyfree genksymsfree
 
 #define FLEX_SCANNER
 #define YY_FLEX_MAJOR_VERSION 2
@@ -23,32 +32,16 @@
 #define FLEX_BETA
 #endif
 
-/* %if-c++-only */
-/* %endif */
-
-/* %if-c-only */
-    
-/* %endif */
-
-/* %if-c-only */
-
-/* %endif */
-
 /* First, we deal with  platform-specific or compiler-specific issues. */
 
 /* begin standard C headers. */
-/* %if-c-only */
 #include <stdio.h>
 #include <string.h>
 #include <errno.h>
 #include <stdlib.h>
-/* %endif */
 
-/* %if-tables-serialization */
-/* %endif */
 /* end standard C headers. */
 
-/* %if-c-or-c++ */
 /* flex integer type definitions */
 
 #ifndef FLEXINT_H
@@ -79,6 +72,7 @@ typedef int flex_int32_t;
 typedef unsigned char flex_uint8_t; 
 typedef unsigned short int flex_uint16_t;
 typedef unsigned int flex_uint32_t;
+#endif /* ! C99 */
 
 /* Limits of integral types. */
 #ifndef INT8_MIN
@@ -109,15 +103,8 @@ typedef unsigned int flex_uint32_t;
 #define UINT32_MAX             (4294967295U)
 #endif
 
-#endif /* ! C99 */
-
 #endif /* ! FLEXINT_H */
 
-/* %endif */
-
-/* %if-c++-only */
-/* %endif */
-
 #ifdef __cplusplus
 
 /* The "const" storage-class-modifier is valid. */
@@ -139,13 +126,8 @@ typedef unsigned int flex_uint32_t;
 #define yyconst
 #endif
 
-/* %not-for-header */
-
 /* Returned upon end-of-file. */
 #define YY_NULL 0
-/* %ok-for-header */
-
-/* %not-for-header */
 
 /* Promotes a possibly negative, possibly signed char to an unsigned
  * integer for use as an array index.  If the signed char is negative,
@@ -153,14 +135,6 @@ typedef unsigned int flex_uint32_t;
  * double cast.
  */
 #define YY_SC_TO_UI(c) ((unsigned int) (unsigned char) c)
-/* %ok-for-header */
-
-/* %if-reentrant */
-/* %endif */
-
-/* %if-not-reentrant */
-
-/* %endif */
 
 /* Enter a start condition.  This macro really ought to take a parameter,
  * but we do it the disgusting crufty way forced on us by the ()-less
@@ -179,7 +153,7 @@ typedef unsigned int flex_uint32_t;
 #define YY_STATE_EOF(state) (YY_END_OF_BUFFER + state + 1)
 
 /* Special action meaning "start processing a new file". */
-#define YY_NEW_FILE yyrestart(yyin  )
+#define YY_NEW_FILE genksymsrestart(genksymsin  )
 
 #define YY_END_OF_BUFFER_CHAR 0
 
@@ -197,15 +171,9 @@ typedef unsigned int flex_uint32_t;
 typedef struct yy_buffer_state *YY_BUFFER_STATE;
 #endif
 
-/* %if-not-reentrant */
-extern int yyleng;
-/* %endif */
+extern int genksymsleng;
 
-/* %if-c-only */
-/* %if-not-reentrant */
-extern FILE *yyin, *yyout;
-/* %endif */
-/* %endif */
+extern FILE *genksymsin, *genksymsout;
 
 #define EOB_ACT_CONTINUE_SCAN 0
 #define EOB_ACT_END_OF_FILE 1
@@ -217,13 +185,13 @@ extern FILE *yyin, *yyout;
 #define yyless(n) \
 	do \
 		{ \
-		/* Undo effects of setting up yytext. */ \
+		/* Undo effects of setting up genksymstext. */ \
         int yyless_macro_arg = (n); \
         YY_LESS_LINENO(yyless_macro_arg);\
 		*yy_cp = (yy_hold_char); \
 		YY_RESTORE_YY_MORE_OFFSET \
 		(yy_c_buf_p) = yy_cp = yy_bp + yyless_macro_arg - YY_MORE_ADJ; \
-		YY_DO_BEFORE_ACTION; /* set up yytext again */ \
+		YY_DO_BEFORE_ACTION; /* set up genksymstext again */ \
 		} \
 	while ( 0 )
 
@@ -238,12 +206,7 @@ typedef size_t yy_size_t;
 #define YY_STRUCT_YY_BUFFER_STATE
 struct yy_buffer_state
 	{
-/* %if-c-only */
 	FILE *yy_input_file;
-/* %endif */
-
-/* %if-c++-only */
-/* %endif */
 
 	char *yy_ch_buf;		/* input buffer */
 	char *yy_buf_pos;		/* current position in input buffer */
@@ -296,27 +259,18 @@ struct yy_buffer_state
 	 * possible backing-up.
 	 *
 	 * When we actually see the EOF, we change the status to "new"
-	 * (via yyrestart()), so that the user can continue scanning by
-	 * just pointing yyin at a new input file.
+	 * (via genksymsrestart()), so that the user can continue scanning by
+	 * just pointing genksymsin at a new input file.
 	 */
 #define YY_BUFFER_EOF_PENDING 2
 
 	};
 #endif /* !YY_STRUCT_YY_BUFFER_STATE */
 
-/* %if-c-only Standard (non-C++) definition */
-/* %not-for-header */
-
-/* %if-not-reentrant */
-
 /* Stack of input buffers. */
 static size_t yy_buffer_stack_top = 0; /**< index of top of stack. */
 static size_t yy_buffer_stack_max = 0; /**< capacity of stack. */
 static YY_BUFFER_STATE * yy_buffer_stack = 0; /**< Stack as an array. */
-/* %endif */
-/* %ok-for-header */
-
-/* %endif */
 
 /* We provide macros for accessing buffer states in case in the
  * future we want to put the buffer states in a more general
@@ -333,61 +287,51 @@ static YY_BUFFER_STATE * yy_buffer_stack = 0; /**< Stack as an array. */
  */
 #define YY_CURRENT_BUFFER_LVALUE (yy_buffer_stack)[(yy_buffer_stack_top)]
 
-/* %if-c-only Standard (non-C++) definition */
-
-/* %if-not-reentrant */
-/* %not-for-header */
-
-/* yy_hold_char holds the character lost when yytext is formed. */
+/* yy_hold_char holds the character lost when genksymstext is formed. */
 static char yy_hold_char;
 static int yy_n_chars;		/* number of characters read into yy_ch_buf */
-int yyleng;
+int genksymsleng;
 
 /* Points to current character in buffer. */
 static char *yy_c_buf_p = (char *) 0;
 static int yy_init = 0;		/* whether we need to initialize */
 static int yy_start = 0;	/* start state number */
 
-/* Flag which is used to allow yywrap()'s to do buffer switches
- * instead of setting up a fresh yyin.  A bit of a hack ...
+/* Flag which is used to allow genksymswrap()'s to do buffer switches
+ * instead of setting up a fresh genksymsin.  A bit of a hack ...
  */
 static int yy_did_buffer_switch_on_eof;
-/* %ok-for-header */
-
-/* %endif */
 
-void yyrestart (FILE *input_file  );
-void yy_switch_to_buffer (YY_BUFFER_STATE new_buffer  );
-YY_BUFFER_STATE yy_create_buffer (FILE *file,int size  );
-void yy_delete_buffer (YY_BUFFER_STATE b  );
-void yy_flush_buffer (YY_BUFFER_STATE b  );
-void yypush_buffer_state (YY_BUFFER_STATE new_buffer  );
-void yypop_buffer_state (void );
+void genksymsrestart (FILE *input_file  );
+void genksyms_switch_to_buffer (YY_BUFFER_STATE new_buffer  );
+YY_BUFFER_STATE genksyms_create_buffer (FILE *file,int size  );
+void genksyms_delete_buffer (YY_BUFFER_STATE b  );
+void genksyms_flush_buffer (YY_BUFFER_STATE b  );
+void genksymspush_buffer_state (YY_BUFFER_STATE new_buffer  );
+void genksymspop_buffer_state (void );
 
-static void yyensure_buffer_stack (void );
-static void yy_load_buffer_state (void );
-static void yy_init_buffer (YY_BUFFER_STATE b,FILE *file  );
+static void genksymsensure_buffer_stack (void );
+static void genksyms_load_buffer_state (void );
+static void genksyms_init_buffer (YY_BUFFER_STATE b,FILE *file  );
 
-#define YY_FLUSH_BUFFER yy_flush_buffer(YY_CURRENT_BUFFER )
+#define YY_FLUSH_BUFFER genksyms_flush_buffer(YY_CURRENT_BUFFER )
 
-YY_BUFFER_STATE yy_scan_buffer (char *base,yy_size_t size  );
-YY_BUFFER_STATE yy_scan_string (yyconst char *yy_str  );
-YY_BUFFER_STATE yy_scan_bytes (yyconst char *bytes,int len  );
+YY_BUFFER_STATE genksyms_scan_buffer (char *base,yy_size_t size  );
+YY_BUFFER_STATE genksyms_scan_string (yyconst char *yy_str  );
+YY_BUFFER_STATE genksyms_scan_bytes (yyconst char *bytes,int len  );
 
-/* %endif */
+void *genksymsalloc (yy_size_t  );
+void *genksymsrealloc (void *,yy_size_t  );
+void genksymsfree (void *  );
 
-void *yyalloc (yy_size_t  );
-void *yyrealloc (void *,yy_size_t  );
-void yyfree (void *  );
-
-#define yy_new_buffer yy_create_buffer
+#define yy_new_buffer genksyms_create_buffer
 
 #define yy_set_interactive(is_interactive) \
 	{ \
 	if ( ! YY_CURRENT_BUFFER ){ \
-        yyensure_buffer_stack (); \
+        genksymsensure_buffer_stack (); \
 		YY_CURRENT_BUFFER_LVALUE =    \
-            yy_create_buffer(yyin,YY_BUF_SIZE ); \
+            genksyms_create_buffer(genksymsin,YY_BUF_SIZE ); \
 	} \
 	YY_CURRENT_BUFFER_LVALUE->yy_is_interactive = is_interactive; \
 	}
@@ -395,58 +339,48 @@ void yyfree (void *  );
 #define yy_set_bol(at_bol) \
 	{ \
 	if ( ! YY_CURRENT_BUFFER ){\
-        yyensure_buffer_stack (); \
+        genksymsensure_buffer_stack (); \
 		YY_CURRENT_BUFFER_LVALUE =    \
-            yy_create_buffer(yyin,YY_BUF_SIZE ); \
+            genksyms_create_buffer(genksymsin,YY_BUF_SIZE ); \
 	} \
 	YY_CURRENT_BUFFER_LVALUE->yy_at_bol = at_bol; \
 	}
 
 #define YY_AT_BOL() (YY_CURRENT_BUFFER_LVALUE->yy_at_bol)
 
-/* %% [1.0] yytext/yyin/yyout/yy_state_type/yylineno etc. def's & init go here */
 /* Begin user sect3 */
 
-#define yywrap(n) 1
+#define genksymswrap(n) 1
 #define YY_SKIP_YYWRAP
 
-#define FLEX_DEBUG
-
 typedef unsigned char YY_CHAR;
 
-FILE *yyin = (FILE *) 0, *yyout = (FILE *) 0;
+FILE *genksymsin = (FILE *) 0, *genksymsout = (FILE *) 0;
 
 typedef int yy_state_type;
 
-extern int yylineno;
-
-int yylineno = 1;
+extern int genksymslineno;
 
-extern char *yytext;
-#define yytext_ptr yytext
+int genksymslineno = 1;
 
-/* %if-c-only Standard (non-C++) definition */
+extern char *genksymstext;
+#define yytext_ptr genksymstext
 
 static yy_state_type yy_get_previous_state (void );
 static yy_state_type yy_try_NUL_trans (yy_state_type current_state  );
 static int yy_get_next_buffer (void );
 static void yy_fatal_error (yyconst char msg[]  );
 
-/* %endif */
-
 /* Done after the current pattern has been matched and before the
- * corresponding action - sets up yytext.
+ * corresponding action - sets up genksymstext.
  */
 #define YY_DO_BEFORE_ACTION \
 	(yytext_ptr) = yy_bp; \
-/* %% [2.0] code to fiddle yytext and yyleng for yymore() goes here \ */\
-	yyleng = (size_t) (yy_cp - yy_bp); \
+	genksymsleng = (size_t) (yy_cp - yy_bp); \
 	(yy_hold_char) = *yy_cp; \
 	*yy_cp = '\0'; \
-/* %% [3.0] code to copy yytext_ptr to yytext[] goes here, if %array \ */\
 	(yy_c_buf_p) = yy_cp;
 
-/* %% [4.0] data tables for the DFA and the user's section 1 definitions go here */
 #define YY_NUM_RULES 13
 #define YY_END_OF_BUFFER 14
 /* This struct is not used in this scanner,
@@ -614,14 +548,8 @@ static yyconst flex_int16_t yy_chk[313] =
 static yy_state_type yy_last_accepting_state;
 static char *yy_last_accepting_cpos;
 
-extern int yy_flex_debug;
-int yy_flex_debug = 1;
-
-static yyconst flex_int16_t yy_rule_linenum[13] =
-    {   0,
-       71,   72,   73,   76,   79,   80,   81,   87,   88,   89,
-       91,   94
-    } ;
+extern int genksyms_flex_debug;
+int genksyms_flex_debug = 0;
 
 /* The intent behind this definition is that it'll catch
  * any uses of REJECT which flex missed.
@@ -630,8 +558,7 @@ static yyconst flex_int16_t yy_rule_linenum[13] =
 #define yymore() yymore_used_but_not_detected
 #define YY_MORE_ADJ 0
 #define YY_RESTORE_YY_MORE_OFFSET
-char *yytext;
-#line 1 "scripts/genksyms/lex.l"
+char *genksymstext;
 /* Lexical analysis for genksyms.
    Copyright 1996, 1997 Linux International.
 
@@ -653,7 +580,6 @@ char *yytext;
    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software Foundation,
    Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
-#line 25 "scripts/genksyms/lex.l"
 
 #include <limits.h>
 #include <stdlib.h>
@@ -661,18 +587,16 @@ char *yytext;
 #include <ctype.h>
 
 #include "genksyms.h"
-#include "parse.h"
 
 /* We've got a two-level lexer here.  We let flex do basic tokenization
    and then we categorize those basic tokens in the second stage.  */
-#define YY_DECL		static int yylex1(void)
+#define YY_DECL		static int genksymslex1(void)
 
 /* Version 2 checksumming does proper tokenization; version 1 wasn't
    quite so pedantic.  */
 
 /* We don't do multiple input files.  */
 #define YY_NO_INPUT 1
-#line 676 "scripts/genksyms/lex.c"
 
 #define INITIAL 0
 #define V2_TOKENS 1
@@ -682,59 +606,43 @@ char *yytext;
  * down here because we want the user's section 1 to have been scanned first.
  * The user has a chance to override it with an option.
  */
-/* %if-c-only */
 #include <unistd.h>
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 #endif
 
 #ifndef YY_EXTRA_TYPE
 #define YY_EXTRA_TYPE void *
 #endif
 
-/* %if-c-only Reentrant structure and macros (non-C++). */
-/* %if-reentrant */
-/* %if-c-only */
-
 static int yy_init_globals (void );
 
-/* %endif */
-/* %if-reentrant */
-/* %endif */
-/* %endif End reentrant structures and macros. */
-
 /* Accessor methods to globals.
    These are made visible to non-reentrant scanners for convenience. */
 
-int yylex_destroy (void );
-
-int yyget_debug (void );
+int genksymslex_destroy (void );
 
-void yyset_debug (int debug_flag  );
+int genksymsget_debug (void );
 
-YY_EXTRA_TYPE yyget_extra (void );
+void genksymsset_debug (int debug_flag  );
 
-void yyset_extra (YY_EXTRA_TYPE user_defined  );
+YY_EXTRA_TYPE genksymsget_extra (void );
 
-FILE *yyget_in (void );
+void genksymsset_extra (YY_EXTRA_TYPE user_defined  );
 
-void yyset_in  (FILE * in_str  );
+FILE *genksymsget_in (void );
 
-FILE *yyget_out (void );
+void genksymsset_in  (FILE * in_str  );
 
-void yyset_out  (FILE * out_str  );
+FILE *genksymsget_out (void );
 
-int yyget_leng (void );
+void genksymsset_out  (FILE * out_str  );
 
-char *yyget_text (void );
+int genksymsget_leng (void );
 
-int yyget_lineno (void );
+char *genksymsget_text (void );
 
-void yyset_lineno (int line_number  );
+int genksymsget_lineno (void );
 
-/* %if-bison-bridge */
-/* %endif */
+void genksymsset_lineno (int line_number  );
 
 /* Macros after this point can all be overridden by user definitions in
  * section 1.
@@ -742,20 +650,14 @@ void yyset_lineno (int line_number  );
 
 #ifndef YY_SKIP_YYWRAP
 #ifdef __cplusplus
-extern "C" int yywrap (void );
+extern "C" int genksymswrap (void );
 #else
-extern int yywrap (void );
+extern int genksymswrap (void );
 #endif
 #endif
 
-/* %not-for-header */
-
     static void yyunput (int c,char *buf_ptr  );
     
-/* %ok-for-header */
-
-/* %endif */
-
 #ifndef yytext_ptr
 static void yy_flex_strncpy (char *,yyconst char *,int );
 #endif
@@ -765,23 +667,15 @@ static int yy_flex_strlen (yyconst char * );
 #endif
 
 #ifndef YY_NO_INPUT
-/* %if-c-only Standard (non-C++) definition */
-/* %not-for-header */
 
 #ifdef __cplusplus
 static int yyinput (void );
 #else
 static int input (void );
 #endif
-/* %ok-for-header */
 
-/* %endif */
 #endif
 
-/* %if-c-only */
-
-/* %endif */
-
 /* Amount of stuff to slurp up with each read. */
 #ifndef YY_READ_BUF_SIZE
 #define YY_READ_BUF_SIZE 8192
@@ -789,14 +683,10 @@ static int input (void );
 
 /* Copy whatever the last rule matched to the standard output. */
 #ifndef ECHO
-/* %if-c-only Standard (non-C++) definition */
 /* This used to be an fputs(), but since the string might contain NUL's,
  * we now use fwrite().
  */
-#define ECHO fwrite( yytext, yyleng, 1, yyout )
-/* %endif */
-/* %if-c++-only C++ definition */
-/* %endif */
+#define ECHO do { if (fwrite( genksymstext, genksymsleng, 1, genksymsout )) {} } while (0)
 #endif
 
 /* Gets input and stuffs it into "buf".  number of characters read, or YY_NULL,
@@ -804,24 +694,23 @@ static int input (void );
  */
 #ifndef YY_INPUT
 #define YY_INPUT(buf,result,max_size) \
-/* %% [5.0] fread()/read() definition of YY_INPUT goes here unless we're doing C++ \ */\
 	if ( YY_CURRENT_BUFFER_LVALUE->yy_is_interactive ) \
 		{ \
 		int c = '*'; \
-		size_t n; \
+		unsigned n; \
 		for ( n = 0; n < max_size && \
-			     (c = getc( yyin )) != EOF && c != '\n'; ++n ) \
+			     (c = getc( genksymsin )) != EOF && c != '\n'; ++n ) \
 			buf[n] = (char) c; \
 		if ( c == '\n' ) \
 			buf[n++] = (char) c; \
-		if ( c == EOF && ferror( yyin ) ) \
+		if ( c == EOF && ferror( genksymsin ) ) \
 			YY_FATAL_ERROR( "input in flex scanner failed" ); \
 		result = n; \
 		} \
 	else \
 		{ \
 		errno=0; \
-		while ( (result = fread(buf, 1, max_size, yyin))==0 && ferror(yyin)) \
+		while ( (result = fread(buf, 1, max_size, genksymsin))==0 && ferror(genksymsin)) \
 			{ \
 			if( errno != EINTR) \
 				{ \
@@ -829,12 +718,10 @@ static int input (void );
 				break; \
 				} \
 			errno=0; \
-			clearerr(yyin); \
+			clearerr(genksymsin); \
 			} \
 		}\
 \
-/* %if-c++-only C++ definition \ */\
-/* %endif */
 
 #endif
 
@@ -853,42 +740,23 @@ static int input (void );
 
 /* Report a fatal error. */
 #ifndef YY_FATAL_ERROR
-/* %if-c-only */
 #define YY_FATAL_ERROR(msg) yy_fatal_error( msg )
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 #endif
 
-/* %if-tables-serialization structures and prototypes */
-/* %not-for-header */
-
-/* %ok-for-header */
-
-/* %not-for-header */
-
-/* %tables-yydmap generated elements */
-/* %endif */
 /* end tables serialization structures and prototypes */
 
-/* %ok-for-header */
-
 /* Default declaration of generated scanner - a define so the user can
  * easily add parameters.
  */
 #ifndef YY_DECL
 #define YY_DECL_IS_OURS 1
-/* %if-c-only Standard (non-C++) definition */
 
-extern int yylex (void);
+extern int genksymslex (void);
 
-#define YY_DECL int yylex (void)
-/* %endif */
-/* %if-c++-only C++ definition */
-/* %endif */
+#define YY_DECL int genksymslex (void)
 #endif /* !YY_DECL */
 
-/* Code executed at the beginning of each rule, after yytext and yyleng
+/* Code executed at the beginning of each rule, after genksymstext and genksymsleng
  * have been set up.
  */
 #ifndef YY_USER_ACTION
@@ -900,15 +768,12 @@ extern int yylex (void);
 #define YY_BREAK break;
 #endif
 
-/* %% [6.0] YY_RULE_SETUP definition goes here */
 #define YY_RULE_SETUP \
-	if ( yyleng > 0 ) \
+	if ( genksymsleng > 0 ) \
 		YY_CURRENT_BUFFER_LVALUE->yy_at_bol = \
-				(yytext[yyleng - 1] == '\n'); \
+				(genksymstext[genksymsleng - 1] == '\n'); \
 	YY_USER_ACTION
 
-/* %not-for-header */
-
 /** The main scanner function which does all the work.
  */
 YY_DECL
@@ -917,13 +782,7 @@ YY_DECL
 	register char *yy_cp, *yy_bp;
 	register int yy_act;
     
-/* %% [7.0] user's declarations go here */
-#line 67 "scripts/genksyms/lex.l"
-
-
-
  /* Keep track of our location in the original source files.  */
-#line 927 "scripts/genksyms/lex.c"
 
 	if ( !(yy_init) )
 		{
@@ -936,35 +795,26 @@ YY_DECL
 		if ( ! (yy_start) )
 			(yy_start) = 1;	/* first start state */
 
-		if ( ! yyin )
-/* %if-c-only */
-			yyin = stdin;
-/* %endif */
-/* %if-c++-only */
-/* %endif */
+		if ( ! genksymsin )
+			genksymsin = stdin;
 
-		if ( ! yyout )
-/* %if-c-only */
-			yyout = stdout;
-/* %endif */
-/* %if-c++-only */
-/* %endif */
+		if ( ! genksymsout )
+			genksymsout = stdout;
 
 		if ( ! YY_CURRENT_BUFFER ) {
-			yyensure_buffer_stack ();
+			genksymsensure_buffer_stack ();
 			YY_CURRENT_BUFFER_LVALUE =
-				yy_create_buffer(yyin,YY_BUF_SIZE );
+				genksyms_create_buffer(genksymsin,YY_BUF_SIZE );
 		}
 
-		yy_load_buffer_state( );
+		genksyms_load_buffer_state( );
 		}
 
 	while ( 1 )		/* loops until end-of-file is reached */
 		{
-/* %% [8.0] yymore()-related code goes here */
 		yy_cp = (yy_c_buf_p);
 
-		/* Support of yytext. */
+		/* Support of genksymstext. */
 		*yy_cp = (yy_hold_char);
 
 		/* yy_bp points to the position in yy_ch_buf of the start of
@@ -972,7 +822,6 @@ YY_DECL
 		 */
 		yy_bp = yy_cp;
 
-/* %% [9.0] code to set up and find next match goes here */
 		yy_current_state = (yy_start);
 		yy_current_state += YY_AT_BOL();
 yy_match:
@@ -996,7 +845,6 @@ yy_match:
 		while ( yy_base[yy_current_state] != 284 );
 
 yy_find_action:
-/* %% [10.0] code to find the action number goes here */
 		yy_act = yy_accept[yy_current_state];
 		if ( yy_act == 0 )
 			{ /* have to back up */
@@ -1007,30 +855,10 @@ yy_find_action:
 
 		YY_DO_BEFORE_ACTION;
 
-/* %% [11.0] code for yylineno update goes here */
-
 do_action:	/* This label is used only to access EOF actions. */
 
-/* %% [12.0] debug code goes here */
-		if ( yy_flex_debug )
-			{
-			if ( yy_act == 0 )
-				fprintf( stderr, "--scanner backing up\n" );
-			else if ( yy_act < 13 )
-				fprintf( stderr, "--accepting rule at line %ld (\"%s\")\n",
-				         (long)yy_rule_linenum[yy_act], yytext );
-			else if ( yy_act == 13 )
-				fprintf( stderr, "--accepting default rule (\"%s\")\n",
-				         yytext );
-			else if ( yy_act == 14 )
-				fprintf( stderr, "--(end of buffer or a NUL)\n" );
-			else
-				fprintf( stderr, "--EOF (start condition %d)\n", YY_START );
-			}
-
 		switch ( yy_act )
 	{ /* beginning of action switch */
-/* %% [13.0] actions go here */
 			case 0: /* must back up */
 			/* undo the effects of YY_DO_BEFORE_ACTION */
 			*yy_cp = (yy_hold_char);
@@ -1041,42 +869,35 @@ do_action:	/* This label is used only to access EOF actions. */
 case 1:
 /* rule 1 can match eol */
 YY_RULE_SETUP
-#line 71 "scripts/genksyms/lex.l"
 return FILENAME;
 	YY_BREAK
 case 2:
 /* rule 2 can match eol */
 YY_RULE_SETUP
-#line 72 "scripts/genksyms/lex.l"
 cur_line++;
 	YY_BREAK
 case 3:
 /* rule 3 can match eol */
 YY_RULE_SETUP
-#line 73 "scripts/genksyms/lex.l"
 cur_line++;
 	YY_BREAK
 /* Ignore all other whitespace.  */
 case 4:
 YY_RULE_SETUP
-#line 76 "scripts/genksyms/lex.l"
 ;
 	YY_BREAK
 case 5:
 /* rule 5 can match eol */
 YY_RULE_SETUP
-#line 79 "scripts/genksyms/lex.l"
 return STRING;
 	YY_BREAK
 case 6:
 /* rule 6 can match eol */
 YY_RULE_SETUP
-#line 80 "scripts/genksyms/lex.l"
 return CHAR;
 	YY_BREAK
 case 7:
 YY_RULE_SETUP
-#line 81 "scripts/genksyms/lex.l"
 return IDENT;
 	YY_BREAK
 /* The Pedant requires that the other C multi-character tokens be
@@ -1085,36 +906,29 @@ return IDENT;
     around them properly.  */
 case 8:
 YY_RULE_SETUP
-#line 87 "scripts/genksyms/lex.l"
 return OTHER;
 	YY_BREAK
 case 9:
 YY_RULE_SETUP
-#line 88 "scripts/genksyms/lex.l"
 return INT;
 	YY_BREAK
 case 10:
 YY_RULE_SETUP
-#line 89 "scripts/genksyms/lex.l"
 return REAL;
 	YY_BREAK
 case 11:
 YY_RULE_SETUP
-#line 91 "scripts/genksyms/lex.l"
 return DOTS;
 	YY_BREAK
 /* All other tokens are single characters.  */
 case 12:
 YY_RULE_SETUP
-#line 94 "scripts/genksyms/lex.l"
-return yytext[0];
+return genksymstext[0];
 	YY_BREAK
 case 13:
 YY_RULE_SETUP
-#line 97 "scripts/genksyms/lex.l"
 ECHO;
 	YY_BREAK
-#line 1118 "scripts/genksyms/lex.c"
 case YY_STATE_EOF(INITIAL):
 case YY_STATE_EOF(V2_TOKENS):
 	yyterminate();
@@ -1132,15 +946,15 @@ case YY_STATE_EOF(V2_TOKENS):
 			{
 			/* We're scanning a new file or input source.  It's
 			 * possible that this happened because the user
-			 * just pointed yyin at a new source and called
-			 * yylex().  If so, then we have to assure
+			 * just pointed genksymsin at a new source and called
+			 * genksymslex().  If so, then we have to assure
 			 * consistency between YY_CURRENT_BUFFER and our
 			 * globals.  Here is the right place to do so, because
 			 * this is the first action (other than possibly a
 			 * back-up) that will match for the new input source.
 			 */
 			(yy_n_chars) = YY_CURRENT_BUFFER_LVALUE->yy_n_chars;
-			YY_CURRENT_BUFFER_LVALUE->yy_input_file = yyin;
+			YY_CURRENT_BUFFER_LVALUE->yy_input_file = genksymsin;
 			YY_CURRENT_BUFFER_LVALUE->yy_buffer_status = YY_BUFFER_NORMAL;
 			}
 
@@ -1182,7 +996,6 @@ case YY_STATE_EOF(V2_TOKENS):
 
 			else
 				{
-/* %% [14.0] code to do back-up for compressed tables and set up yy_cp goes here */
 				yy_cp = (yy_c_buf_p);
 				goto yy_find_action;
 				}
@@ -1194,11 +1007,11 @@ case YY_STATE_EOF(V2_TOKENS):
 				{
 				(yy_did_buffer_switch_on_eof) = 0;
 
-				if ( yywrap( ) )
+				if ( genksymswrap( ) )
 					{
 					/* Note: because we've taken care in
 					 * yy_get_next_buffer() to have set up
-					 * yytext, we can now set up
+					 * genksymstext, we can now set up
 					 * yy_c_buf_p so that if some total
 					 * hoser (like flex itself) wants to
 					 * call the scanner after we return the
@@ -1247,15 +1060,7 @@ case YY_STATE_EOF(V2_TOKENS):
 			"fatal flex scanner internal error--no action found" );
 	} /* end of action switch */
 		} /* end of scanning one token */
-} /* end of yylex */
-/* %ok-for-header */
-
-/* %if-c++-only */
-/* %not-for-header */
-
-/* %ok-for-header */
-
-/* %endif */
+} /* end of genksymslex */
 
 /* yy_get_next_buffer - try to read in a new buffer
  *
@@ -1264,11 +1069,7 @@ case YY_STATE_EOF(V2_TOKENS):
  *	EOB_ACT_CONTINUE_SCAN - continue scanning from current position
  *	EOB_ACT_END_OF_FILE - end of file
  */
-/* %if-c-only */
 static int yy_get_next_buffer (void)
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 {
     	register char *dest = YY_CURRENT_BUFFER_LVALUE->yy_ch_buf;
 	register char *source = (yytext_ptr);
@@ -1337,7 +1138,7 @@ static int yy_get_next_buffer (void)
 
 				b->yy_ch_buf = (char *)
 					/* Include room in for 2 EOB chars. */
-					yyrealloc((void *) b->yy_ch_buf,b->yy_buf_size + 2  );
+					genksymsrealloc((void *) b->yy_ch_buf,b->yy_buf_size + 2  );
 				}
 			else
 				/* Can't grow it, we don't own it. */
@@ -1369,7 +1170,7 @@ static int yy_get_next_buffer (void)
 		if ( number_to_move == YY_MORE_ADJ )
 			{
 			ret_val = EOB_ACT_END_OF_FILE;
-			yyrestart(yyin  );
+			genksymsrestart(genksymsin  );
 			}
 
 		else
@@ -1386,7 +1187,7 @@ static int yy_get_next_buffer (void)
 	if ((yy_size_t) ((yy_n_chars) + number_to_move) > YY_CURRENT_BUFFER_LVALUE->yy_buf_size) {
 		/* Extend the array by 50%, plus the number we really need. */
 		yy_size_t new_size = (yy_n_chars) + number_to_move + ((yy_n_chars) >> 1);
-		YY_CURRENT_BUFFER_LVALUE->yy_ch_buf = (char *) yyrealloc((void *) YY_CURRENT_BUFFER_LVALUE->yy_ch_buf,new_size  );
+		YY_CURRENT_BUFFER_LVALUE->yy_ch_buf = (char *) genksymsrealloc((void *) YY_CURRENT_BUFFER_LVALUE->yy_ch_buf,new_size  );
 		if ( ! YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
 			YY_FATAL_ERROR( "out of dynamic memory in yy_get_next_buffer()" );
 	}
@@ -1402,24 +1203,16 @@ static int yy_get_next_buffer (void)
 
 /* yy_get_previous_state - get the state just before the EOB char was reached */
 
-/* %if-c-only */
-/* %not-for-header */
-
     static yy_state_type yy_get_previous_state (void)
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 {
 	register yy_state_type yy_current_state;
 	register char *yy_cp;
     
-/* %% [15.0] code to get the start state into yy_current_state goes here */
 	yy_current_state = (yy_start);
 	yy_current_state += YY_AT_BOL();
 
 	for ( yy_cp = (yytext_ptr) + YY_MORE_ADJ; yy_cp < (yy_c_buf_p); ++yy_cp )
 		{
-/* %% [16.0] code to find the next state goes here */
 		register YY_CHAR yy_c = (*yy_cp ? yy_ec[YY_SC_TO_UI(*yy_cp)] : 1);
 		if ( yy_accept[yy_current_state] )
 			{
@@ -1443,15 +1236,10 @@ static int yy_get_next_buffer (void)
  * synopsis
  *	next_state = yy_try_NUL_trans( current_state );
  */
-/* %if-c-only */
     static yy_state_type yy_try_NUL_trans  (yy_state_type yy_current_state )
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 {
 	register int yy_is_jam;
-    /* %% [17.0] code to find the next state, and perhaps do backing up, goes here */
-	register char *yy_cp = (yy_c_buf_p);
+    	register char *yy_cp = (yy_c_buf_p);
 
 	register YY_CHAR yy_c = 1;
 	if ( yy_accept[yy_current_state] )
@@ -1471,18 +1259,13 @@ static int yy_get_next_buffer (void)
 	return yy_is_jam ? 0 : yy_current_state;
 }
 
-/* %if-c-only */
-
     static void yyunput (int c, register char * yy_bp )
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 {
 	register char *yy_cp;
     
     yy_cp = (yy_c_buf_p);
 
-	/* undo effects of setting up yytext */
+	/* undo effects of setting up genksymstext */
 	*yy_cp = (yy_hold_char);
 
 	if ( yy_cp < YY_CURRENT_BUFFER_LVALUE->yy_ch_buf + 2 )
@@ -1508,17 +1291,11 @@ static int yy_get_next_buffer (void)
 
 	*--yy_cp = (char) c;
 
-/* %% [18.0] update yylineno here */
-
 	(yytext_ptr) = yy_bp;
 	(yy_hold_char) = *yy_cp;
 	(yy_c_buf_p) = yy_cp;
 }
-/* %if-c-only */
 
-/* %endif */
-
-/* %if-c-only */
 #ifndef YY_NO_INPUT
 #ifdef __cplusplus
     static int yyinput (void)
@@ -1526,9 +1303,6 @@ static int yy_get_next_buffer (void)
     static int input  (void)
 #endif
 
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 {
 	int c;
     
@@ -1563,13 +1337,13 @@ static int yy_get_next_buffer (void)
 					 */
 
 					/* Reset buffer status. */
-					yyrestart(yyin );
+					genksymsrestart(genksymsin );
 
 					/*FALLTHROUGH*/
 
 				case EOB_ACT_END_OF_FILE:
 					{
-					if ( yywrap( ) )
+					if ( genksymswrap( ) )
 						return EOF;
 
 					if ( ! (yy_did_buffer_switch_on_eof) )
@@ -1589,57 +1363,46 @@ static int yy_get_next_buffer (void)
 		}
 
 	c = *(unsigned char *) (yy_c_buf_p);	/* cast for 8-bit char's */
-	*(yy_c_buf_p) = '\0';	/* preserve yytext */
+	*(yy_c_buf_p) = '\0';	/* preserve genksymstext */
 	(yy_hold_char) = *++(yy_c_buf_p);
 
-/* %% [19.0] update BOL and yylineno */
 	YY_CURRENT_BUFFER_LVALUE->yy_at_bol = (c == '\n');
 
 	return c;
 }
-/* %if-c-only */
 #endif	/* ifndef YY_NO_INPUT */
-/* %endif */
 
 /** Immediately switch to a different input stream.
  * @param input_file A readable stream.
  * 
  * @note This function does not reset the start condition to @c INITIAL .
  */
-/* %if-c-only */
-    void yyrestart  (FILE * input_file )
-/* %endif */
-/* %if-c++-only */
-/* %endif */
+    void genksymsrestart  (FILE * input_file )
 {
     
 	if ( ! YY_CURRENT_BUFFER ){
-        yyensure_buffer_stack ();
+        genksymsensure_buffer_stack ();
 		YY_CURRENT_BUFFER_LVALUE =
-            yy_create_buffer(yyin,YY_BUF_SIZE );
+            genksyms_create_buffer(genksymsin,YY_BUF_SIZE );
 	}
 
-	yy_init_buffer(YY_CURRENT_BUFFER,input_file );
-	yy_load_buffer_state( );
+	genksyms_init_buffer(YY_CURRENT_BUFFER,input_file );
+	genksyms_load_buffer_state( );
 }
 
 /** Switch to a different input buffer.
  * @param new_buffer The new input buffer.
  * 
  */
-/* %if-c-only */
-    void yy_switch_to_buffer  (YY_BUFFER_STATE  new_buffer )
-/* %endif */
-/* %if-c++-only */
-/* %endif */
+    void genksyms_switch_to_buffer  (YY_BUFFER_STATE  new_buffer )
 {
     
 	/* TODO. We should be able to replace this entire function body
 	 * with
-	 *		yypop_buffer_state();
-	 *		yypush_buffer_state(new_buffer);
+	 *		genksymspop_buffer_state();
+	 *		genksymspush_buffer_state(new_buffer);
      */
-	yyensure_buffer_stack ();
+	genksymsensure_buffer_stack ();
 	if ( YY_CURRENT_BUFFER == new_buffer )
 		return;
 
@@ -1652,25 +1415,21 @@ static int yy_get_next_buffer (void)
 		}
 
 	YY_CURRENT_BUFFER_LVALUE = new_buffer;
-	yy_load_buffer_state( );
+	genksyms_load_buffer_state( );
 
 	/* We don't actually know whether we did this switch during
-	 * EOF (yywrap()) processing, but the only time this flag
-	 * is looked at is after yywrap() is called, so it's safe
+	 * EOF (genksymswrap()) processing, but the only time this flag
+	 * is looked at is after genksymswrap() is called, so it's safe
 	 * to go ahead and always set it.
 	 */
 	(yy_did_buffer_switch_on_eof) = 1;
 }
 
-/* %if-c-only */
-static void yy_load_buffer_state  (void)
-/* %endif */
-/* %if-c++-only */
-/* %endif */
+static void genksyms_load_buffer_state  (void)
 {
     	(yy_n_chars) = YY_CURRENT_BUFFER_LVALUE->yy_n_chars;
 	(yytext_ptr) = (yy_c_buf_p) = YY_CURRENT_BUFFER_LVALUE->yy_buf_pos;
-	yyin = YY_CURRENT_BUFFER_LVALUE->yy_input_file;
+	genksymsin = YY_CURRENT_BUFFER_LVALUE->yy_input_file;
 	(yy_hold_char) = *(yy_c_buf_p);
 }
 
@@ -1680,43 +1439,35 @@ static void yy_load_buffer_state  (void)
  * 
  * @return the allocated buffer state.
  */
-/* %if-c-only */
-    YY_BUFFER_STATE yy_create_buffer  (FILE * file, int  size )
-/* %endif */
-/* %if-c++-only */
-/* %endif */
+    YY_BUFFER_STATE genksyms_create_buffer  (FILE * file, int  size )
 {
 	YY_BUFFER_STATE b;
     
-	b = (YY_BUFFER_STATE) yyalloc(sizeof( struct yy_buffer_state )  );
+	b = (YY_BUFFER_STATE) genksymsalloc(sizeof( struct yy_buffer_state )  );
 	if ( ! b )
-		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
+		YY_FATAL_ERROR( "out of dynamic memory in genksyms_create_buffer()" );
 
 	b->yy_buf_size = size;
 
 	/* yy_ch_buf has to be 2 characters longer than the size given because
 	 * we need to put in 2 end-of-buffer characters.
 	 */
-	b->yy_ch_buf = (char *) yyalloc(b->yy_buf_size + 2  );
+	b->yy_ch_buf = (char *) genksymsalloc(b->yy_buf_size + 2  );
 	if ( ! b->yy_ch_buf )
-		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
+		YY_FATAL_ERROR( "out of dynamic memory in genksyms_create_buffer()" );
 
 	b->yy_is_our_buffer = 1;
 
-	yy_init_buffer(b,file );
+	genksyms_init_buffer(b,file );
 
 	return b;
 }
 
 /** Destroy the buffer.
- * @param b a buffer created with yy_create_buffer()
+ * @param b a buffer created with genksyms_create_buffer()
  * 
  */
-/* %if-c-only */
-    void yy_delete_buffer (YY_BUFFER_STATE  b )
-/* %endif */
-/* %if-c++-only */
-/* %endif */
+    void genksyms_delete_buffer (YY_BUFFER_STATE  b )
 {
     
 	if ( ! b )
@@ -1726,42 +1477,31 @@ static void yy_load_buffer_state  (void)
 		YY_CURRENT_BUFFER_LVALUE = (YY_BUFFER_STATE) 0;
 
 	if ( b->yy_is_our_buffer )
-		yyfree((void *) b->yy_ch_buf  );
+		genksymsfree((void *) b->yy_ch_buf  );
 
-	yyfree((void *) b  );
+	genksymsfree((void *) b  );
 }
 
-/* %if-c-only */
-
 #ifndef __cplusplus
 extern int isatty (int );
 #endif /* __cplusplus */
     
-/* %endif */
-
-/* %if-c++-only */
-/* %endif */
-
 /* Initializes or reinitializes a buffer.
  * This function is sometimes called more than once on the same buffer,
- * such as during a yyrestart() or at EOF.
+ * such as during a genksymsrestart() or at EOF.
  */
-/* %if-c-only */
-    static void yy_init_buffer  (YY_BUFFER_STATE  b, FILE * file )
-/* %endif */
-/* %if-c++-only */
-/* %endif */
+    static void genksyms_init_buffer  (YY_BUFFER_STATE  b, FILE * file )
 
 {
 	int oerrno = errno;
     
-	yy_flush_buffer(b );
+	genksyms_flush_buffer(b );
 
 	b->yy_input_file = file;
 	b->yy_fill_buffer = 1;
 
-    /* If b is the current buffer, then yy_init_buffer was _probably_
-     * called from yyrestart() or through yy_get_next_buffer.
+    /* If b is the current buffer, then genksyms_init_buffer was _probably_
+     * called from genksymsrestart() or through yy_get_next_buffer.
      * In that case, we don't want to reset the lineno or column.
      */
     if (b != YY_CURRENT_BUFFER){
@@ -1769,13 +1509,8 @@ extern int isatty (int );
         b->yy_bs_column = 0;
     }
 
-/* %if-c-only */
-
         b->yy_is_interactive = file ? (isatty( fileno(file) ) > 0) : 0;
     
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 	errno = oerrno;
 }
 
@@ -1783,11 +1518,7 @@ extern int isatty (int );
  * @param b the buffer state to be flushed, usually @c YY_CURRENT_BUFFER.
  * 
  */
-/* %if-c-only */
-    void yy_flush_buffer (YY_BUFFER_STATE  b )
-/* %endif */
-/* %if-c++-only */
-/* %endif */
+    void genksyms_flush_buffer (YY_BUFFER_STATE  b )
 {
     	if ( ! b )
 		return;
@@ -1807,28 +1538,23 @@ extern int isatty (int );
 	b->yy_buffer_status = YY_BUFFER_NEW;
 
 	if ( b == YY_CURRENT_BUFFER )
-		yy_load_buffer_state( );
+		genksyms_load_buffer_state( );
 }
 
-/* %if-c-or-c++ */
 /** Pushes the new state onto the stack. The new state becomes
  *  the current state. This function will allocate the stack
  *  if necessary.
  *  @param new_buffer The new state.
  *  
  */
-/* %if-c-only */
-void yypush_buffer_state (YY_BUFFER_STATE new_buffer )
-/* %endif */
-/* %if-c++-only */
-/* %endif */
+void genksymspush_buffer_state (YY_BUFFER_STATE new_buffer )
 {
     	if (new_buffer == NULL)
 		return;
 
-	yyensure_buffer_stack();
+	genksymsensure_buffer_stack();
 
-	/* This block is copied from yy_switch_to_buffer. */
+	/* This block is copied from genksyms_switch_to_buffer. */
 	if ( YY_CURRENT_BUFFER )
 		{
 		/* Flush out information for old buffer. */
@@ -1842,47 +1568,35 @@ void yypush_buffer_state (YY_BUFFER_STATE new_buffer )
 		(yy_buffer_stack_top)++;
 	YY_CURRENT_BUFFER_LVALUE = new_buffer;
 
-	/* copied from yy_switch_to_buffer. */
-	yy_load_buffer_state( );
+	/* copied from genksyms_switch_to_buffer. */
+	genksyms_load_buffer_state( );
 	(yy_did_buffer_switch_on_eof) = 1;
 }
-/* %endif */
 
-/* %if-c-or-c++ */
 /** Removes and deletes the top of the stack, if present.
  *  The next element becomes the new top.
  *  
  */
-/* %if-c-only */
-void yypop_buffer_state (void)
-/* %endif */
-/* %if-c++-only */
-/* %endif */
+void genksymspop_buffer_state (void)
 {
     	if (!YY_CURRENT_BUFFER)
 		return;
 
-	yy_delete_buffer(YY_CURRENT_BUFFER );
+	genksyms_delete_buffer(YY_CURRENT_BUFFER );
 	YY_CURRENT_BUFFER_LVALUE = NULL;
 	if ((yy_buffer_stack_top) > 0)
 		--(yy_buffer_stack_top);
 
 	if (YY_CURRENT_BUFFER) {
-		yy_load_buffer_state( );
+		genksyms_load_buffer_state( );
 		(yy_did_buffer_switch_on_eof) = 1;
 	}
 }
-/* %endif */
 
-/* %if-c-or-c++ */
 /* Allocates the stack if it does not exist.
  *  Guarantees space for at least one push.
  */
-/* %if-c-only */
-static void yyensure_buffer_stack (void)
-/* %endif */
-/* %if-c++-only */
-/* %endif */
+static void genksymsensure_buffer_stack (void)
 {
 	int num_to_alloc;
     
@@ -1893,11 +1607,11 @@ static void yyensure_buffer_stack (void)
 		 * immediate realloc on the next call.
          */
 		num_to_alloc = 1;
-		(yy_buffer_stack) = (struct yy_buffer_state**)yyalloc
+		(yy_buffer_stack) = (struct yy_buffer_state**)genksymsalloc
 								(num_to_alloc * sizeof(struct yy_buffer_state*)
 								);
 		if ( ! (yy_buffer_stack) )
-			YY_FATAL_ERROR( "out of dynamic memory in yyensure_buffer_stack()" );
+			YY_FATAL_ERROR( "out of dynamic memory in genksymsensure_buffer_stack()" );
 								  
 		memset((yy_buffer_stack), 0, num_to_alloc * sizeof(struct yy_buffer_state*));
 				
@@ -1912,28 +1626,26 @@ static void yyensure_buffer_stack (void)
 		int grow_size = 8 /* arbitrary grow size */;
 
 		num_to_alloc = (yy_buffer_stack_max) + grow_size;
-		(yy_buffer_stack) = (struct yy_buffer_state**)yyrealloc
+		(yy_buffer_stack) = (struct yy_buffer_state**)genksymsrealloc
 								((yy_buffer_stack),
 								num_to_alloc * sizeof(struct yy_buffer_state*)
 								);
 		if ( ! (yy_buffer_stack) )
-			YY_FATAL_ERROR( "out of dynamic memory in yyensure_buffer_stack()" );
+			YY_FATAL_ERROR( "out of dynamic memory in genksymsensure_buffer_stack()" );
 
 		/* zero only the new slots.*/
 		memset((yy_buffer_stack) + (yy_buffer_stack_max), 0, grow_size * sizeof(struct yy_buffer_state*));
 		(yy_buffer_stack_max) = num_to_alloc;
 	}
 }
-/* %endif */
 
-/* %if-c-only */
 /** Setup the input buffer state to scan directly from a user-specified character buffer.
  * @param base the character buffer
  * @param size the size in bytes of the character buffer
  * 
  * @return the newly allocated buffer state object. 
  */
-YY_BUFFER_STATE yy_scan_buffer  (char * base, yy_size_t  size )
+YY_BUFFER_STATE genksyms_scan_buffer  (char * base, yy_size_t  size )
 {
 	YY_BUFFER_STATE b;
     
@@ -1943,9 +1655,9 @@ YY_BUFFER_STATE yy_scan_buffer  (char * base, yy_size_t  size )
 		/* They forgot to leave room for the EOB's. */
 		return 0;
 
-	b = (YY_BUFFER_STATE) yyalloc(sizeof( struct yy_buffer_state )  );
+	b = (YY_BUFFER_STATE) genksymsalloc(sizeof( struct yy_buffer_state )  );
 	if ( ! b )
-		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_buffer()" );
+		YY_FATAL_ERROR( "out of dynamic memory in genksyms_scan_buffer()" );
 
 	b->yy_buf_size = size - 2;	/* "- 2" to take care of EOB's */
 	b->yy_buf_pos = b->yy_ch_buf = base;
@@ -1957,37 +1669,33 @@ YY_BUFFER_STATE yy_scan_buffer  (char * base, yy_size_t  size )
 	b->yy_fill_buffer = 0;
 	b->yy_buffer_status = YY_BUFFER_NEW;
 
-	yy_switch_to_buffer(b  );
+	genksyms_switch_to_buffer(b  );
 
 	return b;
 }
-/* %endif */
 
-/* %if-c-only */
-/** Setup the input buffer state to scan a string. The next call to yylex() will
+/** Setup the input buffer state to scan a string. The next call to genksymslex() will
  * scan from a @e copy of @a str.
  * @param yystr a NUL-terminated string to scan
  * 
  * @return the newly allocated buffer state object.
  * @note If you want to scan bytes that may contain NUL values, then use
- *       yy_scan_bytes() instead.
+ *       genksyms_scan_bytes() instead.
  */
-YY_BUFFER_STATE yy_scan_string (yyconst char * yystr )
+YY_BUFFER_STATE genksyms_scan_string (yyconst char * yystr )
 {
     
-	return yy_scan_bytes(yystr,strlen(yystr) );
+	return genksyms_scan_bytes(yystr,strlen(yystr) );
 }
-/* %endif */
 
-/* %if-c-only */
-/** Setup the input buffer state to scan the given bytes. The next call to yylex() will
+/** Setup the input buffer state to scan the given bytes. The next call to genksymslex() will
  * scan from a @e copy of @a bytes.
  * @param bytes the byte buffer to scan
  * @param len the number of bytes in the buffer pointed to by @a bytes.
  * 
  * @return the newly allocated buffer state object.
  */
-YY_BUFFER_STATE yy_scan_bytes  (yyconst char * yybytes, int  _yybytes_len )
+YY_BUFFER_STATE genksyms_scan_bytes  (yyconst char * yybytes, int  _yybytes_len )
 {
 	YY_BUFFER_STATE b;
 	char *buf;
@@ -1996,18 +1704,18 @@ YY_BUFFER_STATE yy_scan_bytes  (yyconst char * yybytes, int  _yybytes_len )
     
 	/* Get memory for full buffer, including space for trailing EOB's. */
 	n = _yybytes_len + 2;
-	buf = (char *) yyalloc(n  );
+	buf = (char *) genksymsalloc(n  );
 	if ( ! buf )
-		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_bytes()" );
+		YY_FATAL_ERROR( "out of dynamic memory in genksyms_scan_bytes()" );
 
 	for ( i = 0; i < _yybytes_len; ++i )
 		buf[i] = yybytes[i];
 
 	buf[_yybytes_len] = buf[_yybytes_len+1] = YY_END_OF_BUFFER_CHAR;
 
-	b = yy_scan_buffer(buf,n );
+	b = genksyms_scan_buffer(buf,n );
 	if ( ! b )
-		YY_FATAL_ERROR( "bad buffer in yy_scan_bytes()" );
+		YY_FATAL_ERROR( "bad buffer in genksyms_scan_bytes()" );
 
 	/* It's okay to grow etc. this buffer, and we should throw it
 	 * away when we're done.
@@ -2016,21 +1724,16 @@ YY_BUFFER_STATE yy_scan_bytes  (yyconst char * yybytes, int  _yybytes_len )
 
 	return b;
 }
-/* %endif */
 
 #ifndef YY_EXIT_FAILURE
 #define YY_EXIT_FAILURE 2
 #endif
 
-/* %if-c-only */
 static void yy_fatal_error (yyconst char* msg )
 {
     	(void) fprintf( stderr, "%s\n", msg );
 	exit( YY_EXIT_FAILURE );
 }
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 
 /* Redefine yyless() so it works in section 3 code. */
 
@@ -2038,116 +1741,101 @@ static void yy_fatal_error (yyconst char* msg )
 #define yyless(n) \
 	do \
 		{ \
-		/* Undo effects of setting up yytext. */ \
+		/* Undo effects of setting up genksymstext. */ \
         int yyless_macro_arg = (n); \
         YY_LESS_LINENO(yyless_macro_arg);\
-		yytext[yyleng] = (yy_hold_char); \
-		(yy_c_buf_p) = yytext + yyless_macro_arg; \
+		genksymstext[genksymsleng] = (yy_hold_char); \
+		(yy_c_buf_p) = genksymstext + yyless_macro_arg; \
 		(yy_hold_char) = *(yy_c_buf_p); \
 		*(yy_c_buf_p) = '\0'; \
-		yyleng = yyless_macro_arg; \
+		genksymsleng = yyless_macro_arg; \
 		} \
 	while ( 0 )
 
 /* Accessor  methods (get/set functions) to struct members. */
 
-/* %if-c-only */
-/* %if-reentrant */
-/* %endif */
-
 /** Get the current line number.
  * 
  */
-int yyget_lineno  (void)
+int genksymsget_lineno  (void)
 {
         
-    return yylineno;
+    return genksymslineno;
 }
 
 /** Get the input stream.
  * 
  */
-FILE *yyget_in  (void)
+FILE *genksymsget_in  (void)
 {
-        return yyin;
+        return genksymsin;
 }
 
 /** Get the output stream.
  * 
  */
-FILE *yyget_out  (void)
+FILE *genksymsget_out  (void)
 {
-        return yyout;
+        return genksymsout;
 }
 
 /** Get the length of the current token.
  * 
  */
-int yyget_leng  (void)
+int genksymsget_leng  (void)
 {
-        return yyleng;
+        return genksymsleng;
 }
 
 /** Get the current token.
  * 
  */
 
-char *yyget_text  (void)
+char *genksymsget_text  (void)
 {
-        return yytext;
+        return genksymstext;
 }
 
-/* %if-reentrant */
-/* %endif */
-
 /** Set the current line number.
  * @param line_number
  * 
  */
-void yyset_lineno (int  line_number )
+void genksymsset_lineno (int  line_number )
 {
     
-    yylineno = line_number;
+    genksymslineno = line_number;
 }
 
 /** Set the input stream. This does not discard the current
  * input buffer.
  * @param in_str A readable stream.
  * 
- * @see yy_switch_to_buffer
+ * @see genksyms_switch_to_buffer
  */
-void yyset_in (FILE *  in_str )
+void genksymsset_in (FILE *  in_str )
 {
-        yyin = in_str ;
+        genksymsin = in_str ;
 }
 
-void yyset_out (FILE *  out_str )
+void genksymsset_out (FILE *  out_str )
 {
-        yyout = out_str ;
+        genksymsout = out_str ;
 }
 
-int yyget_debug  (void)
+int genksymsget_debug  (void)
 {
-        return yy_flex_debug;
+        return genksyms_flex_debug;
 }
 
-void yyset_debug (int  bdebug )
+void genksymsset_debug (int  bdebug )
 {
-        yy_flex_debug = bdebug ;
+        genksyms_flex_debug = bdebug ;
 }
 
-/* %endif */
-
-/* %if-reentrant */
-/* %if-bison-bridge */
-/* %endif */
-/* %endif if-c-only */
-
-/* %if-c-only */
 static int yy_init_globals (void)
 {
         /* Initialization is the same as for the non-reentrant scanner.
-     * This function is called from yylex_destroy(), so don't allocate here.
+     * This function is called from genksymslex_destroy(), so don't allocate here.
      */
 
     (yy_buffer_stack) = 0;
@@ -2159,45 +1847,40 @@ static int yy_init_globals (void)
 
 /* Defined in main.c */
 #ifdef YY_STDINIT
-    yyin = stdin;
-    yyout = stdout;
+    genksymsin = stdin;
+    genksymsout = stdout;
 #else
-    yyin = (FILE *) 0;
-    yyout = (FILE *) 0;
+    genksymsin = (FILE *) 0;
+    genksymsout = (FILE *) 0;
 #endif
 
     /* For future reference: Set errno on error, since we are called by
-     * yylex_init()
+     * genksymslex_init()
      */
     return 0;
 }
-/* %endif */
 
-/* %if-c-only SNIP! this currently causes conflicts with the c++ scanner */
-/* yylex_destroy is for both reentrant and non-reentrant scanners. */
-int yylex_destroy  (void)
+/* genksymslex_destroy is for both reentrant and non-reentrant scanners. */
+int genksymslex_destroy  (void)
 {
     
     /* Pop the buffer stack, destroying each element. */
 	while(YY_CURRENT_BUFFER){
-		yy_delete_buffer(YY_CURRENT_BUFFER  );
+		genksyms_delete_buffer(YY_CURRENT_BUFFER  );
 		YY_CURRENT_BUFFER_LVALUE = NULL;
-		yypop_buffer_state();
+		genksymspop_buffer_state();
 	}
 
 	/* Destroy the stack itself. */
-	yyfree((yy_buffer_stack) );
+	genksymsfree((yy_buffer_stack) );
 	(yy_buffer_stack) = NULL;
 
     /* Reset the globals. This is important in a non-reentrant scanner so the next time
-     * yylex() is called, initialization will occur. */
+     * genksymslex() is called, initialization will occur. */
     yy_init_globals( );
 
-/* %if-reentrant */
-/* %endif */
     return 0;
 }
-/* %endif */
 
 /*
  * Internal utility routines.
@@ -2223,12 +1906,12 @@ static int yy_flex_strlen (yyconst char * s )
 }
 #endif
 
-void *yyalloc (yy_size_t  size )
+void *genksymsalloc (yy_size_t  size )
 {
 	return (void *) malloc( size );
 }
 
-void *yyrealloc  (void * ptr, yy_size_t  size )
+void *genksymsrealloc  (void * ptr, yy_size_t  size )
 {
 	/* The cast to (char *) in the following accommodates both
 	 * implementations that use char* generic pointers, and those
@@ -2240,26 +1923,16 @@ void *yyrealloc  (void * ptr, yy_size_t  size )
 	return (void *) realloc( (char *) ptr, size );
 }
 
-void yyfree (void * ptr )
+void genksymsfree (void * ptr )
 {
-	free( (char *) ptr );	/* see yyrealloc() for (char *) cast */
+	free( (char *) ptr );	/* see genksymsrealloc() for (char *) cast */
 }
 
-/* %if-tables-serialization definitions */
-/* %define-yytables   The name for this specific scanner's tables. */
 #define YYTABLES_NAME "yytables"
-/* %endif */
-
-/* %ok-for-header */
-
-#line 97 "scripts/genksyms/lex.l"
-
-
 
 /* Bring in the keyword recognizer.  */
 
-#include "keywords.c"
-
+#include "genksyms.hash.c"
 
 /* Macros to append to our phrase collection list.  */
 
@@ -2271,14 +1944,13 @@ void yyfree (void * ptr )
 			  cur_node->tag = SYM_NORMAL;			   \
 			} while (0)
 
-#define APP		_APP(yytext, yyleng)
-
+#define APP		_APP(genksymstext, genksymsleng)
 
 /* The second stage lexer.  Here we incorporate knowledge of the state
    of the parser to tailor the tokens that are returned.  */
 
 int
-yylex(void)
+genksymslex(void)
 {
   static enum {
     ST_NOTSTARTED, ST_NORMAL, ST_ATTRIBUTE, ST_ASM, ST_BRACKET, ST_BRACE,
@@ -2301,7 +1973,7 @@ yylex(void)
     }
 
 repeat:
-  token = yylex1();
+  token = genksymslex1();
 
   if (token == 0)
     return 0;
@@ -2314,11 +1986,11 @@ repeat:
       if (cur_filename)
 	free(cur_filename);
 
-      file = strchr(yytext, '\"')+1;
+      file = strchr(genksymstext, '\"')+1;
       e = strchr(file, '\"');
       *e = '\0';
       cur_filename = memcpy(xmalloc(e-file+1), file, e-file+1);
-      cur_line = atoi(yytext+2);
+      cur_line = atoi(genksymstext+2);
 
       goto repeat;
     }
@@ -2331,7 +2003,7 @@ repeat:
 	case IDENT:
 	  APP;
 	  {
-	    const struct resword *r = is_reserved_word(yytext, yyleng);
+	    const struct resword *r = is_reserved_word(genksymstext, genksymsleng);
 	    if (r)
 	      {
 		switch (token = r->token)
@@ -2358,7 +2030,7 @@ repeat:
 	      }
 	    if (!suppress_type_lookup)
 	      {
-		struct symbol *sym = find_symbol(yytext, SYM_TYPEDEF);
+		struct symbol *sym = find_symbol(genksymstext, SYM_TYPEDEF);
 		if (sym && sym->type == SYM_TYPEDEF)
 		  token = TYPE;
 	      }
@@ -2505,7 +2177,7 @@ repeat:
       goto repeat;
 
     case ST_TABLE_2:
-      if (token == IDENT && yyleng == 1 && yytext[0] == 'X')
+      if (token == IDENT && genksymsleng == 1 && genksymstext[0] == 'X')
 	{
 	  token = EXPORT_SYMBOL_KEYW;
 	  lexstate = ST_TABLE_5;
@@ -2567,143 +2239,4 @@ fini:
 
   return token;
 }
-/* A Bison parser, made by GNU Bison 2.3.  */
-
-/* Skeleton interface for Bison's Yacc-like parsers in C
-
-   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
-   Free Software Foundation, Inc.
-
-   This program is free software; you can redistribute it and/or modify
-   it under the terms of the GNU General Public License as published by
-   the Free Software Foundation; either version 2, or (at your option)
-   any later version.
-
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 51 Franklin Street, Fifth Floor,
-   Boston, MA 02110-1301, USA.  */
-
-/* As a special exception, you may create a larger work that contains
-   part or all of the Bison parser skeleton and distribute that work
-   under terms of your choice, so long as that work isn't itself a
-   parser generator using the skeleton or a modified version thereof
-   as a parser skeleton.  Alternatively, if you modify or redistribute
-   the parser skeleton itself, you may (at your option) remove this
-   special exception, which will cause the skeleton and the resulting
-   Bison output files to be licensed under the GNU General Public
-   License without this special exception.
-
-   This special exception was added by the Free Software Foundation in
-   version 2.2 of Bison.  */
-
-/* Tokens.  */
-#ifndef YYTOKENTYPE
-# define YYTOKENTYPE
-   /* Put the tokens into the symbol table, so that GDB and other debuggers
-      know about them.  */
-   enum yytokentype {
-     ASM_KEYW = 258,
-     ATTRIBUTE_KEYW = 259,
-     AUTO_KEYW = 260,
-     BOOL_KEYW = 261,
-     CHAR_KEYW = 262,
-     CONST_KEYW = 263,
-     DOUBLE_KEYW = 264,
-     ENUM_KEYW = 265,
-     EXTERN_KEYW = 266,
-     EXTENSION_KEYW = 267,
-     FLOAT_KEYW = 268,
-     INLINE_KEYW = 269,
-     INT_KEYW = 270,
-     LONG_KEYW = 271,
-     REGISTER_KEYW = 272,
-     RESTRICT_KEYW = 273,
-     SHORT_KEYW = 274,
-     SIGNED_KEYW = 275,
-     STATIC_KEYW = 276,
-     STRUCT_KEYW = 277,
-     TYPEDEF_KEYW = 278,
-     UNION_KEYW = 279,
-     UNSIGNED_KEYW = 280,
-     VOID_KEYW = 281,
-     VOLATILE_KEYW = 282,
-     TYPEOF_KEYW = 283,
-     EXPORT_SYMBOL_KEYW = 284,
-     ASM_PHRASE = 285,
-     ATTRIBUTE_PHRASE = 286,
-     BRACE_PHRASE = 287,
-     BRACKET_PHRASE = 288,
-     EXPRESSION_PHRASE = 289,
-     CHAR = 290,
-     DOTS = 291,
-     IDENT = 292,
-     INT = 293,
-     REAL = 294,
-     STRING = 295,
-     TYPE = 296,
-     OTHER = 297,
-     FILENAME = 298
-   };
-#endif
-/* Tokens.  */
-#define ASM_KEYW 258
-#define ATTRIBUTE_KEYW 259
-#define AUTO_KEYW 260
-#define BOOL_KEYW 261
-#define CHAR_KEYW 262
-#define CONST_KEYW 263
-#define DOUBLE_KEYW 264
-#define ENUM_KEYW 265
-#define EXTERN_KEYW 266
-#define EXTENSION_KEYW 267
-#define FLOAT_KEYW 268
-#define INLINE_KEYW 269
-#define INT_KEYW 270
-#define LONG_KEYW 271
-#define REGISTER_KEYW 272
-#define RESTRICT_KEYW 273
-#define SHORT_KEYW 274
-#define SIGNED_KEYW 275
-#define STATIC_KEYW 276
-#define STRUCT_KEYW 277
-#define TYPEDEF_KEYW 278
-#define UNION_KEYW 279
-#define UNSIGNED_KEYW 280
-#define VOID_KEYW 281
-#define VOLATILE_KEYW 282
-#define TYPEOF_KEYW 283
-#define EXPORT_SYMBOL_KEYW 284
-#define ASM_PHRASE 285
-#define ATTRIBUTE_PHRASE 286
-#define BRACE_PHRASE 287
-#define BRACKET_PHRASE 288
-#define EXPRESSION_PHRASE 289
-#define CHAR 290
-#define DOTS 291
-#define IDENT 292
-#define INT 293
-#define REAL 294
-#define STRING 295
-#define TYPE 296
-#define OTHER 297
-#define FILENAME 298
-
-
-
-
-#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
-typedef int YYSTYPE;
-# define yystype YYSTYPE /* obsolescent; will be withdrawn */
-# define YYSTYPE_IS_DECLARED 1
-# define YYSTYPE_IS_TRIVIAL 1
-#endif
-
-extern YYSTYPE yylval;
-
 
-- 
1.7.3.4.574.g608b.dirty

