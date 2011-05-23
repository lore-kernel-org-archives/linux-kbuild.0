Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:45855 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753933Ab1EWILQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 04:11:16 -0400
Received: by mail-iy0-f174.google.com with SMTP id 14so4457027iyb.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2011 01:11:16 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFCv2 13/13] dtc: regen parser
Date: Mon, 23 May 2011 04:10:39 -0400
Message-Id: <1306138239-13440-14-git-send-email-lacombar@gmail.com>
In-Reply-To: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>, David Gibson <david@gibson.dropbear.id.au>

Cc: David Gibson <david@gibson.dropbear.id.au>
---
 scripts/dtc/dtc-lexer.lex.c_shipped  |   60 ++----------------
 scripts/dtc/dtc-parser.tab.c_shipped |  118 ++++++----------------------------
 scripts/dtc/dtc-parser.tab.h_shipped |   91 --------------------------
 3 files changed, 24 insertions(+), 245 deletions(-)
 delete mode 100644 scripts/dtc/dtc-parser.tab.h_shipped

diff --git a/scripts/dtc/dtc-lexer.lex.c_shipped b/scripts/dtc/dtc-lexer.lex.c_shipped
index 50c4420..db944de 100644
--- a/scripts/dtc/dtc-lexer.lex.c_shipped
+++ b/scripts/dtc/dtc-lexer.lex.c_shipped
@@ -1,6 +1,5 @@
-#line 2 "dtc-lexer.lex.c"
 
-#line 4 "dtc-lexer.lex.c"
+#line 3 "scripts/dtc/dtc-lexer.lex.c_shipped"
 
 #define  YY_INT_ALIGNED short int
 
@@ -54,6 +53,7 @@ typedef int flex_int32_t;
 typedef unsigned char flex_uint8_t; 
 typedef unsigned short int flex_uint16_t;
 typedef unsigned int flex_uint32_t;
+#endif /* ! C99 */
 
 /* Limits of integral types. */
 #ifndef INT8_MIN
@@ -84,8 +84,6 @@ typedef unsigned int flex_uint32_t;
 #define UINT32_MAX             (4294967295U)
 #endif
 
-#endif /* ! C99 */
-
 #endif /* ! FLEXINT_H */
 
 #ifdef __cplusplus
@@ -142,15 +140,7 @@ typedef unsigned int flex_uint32_t;
 
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
@@ -550,7 +540,6 @@ int yy_flex_debug = 0;
 #define YY_MORE_ADJ 0
 #define YY_RESTORE_YY_MORE_OFFSET
 char *yytext;
-#line 1 "dtc-lexer.l"
 /*
  * (C) Copyright David Gibson <dwg@au1.ibm.com>, IBM Corporation.  2005.
  *
@@ -572,13 +561,8 @@ char *yytext;
  */
 #define YY_NO_INPUT 1
 
-
-
-
-#line 37 "dtc-lexer.l"
 #include "dtc.h"
 #include "srcpos.h"
-#include "dtc-parser.tab.h"
 
 YYLTYPE yylloc;
 
@@ -603,7 +587,6 @@ static int dts_version = 1;
 
 static void push_input_file(const char *filename);
 static int pop_input_file(void);
-#line 607 "dtc-lexer.lex.c"
 
 #define INITIAL 0
 #define INCLUDE 1
@@ -686,12 +669,7 @@ static int input (void );
 
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
@@ -710,7 +688,7 @@ static int input (void );
 	if ( YY_CURRENT_BUFFER_LVALUE->yy_is_interactive ) \
 		{ \
 		int c = '*'; \
-		size_t n; \
+		unsigned n; \
 		for ( n = 0; n < max_size && \
 			     (c = getc( yyin )) != EOF && c != '\n'; ++n ) \
 			buf[n] = (char) c; \
@@ -792,10 +770,6 @@ YY_DECL
 	register char *yy_cp, *yy_bp;
 	register int yy_act;
     
-#line 66 "dtc-lexer.l"
-
-#line 798 "dtc-lexer.lex.c"
-
 	if ( !(yy_init) )
 		{
 		(yy_init) = 1;
@@ -876,7 +850,6 @@ do_action:	/* This label is used only to access EOF actions. */
 case 1:
 /* rule 1 can match eol */
 YY_RULE_SETUP
-#line 67 "dtc-lexer.l"
 {
 			char *name = strchr(yytext, '\"') + 1;
 			yytext[yyleng-1] = '\0';
@@ -888,7 +861,6 @@ case YY_STATE_EOF(INCLUDE):
 case YY_STATE_EOF(BYTESTRING):
 case YY_STATE_EOF(PROPNODENAME):
 case YY_STATE_EOF(V1):
-#line 73 "dtc-lexer.l"
 {
 			if (!pop_input_file()) {
 				yyterminate();
@@ -898,7 +870,6 @@ case YY_STATE_EOF(V1):
 case 2:
 /* rule 2 can match eol */
 YY_RULE_SETUP
-#line 79 "dtc-lexer.l"
 {
 			DPRINT("String: %s\n", yytext);
 			yylval.data = data_copy_escape_string(yytext+1,
@@ -908,7 +879,6 @@ YY_RULE_SETUP
 	YY_BREAK
 case 3:
 YY_RULE_SETUP
-#line 86 "dtc-lexer.l"
 {
 			DPRINT("Keyword: /dts-v1/\n");
 			dts_version = 1;
@@ -918,7 +888,6 @@ YY_RULE_SETUP
 	YY_BREAK
 case 4:
 YY_RULE_SETUP
-#line 93 "dtc-lexer.l"
 {
 			DPRINT("Keyword: /memreserve/\n");
 			BEGIN_DEFAULT();
@@ -927,7 +896,6 @@ YY_RULE_SETUP
 	YY_BREAK
 case 5:
 YY_RULE_SETUP
-#line 99 "dtc-lexer.l"
 {
 			DPRINT("Label: %s\n", yytext);
 			yylval.labelref = xstrdup(yytext);
@@ -937,7 +905,6 @@ YY_RULE_SETUP
 	YY_BREAK
 case 6:
 YY_RULE_SETUP
-#line 106 "dtc-lexer.l"
 {
 			yylval.literal = xstrdup(yytext);
 			DPRINT("Literal: '%s'\n", yylval.literal);
@@ -946,7 +913,6 @@ YY_RULE_SETUP
 	YY_BREAK
 case 7:
 YY_RULE_SETUP
-#line 112 "dtc-lexer.l"
 {	/* label reference */
 			DPRINT("Ref: %s\n", yytext+1);
 			yylval.labelref = xstrdup(yytext+1);
@@ -955,7 +921,6 @@ YY_RULE_SETUP
 	YY_BREAK
 case 8:
 YY_RULE_SETUP
-#line 118 "dtc-lexer.l"
 {	/* new-style path reference */
 			yytext[yyleng-1] = '\0';
 			DPRINT("Ref: %s\n", yytext+2);
@@ -965,7 +930,6 @@ YY_RULE_SETUP
 	YY_BREAK
 case 9:
 YY_RULE_SETUP
-#line 125 "dtc-lexer.l"
 {
 			yylval.byte = strtol(yytext, NULL, 16);
 			DPRINT("Byte: %02x\n", (int)yylval.byte);
@@ -974,7 +938,6 @@ YY_RULE_SETUP
 	YY_BREAK
 case 10:
 YY_RULE_SETUP
-#line 131 "dtc-lexer.l"
 {
 			DPRINT("/BYTESTRING\n");
 			BEGIN_DEFAULT();
@@ -983,7 +946,6 @@ YY_RULE_SETUP
 	YY_BREAK
 case 11:
 YY_RULE_SETUP
-#line 137 "dtc-lexer.l"
 {
 			DPRINT("PropNodeName: %s\n", yytext);
 			yylval.propnodename = xstrdup(yytext);
@@ -993,7 +955,6 @@ YY_RULE_SETUP
 	YY_BREAK
 case 12:
 YY_RULE_SETUP
-#line 144 "dtc-lexer.l"
 {
 			DPRINT("Binary Include\n");
 			return DT_INCBIN;
@@ -1002,24 +963,20 @@ YY_RULE_SETUP
 case 13:
 /* rule 13 can match eol */
 YY_RULE_SETUP
-#line 149 "dtc-lexer.l"
 /* eat whitespace */
 	YY_BREAK
 case 14:
 /* rule 14 can match eol */
 YY_RULE_SETUP
-#line 150 "dtc-lexer.l"
 /* eat C-style comments */
 	YY_BREAK
 case 15:
 /* rule 15 can match eol */
 YY_RULE_SETUP
-#line 151 "dtc-lexer.l"
 /* eat C++-style comments */
 	YY_BREAK
 case 16:
 YY_RULE_SETUP
-#line 153 "dtc-lexer.l"
 {
 			DPRINT("Char: %c (\\x%02x)\n", yytext[0],
 				(unsigned)yytext[0]);
@@ -1037,10 +994,8 @@ YY_RULE_SETUP
 	YY_BREAK
 case 17:
 YY_RULE_SETUP
-#line 168 "dtc-lexer.l"
 ECHO;
 	YY_BREAK
-#line 1044 "dtc-lexer.lex.c"
 
 	case YY_END_OF_BUFFER:
 		{
@@ -1756,8 +1711,8 @@ YY_BUFFER_STATE yy_scan_string (yyconst char * yystr )
 
 /** Setup the input buffer state to scan the given bytes. The next call to yylex() will
  * scan from a @e copy of @a bytes.
- * @param yybytes the byte buffer to scan
- * @param _yybytes_len the number of bytes in the buffer pointed to by @a bytes.
+ * @param bytes the byte buffer to scan
+ * @param len the number of bytes in the buffer pointed to by @a bytes.
  * 
  * @return the newly allocated buffer state object.
  */
@@ -1996,10 +1951,6 @@ void yyfree (void * ptr )
 
 #define YYTABLES_NAME "yytables"
 
-#line 168 "dtc-lexer.l"
-
-
-
 static void push_input_file(const char *filename)
 {
 	assert(filename);
@@ -2011,7 +1962,6 @@ static void push_input_file(const char *filename)
 	yypush_buffer_state(yy_create_buffer(yyin,YY_BUF_SIZE));
 }
 
-
 static int pop_input_file(void)
 {
 	if (srcfile_pop() == 0)
diff --git a/scripts/dtc/dtc-parser.tab.c_shipped b/scripts/dtc/dtc-parser.tab.c_shipped
index 9be2eea..c848aeb 100644
--- a/scripts/dtc/dtc-parser.tab.c_shipped
+++ b/scripts/dtc/dtc-parser.tab.c_shipped
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
-#line 21 "dtc-parser.y"
 
 #include <stdio.h>
 
@@ -87,12 +84,10 @@ extern int treesource_error;
 static unsigned long long eval_literal(const char *s, int base, int bits);
 
 
-/* Line 189 of yacc.c  */
-#line 92 "dtc-parser.tab.c"
 
 /* Enabling traces.  */
 #ifndef YYDEBUG
-# define YYDEBUG 0
+# define YYDEBUG 1
 #endif
 
 /* Enabling verbose error messages.  */
@@ -134,8 +129,6 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
 typedef union YYSTYPE
 {
 
-/* Line 214 of yacc.c  */
-#line 39 "dtc-parser.y"
 
 	char *propnodename;
 	char *literal;
@@ -154,8 +147,6 @@ typedef union YYSTYPE
 
 
 
-/* Line 214 of yacc.c  */
-#line 159 "dtc-parser.tab.c"
 } YYSTYPE;
 # define YYSTYPE_IS_TRIVIAL 1
 # define yystype YYSTYPE /* obsolescent; will be withdrawn */
@@ -166,8 +157,6 @@ typedef union YYSTYPE
 /* Copy the second part of user declarations.  */
 
 
-/* Line 264 of yacc.c  */
-#line 171 "dtc-parser.tab.c"
 
 #ifdef short
 # undef short
@@ -217,7 +206,7 @@ typedef short int yytype_int16;
 #define YYSIZE_MAXIMUM ((YYSIZE_T) -1)
 
 #ifndef YY_
-# if YYENABLE_NLS
+# if defined YYENABLE_NLS && YYENABLE_NLS
 #  if ENABLE_NLS
 #   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
 #   define YY_(msgid) dgettext ("bison-runtime", msgid)
@@ -607,9 +596,18 @@ static const yytype_uint8 yystos[] =
 
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
 
@@ -666,7 +664,7 @@ while (YYID (0))
    we won't break user code: when these are the locations we know.  */
 
 #ifndef YY_LOCATION_PRINT
-# if YYLTYPE_IS_TRIVIAL
+# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
 #  define YY_LOCATION_PRINT(File, Loc)			\
      fprintf (File, "%d.%d-%d.%d",			\
 	      (Loc).first_line, (Loc).first_column,	\
@@ -1405,8 +1403,6 @@ yyreduce:
     {
         case 2:
 
-/* Line 1455 of yacc.c  */
-#line 87 "dtc-parser.y"
     {
 			the_boot_info = build_boot_info((yyvsp[(3) - (4)].re), (yyvsp[(4) - (4)].node),
 							guess_boot_cpuid((yyvsp[(4) - (4)].node)));
@@ -1415,8 +1411,6 @@ yyreduce:
 
   case 3:
 
-/* Line 1455 of yacc.c  */
-#line 95 "dtc-parser.y"
     {
 			(yyval.re) = NULL;
 		;}
@@ -1424,8 +1418,6 @@ yyreduce:
 
   case 4:
 
-/* Line 1455 of yacc.c  */
-#line 99 "dtc-parser.y"
     {
 			(yyval.re) = chain_reserve_entry((yyvsp[(1) - (2)].re), (yyvsp[(2) - (2)].re));
 		;}
@@ -1433,8 +1425,6 @@ yyreduce:
 
   case 5:
 
-/* Line 1455 of yacc.c  */
-#line 106 "dtc-parser.y"
     {
 			(yyval.re) = build_reserve_entry((yyvsp[(2) - (4)].addr), (yyvsp[(3) - (4)].addr));
 		;}
@@ -1442,8 +1432,6 @@ yyreduce:
 
   case 6:
 
-/* Line 1455 of yacc.c  */
-#line 110 "dtc-parser.y"
     {
 			add_label(&(yyvsp[(2) - (2)].re)->labels, (yyvsp[(1) - (2)].labelref));
 			(yyval.re) = (yyvsp[(2) - (2)].re);
@@ -1452,8 +1440,6 @@ yyreduce:
 
   case 7:
 
-/* Line 1455 of yacc.c  */
-#line 118 "dtc-parser.y"
     {
 			(yyval.addr) = eval_literal((yyvsp[(1) - (1)].literal), 0, 64);
 		;}
@@ -1461,8 +1447,6 @@ yyreduce:
 
   case 8:
 
-/* Line 1455 of yacc.c  */
-#line 125 "dtc-parser.y"
     {
 			(yyval.node) = name_node((yyvsp[(2) - (2)].node), "");
 		;}
@@ -1470,8 +1454,6 @@ yyreduce:
 
   case 9:
 
-/* Line 1455 of yacc.c  */
-#line 129 "dtc-parser.y"
     {
 			(yyval.node) = merge_nodes((yyvsp[(1) - (3)].node), (yyvsp[(3) - (3)].node));
 		;}
@@ -1479,8 +1461,6 @@ yyreduce:
 
   case 10:
 
-/* Line 1455 of yacc.c  */
-#line 133 "dtc-parser.y"
     {
 			struct node *target = get_node_by_ref((yyvsp[(1) - (3)].node), (yyvsp[(2) - (3)].labelref));
 
@@ -1494,8 +1474,6 @@ yyreduce:
 
   case 11:
 
-/* Line 1455 of yacc.c  */
-#line 146 "dtc-parser.y"
     {
 			(yyval.node) = build_node((yyvsp[(2) - (5)].proplist), (yyvsp[(3) - (5)].nodelist));
 		;}
@@ -1503,8 +1481,6 @@ yyreduce:
 
   case 12:
 
-/* Line 1455 of yacc.c  */
-#line 153 "dtc-parser.y"
     {
 			(yyval.proplist) = NULL;
 		;}
@@ -1512,8 +1488,6 @@ yyreduce:
 
   case 13:
 
-/* Line 1455 of yacc.c  */
-#line 157 "dtc-parser.y"
     {
 			(yyval.proplist) = chain_property((yyvsp[(2) - (2)].prop), (yyvsp[(1) - (2)].proplist));
 		;}
@@ -1521,8 +1495,6 @@ yyreduce:
 
   case 14:
 
-/* Line 1455 of yacc.c  */
-#line 164 "dtc-parser.y"
     {
 			(yyval.prop) = build_property((yyvsp[(1) - (4)].propnodename), (yyvsp[(3) - (4)].data));
 		;}
@@ -1530,8 +1502,6 @@ yyreduce:
 
   case 15:
 
-/* Line 1455 of yacc.c  */
-#line 168 "dtc-parser.y"
     {
 			(yyval.prop) = build_property((yyvsp[(1) - (2)].propnodename), empty_data);
 		;}
@@ -1539,8 +1509,6 @@ yyreduce:
 
   case 16:
 
-/* Line 1455 of yacc.c  */
-#line 172 "dtc-parser.y"
     {
 			add_label(&(yyvsp[(2) - (2)].prop)->labels, (yyvsp[(1) - (2)].labelref));
 			(yyval.prop) = (yyvsp[(2) - (2)].prop);
@@ -1549,8 +1517,6 @@ yyreduce:
 
   case 17:
 
-/* Line 1455 of yacc.c  */
-#line 180 "dtc-parser.y"
     {
 			(yyval.data) = data_merge((yyvsp[(1) - (2)].data), (yyvsp[(2) - (2)].data));
 		;}
@@ -1558,8 +1524,6 @@ yyreduce:
 
   case 18:
 
-/* Line 1455 of yacc.c  */
-#line 184 "dtc-parser.y"
     {
 			(yyval.data) = data_merge((yyvsp[(1) - (4)].data), (yyvsp[(3) - (4)].data));
 		;}
@@ -1567,8 +1531,6 @@ yyreduce:
 
   case 19:
 
-/* Line 1455 of yacc.c  */
-#line 188 "dtc-parser.y"
     {
 			(yyval.data) = data_merge((yyvsp[(1) - (4)].data), (yyvsp[(3) - (4)].data));
 		;}
@@ -1576,8 +1538,6 @@ yyreduce:
 
   case 20:
 
-/* Line 1455 of yacc.c  */
-#line 192 "dtc-parser.y"
     {
 			(yyval.data) = data_add_marker((yyvsp[(1) - (2)].data), REF_PATH, (yyvsp[(2) - (2)].labelref));
 		;}
@@ -1585,8 +1545,6 @@ yyreduce:
 
   case 21:
 
-/* Line 1455 of yacc.c  */
-#line 196 "dtc-parser.y"
     {
 			FILE *f = srcfile_relative_open((yyvsp[(4) - (9)].data).val, NULL);
 			struct data d;
@@ -1607,8 +1565,6 @@ yyreduce:
 
   case 22:
 
-/* Line 1455 of yacc.c  */
-#line 213 "dtc-parser.y"
     {
 			FILE *f = srcfile_relative_open((yyvsp[(4) - (5)].data).val, NULL);
 			struct data d = empty_data;
@@ -1622,8 +1578,6 @@ yyreduce:
 
   case 23:
 
-/* Line 1455 of yacc.c  */
-#line 223 "dtc-parser.y"
     {
 			(yyval.data) = data_add_marker((yyvsp[(1) - (2)].data), LABEL, (yyvsp[(2) - (2)].labelref));
 		;}
@@ -1631,8 +1585,6 @@ yyreduce:
 
   case 24:
 
-/* Line 1455 of yacc.c  */
-#line 230 "dtc-parser.y"
     {
 			(yyval.data) = empty_data;
 		;}
@@ -1640,8 +1592,6 @@ yyreduce:
 
   case 25:
 
-/* Line 1455 of yacc.c  */
-#line 234 "dtc-parser.y"
     {
 			(yyval.data) = (yyvsp[(1) - (2)].data);
 		;}
@@ -1649,8 +1599,6 @@ yyreduce:
 
   case 26:
 
-/* Line 1455 of yacc.c  */
-#line 238 "dtc-parser.y"
     {
 			(yyval.data) = data_add_marker((yyvsp[(1) - (2)].data), LABEL, (yyvsp[(2) - (2)].labelref));
 		;}
@@ -1658,8 +1606,6 @@ yyreduce:
 
   case 27:
 
-/* Line 1455 of yacc.c  */
-#line 245 "dtc-parser.y"
     {
 			(yyval.data) = empty_data;
 		;}
@@ -1667,8 +1613,6 @@ yyreduce:
 
   case 28:
 
-/* Line 1455 of yacc.c  */
-#line 249 "dtc-parser.y"
     {
 			(yyval.data) = data_append_cell((yyvsp[(1) - (2)].data), (yyvsp[(2) - (2)].cell));
 		;}
@@ -1676,8 +1620,6 @@ yyreduce:
 
   case 29:
 
-/* Line 1455 of yacc.c  */
-#line 253 "dtc-parser.y"
     {
 			(yyval.data) = data_append_cell(data_add_marker((yyvsp[(1) - (2)].data), REF_PHANDLE,
 							      (yyvsp[(2) - (2)].labelref)), -1);
@@ -1686,8 +1628,6 @@ yyreduce:
 
   case 30:
 
-/* Line 1455 of yacc.c  */
-#line 258 "dtc-parser.y"
     {
 			(yyval.data) = data_add_marker((yyvsp[(1) - (2)].data), LABEL, (yyvsp[(2) - (2)].labelref));
 		;}
@@ -1695,8 +1635,6 @@ yyreduce:
 
   case 31:
 
-/* Line 1455 of yacc.c  */
-#line 265 "dtc-parser.y"
     {
 			(yyval.cell) = eval_literal((yyvsp[(1) - (1)].literal), 0, 32);
 		;}
@@ -1704,8 +1642,6 @@ yyreduce:
 
   case 32:
 
-/* Line 1455 of yacc.c  */
-#line 272 "dtc-parser.y"
     {
 			(yyval.data) = empty_data;
 		;}
@@ -1713,8 +1649,6 @@ yyreduce:
 
   case 33:
 
-/* Line 1455 of yacc.c  */
-#line 276 "dtc-parser.y"
     {
 			(yyval.data) = data_append_byte((yyvsp[(1) - (2)].data), (yyvsp[(2) - (2)].byte));
 		;}
@@ -1722,8 +1656,6 @@ yyreduce:
 
   case 34:
 
-/* Line 1455 of yacc.c  */
-#line 280 "dtc-parser.y"
     {
 			(yyval.data) = data_add_marker((yyvsp[(1) - (2)].data), LABEL, (yyvsp[(2) - (2)].labelref));
 		;}
@@ -1731,8 +1663,6 @@ yyreduce:
 
   case 35:
 
-/* Line 1455 of yacc.c  */
-#line 287 "dtc-parser.y"
     {
 			(yyval.nodelist) = NULL;
 		;}
@@ -1740,8 +1670,6 @@ yyreduce:
 
   case 36:
 
-/* Line 1455 of yacc.c  */
-#line 291 "dtc-parser.y"
     {
 			(yyval.nodelist) = chain_node((yyvsp[(1) - (2)].node), (yyvsp[(2) - (2)].nodelist));
 		;}
@@ -1749,8 +1677,6 @@ yyreduce:
 
   case 37:
 
-/* Line 1455 of yacc.c  */
-#line 295 "dtc-parser.y"
     {
 			print_error("syntax error: properties must precede subnodes");
 			YYERROR;
@@ -1759,8 +1685,6 @@ yyreduce:
 
   case 38:
 
-/* Line 1455 of yacc.c  */
-#line 303 "dtc-parser.y"
     {
 			(yyval.node) = name_node((yyvsp[(2) - (2)].node), (yyvsp[(1) - (2)].propnodename));
 		;}
@@ -1768,8 +1692,6 @@ yyreduce:
 
   case 39:
 
-/* Line 1455 of yacc.c  */
-#line 307 "dtc-parser.y"
     {
 			add_label(&(yyvsp[(2) - (2)].node)->labels, (yyvsp[(1) - (2)].labelref));
 			(yyval.node) = (yyvsp[(2) - (2)].node);
@@ -1778,8 +1700,6 @@ yyreduce:
 
 
 
-/* Line 1455 of yacc.c  */
-#line 1783 "dtc-parser.tab.c"
       default: break;
     }
   YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);
@@ -1990,8 +1910,6 @@ yyreturn:
 
 
 
-/* Line 1675 of yacc.c  */
-#line 313 "dtc-parser.y"
 
 
 void print_error(char const *fmt, ...)
@@ -2026,3 +1944,5 @@ static unsigned long long eval_literal(const char *s, int base, int bits)
 	return val;
 }
 
+#include "dtc-lexer.lex.c"
+
diff --git a/scripts/dtc/dtc-parser.tab.h_shipped b/scripts/dtc/dtc-parser.tab.h_shipped
deleted file mode 100644
index 95c9547..0000000
--- a/scripts/dtc/dtc-parser.tab.h_shipped
+++ /dev/null
@@ -1,91 +0,0 @@
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
-     DT_V1 = 258,
-     DT_MEMRESERVE = 259,
-     DT_PROPNODENAME = 260,
-     DT_LITERAL = 261,
-     DT_BASE = 262,
-     DT_BYTE = 263,
-     DT_STRING = 264,
-     DT_LABEL = 265,
-     DT_REF = 266,
-     DT_INCBIN = 267
-   };
-#endif
-
-
-
-#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
-typedef union YYSTYPE
-{
-
-/* Line 1676 of yacc.c  */
-#line 39 "dtc-parser.y"
-
-	char *propnodename;
-	char *literal;
-	char *labelref;
-	unsigned int cbase;
-	uint8_t byte;
-	struct data data;
-
-	uint64_t addr;
-	cell_t cell;
-	struct property *prop;
-	struct property *proplist;
-	struct node *node;
-	struct node *nodelist;
-	struct reserve_info *re;
-
-
-
-/* Line 1676 of yacc.c  */
-#line 83 "dtc-parser.tab.h"
-} YYSTYPE;
-# define YYSTYPE_IS_TRIVIAL 1
-# define yystype YYSTYPE /* obsolescent; will be withdrawn */
-# define YYSTYPE_IS_DECLARED 1
-#endif
-
-extern YYSTYPE yylval;
-
-
-- 
1.7.3.4.574.g608b.dirty

