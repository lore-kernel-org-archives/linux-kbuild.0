Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49221 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727197AbfLQEOn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:14:43 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/8] kconfig: use parent->dep as the parentdep of 'menu'
Date: Tue, 17 Dec 2019 13:14:17 +0900
Message-Id: <20191217041424.29285-3-masahiroy@kernel.org>
In-Reply-To: <20191217041424.29285-1-masahiroy@kernel.org>
References: <20191217041424.29285-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

In menu_finalize(), the dependency of a menu entry is propagated
downwards.

For the 'menu', ->dep and ->prompt->visible.expr are the same.
Both accumulate the 'depends on' of itself and upper menu entries.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/menu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index b1b1ee8cf987..bbabf0a59ac4 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -326,12 +326,10 @@ void menu_finalize(struct menu *parent)
 			 * choice value symbols.
 			 */
 			parentdep = expr_alloc_symbol(sym);
-		} else if (parent->prompt)
-			/* Menu node for 'menu' */
-			parentdep = parent->prompt->visible.expr;
-		else
-			/* Menu node for 'if' */
+		} else {
+			/* Menu node for 'menu', 'if' */
 			parentdep = parent->dep;
+		}
 
 		/* For each child menu node... */
 		for (menu = parent->list; menu; menu = menu->next) {
-- 
2.17.1
