Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:41918 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730202AbeHMTdj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Aug 2018 15:33:39 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kconfig: remove P_ENV property type
Date: Tue, 14 Aug 2018 01:48:39 +0900
Message-Id: <1534178919-8375-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1534178919-8375-1-git-send-email-yamada.masahiro@socionext.com>
References: <1534178919-8375-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This property is not set by anyone since commit 104daea149c4 ("kconfig:
reference environment variables directly and remove 'option env='").

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/expr.h   | 1 -
 scripts/kconfig/qconf.cc | 1 -
 scripts/kconfig/symbol.c | 2 --
 3 files changed, 4 deletions(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 84a5199..7c329e1 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -185,7 +185,6 @@ enum prop_type {
 	P_SELECT,   /* select BAR */
 	P_IMPLY,    /* imply BAR */
 	P_RANGE,    /* range 7..100 (for a symbol) */
-	P_ENV,      /* value from environment variable */
 	P_SYMBOL,   /* where a symbol is defined */
 };
 
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 62261b3..ef4310f 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1149,7 +1149,6 @@ QString ConfigInfoView::debug_info(struct symbol *sym)
 		case P_DEFAULT:
 		case P_SELECT:
 		case P_RANGE:
-		case P_ENV:
 			debug += prop_get_type_name(prop->type);
 			debug += ": ";
 			expr_print(prop->expr, expr_print_help, &debug, E_NONE);
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 073d780..4ec8b1f 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1289,8 +1289,6 @@ const char *prop_get_type_name(enum prop_type type)
 	switch (type) {
 	case P_PROMPT:
 		return "prompt";
-	case P_ENV:
-		return "env";
 	case P_COMMENT:
 		return "comment";
 	case P_MENU:
-- 
2.7.4
