Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:41880 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728293AbeHMTdg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Aug 2018 15:33:36 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kconfig: remove unused sym_get_env_prop() function
Date: Tue, 14 Aug 2018 01:48:38 +0900
Message-Id: <1534178919-8375-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This function is unused since commit 104daea149c4 ("kconfig: reference
environment variables directly and remove 'option env='").

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/lkc.h    | 1 -
 scripts/kconfig/symbol.c | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 6b7bbc6..9eb7c83 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -125,7 +125,6 @@ const char *sym_get_string_default(struct symbol *sym);
 struct symbol *sym_check_deps(struct symbol *sym);
 struct property *prop_alloc(enum prop_type type, struct symbol *sym);
 struct symbol *prop_get_symbol(struct property *prop);
-struct property *sym_get_env_prop(struct symbol *sym);
 
 static inline tristate sym_get_tristate_value(struct symbol *sym)
 {
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 869a5e8..073d780 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -76,15 +76,6 @@ struct property *sym_get_choice_prop(struct symbol *sym)
 	return NULL;
 }
 
-struct property *sym_get_env_prop(struct symbol *sym)
-{
-	struct property *prop;
-
-	for_all_properties(sym, prop, P_ENV)
-		return prop;
-	return NULL;
-}
-
 static struct property *sym_get_default_prop(struct symbol *sym)
 {
 	struct property *prop;
-- 
2.7.4
