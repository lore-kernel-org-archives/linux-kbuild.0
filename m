Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:44747 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753887Ab1EWILI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 04:11:08 -0400
Received: by mail-iw0-f174.google.com with SMTP id 34so4551646iwn.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2011 01:11:08 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFCv2 05/13] genksym: regen parser
Date: Mon, 23 May 2011 04:10:31 -0400
Message-Id: <1306138239-13440-6-git-send-email-lacombar@gmail.com>
In-Reply-To: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

---
 ...{keywords.c_shipped => keywords.hash.c_shipped} |   96 +++---
 .../genksyms/{lex.c_shipped => lex.lex.c_shipped}  |  360 +-------------------
 scripts/genksyms/parse.h_shipped                   |   97 ------
 .../{parse.c_shipped => parse.tab.c_shipped}       |  200 +----------
 4 files changed, 72 insertions(+), 681 deletions(-)
 rename scripts/genksyms/{keywords.c_shipped => keywords.hash.c_shipped} (94%)
 rename scripts/genksyms/{lex.c_shipped => lex.lex.c_shipped} (89%)
 delete mode 100644 scripts/genksyms/parse.h_shipped
 rename scripts/genksyms/{parse.c_shipped => parse.tab.c_shipped} (92%)

diff --git a/scripts/genksyms/keywords.c_shipped b/scripts/genksyms/keywords.hash.c_shipped
similarity index 94%
rename from scripts/genksyms/keywords.c_shipped
rename to scripts/genksyms/keywords.hash.c_shipped
index 8060e06..8206260 100644
--- a/scripts/genksyms/keywords.c_shipped
+++ b/scripts/genksyms/keywords.hash.c_shipped
@@ -1,5 +1,5 @@
 /* ANSI-C code produced by gperf version 3.0.4 */
-/* Command-line: gperf -L ANSI-C -a -C -E -g -H is_reserved_hash -k '1,3,$' -N is_reserved_word -p -t scripts/genksyms/keywords.gperf  */
+/* Command-line: gperf -t --output-file scripts/genksyms/keywords.hash.c_shipped -a -C -E -g -k '1,3,$' -p -t scripts/genksyms/keywords.gperf  */
 
 #if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
       && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
@@ -28,11 +28,11 @@
 #error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
 #endif
 
-#line 1 "scripts/genksyms/keywords.gperf"
+#line 4 "scripts/genksyms/keywords.gperf"
 
 struct resword;
 static const struct resword *is_reserved_word(register const char *str, register unsigned int len);
-#line 5 "scripts/genksyms/keywords.gperf"
+#line 8 "scripts/genksyms/keywords.gperf"
 struct resword { const char *name; int token; };
 /* maximum key range = 64, duplicates = 0 */
 
@@ -99,108 +99,108 @@ is_reserved_word (register const char *str, register unsigned int len)
   static const struct resword wordlist[] =
     {
       {""}, {""}, {""},
-#line 30 "scripts/genksyms/keywords.gperf"
+#line 33 "scripts/genksyms/keywords.gperf"
       {"asm", ASM_KEYW},
       {""},
-#line 12 "scripts/genksyms/keywords.gperf"
+#line 15 "scripts/genksyms/keywords.gperf"
       {"__asm", ASM_KEYW},
       {""},
-#line 13 "scripts/genksyms/keywords.gperf"
+#line 16 "scripts/genksyms/keywords.gperf"
       {"__asm__", ASM_KEYW},
       {""}, {""},
-#line 56 "scripts/genksyms/keywords.gperf"
+#line 59 "scripts/genksyms/keywords.gperf"
       {"__typeof__", TYPEOF_KEYW},
       {""},
-#line 16 "scripts/genksyms/keywords.gperf"
+#line 19 "scripts/genksyms/keywords.gperf"
       {"__const", CONST_KEYW},
-#line 15 "scripts/genksyms/keywords.gperf"
+#line 18 "scripts/genksyms/keywords.gperf"
       {"__attribute__", ATTRIBUTE_KEYW},
-#line 17 "scripts/genksyms/keywords.gperf"
+#line 20 "scripts/genksyms/keywords.gperf"
       {"__const__", CONST_KEYW},
-#line 22 "scripts/genksyms/keywords.gperf"
+#line 25 "scripts/genksyms/keywords.gperf"
       {"__signed__", SIGNED_KEYW},
-#line 48 "scripts/genksyms/keywords.gperf"
+#line 51 "scripts/genksyms/keywords.gperf"
       {"static", STATIC_KEYW},
       {""},
-#line 43 "scripts/genksyms/keywords.gperf"
+#line 46 "scripts/genksyms/keywords.gperf"
       {"int", INT_KEYW},
-#line 36 "scripts/genksyms/keywords.gperf"
+#line 39 "scripts/genksyms/keywords.gperf"
       {"char", CHAR_KEYW},
-#line 37 "scripts/genksyms/keywords.gperf"
+#line 40 "scripts/genksyms/keywords.gperf"
       {"const", CONST_KEYW},
-#line 49 "scripts/genksyms/keywords.gperf"
+#line 52 "scripts/genksyms/keywords.gperf"
       {"struct", STRUCT_KEYW},
-#line 28 "scripts/genksyms/keywords.gperf"
+#line 31 "scripts/genksyms/keywords.gperf"
       {"__restrict__", RESTRICT_KEYW},
-#line 29 "scripts/genksyms/keywords.gperf"
+#line 32 "scripts/genksyms/keywords.gperf"
       {"restrict", RESTRICT_KEYW},
-#line 9 "scripts/genksyms/keywords.gperf"
+#line 12 "scripts/genksyms/keywords.gperf"
       {"EXPORT_SYMBOL_GPL_FUTURE", EXPORT_SYMBOL_KEYW},
-#line 20 "scripts/genksyms/keywords.gperf"
+#line 23 "scripts/genksyms/keywords.gperf"
       {"__inline__", INLINE_KEYW},
       {""},
-#line 24 "scripts/genksyms/keywords.gperf"
+#line 27 "scripts/genksyms/keywords.gperf"
       {"__volatile__", VOLATILE_KEYW},
-#line 7 "scripts/genksyms/keywords.gperf"
+#line 10 "scripts/genksyms/keywords.gperf"
       {"EXPORT_SYMBOL", EXPORT_SYMBOL_KEYW},
-#line 27 "scripts/genksyms/keywords.gperf"
+#line 30 "scripts/genksyms/keywords.gperf"
       {"_restrict", RESTRICT_KEYW},
       {""},
-#line 14 "scripts/genksyms/keywords.gperf"
+#line 17 "scripts/genksyms/keywords.gperf"
       {"__attribute", ATTRIBUTE_KEYW},
-#line 8 "scripts/genksyms/keywords.gperf"
+#line 11 "scripts/genksyms/keywords.gperf"
       {"EXPORT_SYMBOL_GPL", EXPORT_SYMBOL_KEYW},
-#line 18 "scripts/genksyms/keywords.gperf"
+#line 21 "scripts/genksyms/keywords.gperf"
       {"__extension__", EXTENSION_KEYW},
-#line 39 "scripts/genksyms/keywords.gperf"
+#line 42 "scripts/genksyms/keywords.gperf"
       {"enum", ENUM_KEYW},
-#line 10 "scripts/genksyms/keywords.gperf"
+#line 13 "scripts/genksyms/keywords.gperf"
       {"EXPORT_UNUSED_SYMBOL", EXPORT_SYMBOL_KEYW},
-#line 40 "scripts/genksyms/keywords.gperf"
+#line 43 "scripts/genksyms/keywords.gperf"
       {"extern", EXTERN_KEYW},
       {""},
-#line 21 "scripts/genksyms/keywords.gperf"
+#line 24 "scripts/genksyms/keywords.gperf"
       {"__signed", SIGNED_KEYW},
-#line 11 "scripts/genksyms/keywords.gperf"
+#line 14 "scripts/genksyms/keywords.gperf"
       {"EXPORT_UNUSED_SYMBOL_GPL", EXPORT_SYMBOL_KEYW},
-#line 51 "scripts/genksyms/keywords.gperf"
+#line 54 "scripts/genksyms/keywords.gperf"
       {"union", UNION_KEYW},
-#line 55 "scripts/genksyms/keywords.gperf"
+#line 58 "scripts/genksyms/keywords.gperf"
       {"typeof", TYPEOF_KEYW},
-#line 50 "scripts/genksyms/keywords.gperf"
+#line 53 "scripts/genksyms/keywords.gperf"
       {"typedef", TYPEDEF_KEYW},
-#line 19 "scripts/genksyms/keywords.gperf"
+#line 22 "scripts/genksyms/keywords.gperf"
       {"__inline", INLINE_KEYW},
-#line 35 "scripts/genksyms/keywords.gperf"
+#line 38 "scripts/genksyms/keywords.gperf"
       {"auto", AUTO_KEYW},
-#line 23 "scripts/genksyms/keywords.gperf"
+#line 26 "scripts/genksyms/keywords.gperf"
       {"__volatile", VOLATILE_KEYW},
       {""}, {""},
-#line 52 "scripts/genksyms/keywords.gperf"
+#line 55 "scripts/genksyms/keywords.gperf"
       {"unsigned", UNSIGNED_KEYW},
       {""},
-#line 46 "scripts/genksyms/keywords.gperf"
+#line 49 "scripts/genksyms/keywords.gperf"
       {"short", SHORT_KEYW},
-#line 42 "scripts/genksyms/keywords.gperf"
+#line 45 "scripts/genksyms/keywords.gperf"
       {"inline", INLINE_KEYW},
       {""},
-#line 54 "scripts/genksyms/keywords.gperf"
+#line 57 "scripts/genksyms/keywords.gperf"
       {"volatile", VOLATILE_KEYW},
-#line 44 "scripts/genksyms/keywords.gperf"
+#line 47 "scripts/genksyms/keywords.gperf"
       {"long", LONG_KEYW},
-#line 26 "scripts/genksyms/keywords.gperf"
+#line 29 "scripts/genksyms/keywords.gperf"
       {"_Bool", BOOL_KEYW},
       {""}, {""},
-#line 45 "scripts/genksyms/keywords.gperf"
+#line 48 "scripts/genksyms/keywords.gperf"
       {"register", REGISTER_KEYW},
-#line 53 "scripts/genksyms/keywords.gperf"
+#line 56 "scripts/genksyms/keywords.gperf"
       {"void", VOID_KEYW},
-#line 41 "scripts/genksyms/keywords.gperf"
+#line 44 "scripts/genksyms/keywords.gperf"
       {"float", FLOAT_KEYW},
-#line 38 "scripts/genksyms/keywords.gperf"
+#line 41 "scripts/genksyms/keywords.gperf"
       {"double", DOUBLE_KEYW},
       {""}, {""}, {""}, {""},
-#line 47 "scripts/genksyms/keywords.gperf"
+#line 50 "scripts/genksyms/keywords.gperf"
       {"signed", SIGNED_KEYW}
     };
 
diff --git a/scripts/genksyms/lex.c_shipped b/scripts/genksyms/lex.lex.c_shipped
similarity index 89%
rename from scripts/genksyms/lex.c_shipped
rename to scripts/genksyms/lex.lex.c_shipped
index af49390..cf37b38 100644
--- a/scripts/genksyms/lex.c_shipped
+++ b/scripts/genksyms/lex.lex.c_shipped
@@ -1,20 +1,10 @@
-#line 2 "scripts/genksyms/lex.c"
 
-#line 4 "scripts/genksyms/lex.c"
+#line 3 "scripts/genksyms/lex.lex.c_shipped"
 
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
-
 #define FLEX_SCANNER
 #define YY_FLEX_MAJOR_VERSION 2
 #define YY_FLEX_MINOR_VERSION 5
@@ -23,32 +13,16 @@
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
@@ -112,11 +86,6 @@ typedef unsigned int flex_uint32_t;
 
 #endif /* ! FLEXINT_H */
 
-/* %endif */
-
-/* %if-c++-only */
-/* %endif */
-
 #ifdef __cplusplus
 
 /* The "const" storage-class-modifier is valid. */
@@ -138,13 +107,8 @@ typedef unsigned int flex_uint32_t;
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
@@ -152,14 +116,6 @@ typedef unsigned int flex_uint32_t;
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
@@ -196,15 +152,9 @@ typedef unsigned int flex_uint32_t;
 typedef struct yy_buffer_state *YY_BUFFER_STATE;
 #endif
 
-/* %if-not-reentrant */
 extern int yyleng;
-/* %endif */
 
-/* %if-c-only */
-/* %if-not-reentrant */
 extern FILE *yyin, *yyout;
-/* %endif */
-/* %endif */
 
 #define EOB_ACT_CONTINUE_SCAN 0
 #define EOB_ACT_END_OF_FILE 1
@@ -237,12 +187,7 @@ typedef size_t yy_size_t;
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
@@ -303,19 +248,10 @@ struct yy_buffer_state
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
@@ -332,11 +268,6 @@ static YY_BUFFER_STATE * yy_buffer_stack = 0; /**< Stack as an array. */
  */
 #define YY_CURRENT_BUFFER_LVALUE (yy_buffer_stack)[(yy_buffer_stack_top)]
 
-/* %if-c-only Standard (non-C++) definition */
-
-/* %if-not-reentrant */
-/* %not-for-header */
-
 /* yy_hold_char holds the character lost when yytext is formed. */
 static char yy_hold_char;
 static int yy_n_chars;		/* number of characters read into yy_ch_buf */
@@ -351,9 +282,6 @@ static int yy_start = 0;	/* start state number */
  * instead of setting up a fresh yyin.  A bit of a hack ...
  */
 static int yy_did_buffer_switch_on_eof;
-/* %ok-for-header */
-
-/* %endif */
 
 void yyrestart (FILE *input_file  );
 void yy_switch_to_buffer (YY_BUFFER_STATE new_buffer  );
@@ -373,8 +301,6 @@ YY_BUFFER_STATE yy_scan_buffer (char *base,yy_size_t size  );
 YY_BUFFER_STATE yy_scan_string (yyconst char *yy_str  );
 YY_BUFFER_STATE yy_scan_bytes (yyconst char *bytes,int len  );
 
-/* %endif */
-
 void *yyalloc (yy_size_t  );
 void *yyrealloc (void *,yy_size_t  );
 void yyfree (void *  );
@@ -403,14 +329,11 @@ void yyfree (void *  );
 
 #define YY_AT_BOL() (YY_CURRENT_BUFFER_LVALUE->yy_at_bol)
 
-/* %% [1.0] yytext/yyin/yyout/yy_state_type/yylineno etc. def's & init go here */
 /* Begin user sect3 */
 
 #define yywrap(n) 1
 #define YY_SKIP_YYWRAP
 
-#define FLEX_DEBUG
-
 typedef unsigned char YY_CHAR;
 
 FILE *yyin = (FILE *) 0, *yyout = (FILE *) 0;
@@ -424,28 +347,21 @@ int yylineno = 1;
 extern char *yytext;
 #define yytext_ptr yytext
 
-/* %if-c-only Standard (non-C++) definition */
-
 static yy_state_type yy_get_previous_state (void );
 static yy_state_type yy_try_NUL_trans (yy_state_type current_state  );
 static int yy_get_next_buffer (void );
 static void yy_fatal_error (yyconst char msg[]  );
 
-/* %endif */
-
 /* Done after the current pattern has been matched and before the
  * corresponding action - sets up yytext.
  */
 #define YY_DO_BEFORE_ACTION \
 	(yytext_ptr) = yy_bp; \
-/* %% [2.0] code to fiddle yytext and yyleng for yymore() goes here \ */\
 	yyleng = (size_t) (yy_cp - yy_bp); \
 	(yy_hold_char) = *yy_cp; \
 	*yy_cp = '\0'; \
-/* %% [3.0] code to copy yytext_ptr to yytext[] goes here, if %array \ */\
 	(yy_c_buf_p) = yy_cp;
 
-/* %% [4.0] data tables for the DFA and the user's section 1 definitions go here */
 #define YY_NUM_RULES 13
 #define YY_END_OF_BUFFER 14
 /* This struct is not used in this scanner,
@@ -610,13 +526,7 @@ static yy_state_type yy_last_accepting_state;
 static char *yy_last_accepting_cpos;
 
 extern int yy_flex_debug;
-int yy_flex_debug = 1;
-
-static yyconst flex_int16_t yy_rule_linenum[13] =
-    {   0,
-       67,   68,   69,   72,   75,   76,   77,   83,   84,   85,
-       87,   90
-    } ;
+int yy_flex_debug = 0;
 
 /* The intent behind this definition is that it'll catch
  * any uses of REJECT which flex missed.
@@ -626,7 +536,6 @@ static yyconst flex_int16_t yy_rule_linenum[13] =
 #define YY_MORE_ADJ 0
 #define YY_RESTORE_YY_MORE_OFFSET
 char *yytext;
-#line 1 "scripts/genksyms/lex.l"
 /* Lexical analysis for genksyms.
    Copyright 1996, 1997 Linux International.
 
@@ -648,23 +557,18 @@ char *yytext;
    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software Foundation,
    Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
-#line 25 "scripts/genksyms/lex.l"
 
 #include <limits.h>
 #include <stdlib.h>
 #include <string.h>
 #include <ctype.h>
 
-#include "genksyms.h"
-#include "parse.h"
-
 /* We've got a two-level lexer here.  We let flex do basic tokenization
    and then we categorize those basic tokens in the second stage.  */
 #define YY_DECL		static int yylex1(void)
 
 /* We don't do multiple input files.  */
 #define YY_NO_INPUT 1
-#line 668 "scripts/genksyms/lex.c"
 
 #define INITIAL 0
 
@@ -673,28 +577,15 @@ char *yytext;
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
 
@@ -724,9 +615,6 @@ int yyget_lineno (void );
 
 void yyset_lineno (int line_number  );
 
-/* %if-bison-bridge */
-/* %endif */
-
 /* Macros after this point can all be overridden by user definitions in
  * section 1.
  */
@@ -739,14 +627,8 @@ extern int yywrap (void );
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
@@ -756,23 +638,15 @@ static int yy_flex_strlen (yyconst char * );
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
@@ -780,14 +654,10 @@ static int input (void );
 
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
+#define ECHO do { if (fwrite( yytext, yyleng, 1, yyout )) {} } while (0)
 #endif
 
 /* Gets input and stuffs it into "buf".  number of characters read, or YY_NULL,
@@ -795,11 +665,10 @@ static int input (void );
  */
 #ifndef YY_INPUT
 #define YY_INPUT(buf,result,max_size) \
-/* %% [5.0] fread()/read() definition of YY_INPUT goes here unless we're doing C++ \ */\
 	if ( YY_CURRENT_BUFFER_LVALUE->yy_is_interactive ) \
 		{ \
 		int c = '*'; \
-		int n; \
+		unsigned n; \
 		for ( n = 0; n < max_size && \
 			     (c = getc( yyin )) != EOF && c != '\n'; ++n ) \
 			buf[n] = (char) c; \
@@ -824,8 +693,6 @@ static int input (void );
 			} \
 		}\
 \
-/* %if-c++-only C++ definition \ */\
-/* %endif */
 
 #endif
 
@@ -844,39 +711,20 @@ static int input (void );
 
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
 
 extern int yylex (void);
 
 #define YY_DECL int yylex (void)
-/* %endif */
-/* %if-c++-only C++ definition */
-/* %endif */
 #endif /* !YY_DECL */
 
 /* Code executed at the beginning of each rule, after yytext and yyleng
@@ -891,15 +739,12 @@ extern int yylex (void);
 #define YY_BREAK break;
 #endif
 
-/* %% [6.0] YY_RULE_SETUP definition goes here */
 #define YY_RULE_SETUP \
 	if ( yyleng > 0 ) \
 		YY_CURRENT_BUFFER_LVALUE->yy_at_bol = \
 				(yytext[yyleng - 1] == '\n'); \
 	YY_USER_ACTION
 
-/* %not-for-header */
-
 /** The main scanner function which does all the work.
  */
 YY_DECL
@@ -908,13 +753,7 @@ YY_DECL
 	register char *yy_cp, *yy_bp;
 	register int yy_act;
     
-/* %% [7.0] user's declarations go here */
-#line 63 "scripts/genksyms/lex.l"
-
-
-
  /* Keep track of our location in the original source files.  */
-#line 918 "scripts/genksyms/lex.c"
 
 	if ( !(yy_init) )
 		{
@@ -928,18 +767,10 @@ YY_DECL
 			(yy_start) = 1;	/* first start state */
 
 		if ( ! yyin )
-/* %if-c-only */
 			yyin = stdin;
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 
 		if ( ! yyout )
-/* %if-c-only */
 			yyout = stdout;
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 
 		if ( ! YY_CURRENT_BUFFER ) {
 			yyensure_buffer_stack ();
@@ -952,7 +783,6 @@ YY_DECL
 
 	while ( 1 )		/* loops until end-of-file is reached */
 		{
-/* %% [8.0] yymore()-related code goes here */
 		yy_cp = (yy_c_buf_p);
 
 		/* Support of yytext. */
@@ -963,7 +793,6 @@ YY_DECL
 		 */
 		yy_bp = yy_cp;
 
-/* %% [9.0] code to set up and find next match goes here */
 		yy_current_state = (yy_start);
 		yy_current_state += YY_AT_BOL();
 yy_match:
@@ -987,7 +816,6 @@ yy_match:
 		while ( yy_base[yy_current_state] != 266 );
 
 yy_find_action:
-/* %% [10.0] code to find the action number goes here */
 		yy_act = yy_accept[yy_current_state];
 		if ( yy_act == 0 )
 			{ /* have to back up */
@@ -998,30 +826,10 @@ yy_find_action:
 
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
@@ -1032,42 +840,35 @@ do_action:	/* This label is used only to access EOF actions. */
 case 1:
 /* rule 1 can match eol */
 YY_RULE_SETUP
-#line 67 "scripts/genksyms/lex.l"
 return FILENAME;
 	YY_BREAK
 case 2:
 /* rule 2 can match eol */
 YY_RULE_SETUP
-#line 68 "scripts/genksyms/lex.l"
 cur_line++;
 	YY_BREAK
 case 3:
 /* rule 3 can match eol */
 YY_RULE_SETUP
-#line 69 "scripts/genksyms/lex.l"
 cur_line++;
 	YY_BREAK
 /* Ignore all other whitespace.  */
 case 4:
 YY_RULE_SETUP
-#line 72 "scripts/genksyms/lex.l"
 ;
 	YY_BREAK
 case 5:
 /* rule 5 can match eol */
 YY_RULE_SETUP
-#line 75 "scripts/genksyms/lex.l"
 return STRING;
 	YY_BREAK
 case 6:
 /* rule 6 can match eol */
 YY_RULE_SETUP
-#line 76 "scripts/genksyms/lex.l"
 return CHAR;
 	YY_BREAK
 case 7:
 YY_RULE_SETUP
-#line 77 "scripts/genksyms/lex.l"
 return IDENT;
 	YY_BREAK
 /* The Pedant requires that the other C multi-character tokens be
@@ -1076,36 +877,29 @@ return IDENT;
     around them properly.  */
 case 8:
 YY_RULE_SETUP
-#line 83 "scripts/genksyms/lex.l"
 return OTHER;
 	YY_BREAK
 case 9:
 YY_RULE_SETUP
-#line 84 "scripts/genksyms/lex.l"
 return INT;
 	YY_BREAK
 case 10:
 YY_RULE_SETUP
-#line 85 "scripts/genksyms/lex.l"
 return REAL;
 	YY_BREAK
 case 11:
 YY_RULE_SETUP
-#line 87 "scripts/genksyms/lex.l"
 return DOTS;
 	YY_BREAK
 /* All other tokens are single characters.  */
 case 12:
 YY_RULE_SETUP
-#line 90 "scripts/genksyms/lex.l"
 return yytext[0];
 	YY_BREAK
 case 13:
 YY_RULE_SETUP
-#line 93 "scripts/genksyms/lex.l"
 ECHO;
 	YY_BREAK
-#line 1109 "scripts/genksyms/lex.c"
 case YY_STATE_EOF(INITIAL):
 	yyterminate();
 
@@ -1172,7 +966,6 @@ case YY_STATE_EOF(INITIAL):
 
 			else
 				{
-/* %% [14.0] code to do back-up for compressed tables and set up yy_cp goes here */
 				yy_cp = (yy_c_buf_p);
 				goto yy_find_action;
 				}
@@ -1238,14 +1031,6 @@ case YY_STATE_EOF(INITIAL):
 	} /* end of action switch */
 		} /* end of scanning one token */
 } /* end of yylex */
-/* %ok-for-header */
-
-/* %if-c++-only */
-/* %not-for-header */
-
-/* %ok-for-header */
-
-/* %endif */
 
 /* yy_get_next_buffer - try to read in a new buffer
  *
@@ -1254,11 +1039,7 @@ case YY_STATE_EOF(INITIAL):
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
@@ -1392,24 +1173,16 @@ static int yy_get_next_buffer (void)
 
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
@@ -1433,15 +1206,10 @@ static int yy_get_next_buffer (void)
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
@@ -1461,12 +1229,7 @@ static int yy_get_next_buffer (void)
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
     
@@ -1498,17 +1261,11 @@ static int yy_get_next_buffer (void)
 
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
@@ -1516,9 +1273,6 @@ static int yy_get_next_buffer (void)
     static int input  (void)
 #endif
 
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 {
 	int c;
     
@@ -1582,25 +1336,18 @@ static int yy_get_next_buffer (void)
 	*(yy_c_buf_p) = '\0';	/* preserve yytext */
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
     void yyrestart  (FILE * input_file )
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 {
     
 	if ( ! YY_CURRENT_BUFFER ){
@@ -1617,11 +1364,7 @@ static int yy_get_next_buffer (void)
  * @param new_buffer The new input buffer.
  * 
  */
-/* %if-c-only */
     void yy_switch_to_buffer  (YY_BUFFER_STATE  new_buffer )
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 {
     
 	/* TODO. We should be able to replace this entire function body
@@ -1652,11 +1395,7 @@ static int yy_get_next_buffer (void)
 	(yy_did_buffer_switch_on_eof) = 1;
 }
 
-/* %if-c-only */
 static void yy_load_buffer_state  (void)
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 {
     	(yy_n_chars) = YY_CURRENT_BUFFER_LVALUE->yy_n_chars;
 	(yytext_ptr) = (yy_c_buf_p) = YY_CURRENT_BUFFER_LVALUE->yy_buf_pos;
@@ -1670,11 +1409,7 @@ static void yy_load_buffer_state  (void)
  * 
  * @return the allocated buffer state.
  */
-/* %if-c-only */
     YY_BUFFER_STATE yy_create_buffer  (FILE * file, int  size )
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 {
 	YY_BUFFER_STATE b;
     
@@ -1702,11 +1437,7 @@ static void yy_load_buffer_state  (void)
  * @param b a buffer created with yy_create_buffer()
  * 
  */
-/* %if-c-only */
     void yy_delete_buffer (YY_BUFFER_STATE  b )
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 {
     
 	if ( ! b )
@@ -1721,26 +1452,15 @@ static void yy_load_buffer_state  (void)
 	yyfree((void *) b  );
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
  * such as during a yyrestart() or at EOF.
  */
-/* %if-c-only */
     static void yy_init_buffer  (YY_BUFFER_STATE  b, FILE * file )
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 
 {
 	int oerrno = errno;
@@ -1759,13 +1479,8 @@ extern int isatty (int );
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
 
@@ -1773,11 +1488,7 @@ extern int isatty (int );
  * @param b the buffer state to be flushed, usually @c YY_CURRENT_BUFFER.
  * 
  */
-/* %if-c-only */
     void yy_flush_buffer (YY_BUFFER_STATE  b )
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 {
     	if ( ! b )
 		return;
@@ -1800,18 +1511,13 @@ extern int isatty (int );
 		yy_load_buffer_state( );
 }
 
-/* %if-c-or-c++ */
 /** Pushes the new state onto the stack. The new state becomes
  *  the current state. This function will allocate the stack
  *  if necessary.
  *  @param new_buffer The new state.
  *  
  */
-/* %if-c-only */
 void yypush_buffer_state (YY_BUFFER_STATE new_buffer )
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 {
     	if (new_buffer == NULL)
 		return;
@@ -1836,18 +1542,12 @@ void yypush_buffer_state (YY_BUFFER_STATE new_buffer )
 	yy_load_buffer_state( );
 	(yy_did_buffer_switch_on_eof) = 1;
 }
-/* %endif */
 
-/* %if-c-or-c++ */
 /** Removes and deletes the top of the stack, if present.
  *  The next element becomes the new top.
  *  
  */
-/* %if-c-only */
 void yypop_buffer_state (void)
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 {
     	if (!YY_CURRENT_BUFFER)
 		return;
@@ -1862,17 +1562,11 @@ void yypop_buffer_state (void)
 		(yy_did_buffer_switch_on_eof) = 1;
 	}
 }
-/* %endif */
 
-/* %if-c-or-c++ */
 /* Allocates the stack if it does not exist.
  *  Guarantees space for at least one push.
  */
-/* %if-c-only */
 static void yyensure_buffer_stack (void)
-/* %endif */
-/* %if-c++-only */
-/* %endif */
 {
 	int num_to_alloc;
     
@@ -1914,9 +1608,7 @@ static void yyensure_buffer_stack (void)
 		(yy_buffer_stack_max) = num_to_alloc;
 	}
 }
-/* %endif */
 
-/* %if-c-only */
 /** Setup the input buffer state to scan directly from a user-specified character buffer.
  * @param base the character buffer
  * @param size the size in bytes of the character buffer
@@ -1951,9 +1643,7 @@ YY_BUFFER_STATE yy_scan_buffer  (char * base, yy_size_t  size )
 
 	return b;
 }
-/* %endif */
 
-/* %if-c-only */
 /** Setup the input buffer state to scan a string. The next call to yylex() will
  * scan from a @e copy of @a str.
  * @param yystr a NUL-terminated string to scan
@@ -1967,9 +1657,7 @@ YY_BUFFER_STATE yy_scan_string (yyconst char * yystr )
     
 	return yy_scan_bytes(yystr,strlen(yystr) );
 }
-/* %endif */
 
-/* %if-c-only */
 /** Setup the input buffer state to scan the given bytes. The next call to yylex() will
  * scan from a @e copy of @a bytes.
  * @param bytes the byte buffer to scan
@@ -2006,21 +1694,16 @@ YY_BUFFER_STATE yy_scan_bytes  (yyconst char * yybytes, int  _yybytes_len )
 
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
 
@@ -2041,10 +1724,6 @@ static void yy_fatal_error (yyconst char* msg )
 
 /* Accessor  methods (get/set functions) to struct members. */
 
-/* %if-c-only */
-/* %if-reentrant */
-/* %endif */
-
 /** Get the current line number.
  * 
  */
@@ -2087,9 +1766,6 @@ char *yyget_text  (void)
         return yytext;
 }
 
-/* %if-reentrant */
-/* %endif */
-
 /** Set the current line number.
  * @param line_number
  * 
@@ -2126,14 +1802,6 @@ void yyset_debug (int  bdebug )
         yy_flex_debug = bdebug ;
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
@@ -2161,9 +1829,7 @@ static int yy_init_globals (void)
      */
     return 0;
 }
-/* %endif */
 
-/* %if-c-only SNIP! this currently causes conflicts with the c++ scanner */
 /* yylex_destroy is for both reentrant and non-reentrant scanners. */
 int yylex_destroy  (void)
 {
@@ -2183,11 +1849,8 @@ int yylex_destroy  (void)
      * yylex() is called, initialization will occur. */
     yy_init_globals( );
 
-/* %if-reentrant */
-/* %endif */
     return 0;
 }
-/* %endif */
 
 /*
  * Internal utility routines.
@@ -2235,21 +1898,11 @@ void yyfree (void * ptr )
 	free( (char *) ptr );	/* see yyrealloc() for (char *) cast */
 }
 
-/* %if-tables-serialization definitions */
-/* %define-yytables   The name for this specific scanner's tables. */
 #define YYTABLES_NAME "yytables"
-/* %endif */
-
-/* %ok-for-header */
-
-#line 93 "scripts/genksyms/lex.l"
-
-
 
 /* Bring in the keyword recognizer.  */
 
-#include "keywords.c"
-
+#include "keywords.hash.c"
 
 /* Macros to append to our phrase collection list.  */
 
@@ -2274,7 +1927,6 @@ void yyfree (void * ptr )
 
 #define APP		_APP(yytext, yyleng)
 
-
 /* The second stage lexer.  Here we incorporate knowledge of the state
    of the parser to tailor the tokens that are returned.  */
 
diff --git a/scripts/genksyms/parse.h_shipped b/scripts/genksyms/parse.h_shipped
deleted file mode 100644
index 5175236..0000000
--- a/scripts/genksyms/parse.h_shipped
+++ /dev/null
@@ -1,97 +0,0 @@
-
-/* A Bison parser, made by GNU Bison 2.4.1.  */
-
-/* Skeleton interface for Bison's Yacc-like parsers in C
-   
-      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
-   Free Software Foundation, Inc.
-   
-   This program is free software: you can redistribute it and/or modify
-   it under the terms of the GNU General Public License as published by
-   the Free Software Foundation, either version 3 of the License, or
-   (at your option) any later version.
-   
-   This program is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-   GNU General Public License for more details.
-   
-   You should have received a copy of the GNU General Public License
-   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
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
-
-
-
-#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
-typedef int YYSTYPE;
-# define YYSTYPE_IS_TRIVIAL 1
-# define yystype YYSTYPE /* obsolescent; will be withdrawn */
-# define YYSTYPE_IS_DECLARED 1
-#endif
-
-extern YYSTYPE yylval;
-
-
diff --git a/scripts/genksyms/parse.c_shipped b/scripts/genksyms/parse.tab.c_shipped
similarity index 92%
rename from scripts/genksyms/parse.c_shipped
rename to scripts/genksyms/parse.tab.c_shipped
index 1a0b860..67f19e7 100644
--- a/scripts/genksyms/parse.c_shipped
+++ b/scripts/genksyms/parse.tab.c_shipped
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
@@ -67,8 +66,6 @@
 
 /* Copy the first part of user declarations.  */
 
-/* Line 189 of yacc.c  */
-#line 24 "scripts/genksyms/parse.y"
 
 
 #include <assert.h>
@@ -101,8 +98,6 @@ remove_list(struct string_list **pb, struct string_list **pe)
 
 
 
-/* Line 189 of yacc.c  */
-#line 106 "scripts/genksyms/parse.c"
 
 /* Enabling traces.  */
 #ifndef YYDEBUG
@@ -186,8 +181,6 @@ typedef int YYSTYPE;
 /* Copy the second part of user declarations.  */
 
 
-/* Line 264 of yacc.c  */
-#line 191 "scripts/genksyms/parse.c"
 
 #ifdef short
 # undef short
@@ -237,7 +230,7 @@ typedef short int yytype_int16;
 #define YYSIZE_MAXIMUM ((YYSIZE_T) -1)
 
 #ifndef YY_
-# if YYENABLE_NLS
+# if defined YYENABLE_NLS && YYENABLE_NLS
 #  if ENABLE_NLS
 #   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
 #   define YY_(msgid) dgettext ("bison-runtime", msgid)
@@ -855,9 +848,18 @@ static const yytype_uint8 yystos[] =
 
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
 
@@ -914,7 +916,7 @@ while (YYID (0))
    we won't break user code: when these are the locations we know.  */
 
 #ifndef YY_LOCATION_PRINT
-# if YYLTYPE_IS_TRIVIAL
+# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
 #  define YY_LOCATION_PRINT(File, Loc)			\
      fprintf (File, "%d.%d-%d.%d",			\
 	      (Loc).first_line, (Loc).first_column,	\
@@ -1653,64 +1655,46 @@ yyreduce:
     {
         case 4:
 
-/* Line 1455 of yacc.c  */
-#line 109 "scripts/genksyms/parse.y"
     { is_typedef = 0; is_extern = 0; current_name = NULL; decl_spec = NULL; ;}
     break;
 
   case 5:
 
-/* Line 1455 of yacc.c  */
-#line 111 "scripts/genksyms/parse.y"
     { free_list(*(yyvsp[(2) - (2)]), NULL); *(yyvsp[(2) - (2)]) = NULL; ;}
     break;
 
   case 6:
 
-/* Line 1455 of yacc.c  */
-#line 115 "scripts/genksyms/parse.y"
     { is_typedef = 1; ;}
     break;
 
   case 7:
 
-/* Line 1455 of yacc.c  */
-#line 116 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(4) - (4)]); ;}
     break;
 
   case 8:
 
-/* Line 1455 of yacc.c  */
-#line 117 "scripts/genksyms/parse.y"
     { is_typedef = 1; ;}
     break;
 
   case 9:
 
-/* Line 1455 of yacc.c  */
-#line 118 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 14:
 
-/* Line 1455 of yacc.c  */
-#line 123 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 15:
 
-/* Line 1455 of yacc.c  */
-#line 124 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 16:
 
-/* Line 1455 of yacc.c  */
-#line 129 "scripts/genksyms/parse.y"
     { if (current_name) {
 		    struct string_list *decl = (*(yyvsp[(3) - (3)]))->next;
 		    (*(yyvsp[(3) - (3)]))->next = NULL;
@@ -1725,15 +1709,11 @@ yyreduce:
 
   case 17:
 
-/* Line 1455 of yacc.c  */
-#line 142 "scripts/genksyms/parse.y"
     { (yyval) = NULL; ;}
     break;
 
   case 19:
 
-/* Line 1455 of yacc.c  */
-#line 148 "scripts/genksyms/parse.y"
     { struct string_list *decl = *(yyvsp[(1) - (1)]);
 		  *(yyvsp[(1) - (1)]) = NULL;
 		  add_symbol(current_name,
@@ -1745,8 +1725,6 @@ yyreduce:
 
   case 20:
 
-/* Line 1455 of yacc.c  */
-#line 156 "scripts/genksyms/parse.y"
     { struct string_list *decl = *(yyvsp[(3) - (3)]);
 		  *(yyvsp[(3) - (3)]) = NULL;
 		  free_list(*(yyvsp[(2) - (3)]), NULL);
@@ -1760,36 +1738,26 @@ yyreduce:
 
   case 21:
 
-/* Line 1455 of yacc.c  */
-#line 169 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(4) - (4)]) ? (yyvsp[(4) - (4)]) : (yyvsp[(3) - (4)]) ? (yyvsp[(3) - (4)]) : (yyvsp[(2) - (4)]) ? (yyvsp[(2) - (4)]) : (yyvsp[(1) - (4)]); ;}
     break;
 
   case 22:
 
-/* Line 1455 of yacc.c  */
-#line 174 "scripts/genksyms/parse.y"
     { decl_spec = NULL; ;}
     break;
 
   case 24:
 
-/* Line 1455 of yacc.c  */
-#line 179 "scripts/genksyms/parse.y"
     { decl_spec = *(yyvsp[(1) - (1)]); ;}
     break;
 
   case 25:
 
-/* Line 1455 of yacc.c  */
-#line 180 "scripts/genksyms/parse.y"
     { decl_spec = *(yyvsp[(2) - (2)]); ;}
     break;
 
   case 26:
 
-/* Line 1455 of yacc.c  */
-#line 185 "scripts/genksyms/parse.y"
     { /* Version 2 checksumming ignores storage class, as that
 		     is really irrelevant to the linkage.  */
 		  remove_node((yyvsp[(1) - (1)]));
@@ -1799,43 +1767,31 @@ yyreduce:
 
   case 31:
 
-/* Line 1455 of yacc.c  */
-#line 197 "scripts/genksyms/parse.y"
     { is_extern = 1; (yyval) = (yyvsp[(1) - (1)]); ;}
     break;
 
   case 32:
 
-/* Line 1455 of yacc.c  */
-#line 198 "scripts/genksyms/parse.y"
     { is_extern = 0; (yyval) = (yyvsp[(1) - (1)]); ;}
     break;
 
   case 37:
 
-/* Line 1455 of yacc.c  */
-#line 210 "scripts/genksyms/parse.y"
     { remove_node((yyvsp[(1) - (2)])); (*(yyvsp[(2) - (2)]))->tag = SYM_STRUCT; (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 38:
 
-/* Line 1455 of yacc.c  */
-#line 212 "scripts/genksyms/parse.y"
     { remove_node((yyvsp[(1) - (2)])); (*(yyvsp[(2) - (2)]))->tag = SYM_UNION; (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 39:
 
-/* Line 1455 of yacc.c  */
-#line 214 "scripts/genksyms/parse.y"
     { remove_node((yyvsp[(1) - (2)])); (*(yyvsp[(2) - (2)]))->tag = SYM_ENUM; (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 40:
 
-/* Line 1455 of yacc.c  */
-#line 218 "scripts/genksyms/parse.y"
     { struct string_list *s = *(yyvsp[(3) - (3)]), *i = *(yyvsp[(2) - (3)]), *r;
 		  r = copy_node(i); r->tag = SYM_STRUCT;
 		  r->next = (*(yyvsp[(1) - (3)]))->next; *(yyvsp[(3) - (3)]) = r; (*(yyvsp[(1) - (3)]))->next = NULL;
@@ -1846,8 +1802,6 @@ yyreduce:
 
   case 41:
 
-/* Line 1455 of yacc.c  */
-#line 225 "scripts/genksyms/parse.y"
     { struct string_list *s = *(yyvsp[(3) - (3)]), *i = *(yyvsp[(2) - (3)]), *r;
 		  r = copy_node(i); r->tag = SYM_UNION;
 		  r->next = (*(yyvsp[(1) - (3)]))->next; *(yyvsp[(3) - (3)]) = r; (*(yyvsp[(1) - (3)]))->next = NULL;
@@ -1858,8 +1812,6 @@ yyreduce:
 
   case 42:
 
-/* Line 1455 of yacc.c  */
-#line 232 "scripts/genksyms/parse.y"
     { struct string_list *s = *(yyvsp[(3) - (3)]), *i = *(yyvsp[(2) - (3)]), *r;
 		  r = copy_node(i); r->tag = SYM_ENUM;
 		  r->next = (*(yyvsp[(1) - (3)]))->next; *(yyvsp[(3) - (3)]) = r; (*(yyvsp[(1) - (3)]))->next = NULL;
@@ -1870,57 +1822,41 @@ yyreduce:
 
   case 43:
 
-/* Line 1455 of yacc.c  */
-#line 242 "scripts/genksyms/parse.y"
     { add_symbol(NULL, SYM_ENUM, NULL, 0); (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 44:
 
-/* Line 1455 of yacc.c  */
-#line 244 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 45:
 
-/* Line 1455 of yacc.c  */
-#line 245 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 56:
 
-/* Line 1455 of yacc.c  */
-#line 259 "scripts/genksyms/parse.y"
     { (*(yyvsp[(1) - (1)]))->tag = SYM_TYPEDEF; (yyval) = (yyvsp[(1) - (1)]); ;}
     break;
 
   case 57:
 
-/* Line 1455 of yacc.c  */
-#line 264 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]) ? (yyvsp[(2) - (2)]) : (yyvsp[(1) - (2)]); ;}
     break;
 
   case 58:
 
-/* Line 1455 of yacc.c  */
-#line 268 "scripts/genksyms/parse.y"
     { (yyval) = NULL; ;}
     break;
 
   case 61:
 
-/* Line 1455 of yacc.c  */
-#line 274 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 65:
 
-/* Line 1455 of yacc.c  */
-#line 280 "scripts/genksyms/parse.y"
     { /* restrict has no effect in prototypes so ignore it */
 		  remove_node((yyvsp[(1) - (1)]));
 		  (yyval) = (yyvsp[(1) - (1)]);
@@ -1929,15 +1865,11 @@ yyreduce:
 
   case 66:
 
-/* Line 1455 of yacc.c  */
-#line 287 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 68:
 
-/* Line 1455 of yacc.c  */
-#line 293 "scripts/genksyms/parse.y"
     { if (current_name != NULL) {
 		    error_with_pos("unexpected second declaration name");
 		    YYERROR;
@@ -1950,134 +1882,96 @@ yyreduce:
 
   case 69:
 
-/* Line 1455 of yacc.c  */
-#line 302 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(4) - (4)]); ;}
     break;
 
   case 70:
 
-/* Line 1455 of yacc.c  */
-#line 304 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(4) - (4)]); ;}
     break;
 
   case 71:
 
-/* Line 1455 of yacc.c  */
-#line 306 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 72:
 
-/* Line 1455 of yacc.c  */
-#line 308 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 73:
 
-/* Line 1455 of yacc.c  */
-#line 310 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 74:
 
-/* Line 1455 of yacc.c  */
-#line 316 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 78:
 
-/* Line 1455 of yacc.c  */
-#line 324 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(4) - (4)]); ;}
     break;
 
   case 79:
 
-/* Line 1455 of yacc.c  */
-#line 326 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(4) - (4)]); ;}
     break;
 
   case 80:
 
-/* Line 1455 of yacc.c  */
-#line 328 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 81:
 
-/* Line 1455 of yacc.c  */
-#line 330 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 82:
 
-/* Line 1455 of yacc.c  */
-#line 332 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 83:
 
-/* Line 1455 of yacc.c  */
-#line 336 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 85:
 
-/* Line 1455 of yacc.c  */
-#line 338 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 86:
 
-/* Line 1455 of yacc.c  */
-#line 342 "scripts/genksyms/parse.y"
     { (yyval) = NULL; ;}
     break;
 
   case 89:
 
-/* Line 1455 of yacc.c  */
-#line 349 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 90:
 
-/* Line 1455 of yacc.c  */
-#line 354 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]) ? (yyvsp[(2) - (2)]) : (yyvsp[(1) - (2)]); ;}
     break;
 
   case 91:
 
-/* Line 1455 of yacc.c  */
-#line 359 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]) ? (yyvsp[(2) - (2)]) : (yyvsp[(1) - (2)]); ;}
     break;
 
   case 93:
 
-/* Line 1455 of yacc.c  */
-#line 364 "scripts/genksyms/parse.y"
     { (yyval) = NULL; ;}
     break;
 
   case 94:
 
-/* Line 1455 of yacc.c  */
-#line 366 "scripts/genksyms/parse.y"
     { /* For version 2 checksums, we don't want to remember
 		     private parameter names.  */
 		  remove_node((yyvsp[(1) - (1)]));
@@ -2087,8 +1981,6 @@ yyreduce:
 
   case 95:
 
-/* Line 1455 of yacc.c  */
-#line 374 "scripts/genksyms/parse.y"
     { remove_node((yyvsp[(1) - (1)]));
 		  (yyval) = (yyvsp[(1) - (1)]);
 		;}
@@ -2096,43 +1988,31 @@ yyreduce:
 
   case 96:
 
-/* Line 1455 of yacc.c  */
-#line 378 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(4) - (4)]); ;}
     break;
 
   case 97:
 
-/* Line 1455 of yacc.c  */
-#line 380 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(4) - (4)]); ;}
     break;
 
   case 98:
 
-/* Line 1455 of yacc.c  */
-#line 382 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 99:
 
-/* Line 1455 of yacc.c  */
-#line 384 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 100:
 
-/* Line 1455 of yacc.c  */
-#line 386 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 101:
 
-/* Line 1455 of yacc.c  */
-#line 391 "scripts/genksyms/parse.y"
     { struct string_list *decl = *(yyvsp[(2) - (3)]);
 		  *(yyvsp[(2) - (3)]) = NULL;
 		  add_symbol(current_name, SYM_NORMAL, decl, is_extern);
@@ -2142,120 +2022,86 @@ yyreduce:
 
   case 102:
 
-/* Line 1455 of yacc.c  */
-#line 399 "scripts/genksyms/parse.y"
     { (yyval) = NULL; ;}
     break;
 
   case 104:
 
-/* Line 1455 of yacc.c  */
-#line 406 "scripts/genksyms/parse.y"
     { remove_list((yyvsp[(2) - (2)]), &(*(yyvsp[(1) - (2)]))->next); (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 105:
 
-/* Line 1455 of yacc.c  */
-#line 410 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 106:
 
-/* Line 1455 of yacc.c  */
-#line 411 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 107:
 
-/* Line 1455 of yacc.c  */
-#line 415 "scripts/genksyms/parse.y"
     { (yyval) = NULL; ;}
     break;
 
   case 110:
 
-/* Line 1455 of yacc.c  */
-#line 421 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 111:
 
-/* Line 1455 of yacc.c  */
-#line 426 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 112:
 
-/* Line 1455 of yacc.c  */
-#line 428 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 113:
 
-/* Line 1455 of yacc.c  */
-#line 432 "scripts/genksyms/parse.y"
     { (yyval) = NULL; ;}
     break;
 
   case 116:
 
-/* Line 1455 of yacc.c  */
-#line 438 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 117:
 
-/* Line 1455 of yacc.c  */
-#line 442 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]) ? (yyvsp[(2) - (2)]) : (yyvsp[(1) - (2)]); ;}
     break;
 
   case 118:
 
-/* Line 1455 of yacc.c  */
-#line 443 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 120:
 
-/* Line 1455 of yacc.c  */
-#line 448 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 121:
 
-/* Line 1455 of yacc.c  */
-#line 452 "scripts/genksyms/parse.y"
     { (yyval) = NULL; ;}
     break;
 
   case 123:
 
-/* Line 1455 of yacc.c  */
-#line 457 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(3) - (3)]); ;}
     break;
 
   case 124:
 
-/* Line 1455 of yacc.c  */
-#line 458 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(4) - (4)]); ;}
     break;
 
   case 127:
 
-/* Line 1455 of yacc.c  */
-#line 467 "scripts/genksyms/parse.y"
     {
 			const char *name = strdup((*(yyvsp[(1) - (1)]))->string);
 			add_symbol(name, SYM_ENUM_CONST, NULL, 0);
@@ -2264,8 +2110,6 @@ yyreduce:
 
   case 128:
 
-/* Line 1455 of yacc.c  */
-#line 472 "scripts/genksyms/parse.y"
     {
 			const char *name = strdup((*(yyvsp[(1) - (3)]))->string);
 			struct string_list *expr = copy_list_range(*(yyvsp[(3) - (3)]), *(yyvsp[(2) - (3)]));
@@ -2275,29 +2119,21 @@ yyreduce:
 
   case 129:
 
-/* Line 1455 of yacc.c  */
-#line 479 "scripts/genksyms/parse.y"
     { (yyval) = (yyvsp[(2) - (2)]); ;}
     break;
 
   case 130:
 
-/* Line 1455 of yacc.c  */
-#line 483 "scripts/genksyms/parse.y"
     { (yyval) = NULL; ;}
     break;
 
   case 132:
 
-/* Line 1455 of yacc.c  */
-#line 489 "scripts/genksyms/parse.y"
     { export_symbol((*(yyvsp[(3) - (5)]))->string); (yyval) = (yyvsp[(5) - (5)]); ;}
     break;
 
 
 
-/* Line 1455 of yacc.c  */
-#line 2301 "scripts/genksyms/parse.c"
       default: break;
     }
   YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);
@@ -2508,8 +2344,6 @@ yyreturn:
 
 
 
-/* Line 1675 of yacc.c  */
-#line 493 "scripts/genksyms/parse.y"
 
 
 static void
@@ -2518,3 +2352,5 @@ yyerror(const char *e)
   error_with_pos("%s", e);
 }
 
+#include "lex.lex.c"
+
-- 
1.7.3.4.574.g608b.dirty

