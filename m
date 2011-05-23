Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:43870 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753930Ab1EWILJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 04:11:09 -0400
Received: by iwn34 with SMTP id 34so4551698iwn.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2011 01:11:09 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFCv2 06/13] kconfig: constify `kconf_id_lookup'
Date: Mon, 23 May 2011 04:10:32 -0400
Message-Id: <1306138239-13440-7-git-send-email-lacombar@gmail.com>
In-Reply-To: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/kconfig/Makefile    |    2 +-
 scripts/kconfig/zconf.gperf |    2 +-
 scripts/kconfig/zconf.l     |    4 ++--
 scripts/kconfig/zconf.y     |    8 ++++----
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 368ae30..088ed9b 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -348,7 +348,7 @@ lex.%.c: %.l
 	cp $@ $@_shipped
 
 %.hash.c: %.gperf
-	gperf < $< > $@
+	gperf -C < $< > $@
 	cp $@ $@_shipped
 
 endif
diff --git a/scripts/kconfig/zconf.gperf b/scripts/kconfig/zconf.gperf
index c9e690e..f14ab41 100644
--- a/scripts/kconfig/zconf.gperf
+++ b/scripts/kconfig/zconf.gperf
@@ -9,7 +9,7 @@
 
 struct kconf_id;
 
-static struct kconf_id *kconf_id_lookup(register const char *str, register unsigned int len);
+static const struct kconf_id *kconf_id_lookup(register const char *str, register unsigned int len);
 
 %%
 mainmenu,	T_MAINMENU,	TF_COMMAND
diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 3dbaec1..ee92b10 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -96,7 +96,7 @@ n	[A-Za-z0-9_]
 
 <COMMAND>{
 	{n}+	{
-		struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
+		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
 		BEGIN(PARAM);
 		current_pos.file = current_file;
 		current_pos.lineno = current_file->lineno;
@@ -132,7 +132,7 @@ n	[A-Za-z0-9_]
 	\n	BEGIN(INITIAL); current_file->lineno++; return T_EOL;
 	---	/* ignore */
 	({n}|[-/.])+	{
-		struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
+		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
 		if (id && id->flags & TF_PARAM) {
 			zconflval.id = id;
 			return id->token;
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 49fb4ab..98c5716 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -25,7 +25,7 @@ extern int zconflex(void);
 static void zconfprint(const char *err, ...);
 static void zconf_error(const char *err, ...);
 static void zconferror(const char *err);
-static bool zconf_endtoken(struct kconf_id *id, int starttoken, int endtoken);
+static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtoken);
 
 struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 
@@ -45,7 +45,7 @@ static struct menu *current_menu, *current_entry;
 	struct symbol *symbol;
 	struct expr *expr;
 	struct menu *menu;
-	struct kconf_id *id;
+	const struct kconf_id *id;
 }
 
 %token <id>T_MAINMENU
@@ -229,7 +229,7 @@ symbol_option_list:
 	  /* empty */
 	| symbol_option_list T_WORD symbol_option_arg
 {
-	struct kconf_id *id = kconf_id_lookup($2, strlen($2));
+	const struct kconf_id *id = kconf_id_lookup($2, strlen($2));
 	if (id && id->flags & TF_OPTION)
 		menu_add_option(id->token, $3);
 	else
@@ -545,7 +545,7 @@ static const char *zconf_tokenname(int token)
 	return "<token>";
 }
 
-static bool zconf_endtoken(struct kconf_id *id, int starttoken, int endtoken)
+static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtoken)
 {
 	if (id->token != endtoken) {
 		zconf_error("unexpected '%s' within %s block",
-- 
1.7.3.4.574.g608b.dirty

