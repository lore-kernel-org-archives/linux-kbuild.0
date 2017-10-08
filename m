Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:55131 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753758AbdJHRMX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Oct 2017 13:12:23 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 6/6] kconfig: Regenerate parser
Date: Sun,  8 Oct 2017 19:11:23 +0200
Message-Id: <1507482683-22651-7-git-send-email-ulfalizer@gmail.com>
In-Reply-To: <1507482683-22651-1-git-send-email-ulfalizer@gmail.com>
References: <1507482683-22651-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, michal.lkml@markovi.net, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, walch.martin@web.de, JBeulich@suse.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

After the parsing memory leak fixes.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/zconf.tab.c_shipped | 562 +++++++++++++++++++-----------------
 1 file changed, 294 insertions(+), 268 deletions(-)

diff --git a/scripts/kconfig/zconf.tab.c_shipped b/scripts/kconfig/zconf.tab.c_shipped
index a22b285..d513857 100644
--- a/scripts/kconfig/zconf.tab.c_shipped
+++ b/scripts/kconfig/zconf.tab.c_shipped
@@ -454,16 +454,16 @@ union yyalloc
 /* YYFINAL -- State number of the termination state.  */
 #define YYFINAL  11
 /* YYLAST -- Last index in YYTABLE.  */
-#define YYLAST   301
+#define YYLAST   325
 
 /* YYNTOKENS -- Number of terminals.  */
 #define YYNTOKENS  41
 /* YYNNTS -- Number of nonterminals.  */
-#define YYNNTS  50
+#define YYNNTS  52
 /* YYNRULES -- Number of rules.  */
-#define YYNRULES  124
+#define YYNRULES  126
 /* YYNSTATES -- Number of states.  */
-#define YYNSTATES  204
+#define YYNSTATES  206
 
 /* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
    by yylex, with out-of-bounds checking.  */
@@ -513,19 +513,19 @@ static const yytype_uint8 yytranslate[] =
   /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
 static const yytype_uint16 yyrline[] =
 {
-       0,   109,   109,   109,   111,   111,   113,   115,   116,   117,
-     118,   119,   120,   124,   128,   128,   128,   128,   128,   128,
-     128,   128,   128,   132,   133,   134,   135,   136,   137,   141,
-     142,   148,   156,   162,   170,   180,   182,   183,   184,   185,
-     186,   187,   190,   198,   204,   214,   220,   226,   232,   235,
-     237,   248,   249,   254,   263,   268,   276,   279,   281,   282,
-     283,   284,   285,   288,   294,   305,   311,   321,   323,   328,
-     336,   344,   347,   349,   350,   351,   356,   363,   370,   375,
-     383,   386,   388,   389,   390,   393,   401,   408,   415,   421,
-     428,   430,   431,   432,   435,   443,   445,   446,   449,   456,
-     458,   463,   464,   467,   468,   469,   473,   474,   477,   478,
-     481,   482,   483,   484,   485,   486,   487,   488,   489,   490,
-     491,   494,   495,   498,   499
+       0,   110,   110,   110,   112,   112,   116,   124,   134,   136,
+     137,   138,   139,   140,   141,   145,   149,   149,   149,   149,
+     149,   149,   149,   149,   149,   153,   154,   155,   156,   157,
+     158,   162,   163,   169,   176,   182,   189,   199,   201,   202,
+     203,   204,   205,   206,   209,   217,   223,   233,   239,   245,
+     251,   254,   256,   269,   270,   275,   284,   289,   297,   300,
+     302,   303,   304,   305,   306,   309,   315,   326,   332,   342,
+     344,   349,   357,   365,   368,   370,   371,   372,   377,   384,
+     389,   397,   400,   402,   403,   404,   407,   416,   423,   430,
+     436,   446,   448,   449,   450,   453,   461,   463,   464,   467,
+     474,   476,   481,   482,   485,   486,   487,   491,   492,   495,
+     496,   499,   500,   501,   502,   503,   504,   505,   506,   507,
+     508,   509,   513,   515,   516,   519,   520
 };
 #endif
 
@@ -541,17 +541,18 @@ static const char *const yytname[] =
   "T_RANGE", "T_VISIBLE", "T_OPTION", "T_ON", "T_WORD", "T_WORD_QUOTE",
   "T_UNEQUAL", "T_LESS", "T_LESS_EQUAL", "T_GREATER", "T_GREATER_EQUAL",
   "T_CLOSE_PAREN", "T_OPEN_PAREN", "T_EOL", "T_OR", "T_AND", "T_EQUAL",
-  "T_NOT", "$accept", "input", "start", "stmt_list", "option_name",
-  "common_stmt", "option_error", "config_entry_start", "config_stmt",
+  "T_NOT", "$accept", "input", "start", "mainmenu_stmt",
+  "no_mainmenu_stmt", "stmt_list", "option_name", "common_stmt",
+  "option_error", "config_entry_start", "config_stmt",
   "menuconfig_entry_start", "menuconfig_stmt", "config_option_list",
   "config_option", "symbol_option", "symbol_option_list",
   "symbol_option_arg", "choice", "choice_entry", "choice_end",
   "choice_stmt", "choice_option_list", "choice_option", "choice_block",
-  "if_entry", "if_end", "if_stmt", "if_block", "mainmenu_stmt", "menu",
-  "menu_entry", "menu_end", "menu_stmt", "menu_block", "source_stmt",
-  "comment", "comment_stmt", "help_start", "help", "depends_list",
-  "depends", "visibility_list", "visible", "prompt_stmt_opt", "prompt",
-  "end", "nl", "if_expr", "expr", "symbol", "word_opt", YY_NULLPTR
+  "if_entry", "if_end", "if_stmt", "if_block", "menu", "menu_entry",
+  "menu_end", "menu_stmt", "menu_block", "source_stmt", "comment",
+  "comment_stmt", "help_start", "help", "depends_list", "depends",
+  "visibility_list", "visible", "prompt_stmt_opt", "prompt", "end", "nl",
+  "if_expr", "expr", "nonconst_symbol", "symbol", "word_opt", YY_NULLPTR
 };
 #endif
 
@@ -573,7 +574,7 @@ static const yytype_uint16 yytoknum[] =
 #define yypact_value_is_default(Yystate) \
   (!!((Yystate) == (-92)))
 
-#define YYTABLE_NINF -88
+#define YYTABLE_NINF -89
 
 #define yytable_value_is_error(Yytable_value) \
   0
@@ -582,27 +583,27 @@ static const yytype_uint16 yytoknum[] =
      STATE-NUM.  */
 static const yytype_int16 yypact[] =
 {
-      17,    41,   -92,    15,   -92,   150,   -92,    19,   -92,   -92,
-     -13,   -92,    28,    41,    38,    41,    50,    47,    41,    79,
-      82,    44,    76,   -92,   -92,   -92,   -92,   -92,   -92,   -92,
-     -92,   -92,   118,   -92,   129,   -92,   -92,   -92,   -92,   -92,
+      20,    33,   -92,    16,   -92,   -92,   -92,    21,   -92,   -92,
+      29,   -92,   152,   186,   -92,   -92,    40,    67,    33,    71,
+      33,    42,    80,    33,    78,    78,    31,    82,   -92,   -92,
+     -92,   -92,   -92,   -92,   -92,   -92,   -92,   120,   -92,   131,
      -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,
-     -92,   -92,   184,   -92,   -92,   107,   -92,   111,   -92,   113,
-     -92,   116,   -92,   139,   140,   151,   -92,   -92,    44,    44,
-     142,   256,   -92,   160,   173,    27,   117,    80,    51,   255,
-     -15,   255,   217,   -92,   -92,   -92,   -92,   -92,   -92,    -8,
-     -92,    44,    44,   107,    87,    87,    87,    87,    87,    87,
-     -92,   -92,   174,   176,   187,    41,    41,    44,   188,   189,
-      87,   -92,   213,   -92,   -92,   -92,   -92,   206,   -92,   -92,
-     193,    41,    41,   203,   -92,   -92,   -92,   -92,   -92,   -92,
-     -92,   -92,   -92,   -92,   -92,   -92,   -92,   229,   -92,   241,
-     -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,
-     216,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,
-      44,   229,   222,   229,    64,   229,   229,    87,    31,   231,
-     -92,   -92,   229,   236,   229,    44,   -92,   145,   242,   -92,
-     -92,   243,   244,   245,   229,   251,   -92,   -92,   247,   -92,
-     257,   125,   -92,   -92,   -92,   -92,   -92,   260,    41,   -92,
-     -92,   -92,   -92,   -92
+     -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   109,   -92,
+     118,   -92,   128,   -92,   129,   -92,   141,   142,   -92,    31,
+      31,    74,   -92,    69,   -92,   144,   145,    28,   119,   248,
+     286,    77,    38,    77,   219,   -92,   -92,   -92,   -92,   -92,
+     -92,    -7,   -92,    31,    31,    40,    52,    52,    52,    52,
+      52,    52,   -92,   -92,   146,   147,   158,    33,    33,    31,
+      78,    78,    52,   -92,   184,   -92,   -92,   -92,   -92,   176,
+     -92,   -92,   162,    33,    33,    78,   -92,   -92,   -92,   -92,
+     -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   197,
+     -92,   272,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,
+     -92,   -92,   174,   -92,   -92,   -92,   -92,   -92,   -92,   -92,
+     -92,   -92,    31,   197,   178,   197,    59,   197,   197,    52,
+      27,   179,   -92,   -92,   197,   180,   197,    31,   -92,   111,
+     181,   -92,   -92,   182,   185,   195,   197,   193,   -92,   -92,
+     208,   -92,   209,   113,   -92,   -92,   -92,   -92,   -92,   211,
+      33,   -92,   -92,   -92,   -92,   -92
 };
 
   /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
@@ -610,47 +611,49 @@ static const yytype_int16 yypact[] =
      means the default is an error.  */
 static const yytype_uint8 yydefact[] =
 {
-       6,     0,   106,     0,     3,     0,     6,     6,   101,   102,
-       0,     1,     0,     0,     0,     0,   123,     0,     0,     0,
-       0,     0,     0,    14,    19,    15,    16,    21,    17,    18,
-      20,    22,     0,    23,     0,     7,    35,    26,    35,    27,
-      57,    67,     8,    72,    24,    95,    81,     9,    28,    90,
-      25,    10,     0,   107,     2,    76,    13,     0,   103,     0,
-     124,     0,   104,     0,     0,     0,   121,   122,     0,     0,
-       0,   110,   105,     0,     0,     0,     0,     0,     0,     0,
-      90,     0,     0,    77,    85,    53,    86,    31,    33,     0,
-     118,     0,     0,    69,     0,     0,     0,     0,     0,     0,
-      11,    12,     0,     0,     0,     0,    99,     0,     0,     0,
-       0,    49,     0,    41,    40,    36,    37,     0,    39,    38,
-       0,     0,    99,     0,    61,    62,    58,    60,    59,    68,
-      56,    55,    73,    75,    71,    74,    70,   108,    97,     0,
-      96,    82,    84,    80,    83,    79,    92,    93,    91,   117,
-     119,   120,   116,   111,   112,   113,   114,   115,    30,    88,
-       0,   108,     0,   108,   108,   108,   108,     0,     0,     0,
-      89,    65,   108,     0,   108,     0,    98,     0,     0,    42,
-     100,     0,     0,     0,   108,    51,    48,    29,     0,    64,
-       0,   109,    94,    43,    44,    45,    46,     0,     0,    50,
-      63,    66,    47,    52
+       7,     0,   107,     0,     3,     8,     8,     7,   102,   103,
+       0,     1,     0,     0,   108,     2,     6,     0,     0,     0,
+       0,   125,     0,     0,     0,     0,     0,     0,    16,    21,
+      17,    18,    23,    19,    20,    22,    24,     0,    25,     0,
+       9,    37,    28,    37,    29,    59,    69,    10,    74,    26,
+      96,    82,    11,    30,    91,    27,    12,    15,     0,   104,
+       0,   126,     0,   105,     0,   122,     0,     0,   124,     0,
+       0,     0,   123,   111,   106,     0,     0,     0,     0,     0,
+       0,     0,    91,     0,     0,    78,    86,    55,    87,    33,
+      35,     0,   119,     0,     0,    71,     0,     0,     0,     0,
+       0,     0,    13,    14,     0,     0,     0,     0,   100,     0,
+       0,     0,     0,    51,     0,    43,    42,    38,    39,     0,
+      41,    40,     0,     0,   100,     0,    63,    64,    60,    62,
+      61,    70,    58,    57,    75,    77,    73,    76,    72,   109,
+      98,     0,    97,    83,    85,    81,    84,    80,    93,    94,
+      92,   118,   120,   121,   117,   112,   113,   114,   115,   116,
+      32,    89,     0,   109,     0,   109,   109,   109,   109,     0,
+       0,     0,    90,    67,   109,     0,   109,     0,    99,     0,
+       0,    44,   101,     0,     0,     0,   109,    53,    50,    31,
+       0,    66,     0,   110,    95,    45,    46,    47,    48,     0,
+       0,    52,    65,    68,    49,    54
 };
 
   /* YYPGOTO[NTERM-NUM].  */
 static const yytype_int16 yypgoto[] =
 {
-     -92,   -92,   285,   291,   -92,    32,   -66,   -92,   -92,   -92,
-     -92,   261,   -92,   -92,   -92,   -92,   -92,   -92,   -92,     1,
-     -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,
-     -92,    24,   -92,   -92,   -92,   -92,   -92,   221,   220,   -64,
-     -92,   -92,   179,    -1,    67,     0,   110,   -67,   -91,   -92
+     -92,   -92,   241,   -92,   -92,   244,   -92,   -13,   -66,   -92,
+     -92,   -92,   -92,   218,   -92,   -92,   -92,   -92,   -92,   -92,
+     -92,   -69,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,
+     -92,   -92,    12,   -92,   -92,   -92,   -92,   -92,   172,   170,
+     -64,   -92,   -92,   148,    -1,    34,     1,   139,   -68,   -21,
+     -91,   -92
 };
 
   /* YYDEFGOTO[NTERM-NUM].  */
 static const yytype_int16 yydefgoto[] =
 {
-      -1,     3,     4,     5,    34,    35,   114,    36,    37,    38,
-      39,    75,   115,   116,   168,   199,    40,    41,   130,    42,
-      77,   126,    78,    43,   134,    44,    79,     6,    45,    46,
-     143,    47,    81,    48,    49,    50,   117,   118,    82,   119,
-      80,   140,   162,   163,    51,     7,   176,    70,    71,    61
+      -1,     3,     4,     5,     6,    12,    39,    40,   116,    41,
+      42,    43,    44,    77,   117,   118,   170,   201,    45,    46,
+     132,    47,    79,   128,    80,    48,   136,    49,    81,    50,
+      51,   145,    52,    83,    53,    54,    55,   119,   120,    84,
+     121,    82,   142,   164,   165,    56,     7,   178,    71,    72,
+      73,    62
 };
 
   /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
@@ -658,135 +661,139 @@ static const yytype_int16 yydefgoto[] =
      number is the opposite.  If YYTABLE_NINF, syntax error.  */
 static const yytype_int16 yytable[] =
 {
-      10,    89,    90,   152,   153,   154,   155,   156,   157,   137,
-      55,   125,    57,   128,    59,    11,   147,    63,   148,   167,
-       1,   138,     1,     2,   150,   151,   149,   -32,   102,    91,
-      92,   -32,   -32,   -32,   -32,   -32,   -32,   -32,   -32,   103,
-     164,   -32,   -32,   104,   -32,   105,   106,   107,   108,   109,
-     110,   -32,   111,     2,   112,    53,    14,    15,   185,    17,
-      18,    19,    20,   113,    56,    21,    22,   186,     8,     9,
-      93,    66,    67,   147,    58,   148,   184,    60,   175,    68,
-     133,   102,   142,    62,    69,   -54,   -54,    33,   -54,   -54,
-     -54,   -54,   103,   177,   -54,   -54,   104,   120,   121,   122,
-     123,    91,    92,   135,   161,   144,    64,   112,   191,    65,
-     129,   132,    72,   141,    66,    67,   124,   -34,   102,    73,
-     172,   -34,   -34,   -34,   -34,   -34,   -34,   -34,   -34,   103,
-      74,   -34,   -34,   104,   -34,   105,   106,   107,   108,   109,
-     110,   -34,   111,    53,   112,   131,   136,    83,   145,    84,
-      -5,    12,    85,   113,    13,    14,    15,    16,    17,    18,
-      19,    20,    91,    92,    21,    22,    23,    24,    25,    26,
-      27,    28,    29,    30,    31,    86,    87,    32,     2,    91,
-      92,   192,    91,    92,    -4,    12,    33,    88,    13,    14,
-      15,    16,    17,    18,    19,    20,   100,   203,    21,    22,
-      23,    24,    25,    26,    27,    28,    29,    30,    31,   101,
-     158,    32,   159,   160,   169,   165,   166,   -87,   102,   170,
-      33,   -87,   -87,   -87,   -87,   -87,   -87,   -87,   -87,   171,
-     174,   -87,   -87,   104,   -87,   -87,   -87,   -87,   -87,   -87,
-     -87,   -87,   102,   175,   112,   -78,   -78,   -78,   -78,   -78,
-     -78,   -78,   -78,   146,    92,   -78,   -78,   104,   179,    13,
-      14,    15,    16,    17,    18,    19,    20,   187,   112,    21,
-      22,   178,   189,   180,   181,   182,   183,   146,   193,   194,
-     195,   196,   188,   200,   190,    94,    95,    96,    97,    98,
-     198,    33,    54,   201,   197,    99,   202,    52,   127,    76,
-     139,   173
+      10,    91,    92,    66,    67,   154,   155,   156,   157,   158,
+     159,    16,   135,   127,   144,   130,    11,    58,   149,    60,
+     150,   169,    64,     1,     1,   152,   153,   151,   -34,   104,
+      93,    94,   -34,   -34,   -34,   -34,   -34,   -34,   -34,   -34,
+     105,   166,   -34,   -34,   106,   -34,   107,   108,   109,   110,
+     111,   112,   -34,   113,   187,   114,     2,    14,    65,    68,
+       8,     9,   139,   188,   115,     2,    69,   131,   134,    61,
+     143,    70,    95,   177,   140,   149,    14,   150,   186,    65,
+      68,    18,    19,    20,    21,    22,    23,    24,    25,   167,
+     168,    26,    27,   137,   179,   146,    93,    94,    96,    97,
+      98,    99,   100,    57,   176,    65,   163,    59,   101,   193,
+       2,    93,    94,    38,   133,   138,    63,   147,    74,   -36,
+     104,    75,   174,   -36,   -36,   -36,   -36,   -36,   -36,   -36,
+     -36,   105,    76,   -36,   -36,   106,   -36,   107,   108,   109,
+     110,   111,   112,   -36,   113,    85,   114,   194,    93,    94,
+      93,    94,    -4,    17,    86,   115,    18,    19,    20,    21,
+      22,    23,    24,    25,    87,    88,    26,    27,    28,    29,
+      30,    31,    32,    33,    34,    35,    36,    89,    90,    37,
+     102,   103,   160,   161,   162,   171,    -5,    17,    38,   172,
+      18,    19,    20,    21,    22,    23,    24,    25,   173,   205,
+      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
+      36,   177,    94,    37,   181,   189,   191,   195,   196,   -88,
+     104,   197,    38,   -88,   -88,   -88,   -88,   -88,   -88,   -88,
+     -88,   198,   200,   -88,   -88,   106,   -88,   -88,   -88,   -88,
+     -88,   -88,   -88,   -88,   202,   203,   114,   204,    15,   104,
+      13,   129,   141,   -56,   -56,   148,   -56,   -56,   -56,   -56,
+     105,    78,   -56,   -56,   106,   122,   123,   124,   125,     0,
+       0,     0,   175,   104,     0,   114,   -79,   -79,   -79,   -79,
+     -79,   -79,   -79,   -79,   126,     0,   -79,   -79,   106,     0,
+       0,    19,    20,     0,    22,    23,    24,    25,     0,   114,
+      26,    27,   180,     0,   182,   183,   184,   185,   148,     0,
+       0,     0,     0,   190,     0,   192,     0,     0,     0,     0,
+       0,     0,    38,     0,     0,   199
 };
 
-static const yytype_uint8 yycheck[] =
+static const yytype_int16 yycheck[] =
 {
-       1,    68,    69,    94,    95,    96,    97,    98,    99,    24,
-      10,    77,    13,    77,    15,     0,    82,    18,    82,   110,
-       3,    36,     3,    36,    91,    92,    34,     0,     1,    37,
-      38,     4,     5,     6,     7,     8,     9,    10,    11,    12,
-     107,    14,    15,    16,    17,    18,    19,    20,    21,    22,
-      23,    24,    25,    36,    27,    36,     5,     6,    27,     8,
-       9,    10,    11,    36,    36,    14,    15,    36,    27,    28,
-      70,    27,    28,   139,    36,   139,   167,    27,    14,    35,
-      79,     1,    81,    36,    40,     5,     6,    36,     8,     9,
-      10,    11,    12,   160,    14,    15,    16,    17,    18,    19,
-      20,    37,    38,    79,   105,    81,    27,    27,   175,    27,
-      78,    79,    36,    81,    27,    28,    36,     0,     1,     1,
-     121,     4,     5,     6,     7,     8,     9,    10,    11,    12,
-       1,    14,    15,    16,    17,    18,    19,    20,    21,    22,
-      23,    24,    25,    36,    27,    78,    79,    36,    81,    36,
-       0,     1,    36,    36,     4,     5,     6,     7,     8,     9,
-      10,    11,    37,    38,    14,    15,    16,    17,    18,    19,
-      20,    21,    22,    23,    24,    36,    36,    27,    36,    37,
-      38,    36,    37,    38,     0,     1,    36,    36,     4,     5,
-       6,     7,     8,     9,    10,    11,    36,   198,    14,    15,
-      16,    17,    18,    19,    20,    21,    22,    23,    24,    36,
-      36,    27,    36,    26,     1,    27,    27,     0,     1,    13,
-      36,     4,     5,     6,     7,     8,     9,    10,    11,    36,
-      27,    14,    15,    16,    17,    18,    19,    20,    21,    22,
-      23,    24,     1,    14,    27,     4,     5,     6,     7,     8,
-       9,    10,    11,    36,    38,    14,    15,    16,    36,     4,
-       5,     6,     7,     8,     9,    10,    11,    36,    27,    14,
-      15,   161,    36,   163,   164,   165,   166,    36,    36,    36,
-      36,    36,   172,    36,   174,    29,    30,    31,    32,    33,
-      39,    36,     7,    36,   184,    39,    36,     6,    77,    38,
-      80,   122
+       1,    69,    70,    24,    25,    96,    97,    98,    99,   100,
+     101,    10,    81,    79,    83,    79,     0,    18,    84,    20,
+      84,   112,    23,     3,     3,    93,    94,    34,     0,     1,
+      37,    38,     4,     5,     6,     7,     8,     9,    10,    11,
+      12,   109,    14,    15,    16,    17,    18,    19,    20,    21,
+      22,    23,    24,    25,    27,    27,    36,    36,    27,    28,
+      27,    28,    24,    36,    36,    36,    35,    80,    81,    27,
+      83,    40,    71,    14,    36,   141,    36,   141,   169,    27,
+      28,     4,     5,     6,     7,     8,     9,    10,    11,   110,
+     111,    14,    15,    81,   162,    83,    37,    38,    29,    30,
+      31,    32,    33,    36,   125,    27,   107,    36,    39,   177,
+      36,    37,    38,    36,    80,    81,    36,    83,    36,     0,
+       1,     1,   123,     4,     5,     6,     7,     8,     9,    10,
+      11,    12,     1,    14,    15,    16,    17,    18,    19,    20,
+      21,    22,    23,    24,    25,    36,    27,    36,    37,    38,
+      37,    38,     0,     1,    36,    36,     4,     5,     6,     7,
+       8,     9,    10,    11,    36,    36,    14,    15,    16,    17,
+      18,    19,    20,    21,    22,    23,    24,    36,    36,    27,
+      36,    36,    36,    36,    26,     1,     0,     1,    36,    13,
+       4,     5,     6,     7,     8,     9,    10,    11,    36,   200,
+      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
+      24,    14,    38,    27,    36,    36,    36,    36,    36,     0,
+       1,    36,    36,     4,     5,     6,     7,     8,     9,    10,
+      11,    36,    39,    14,    15,    16,    17,    18,    19,    20,
+      21,    22,    23,    24,    36,    36,    27,    36,     7,     1,
+       6,    79,    82,     5,     6,    36,     8,     9,    10,    11,
+      12,    43,    14,    15,    16,    17,    18,    19,    20,    -1,
+      -1,    -1,   124,     1,    -1,    27,     4,     5,     6,     7,
+       8,     9,    10,    11,    36,    -1,    14,    15,    16,    -1,
+      -1,     5,     6,    -1,     8,     9,    10,    11,    -1,    27,
+      14,    15,   163,    -1,   165,   166,   167,   168,    36,    -1,
+      -1,    -1,    -1,   174,    -1,   176,    -1,    -1,    -1,    -1,
+      -1,    -1,    36,    -1,    -1,   186
 };
 
   /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
      symbol of state STATE-NUM.  */
 static const yytype_uint8 yystos[] =
 {
-       0,     3,    36,    42,    43,    44,    68,    86,    27,    28,
-      84,     0,     1,     4,     5,     6,     7,     8,     9,    10,
-      11,    14,    15,    16,    17,    18,    19,    20,    21,    22,
-      23,    24,    27,    36,    45,    46,    48,    49,    50,    51,
-      57,    58,    60,    64,    66,    69,    70,    72,    74,    75,
-      76,    85,    44,    36,    43,    86,    36,    84,    36,    84,
-      27,    90,    36,    84,    27,    27,    27,    28,    35,    40,
-      88,    89,    36,     1,     1,    52,    52,    61,    63,    67,
-      81,    73,    79,    36,    36,    36,    36,    36,    36,    88,
-      88,    37,    38,    86,    29,    30,    31,    32,    33,    39,
-      36,    36,     1,    12,    16,    18,    19,    20,    21,    22,
-      23,    25,    27,    36,    47,    53,    54,    77,    78,    80,
-      17,    18,    19,    20,    36,    47,    62,    78,    80,    46,
-      59,    85,    46,    60,    65,    72,    85,    24,    36,    79,
-      82,    46,    60,    71,    72,    85,    36,    47,    80,    34,
-      88,    88,    89,    89,    89,    89,    89,    89,    36,    36,
-      26,    84,    83,    84,    88,    27,    27,    89,    55,     1,
-      13,    36,    84,    83,    27,    14,    87,    88,    87,    36,
-      87,    87,    87,    87,    89,    27,    36,    36,    87,    36,
-      87,    88,    36,    36,    36,    36,    36,    87,    39,    56,
-      36,    36,    36,    84
+       0,     3,    36,    42,    43,    44,    45,    87,    27,    28,
+      85,     0,    46,    46,    36,    43,    87,     1,     4,     5,
+       6,     7,     8,     9,    10,    11,    14,    15,    16,    17,
+      18,    19,    20,    21,    22,    23,    24,    27,    36,    47,
+      48,    50,    51,    52,    53,    59,    60,    62,    66,    68,
+      70,    71,    73,    75,    76,    77,    86,    36,    85,    36,
+      85,    27,    92,    36,    85,    27,    90,    90,    28,    35,
+      40,    89,    90,    91,    36,     1,     1,    54,    54,    63,
+      65,    69,    82,    74,    80,    36,    36,    36,    36,    36,
+      36,    89,    89,    37,    38,    87,    29,    30,    31,    32,
+      33,    39,    36,    36,     1,    12,    16,    18,    19,    20,
+      21,    22,    23,    25,    27,    36,    49,    55,    56,    78,
+      79,    81,    17,    18,    19,    20,    36,    49,    64,    79,
+      81,    48,    61,    86,    48,    62,    67,    73,    86,    24,
+      36,    80,    83,    48,    62,    72,    73,    86,    36,    49,
+      81,    34,    89,    89,    91,    91,    91,    91,    91,    91,
+      36,    36,    26,    85,    84,    85,    89,    90,    90,    91,
+      57,     1,    13,    36,    85,    84,    90,    14,    88,    89,
+      88,    36,    88,    88,    88,    88,    91,    27,    36,    36,
+      88,    36,    88,    89,    36,    36,    36,    36,    36,    88,
+      39,    58,    36,    36,    36,    85
 };
 
   /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
 static const yytype_uint8 yyr1[] =
 {
-       0,    41,    42,    42,    43,    43,    44,    44,    44,    44,
-      44,    44,    44,    44,    45,    45,    45,    45,    45,    45,
-      45,    45,    45,    46,    46,    46,    46,    46,    46,    47,
-      47,    48,    49,    50,    51,    52,    52,    52,    52,    52,
-      52,    52,    53,    53,    53,    53,    53,    53,    54,    55,
-      55,    56,    56,    57,    58,    59,    60,    61,    61,    61,
-      61,    61,    61,    62,    62,    62,    62,    63,    63,    64,
-      65,    66,    67,    67,    67,    67,    68,    69,    70,    71,
-      72,    73,    73,    73,    73,    74,    75,    76,    77,    78,
-      79,    79,    79,    79,    80,    81,    81,    81,    82,    83,
-      83,    84,    84,    85,    85,    85,    86,    86,    87,    87,
-      88,    88,    88,    88,    88,    88,    88,    88,    88,    88,
-      88,    89,    89,    90,    90
+       0,    41,    42,    42,    43,    43,    44,    45,    46,    46,
+      46,    46,    46,    46,    46,    46,    47,    47,    47,    47,
+      47,    47,    47,    47,    47,    48,    48,    48,    48,    48,
+      48,    49,    49,    50,    51,    52,    53,    54,    54,    54,
+      54,    54,    54,    54,    55,    55,    55,    55,    55,    55,
+      56,    57,    57,    58,    58,    59,    60,    61,    62,    63,
+      63,    63,    63,    63,    63,    64,    64,    64,    64,    65,
+      65,    66,    67,    68,    69,    69,    69,    69,    70,    71,
+      72,    73,    74,    74,    74,    74,    75,    76,    77,    78,
+      79,    80,    80,    80,    80,    81,    82,    82,    82,    83,
+      84,    84,    85,    85,    86,    86,    86,    87,    87,    88,
+      88,    89,    89,    89,    89,    89,    89,    89,    89,    89,
+      89,    89,    90,    91,    91,    92,    92
 };
 
   /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
 static const yytype_uint8 yyr2[] =
 {
-       0,     2,     2,     1,     2,     1,     0,     2,     2,     2,
-       2,     4,     4,     3,     1,     1,     1,     1,     1,     1,
-       1,     1,     1,     1,     1,     1,     1,     1,     1,     3,
-       2,     3,     2,     3,     2,     0,     2,     2,     2,     2,
-       2,     2,     3,     4,     4,     4,     4,     5,     3,     0,
-       3,     0,     2,     3,     2,     1,     3,     0,     2,     2,
-       2,     2,     2,     4,     3,     2,     4,     0,     2,     3,
-       1,     3,     0,     2,     2,     2,     3,     3,     3,     1,
-       3,     0,     2,     2,     2,     3,     3,     2,     2,     2,
-       0,     2,     2,     2,     4,     0,     2,     2,     2,     0,
-       2,     1,     1,     2,     2,     2,     1,     2,     0,     2,
-       1,     3,     3,     3,     3,     3,     3,     3,     2,     3,
-       3,     1,     1,     0,     1
+       0,     2,     2,     1,     2,     2,     3,     0,     0,     2,
+       2,     2,     2,     4,     4,     3,     1,     1,     1,     1,
+       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
+       1,     3,     2,     3,     2,     3,     2,     0,     2,     2,
+       2,     2,     2,     2,     3,     4,     4,     4,     4,     5,
+       3,     0,     3,     0,     2,     3,     2,     1,     3,     0,
+       2,     2,     2,     2,     2,     4,     3,     2,     4,     0,
+       2,     3,     1,     3,     0,     2,     2,     2,     3,     3,
+       1,     3,     0,     2,     2,     2,     3,     3,     2,     2,
+       2,     0,     2,     2,     2,     4,     0,     2,     2,     2,
+       0,     2,     1,     1,     2,     2,     2,     1,     2,     0,
+       2,     1,     3,     3,     3,     3,     3,     3,     3,     2,
+       3,     3,     1,     1,     1,     0,     1
 };
 
 
@@ -1209,7 +1216,7 @@ yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
   YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
   switch (yytype)
     {
-          case 58: /* choice_entry  */
+          case 60: /* choice_entry  */
 
       {
 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
@@ -1220,7 +1227,7 @@ yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
 
         break;
 
-    case 64: /* if_entry  */
+    case 66: /* if_entry  */
 
       {
 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
@@ -1231,7 +1238,7 @@ yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
 
         break;
 
-    case 70: /* menu_entry  */
+    case 71: /* menu_entry  */
 
       {
 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
@@ -1500,19 +1507,40 @@ yyreduce:
   YY_REDUCE_PRINT (yyn);
   switch (yyn)
     {
-        case 10:
+        case 6:
+
+    {
+	menu_add_prompt(P_MENU, (yyvsp[-1].string), NULL);
+}
+
+    break;
+
+  case 7:
+
+    {
+	/*
+	 * Hack: Keep the main menu title on the heap so we can safely free it
+	 * later regardless of whether it comes from the 'prompt' in
+	 * mainmenu_stmt or here
+	 */
+	menu_add_prompt(P_MENU, strdup("Linux Kernel Configuration"), NULL);
+}
+
+    break;
+
+  case 12:
 
     { zconf_error("unexpected end statement"); }
 
     break;
 
-  case 11:
+  case 13:
 
     { zconf_error("unknown statement \"%s\"", (yyvsp[-2].string)); }
 
     break;
 
-  case 12:
+  case 14:
 
     {
 	zconf_error("unexpected option \"%s\"", (yyvsp[-2].id)->name);
@@ -1520,36 +1548,35 @@ yyreduce:
 
     break;
 
-  case 13:
+  case 15:
 
     { zconf_error("invalid statement"); }
 
     break;
 
-  case 29:
+  case 31:
 
     { zconf_error("unknown option \"%s\"", (yyvsp[-2].string)); }
 
     break;
 
-  case 30:
+  case 32:
 
     { zconf_error("invalid option"); }
 
     break;
 
-  case 31:
+  case 33:
 
     {
-	struct symbol *sym = sym_lookup((yyvsp[-1].string), 0);
-	sym->flags |= SYMBOL_OPTIONAL;
-	menu_add_entry(sym);
-	printd(DEBUG_PARSE, "%s:%d:config %s\n", zconf_curname(), zconf_lineno(), (yyvsp[-1].string));
+	(yyvsp[-1].symbol)->flags |= SYMBOL_OPTIONAL;
+	menu_add_entry((yyvsp[-1].symbol));
+	printd(DEBUG_PARSE, "%s:%d:config %s\n", zconf_curname(), zconf_lineno(), (yyvsp[-1].symbol)->name);
 }
 
     break;
 
-  case 32:
+  case 34:
 
     {
 	menu_end_entry();
@@ -1558,18 +1585,17 @@ yyreduce:
 
     break;
 
-  case 33:
+  case 35:
 
     {
-	struct symbol *sym = sym_lookup((yyvsp[-1].string), 0);
-	sym->flags |= SYMBOL_OPTIONAL;
-	menu_add_entry(sym);
-	printd(DEBUG_PARSE, "%s:%d:menuconfig %s\n", zconf_curname(), zconf_lineno(), (yyvsp[-1].string));
+	(yyvsp[-1].symbol)->flags |= SYMBOL_OPTIONAL;
+	menu_add_entry((yyvsp[-1].symbol));
+	printd(DEBUG_PARSE, "%s:%d:menuconfig %s\n", zconf_curname(), zconf_lineno(), (yyvsp[-1].symbol)->name);
 }
 
     break;
 
-  case 34:
+  case 36:
 
     {
 	if (current_entry->prompt)
@@ -1582,7 +1608,7 @@ yyreduce:
 
     break;
 
-  case 42:
+  case 44:
 
     {
 	menu_set_type((yyvsp[-2].id)->stype);
@@ -1593,7 +1619,7 @@ yyreduce:
 
     break;
 
-  case 43:
+  case 45:
 
     {
 	menu_add_prompt(P_PROMPT, (yyvsp[-2].string), (yyvsp[-1].expr));
@@ -1602,7 +1628,7 @@ yyreduce:
 
     break;
 
-  case 44:
+  case 46:
 
     {
 	menu_add_expr(P_DEFAULT, (yyvsp[-2].expr), (yyvsp[-1].expr));
@@ -1615,25 +1641,25 @@ yyreduce:
 
     break;
 
-  case 45:
+  case 47:
 
     {
-	menu_add_symbol(P_SELECT, sym_lookup((yyvsp[-2].string), 0), (yyvsp[-1].expr));
+	menu_add_symbol(P_SELECT, (yyvsp[-2].symbol), (yyvsp[-1].expr));
 	printd(DEBUG_PARSE, "%s:%d:select\n", zconf_curname(), zconf_lineno());
 }
 
     break;
 
-  case 46:
+  case 48:
 
     {
-	menu_add_symbol(P_IMPLY, sym_lookup((yyvsp[-2].string), 0), (yyvsp[-1].expr));
+	menu_add_symbol(P_IMPLY, (yyvsp[-2].symbol), (yyvsp[-1].expr));
 	printd(DEBUG_PARSE, "%s:%d:imply\n", zconf_curname(), zconf_lineno());
 }
 
     break;
 
-  case 47:
+  case 49:
 
     {
 	menu_add_expr(P_RANGE, expr_alloc_comp(E_RANGE,(yyvsp[-3].symbol), (yyvsp[-2].symbol)), (yyvsp[-1].expr));
@@ -1642,12 +1668,14 @@ yyreduce:
 
     break;
 
-  case 50:
+  case 52:
 
     {
 	const struct kconf_id *id = kconf_id_lookup((yyvsp[-1].string), strlen((yyvsp[-1].string)));
-	if (id && id->flags & TF_OPTION)
+	if (id && id->flags & TF_OPTION) {
 		menu_add_option(id->token, (yyvsp[0].string));
+		free((yyvsp[0].string));
+	}
 	else
 		zconfprint("warning: ignoring unknown option %s", (yyvsp[-1].string));
 	free((yyvsp[-1].string));
@@ -1655,19 +1683,19 @@ yyreduce:
 
     break;
 
-  case 51:
+  case 53:
 
     { (yyval.string) = NULL; }
 
     break;
 
-  case 52:
+  case 54:
 
     { (yyval.string) = (yyvsp[0].string); }
 
     break;
 
-  case 53:
+  case 55:
 
     {
 	struct symbol *sym = sym_lookup((yyvsp[-1].string), SYMBOL_CHOICE);
@@ -1679,7 +1707,7 @@ yyreduce:
 
     break;
 
-  case 54:
+  case 56:
 
     {
 	(yyval.menu) = menu_add_menu();
@@ -1687,7 +1715,7 @@ yyreduce:
 
     break;
 
-  case 55:
+  case 57:
 
     {
 	if (zconf_endtoken((yyvsp[0].id), T_CHOICE, T_ENDCHOICE)) {
@@ -1698,7 +1726,7 @@ yyreduce:
 
     break;
 
-  case 63:
+  case 65:
 
     {
 	menu_add_prompt(P_PROMPT, (yyvsp[-2].string), (yyvsp[-1].expr));
@@ -1707,7 +1735,7 @@ yyreduce:
 
     break;
 
-  case 64:
+  case 66:
 
     {
 	if ((yyvsp[-2].id)->stype == S_BOOLEAN || (yyvsp[-2].id)->stype == S_TRISTATE) {
@@ -1721,7 +1749,7 @@ yyreduce:
 
     break;
 
-  case 65:
+  case 67:
 
     {
 	current_entry->sym->flags |= SYMBOL_OPTIONAL;
@@ -1730,11 +1758,11 @@ yyreduce:
 
     break;
 
-  case 66:
+  case 68:
 
     {
 	if ((yyvsp[-3].id)->stype == S_UNKNOWN) {
-		menu_add_symbol(P_DEFAULT, sym_lookup((yyvsp[-2].string), 0), (yyvsp[-1].expr));
+		menu_add_symbol(P_DEFAULT, (yyvsp[-2].symbol), (yyvsp[-1].expr));
 		printd(DEBUG_PARSE, "%s:%d:default\n",
 			zconf_curname(), zconf_lineno());
 	} else
@@ -1743,7 +1771,7 @@ yyreduce:
 
     break;
 
-  case 69:
+  case 71:
 
     {
 	printd(DEBUG_PARSE, "%s:%d:if\n", zconf_curname(), zconf_lineno());
@@ -1754,7 +1782,7 @@ yyreduce:
 
     break;
 
-  case 70:
+  case 72:
 
     {
 	if (zconf_endtoken((yyvsp[0].id), T_IF, T_ENDIF)) {
@@ -1765,15 +1793,7 @@ yyreduce:
 
     break;
 
-  case 76:
-
-    {
-	menu_add_prompt(P_MENU, (yyvsp[-1].string), NULL);
-}
-
-    break;
-
-  case 77:
+  case 78:
 
     {
 	menu_add_entry(NULL);
@@ -1783,7 +1803,7 @@ yyreduce:
 
     break;
 
-  case 78:
+  case 79:
 
     {
 	(yyval.menu) = menu_add_menu();
@@ -1791,7 +1811,7 @@ yyreduce:
 
     break;
 
-  case 79:
+  case 80:
 
     {
 	if (zconf_endtoken((yyvsp[0].id), T_MENU, T_ENDMENU)) {
@@ -1802,16 +1822,17 @@ yyreduce:
 
     break;
 
-  case 85:
+  case 86:
 
     {
 	printd(DEBUG_PARSE, "%s:%d:source %s\n", zconf_curname(), zconf_lineno(), (yyvsp[-1].string));
 	zconf_nextfile((yyvsp[-1].string));
+	free((yyvsp[-1].string));
 }
 
     break;
 
-  case 86:
+  case 87:
 
     {
 	menu_add_entry(NULL);
@@ -1821,7 +1842,7 @@ yyreduce:
 
     break;
 
-  case 87:
+  case 88:
 
     {
 	menu_end_entry();
@@ -1829,7 +1850,7 @@ yyreduce:
 
     break;
 
-  case 88:
+  case 89:
 
     {
 	printd(DEBUG_PARSE, "%s:%d:help\n", zconf_curname(), zconf_lineno());
@@ -1838,15 +1859,18 @@ yyreduce:
 
     break;
 
-  case 89:
+  case 90:
 
     {
+	if (current_entry->help)
+		/* Weird menu node with two help strings */
+		free(current_entry->help);
 	current_entry->help = (yyvsp[0].string);
 }
 
     break;
 
-  case 94:
+  case 95:
 
     {
 	menu_add_dep((yyvsp[-1].expr));
@@ -1855,7 +1879,7 @@ yyreduce:
 
     break;
 
-  case 98:
+  case 99:
 
     {
 	menu_add_visibility((yyvsp[0].expr));
@@ -1863,7 +1887,7 @@ yyreduce:
 
     break;
 
-  case 100:
+  case 101:
 
     {
 	menu_add_prompt(P_PROMPT, (yyvsp[-1].string), (yyvsp[0].expr));
@@ -1871,115 +1895,115 @@ yyreduce:
 
     break;
 
-  case 103:
+  case 104:
 
     { (yyval.id) = (yyvsp[-1].id); }
 
     break;
 
-  case 104:
+  case 105:
 
     { (yyval.id) = (yyvsp[-1].id); }
 
     break;
 
-  case 105:
+  case 106:
 
     { (yyval.id) = (yyvsp[-1].id); }
 
     break;
 
-  case 108:
+  case 109:
 
     { (yyval.expr) = NULL; }
 
     break;
 
-  case 109:
+  case 110:
 
     { (yyval.expr) = (yyvsp[0].expr); }
 
     break;
 
-  case 110:
+  case 111:
 
     { (yyval.expr) = expr_alloc_symbol((yyvsp[0].symbol)); }
 
     break;
 
-  case 111:
+  case 112:
 
     { (yyval.expr) = expr_alloc_comp(E_LTH, (yyvsp[-2].symbol), (yyvsp[0].symbol)); }
 
     break;
 
-  case 112:
+  case 113:
 
     { (yyval.expr) = expr_alloc_comp(E_LEQ, (yyvsp[-2].symbol), (yyvsp[0].symbol)); }
 
     break;
 
-  case 113:
+  case 114:
 
     { (yyval.expr) = expr_alloc_comp(E_GTH, (yyvsp[-2].symbol), (yyvsp[0].symbol)); }
 
     break;
 
-  case 114:
+  case 115:
 
     { (yyval.expr) = expr_alloc_comp(E_GEQ, (yyvsp[-2].symbol), (yyvsp[0].symbol)); }
 
     break;
 
-  case 115:
+  case 116:
 
     { (yyval.expr) = expr_alloc_comp(E_EQUAL, (yyvsp[-2].symbol), (yyvsp[0].symbol)); }
 
     break;
 
-  case 116:
+  case 117:
 
     { (yyval.expr) = expr_alloc_comp(E_UNEQUAL, (yyvsp[-2].symbol), (yyvsp[0].symbol)); }
 
     break;
 
-  case 117:
+  case 118:
 
     { (yyval.expr) = (yyvsp[-1].expr); }
 
     break;
 
-  case 118:
+  case 119:
 
     { (yyval.expr) = expr_alloc_one(E_NOT, (yyvsp[0].expr)); }
 
     break;
 
-  case 119:
+  case 120:
 
     { (yyval.expr) = expr_alloc_two(E_OR, (yyvsp[-2].expr), (yyvsp[0].expr)); }
 
     break;
 
-  case 120:
+  case 121:
 
     { (yyval.expr) = expr_alloc_two(E_AND, (yyvsp[-2].expr), (yyvsp[0].expr)); }
 
     break;
 
-  case 121:
+  case 122:
 
     { (yyval.symbol) = sym_lookup((yyvsp[0].string), 0); free((yyvsp[0].string)); }
 
     break;
 
-  case 122:
+  case 124:
 
     { (yyval.symbol) = sym_lookup((yyvsp[0].string), SYMBOL_CONST); free((yyvsp[0].string)); }
 
     break;
 
-  case 123:
+  case 125:
 
     { (yyval.string) = NULL; }
 
@@ -2219,6 +2243,7 @@ yyreturn:
 
 void conf_parse(const char *name)
 {
+	const char *tmp;
 	struct symbol *sym;
 	int i;
 
@@ -2226,7 +2251,6 @@ void conf_parse(const char *name)
 
 	sym_init();
 	_menu_init();
-	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
 
 	if (getenv("ZCONF_DEBUG"))
 		zconfdebug = 1;
@@ -2236,8 +2260,10 @@ void conf_parse(const char *name)
 	if (!modules_sym)
 		modules_sym = sym_find( "n" );
 
+	tmp = rootmenu.prompt->text;
 	rootmenu.prompt->text = _(rootmenu.prompt->text);
 	rootmenu.prompt->text = sym_expand_string_value(rootmenu.prompt->text);
+	free((char*)tmp);
 
 	menu_finalize(&rootmenu);
 	for_all_symbols(i, sym) {
-- 
2.7.4

