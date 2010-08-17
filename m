Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:55779 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751286Ab0HQFtg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Aug 2010 01:49:36 -0400
Received: by gyg10 with SMTP id 10so2223049gyg.19
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2010 22:49:36 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] kbuild: delay rootmenu prompt initialization
Date: Tue, 17 Aug 2010 01:44:20 -0400
Message-Id: <1282023860-13242-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1282023725-20428-1-git-send-email-lacombar@gmail.com>
References: <1282023725-20428-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

In order to be able to get the mainmenu prompt, the rootmenu's prompt need
to be deferred after zconfparse(), but still before menu_finalize().

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/kconfig/zconf.y |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 18c9a28..8788d77 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -486,7 +486,6 @@ void conf_parse(const char *name)
 	modules_sym = sym_lookup(NULL, 0);
 	modules_sym->type = S_BOOLEAN;
 	modules_sym->flags |= SYMBOL_AUTO;
-	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
 
 #if YYDEBUG
 	if (getenv("ZCONF_DEBUG"))
@@ -501,6 +500,9 @@ void conf_parse(const char *name)
 		prop = prop_alloc(P_DEFAULT, modules_sym);
 		prop->expr = expr_alloc_symbol(sym_lookup("MODULES", 0));
 	}
+
+	rootmenu.prompt = menu_add_prompt(P_MENU, mainmenu_get_prompt(), NULL);
+
 	menu_finalize(&rootmenu);
 	for_all_symbols(i, sym) {
 		if (sym_check_deps(sym))
-- 
1.7.2.30.gc37d7.dirty

