Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:44747 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753933Ab1EWILK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 04:11:10 -0400
Received: by mail-iw0-f174.google.com with SMTP id 34so4551646iwn.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2011 01:11:10 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFCv2 07/13] kconfig: back-out parser prefix, from `zconf' to `yy'
Date: Mon, 23 May 2011 04:10:33 -0400
Message-Id: <1306138239-13440-8-git-send-email-lacombar@gmail.com>
In-Reply-To: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/kconfig/lkc.h   |    2 +-
 scripts/kconfig/zconf.l |   16 ++++++++--------
 scripts/kconfig/zconf.y |   22 +++++++++++-----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index febf0c9..716c36c 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -69,7 +69,7 @@ struct kconf_id {
 };
 
 #ifdef YYDEBUG
-extern int zconfdebug;
+extern int yyebug;
 #endif
 
 int zconfparse(void);
diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index ee92b10..cf549c7 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -101,11 +101,11 @@ n	[A-Za-z0-9_]
 		current_pos.file = current_file;
 		current_pos.lineno = current_file->lineno;
 		if (id && id->flags & TF_COMMAND) {
-			zconflval.id = id;
+			yylval.id = id;
 			return id->token;
 		}
 		alloc_string(yytext, yyleng);
-		zconflval.string = text;
+		yylval.string = text;
 		return T_WORD;
 	}
 	.
@@ -134,11 +134,11 @@ n	[A-Za-z0-9_]
 	({n}|[-/.])+	{
 		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
 		if (id && id->flags & TF_PARAM) {
-			zconflval.id = id;
+			yylval.id = id;
 			return id->token;
 		}
 		alloc_string(yytext, yyleng);
-		zconflval.string = text;
+		yylval.string = text;
 		return T_WORD;
 	}
 	#.*	/* comment */
@@ -152,7 +152,7 @@ n	[A-Za-z0-9_]
 <STRING>{
 	[^'"\\\n]+/\n	{
 		append_string(yytext, yyleng);
-		zconflval.string = text;
+		yylval.string = text;
 		return T_WORD_QUOTE;
 	}
 	[^'"\\\n]+	{
@@ -160,7 +160,7 @@ n	[A-Za-z0-9_]
 	}
 	\\.?/\n	{
 		append_string(yytext + 1, yyleng - 1);
-		zconflval.string = text;
+		yylval.string = text;
 		return T_WORD_QUOTE;
 	}
 	\\.?	{
@@ -169,7 +169,7 @@ n	[A-Za-z0-9_]
 	\'|\"	{
 		if (str == yytext[0]) {
 			BEGIN(PARAM);
-			zconflval.string = text;
+			yylval.string = text;
 			return T_WORD_QUOTE;
 		} else
 			append_string(yytext, 1);
@@ -252,7 +252,7 @@ void zconf_starthelp(void)
 
 static void zconf_endhelp(void)
 {
-	zconflval.string = text;
+	yylval.string = text;
 	BEGIN(INITIAL);
 }
 
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 98c5716..8564238 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -21,10 +21,10 @@
 
 int cdebug = PRINTD;
 
-extern int zconflex(void);
+extern int yylex(void);
 static void zconfprint(const char *err, ...);
 static void zconf_error(const char *err, ...);
-static void zconferror(const char *err);
+static void yyerror(const char *err);
 static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtoken);
 
 struct symbol *symbol_hash[SYMBOL_HASHSIZE];
@@ -505,10 +505,10 @@ void conf_parse(const char *name)
 
 #if YYDEBUG
 	if (getenv("ZCONF_DEBUG"))
-		zconfdebug = 1;
+		yydebug = 1;
 #endif
-	zconfparse();
-	if (zconfnerrs)
+	yyparse();
+	if (yynerrs)
 		exit(1);
 	if (!modules_sym->prop) {
 		struct property *prop;
@@ -523,9 +523,9 @@ void conf_parse(const char *name)
 	menu_finalize(&rootmenu);
 	for_all_symbols(i, sym) {
 		if (sym_check_deps(sym))
-			zconfnerrs++;
+			yynerrs++;
         }
-	if (zconfnerrs)
+	if (yynerrs)
 		exit(1);
 	sym_set_change_count(1);
 }
@@ -550,7 +550,7 @@ static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtok
 	if (id->token != endtoken) {
 		zconf_error("unexpected '%s' within %s block",
 			kconf_id_strings + id->name, zconf_tokenname(starttoken));
-		zconfnerrs++;
+		yynerrs++;
 		return false;
 	}
 	if (current_menu->file != current_file) {
@@ -559,7 +559,7 @@ static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtok
 		fprintf(stderr, "%s:%d: location of the '%s'\n",
 			current_menu->file->name, current_menu->lineno,
 			zconf_tokenname(starttoken));
-		zconfnerrs++;
+		yynerrs++;
 		return false;
 	}
 	return true;
@@ -580,7 +580,7 @@ static void zconf_error(const char *err, ...)
 {
 	va_list ap;
 
-	zconfnerrs++;
+	yynerrs++;
 	fprintf(stderr, "%s:%d: ", zconf_curname(), zconf_lineno());
 	va_start(ap, err);
 	vfprintf(stderr, err, ap);
@@ -588,7 +588,7 @@ static void zconf_error(const char *err, ...)
 	fprintf(stderr, "\n");
 }
 
-static void zconferror(const char *err)
+static void yyerror(const char *err)
 {
 #if YYDEBUG
 	fprintf(stderr, "%s:%d: %s\n", zconf_curname(), zconf_lineno() + 1, err);
-- 
1.7.3.4.574.g608b.dirty

