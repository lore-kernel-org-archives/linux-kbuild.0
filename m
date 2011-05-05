Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:65196 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752615Ab1EECDl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2011 22:03:41 -0400
Received: by iyb14 with SMTP id 14so1449087iyb.19
        for <linux-kbuild@vger.kernel.org>; Wed, 04 May 2011 19:03:41 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFC 5/9] kconfig: constify `kconf_id_lookup'
Date: Wed,  4 May 2011 22:03:20 -0400
Message-Id: <1304561004-2684-6-git-send-email-lacombar@gmail.com>
In-Reply-To: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
References: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/kconfig/zconf.gperf |    2 +-
 scripts/kconfig/zconf.l     |    4 ++--
 scripts/kconfig/zconf.y     |    8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

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

