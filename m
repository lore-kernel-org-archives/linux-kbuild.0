Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:59897 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752899AbbATMwv convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:4:1>);
	Tue, 20 Jan 2015 07:52:51 -0500
Message-Id: <54BE5DB00200007800057062@mail.emea.novell.com>
Date: Tue, 20 Jan 2015 12:52:48 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v3 2/3] kconfig: don't silently ignore unhandled
 characters
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>, pebolle@tiscali.nl

At the very least we should tell people that what they wrote is not
what the utility understands.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Paul Bolle <pebolle@tiscali.nl>
---
v3: Split off sound/soc/intel/Kconfig change.
v2: printf() -> fprintf(stderr, ) upon Paul Bolle's request. Replace
    two instances of double backslash line continuations with single
    ones in sound/soc/intel/Kconfig.
---
 scripts/kconfig/zconf.l             |    7 +
 scripts/kconfig/zconf.lex.c_shipped |  195 +++++++++++++++++++-----------------
 2 files changed, 113 insertions(+), 89 deletions(-)

--- 3.19-rc5-kconfig.orig/scripts/kconfig/zconf.l
+++ 3.19-rc5-kconfig/scripts/kconfig/zconf.l
@@ -141,7 +141,12 @@ n	[A-Za-z0-9_]
 	}
 	#.*	/* comment */
 	\\\n	current_file->lineno++;
-	.
+	[[:blank:]]+
+	.	{
+		fprintf(stderr,
+		        "%s:%d:warning: ignoring unsupported character '%c'\n",
+		        zconf_curname(), zconf_lineno(), *yytext);
+	}
 	<<EOF>> {
 		BEGIN(INITIAL);
 	}
--- 3.19-rc5-kconfig.orig/scripts/kconfig/zconf.lex.c_shipped
+++ 3.19-rc5-kconfig/scripts/kconfig/zconf.lex.c_shipped
@@ -414,14 +414,14 @@ static yyconst flex_int16_t yy_nxt[][17]
     },
 
     {
-       11,   26,   26,   27,   28,   29,   30,   31,   29,   32,
-       33,   34,   35,   35,   36,   37,   38
+       11,   26,   27,   28,   29,   30,   31,   32,   30,   33,
+       34,   35,   36,   36,   37,   38,   39
 
     },
 
     {
-       11,   26,   26,   27,   28,   29,   30,   31,   29,   32,
-       33,   34,   35,   35,   36,   37,   38
+       11,   26,   27,   28,   29,   30,   31,   32,   30,   33,
+       34,   35,   36,   36,   37,   38,   39
     },
 
     {
@@ -435,7 +435,7 @@ static yyconst flex_int16_t yy_nxt[][17]
     },
 
     {
-       11,  -13,   39,   40,  -13,  -13,   41,  -13,  -13,  -13,
+       11,  -13,   40,   41,  -13,  -13,   42,  -13,  -13,  -13,
       -13,  -13,  -13,  -13,  -13,  -13,  -13
     },
 
@@ -446,8 +446,8 @@ static yyconst flex_int16_t yy_nxt[][17]
     },
 
     {
-       11,   42,   42,   43,   42,   42,   42,   42,   42,   42,
-       42,   42,   42,   42,   42,   42,   42
+       11,   43,   43,   44,   43,   43,   43,   43,   43,   43,
+       43,   43,   43,   43,   43,   43,   43
     },
 
     {
@@ -462,28 +462,28 @@ static yyconst flex_int16_t yy_nxt[][17]
 
     {
        11,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
-      -18,  -18,  -18,   44,  -18,  -18,  -18
+      -18,  -18,  -18,   45,  -18,  -18,  -18
     },
 
     {
-       11,   45,   45,  -19,   45,   45,   45,   45,   45,   45,
-       45,   45,   45,   45,   45,   45,   45
+       11,   46,   46,  -19,   46,   46,   46,   46,   46,   46,
+       46,   46,   46,   46,   46,   46,   46
 
     },
 
     {
-       11,  -20,   46,   47,  -20,  -20,  -20,  -20,  -20,  -20,
+       11,  -20,   47,   48,  -20,  -20,  -20,  -20,  -20,  -20,
       -20,  -20,  -20,  -20,  -20,  -20,  -20
     },
 
     {
-       11,   48,  -21,  -21,   48,   48,   48,   48,   48,   48,
-       48,   48,   48,   48,   48,   48,   48
+       11,   49,  -21,  -21,   49,   49,   49,   49,   49,   49,
+       49,   49,   49,   49,   49,   49,   49
     },
 
     {
-       11,   49,   49,   50,   49,  -22,   49,   49,  -22,   49,
-       49,   49,   49,   49,   49,  -22,   49
+       11,   50,   50,   51,   50,  -22,   50,   50,  -22,   50,
+       50,   50,   50,   50,   50,  -22,   50
     },
 
     {
@@ -498,8 +498,8 @@ static yyconst flex_int16_t yy_nxt[][17]
     },
 
     {
-       11,   51,   51,   52,   51,   51,   51,   51,   51,   51,
-       51,   51,   51,   51,   51,   51,   51
+       11,   52,   52,   53,   52,   52,   52,   52,   52,   52,
+       52,   52,   52,   52,   52,   52,   52
     },
 
     {
@@ -508,33 +508,33 @@ static yyconst flex_int16_t yy_nxt[][17]
     },
 
     {
-       11,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
+       11,  -27,   54,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
       -27,  -27,  -27,  -27,  -27,  -27,  -27
     },
 
     {
        11,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
-      -28,  -28,  -28,  -28,   53,  -28,  -28
+      -28,  -28,  -28,  -28,  -28,  -28,  -28
     },
 
     {
        11,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,
-      -29,  -29,  -29,  -29,  -29,  -29,  -29
+      -29,  -29,  -29,  -29,   55,  -29,  -29
 
     },
 
     {
-       11,   54,   54,  -30,   54,   54,   54,   54,   54,   54,
-       54,   54,   54,   54,   54,   54,   54
+       11,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
+      -30,  -30,  -30,  -30,  -30,  -30,  -30
     },
 
     {
-       11,  -31,  -31,  -31,  -31,  -31,  -31,   55,  -31,  -31,
-      -31,  -31,  -31,  -31,  -31,  -31,  -31
+       11,   56,   56,  -31,   56,   56,   56,   56,   56,   56,
+       56,   56,   56,   56,   56,   56,   56
     },
 
     {
-       11,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,
+       11,  -32,  -32,  -32,  -32,  -32,  -32,   57,  -32,  -32,
       -32,  -32,  -32,  -32,  -32,  -32,  -32
     },
 
@@ -545,100 +545,100 @@ static yyconst flex_int16_t yy_nxt[][17]
 
     {
        11,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
-      -34,   56,   57,   57,  -34,  -34,  -34
+      -34,  -34,  -34,  -34,  -34,  -34,  -34
 
     },
 
     {
        11,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
-      -35,   57,   57,   57,  -35,  -35,  -35
+      -35,   58,   59,   59,  -35,  -35,  -35
     },
 
     {
        11,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,
-      -36,  -36,  -36,  -36,  -36,  -36,  -36
+      -36,   59,   59,   59,  -36,  -36,  -36
     },
 
     {
-       11,  -37,  -37,   58,  -37,  -37,  -37,  -37,  -37,  -37,
+       11,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
       -37,  -37,  -37,  -37,  -37,  -37,  -37
     },
 
     {
-       11,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
-      -38,  -38,  -38,  -38,  -38,  -38,   59
+       11,  -38,  -38,   60,  -38,  -38,  -38,  -38,  -38,  -38,
+      -38,  -38,  -38,  -38,  -38,  -38,  -38
     },
 
     {
-       11,  -39,   39,   40,  -39,  -39,   41,  -39,  -39,  -39,
-      -39,  -39,  -39,  -39,  -39,  -39,  -39
+       11,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
+      -39,  -39,  -39,  -39,  -39,  -39,   61
 
     },
 
     {
-       11,  -40,  -40,  -40,  -40,  -40,  -40,  -40,  -40,  -40,
+       11,  -40,   40,   41,  -40,  -40,   42,  -40,  -40,  -40,
       -40,  -40,  -40,  -40,  -40,  -40,  -40
     },
 
     {
-       11,   42,   42,   43,   42,   42,   42,   42,   42,   42,
-       42,   42,   42,   42,   42,   42,   42
+       11,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
+      -41,  -41,  -41,  -41,  -41,  -41,  -41
     },
 
     {
-       11,   42,   42,   43,   42,   42,   42,   42,   42,   42,
-       42,   42,   42,   42,   42,   42,   42
+       11,   43,   43,   44,   43,   43,   43,   43,   43,   43,
+       43,   43,   43,   43,   43,   43,   43
     },
 
     {
-       11,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
-      -43,  -43,  -43,  -43,  -43,  -43,  -43
+       11,   43,   43,   44,   43,   43,   43,   43,   43,   43,
+       43,   43,   43,   43,   43,   43,   43
     },
 
     {
        11,  -44,  -44,  -44,  -44,  -44,  -44,  -44,  -44,  -44,
-      -44,  -44,  -44,   44,  -44,  -44,  -44
+      -44,  -44,  -44,  -44,  -44,  -44,  -44
 
     },
 
     {
-       11,   45,   45,  -45,   45,   45,   45,   45,   45,   45,
-       45,   45,   45,   45,   45,   45,   45
+       11,  -45,  -45,  -45,  -45,  -45,  -45,  -45,  -45,  -45,
+      -45,  -45,  -45,   45,  -45,  -45,  -45
     },
 
     {
-       11,  -46,   46,   47,  -46,  -46,  -46,  -46,  -46,  -46,
-      -46,  -46,  -46,  -46,  -46,  -46,  -46
+       11,   46,   46,  -46,   46,   46,   46,   46,   46,   46,
+       46,   46,   46,   46,   46,   46,   46
     },
 
     {
-       11,   48,  -47,  -47,   48,   48,   48,   48,   48,   48,
-       48,   48,   48,   48,   48,   48,   48
+       11,  -47,   47,   48,  -47,  -47,  -47,  -47,  -47,  -47,
+      -47,  -47,  -47,  -47,  -47,  -47,  -47
     },
 
     {
-       11,  -48,  -48,  -48,  -48,  -48,  -48,  -48,  -48,  -48,
-      -48,  -48,  -48,  -48,  -48,  -48,  -48
+       11,   49,  -48,  -48,   49,   49,   49,   49,   49,   49,
+       49,   49,   49,   49,   49,   49,   49
     },
 
     {
-       11,   49,   49,   50,   49,  -49,   49,   49,  -49,   49,
-       49,   49,   49,   49,   49,  -49,   49
+       11,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
+      -49,  -49,  -49,  -49,  -49,  -49,  -49
 
     },
 
     {
-       11,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
-      -50,  -50,  -50,  -50,  -50,  -50,  -50
+       11,   50,   50,   51,   50,  -50,   50,   50,  -50,   50,
+       50,   50,   50,   50,   50,  -50,   50
     },
 
     {
-       11,  -51,  -51,   52,  -51,  -51,  -51,  -51,  -51,  -51,
+       11,  -51,  -51,  -51,  -51,  -51,  -51,  -51,  -51,  -51,
       -51,  -51,  -51,  -51,  -51,  -51,  -51
     },
 
     {
-       11,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
+       11,  -52,  -52,   53,  -52,  -52,  -52,  -52,  -52,  -52,
       -52,  -52,  -52,  -52,  -52,  -52,  -52
     },
 
@@ -648,8 +648,8 @@ static yyconst flex_int16_t yy_nxt[][17]
     },
 
     {
-       11,   54,   54,  -54,   54,   54,   54,   54,   54,   54,
-       54,   54,   54,   54,   54,   54,   54
+       11,  -54,   54,  -54,  -54,  -54,  -54,  -54,  -54,  -54,
+      -54,  -54,  -54,  -54,  -54,  -54,  -54
 
     },
 
@@ -659,29 +659,39 @@ static yyconst flex_int16_t yy_nxt[][17]
     },
 
     {
-       11,  -56,  -56,  -56,  -56,  -56,  -56,  -56,  -56,  -56,
-      -56,   60,   57,   57,  -56,  -56,  -56
+       11,   56,   56,  -56,   56,   56,   56,   56,   56,   56,
+       56,   56,   56,   56,   56,   56,   56
     },
 
     {
        11,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
-      -57,   57,   57,   57,  -57,  -57,  -57
+      -57,  -57,  -57,  -57,  -57,  -57,  -57
     },
 
     {
        11,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
-      -58,  -58,  -58,  -58,  -58,  -58,  -58
+      -58,   62,   59,   59,  -58,  -58,  -58
     },
 
     {
        11,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
-      -59,  -59,  -59,  -59,  -59,  -59,  -59
+      -59,   59,   59,   59,  -59,  -59,  -59
 
     },
 
     {
        11,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
-      -60,   57,   57,   57,  -60,  -60,  -60
+      -60,  -60,  -60,  -60,  -60,  -60,  -60
+    },
+
+    {
+       11,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
+      -61,  -61,  -61,  -61,  -61,  -61,  -61
+    },
+
+    {
+       11,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
+      -62,   59,   59,   59,  -62,  -62,  -62
     },
 
     } ;
@@ -701,8 +711,8 @@ static void yy_fatal_error (yyconst char
 	*yy_cp = '\0'; \
 	(yy_c_buf_p) = yy_cp;
 
-#define YY_NUM_RULES 33
-#define YY_END_OF_BUFFER 34
+#define YY_NUM_RULES 34
+#define YY_END_OF_BUFFER 35
 /* This struct is not used in this scanner,
    but its presence is necessary. */
 struct yy_trans_info
@@ -710,14 +720,15 @@ struct yy_trans_info
 	flex_int32_t yy_verify;
 	flex_int32_t yy_nxt;
 	};
-static yyconst flex_int16_t yy_accept[61] =
+static yyconst flex_int16_t yy_accept[63] =
     {   0,
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
-       34,    5,    4,    2,    3,    7,    8,    6,   32,   29,
-       31,   24,   28,   27,   26,   22,   17,   13,   16,   20,
-       22,   11,   12,   19,   19,   14,   22,   22,    4,    2,
-        3,    3,    1,    6,   32,   29,   31,   30,   24,   23,
-       26,   25,   15,   20,    9,   19,   19,   21,   10,   18
+       35,    5,    4,    2,    3,    7,    8,    6,   33,   30,
+       32,   25,   29,   28,   27,   23,   22,   17,   13,   16,
+       20,   23,   11,   12,   19,   19,   14,   23,   23,    4,
+        2,    3,    3,    1,    6,   33,   30,   32,   31,   25,
+       24,   27,   26,   22,   15,   20,    9,   19,   19,   21,
+       10,   18
     } ;
 
 static yyconst flex_int32_t yy_ec[256] =
@@ -920,7 +931,7 @@ static int input (void );
 /* This used to be an fputs(), but since the string might contain NUL's,
  * we now use fwrite().
  */
-#define ECHO do { if (fwrite( zconftext, zconfleng, 1, zconfout )) {} } while (0)
+#define ECHO fwrite( zconftext, zconfleng, 1, zconfout )
 #endif
 
 /* Gets input and stuffs it into "buf".  number of characters read, or YY_NULL,
@@ -1183,14 +1194,22 @@ case 22:
 YY_RULE_SETUP
 
 	YY_BREAK
+case 23:
+YY_RULE_SETUP
+{
+		fprintf(stderr,
+		        "%s:%d:warning: ignoring unsupported character '%c'\n",
+		        zconf_curname(), zconf_lineno(), *zconftext);
+	}
+	YY_BREAK
 case YY_STATE_EOF(PARAM):
 {
 		BEGIN(INITIAL);
 	}
 	YY_BREAK
 
-case 23:
-/* rule 23 can match eol */
+case 24:
+/* rule 24 can match eol */
 *yy_cp = (yy_hold_char); /* undo effects of setting up zconftext */
 (yy_c_buf_p) = yy_cp -= 1;
 YY_DO_BEFORE_ACTION; /* set up zconftext again */
@@ -1201,14 +1220,14 @@ YY_RULE_SETUP
 		return T_WORD_QUOTE;
 	}
 	YY_BREAK
-case 24:
+case 25:
 YY_RULE_SETUP
 {
 		append_string(zconftext, zconfleng);
 	}
 	YY_BREAK
-case 25:
-/* rule 25 can match eol */
+case 26:
+/* rule 26 can match eol */
 *yy_cp = (yy_hold_char); /* undo effects of setting up zconftext */
 (yy_c_buf_p) = yy_cp -= 1;
 YY_DO_BEFORE_ACTION; /* set up zconftext again */
@@ -1219,13 +1238,13 @@ YY_RULE_SETUP
 		return T_WORD_QUOTE;
 	}
 	YY_BREAK
-case 26:
+case 27:
 YY_RULE_SETUP
 {
 		append_string(zconftext + 1, zconfleng - 1);
 	}
 	YY_BREAK
-case 27:
+case 28:
 YY_RULE_SETUP
 {
 		if (str == zconftext[0]) {
@@ -1236,8 +1255,8 @@ YY_RULE_SETUP
 			append_string(zconftext, 1);
 	}
 	YY_BREAK
-case 28:
-/* rule 28 can match eol */
+case 29:
+/* rule 29 can match eol */
 YY_RULE_SETUP
 {
 		printf("%s:%d:warning: multi-line strings not supported\n", zconf_curname(), zconf_lineno());
@@ -1252,7 +1271,7 @@ case YY_STATE_EOF(STRING):
 	}
 	YY_BREAK
 
-case 29:
+case 30:
 YY_RULE_SETUP
 {
 		ts = 0;
@@ -1277,8 +1296,8 @@ YY_RULE_SETUP
 		}
 	}
 	YY_BREAK
-case 30:
-/* rule 30 can match eol */
+case 31:
+/* rule 31 can match eol */
 *yy_cp = (yy_hold_char); /* undo effects of setting up zconftext */
 (yy_c_buf_p) = yy_cp -= 1;
 YY_DO_BEFORE_ACTION; /* set up zconftext again */
@@ -1289,15 +1308,15 @@ YY_RULE_SETUP
 		return T_HELPTEXT;
 	}
 	YY_BREAK
-case 31:
-/* rule 31 can match eol */
+case 32:
+/* rule 32 can match eol */
 YY_RULE_SETUP
 {
 		current_file->lineno++;
 		append_string("\n", 1);
 	}
 	YY_BREAK
-case 32:
+case 33:
 YY_RULE_SETUP
 {
 		while (zconfleng) {
@@ -1328,7 +1347,7 @@ case YY_STATE_EOF(COMMAND):
 	yyterminate();
 }
 	YY_BREAK
-case 33:
+case 34:
 YY_RULE_SETUP
 YY_FATAL_ERROR( "flex scanner jammed" );
 	YY_BREAK


