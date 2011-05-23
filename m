Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:45855 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753887Ab1EWILK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 04:11:10 -0400
Received: by mail-iy0-f174.google.com with SMTP id 14so4457027iyb.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2011 01:11:10 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFCv2 08/13] kconfig: kill no longer needed reference to YYDEBUG
Date: Mon, 23 May 2011 04:10:34 -0400
Message-Id: <1306138239-13440-9-git-send-email-lacombar@gmail.com>
In-Reply-To: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/kconfig/lkc.h   |    2 --
 scripts/kconfig/zconf.y |   12 +++---------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 716c36c..81d25b0 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -68,9 +68,7 @@ struct kconf_id {
 	enum symbol_type stype;
 };
 
-#ifdef YYDEBUG
 extern int yyebug;
-#endif
 
 int zconfparse(void);
 void zconfdump(FILE *out);
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 8564238..8f8dc70 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -31,10 +31,6 @@ struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 
 static struct menu *current_menu, *current_entry;
 
-#define YYDEBUG 0
-#if YYDEBUG
-#define YYERROR_VERBOSE
-#endif
 %}
 %expect 30
 
@@ -503,10 +499,10 @@ void conf_parse(const char *name)
 	modules_sym->flags |= SYMBOL_AUTO;
 	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
 
-#if YYDEBUG
-	if (getenv("ZCONF_DEBUG"))
+	if (getenv("ZCONF_DEBUG")) {
+		extern int yydebug;
 		yydebug = 1;
-#endif
+	}
 	yyparse();
 	if (yynerrs)
 		exit(1);
@@ -590,9 +586,7 @@ static void zconf_error(const char *err, ...)
 
 static void yyerror(const char *err)
 {
-#if YYDEBUG
 	fprintf(stderr, "%s:%d: %s\n", zconf_curname(), zconf_lineno() + 1, err);
-#endif
 }
 
 static void print_quoted_string(FILE *out, const char *str)
-- 
1.7.3.4.574.g608b.dirty

