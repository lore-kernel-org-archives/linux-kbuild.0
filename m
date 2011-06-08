Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:54298 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750898Ab1FHFDh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jun 2011 01:03:37 -0400
Received: by iwn34 with SMTP id 34so128425iwn.19
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Jun 2011 22:03:36 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFCv5] Kbuild: factor parser rules
Date: Wed,  8 Jun 2011 01:03:28 -0400
Message-Id: <1307509408-2497-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1307479931-10424-1-git-send-email-lacombar@gmail.com>
References: <1307479931-10424-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

Hi Michal,

Here is some update concerning the parser generation merge. I do not repost the
whole serie as it may be overkill. You can find the latest branch at:

git://github.com/lacombar/linux-2.6.git kbuild-implicit-parser-rule

So let't get it done the safe way...

Changes since v4:
 - split the parser definition and its associated header. This workaround
   gmake(1) inabilities to link implicit rules [... or my own to find the right
   sequence :)]. As you can see with the incremental diff, the .tab.c is
   absolutly not alterated by this change
 - nuke the unused `scripts/kconfig/zconf.tab.h_shipped'
 - avoids long lines in the lexer/parser command
 - clean-up {genksyms,dtc}/Makefile

Changes since v3:
 - fix the %_shipped implicit rule
 - attempt to tweak the relation between `$(src)/%.tab.c_shipped' and
  `$(src)/%.tab.h_shipped' to make it more robust. This is _very_ delicate as
  gmake has trouble to properly generate `$(obj)/%.tab.h' from
  `$(src)/%.tab.h_shipped' if it is missing and requires
  `$(src)/%.tab.c_shipped' to be created. This now survives a full deletion of
  the i%_shipped files.
 - a few spacing nits
 - removes a few useless explicit dependency
 - do not degerate extra `lex.debug' file when regenerating kconfig's parser
 - removed missed occurences of YYDEBUG

Changes since v2:
 - allow a parser to specify the prefix to be used. This will allow for multiple
 parser to use the implicit rules, which was not previously possible, as it
 was using the `yy' default.
 - drop the zconf prefix changes
 - add a `baseprereq' global to kbuild, which mimics `basetarget'
 - rebase on top of v3.0-rc1

Changes since v1:
 - include scripts/dtc/' parser in the scope of the patchset
 - do not rename any parser source
 - make lexer file name consistent, ie. name it %.lex.c, not lex.%.c
 - rebase on top of v2.6.39

Regards,
 - Arnaud

Arnaud Lacombe (14):
      kbuild: add `baseprereq'
      kbuild: add implicit rules for parser generation
      kbuild: simplify the %_shipped rule
      genksyms: pass hash and lookup functions name and target language though the input file
      genksyms: drop -Wno-uninitialized from HOSTCFLAGS_parse.tab.o
      genksyms: migrate parser to implicit rules
      genksym: regen parser
      kconfig: constify `kconf_id_lookup'
      kconfig: kill no longer needed reference to YYDEBUG
      kconfig/zconf.l: do not ask to generate backup
      kconfig: migrate parser to implicit rules
      kconfig: regen parser
      dtc: migrate parser to implicit rules
      dtc: regen parser

---
 scripts/Makefile.lib                |   16 +++++-
 scripts/dtc/Makefile                |    4 +-
 scripts/genksyms/Makefile           |    9 ++--
 scripts/kconfig/zconf.tab.h_shipped |  101 -----------------------------------
 4 files changed, 18 insertions(+), 112 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index ad062b7..aeea84a 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -172,20 +172,30 @@ $(src)/%.hash.c_shipped: $(src)/%.gperf
 
 # LEX
 # ---------------------------------------------------------------------------
+LEX_PREFIX = $(if $(LEX_PREFIX_${baseprereq}),$(LEX_PREFIX_${baseprereq}),yy)
+
 quiet_cmd_flex = LEX     $@
-      cmd_flex = flex -o$@ -L -P $(if $(LEX_PREFIX_${baseprereq}),$(LEX_PREFIX_${baseprereq}),yy) $<
+      cmd_flex = flex -o$@ -L -P $(LEX_PREFIX) $<
 
 $(src)/%.lex.c_shipped: $(src)/%.l
 	$(call cmd,flex)
 
 # YACC
 # ---------------------------------------------------------------------------
+YACC_PREFIX = $(if $(YACC_PREFIX_${baseprereq}),$(YACC_PREFIX_${baseprereq}),yy)
+
 quiet_cmd_bison = YACC    $@
-      cmd_bison = bison -o$@ -d -t -l -p $(if $(YACC_PREFIX_${baseprereq}),$(YACC_PREFIX_${baseprereq}),yy) $<
+      cmd_bison = bison -o$@ -t -l -p $(YACC_PREFIX) $<
 
-$(src)/%.tab.c_shipped $(src)/%.tab.h_shipped: $(src)/%.y
+$(src)/%.tab.c_shipped: $(src)/%.y
 	$(call cmd,bison)
 
+quiet_cmd_bison_h = YACC    $@
+      cmd_bison_h = bison -o/dev/null --defines=$@ -t -l -p $(YACC_PREFIX) $<
+
+$(src)/%.tab.h_shipped: $(src)/%.y
+	$(call cmd,bison_h)
+
 endif
 
 # Shipped files
diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index a957ab4..6d1c6bb 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -25,7 +25,5 @@ HOSTCFLAGS_dtc-lexer.lex.o := $(HOSTCFLAGS_DTC)
 HOSTCFLAGS_dtc-parser.tab.o := $(HOSTCFLAGS_DTC)
 
 # dependencies on generated files need to be listed explicitly
-$(obj)/dtc-parser.tab.o: $(obj)/dtc-parser.tab.c $(obj)/dtc-parser.tab.h
-
-$(obj)/dtc-lexer.lex.o: $(obj)/dtc-parser.tab.c $(obj)/dtc-parser.tab.h
+$(obj)/dtc-lexer.lex.o: $(obj)/dtc-parser.tab.h
 
diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index 0b883e3..a551090 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -5,10 +5,9 @@ always		:= $(hostprogs-y)
 genksyms-objs	:= genksyms.o parse.tab.o lex.lex.o
 
 # -I needed for generated C source (shipped source)
-HOSTCFLAGS_parse.tab.o := -Wno-uninitialized -I$(src)
+HOSTCFLAGS_parse.tab.o := -I$(src)
+HOSTCFLAGS_lex.lex.o := -I$(src)
 
-$(obj)/parse.tab.o: $(obj)/parse.tab.c $(obj)/parse.tab.h
-
-$(obj)/lex.lex.o: $(obj)/keywords.hash.c
-$(obj)/lex.lex.o: $(obj)/parse.tab.c $(obj)/parse.tab.h
+# dependencies on generated files need to be listed explicitly
+$(obj)/lex.lex.o: $(obj)/keywords.hash.c $(obj)/parse.tab.h
 
diff --git a/scripts/kconfig/zconf.tab.h_shipped b/scripts/kconfig/zconf.tab.h_shipped
deleted file mode 100644
index 724a7e8..0000000
--- a/scripts/kconfig/zconf.tab.h_shipped
+++ /dev/null
@@ -1,101 +0,0 @@
-/* A Bison parser, made by GNU Bison 2.4.3.  */
-
-/* Skeleton interface for Bison's Yacc-like parsers in C
-   
-      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006,
-   2009, 2010 Free Software Foundation, Inc.
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
-     T_MAINMENU = 258,
-     T_MENU = 259,
-     T_ENDMENU = 260,
-     T_SOURCE = 261,
-     T_CHOICE = 262,
-     T_ENDCHOICE = 263,
-     T_COMMENT = 264,
-     T_CONFIG = 265,
-     T_MENUCONFIG = 266,
-     T_HELP = 267,
-     T_HELPTEXT = 268,
-     T_IF = 269,
-     T_ENDIF = 270,
-     T_DEPENDS = 271,
-     T_OPTIONAL = 272,
-     T_PROMPT = 273,
-     T_TYPE = 274,
-     T_DEFAULT = 275,
-     T_SELECT = 276,
-     T_RANGE = 277,
-     T_VISIBLE = 278,
-     T_OPTION = 279,
-     T_ON = 280,
-     T_WORD = 281,
-     T_WORD_QUOTE = 282,
-     T_UNEQUAL = 283,
-     T_CLOSE_PAREN = 284,
-     T_OPEN_PAREN = 285,
-     T_EOL = 286,
-     T_OR = 287,
-     T_AND = 288,
-     T_EQUAL = 289,
-     T_NOT = 290
-   };
-#endif
-
-
-
-#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
-typedef union YYSTYPE
-{
-
-
-	char *string;
-	struct file *file;
-	struct symbol *symbol;
-	struct expr *expr;
-	struct menu *menu;
-	const struct kconf_id *id;
-
-
-
-} YYSTYPE;
-# define YYSTYPE_IS_TRIVIAL 1
-# define yystype YYSTYPE /* obsolescent; will be withdrawn */
-# define YYSTYPE_IS_DECLARED 1
-#endif
-
-extern YYSTYPE zconflval;
-
-

-- 
1.7.3.4.574.g608b.dirty
