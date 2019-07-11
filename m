Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:19441 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfGKHdp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 03:33:45 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kconfig: remove meaningless if-conditional in conf_read()
Date: Thu, 11 Jul 2019 16:33:17 +0900
Message-Id: <20190711073317.27248-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

sym_is_choice(sym) has already been checked by previous if-block:

    if (sym_is_choice(sym) || (sym->flags & SYMBOL_NO_WRITE))
            continue;

Hence, the following code is redundant, and the comment is misleading:

    if (!sym_is_choice(sym))
            continue;
    /* fall through */

It always takes 'continue', never falls though.

Clean up the dead code.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/confdata.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 18e8051d89d7..cbb6efa4a5a6 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -534,11 +534,9 @@ int conf_read(const char *name)
 			switch (sym->type) {
 			case S_BOOLEAN:
 			case S_TRISTATE:
-				if (sym->def[S_DEF_USER].tri != sym_get_tristate_value(sym))
-					break;
-				if (!sym_is_choice(sym))
+				if (sym->def[S_DEF_USER].tri == sym_get_tristate_value(sym))
 					continue;
-				/* fall through */
+				break;
 			default:
 				if (!strcmp(sym->curr.val, sym->def[S_DEF_USER].val))
 					continue;
-- 
2.17.1
