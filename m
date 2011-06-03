Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:57991 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750990Ab1FCRRI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 3 Jun 2011 13:17:08 -0400
Received: by ywe9 with SMTP id 9so837274ywe.19
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Jun 2011 10:17:07 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFCv3] Kbuild: factor parser rules
Date: Fri,  3 Jun 2011 13:16:52 -0400
Message-Id: <1307121412-6314-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

Hi Michal,

Here is some update concerning the parser generation merge. I do not repost the
whole serie as it may be overkill. You can find the latest branch at:

git://github.com/lacombar/linux-2.6.git kbuild-implicit-parser-rule

You'll find an updated diff between v2 [rebased on top of v3.0-rc1] and v3
below.

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

I am still not a huge fan of the {YACC,LEX}_PREFIX_ naming, if you got a better
idea, it is most welcome !

Regards,
 - Arnaud

Arnaud Lacombe (11):
      kbuild: add `baseprereq'
      kbuild: add implicit rules for parser generation
      genksyms: pass hash and lookup functions name and target language though the input file
      genksyms: migrate parser to implicit rules
      genksym: regen parser
      kconfig: constify `kconf_id_lookup'
      kconfig: kill no longer needed reference to YYDEBUG
      kconfig: migrate parser to implicit rules
      kconfig: regen parser
      dtc: migrate parser to implicit rules
      dtc: regen parser

---
 scripts/Kbuild.include   |    4 ++++
 scripts/Makefile.lib     |    5 +++--
 scripts/kconfig/Makefile |    3 +++
 scripts/kconfig/lkc.h    |    2 +-
 scripts/kconfig/zconf.l  |   16 ++++++++--------
 scripts/kconfig/zconf.y  |   28 ++++++++++++++--------------
 6 files changed, 33 insertions(+), 25 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index be39cd1..d897278 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -21,6 +21,10 @@ depfile = $(subst $(comma),_,$(dot-target).d)
 basetarget = $(basename $(notdir $@))
 
 ###
+# filename of first prerequisite with directory and extension stripped
+baseprereq = $(basename $(notdir $<))
+
+###
 # Escape single quote for use in echo statements
 escsq = $(subst $(squote),'\$(squote)',$1)
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 104d53f5..f76d9ba 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -171,14 +171,15 @@ $(src)/%.hash.c_shipped: $(src)/%.gperf
 # LEX
 # ---------------------------------------------------------------------------
 quiet_cmd_flex = LEX     $@
-      cmd_flex = flex -o$@ -L $<
+      cmd_flex = flex -o$@ -L -P $(if $(LEX_PREFIX_${baseprereq}),$(LEX_PREFIX_${baseprereq}),yy) $<
+
 $(src)/%.lex.c_shipped: $(src)/%.l
 	$(call cmd,flex)
 
 # YACC
 # ---------------------------------------------------------------------------
 quiet_cmd_bison = YACC    $@
-      cmd_bison = bison -o$@ -d -t -l $<
+      cmd_bison = bison -o$@ -d -t -l -p $(if $(YACC_PREFIX_${baseprereq}),$(YACC_PREFIX_${baseprereq}),yy) $<
 $(src)/%.tab.c_shipped: $(src)/%.y
 	$(call cmd,bison)
 
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 536012d..0b4276c 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -223,6 +223,9 @@ HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCC)
 HOSTCFLAGS_zconf.lex.o	:= -I$(src)
 HOSTCFLAGS_zconf.tab.o	:= -I$(src)
 
+LEX_PREFIX_zconf	:= zconf
+YACC_PREFIX_zconf	:= zconf
+
 HOSTLOADLIBES_qconf	= $(KC_QT_LIBS) -ldl
 HOSTCXXFLAGS_qconf.o	= $(KC_QT_CFLAGS) -D LKC_DIRECT_LINK
 
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 9fab6d3..f34a0a9 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -68,7 +68,7 @@ struct kconf_id {
 	enum symbol_type stype;
 };
 
-extern int yydebug;
+extern int zconfdebug;
 
 int zconfparse(void);
 void zconfdump(FILE *out);
diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 9ca6e5f..98aad53 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -101,11 +101,11 @@ n	[A-Za-z0-9_]
 		current_pos.file = current_file;
 		current_pos.lineno = current_file->lineno;
 		if (id && id->flags & TF_COMMAND) {
-			yylval.id = id;
+			zconflval.id = id;
 			return id->token;
 		}
 		alloc_string(yytext, yyleng);
-		yylval.string = text;
+		zconflval.string = text;
 		return T_WORD;
 	}
 	.
@@ -134,11 +134,11 @@ n	[A-Za-z0-9_]
 	({n}|[-/.])+	{
 		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
 		if (id && id->flags & TF_PARAM) {
-			yylval.id = id;
+			zconflval.id = id;
 			return id->token;
 		}
 		alloc_string(yytext, yyleng);
-		yylval.string = text;
+		zconflval.string = text;
 		return T_WORD;
 	}
 	#.*	/* comment */
@@ -152,7 +152,7 @@ n	[A-Za-z0-9_]
 <STRING>{
 	[^'"\\\n]+/\n	{
 		append_string(yytext, yyleng);
-		yylval.string = text;
+		zconflval.string = text;
 		return T_WORD_QUOTE;
 	}
 	[^'"\\\n]+	{
@@ -160,7 +160,7 @@ n	[A-Za-z0-9_]
 	}
 	\\.?/\n	{
 		append_string(yytext + 1, yyleng - 1);
-		yylval.string = text;
+		zconflval.string = text;
 		return T_WORD_QUOTE;
 	}
 	\\.?	{
@@ -169,7 +169,7 @@ n	[A-Za-z0-9_]
 	\'|\"	{
 		if (str == yytext[0]) {
 			BEGIN(PARAM);
-			yylval.string = text;
+			zconflval.string = text;
 			return T_WORD_QUOTE;
 		} else
 			append_string(yytext, 1);
@@ -252,7 +252,7 @@ void zconf_starthelp(void)
 
 static void zconf_endhelp(void)
 {
-	yylval.string = text;
+	zconflval.string = text;
 	BEGIN(INITIAL);
 }
 
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 157d31f..f661b4c 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -21,10 +21,10 @@
 
 int cdebug = PRINTD;
 
-extern int yylex(void);
+extern int zconflex(void);
 static void zconfprint(const char *err, ...);
 static void zconf_error(const char *err, ...);
-static void yyerror(const char *err);
+static void zconferror(const char *err);
 static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtoken);
 
 struct symbol *symbol_hash[SYMBOL_HASHSIZE];
@@ -499,12 +499,12 @@ void conf_parse(const char *name)
 	modules_sym->flags |= SYMBOL_AUTO;
 	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
 
-	if (getenv("ZCONF_DEBUG")) {
-		extern int yydebug;
-		yydebug = 1;
-	}
-	yyparse();
-	if (yynerrs)
+#if YYDEBUG
+	if (getenv("ZCONF_DEBUG"))
+		zconfdebug = 1;
+#endif
+	zconfparse();
+	if (zconfnerrs)
 		exit(1);
 	if (!modules_sym->prop) {
 		struct property *prop;
@@ -519,9 +519,9 @@ void conf_parse(const char *name)
 	menu_finalize(&rootmenu);
 	for_all_symbols(i, sym) {
 		if (sym_check_deps(sym))
-			yynerrs++;
+			zconfnerrs++;
         }
-	if (yynerrs)
+	if (zconfnerrs)
 		exit(1);
 	sym_set_change_count(1);
 }
@@ -546,7 +546,7 @@ static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtok
 	if (id->token != endtoken) {
 		zconf_error("unexpected '%s' within %s block",
 			kconf_id_strings + id->name, zconf_tokenname(starttoken));
-		yynerrs++;
+		zconfnerrs++;
 		return false;
 	}
 	if (current_menu->file != current_file) {
@@ -555,7 +555,7 @@ static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtok
 		fprintf(stderr, "%s:%d: location of the '%s'\n",
 			current_menu->file->name, current_menu->lineno,
 			zconf_tokenname(starttoken));
-		yynerrs++;
+		zconfnerrs++;
 		return false;
 	}
 	return true;
@@ -576,7 +576,7 @@ static void zconf_error(const char *err, ...)
 {
 	va_list ap;
 
-	yynerrs++;
+	zconfnerrs++;
 	fprintf(stderr, "%s:%d: ", zconf_curname(), zconf_lineno());
 	va_start(ap, err);
 	vfprintf(stderr, err, ap);
@@ -584,7 +584,7 @@ static void zconf_error(const char *err, ...)
 	fprintf(stderr, "\n");
 }
 
-static void yyerror(const char *err)
+static void zconferror(const char *err)
 {
 	fprintf(stderr, "%s:%d: %s\n", zconf_curname(), zconf_lineno() + 1, err);
 }
