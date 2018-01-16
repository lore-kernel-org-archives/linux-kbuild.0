Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:41705 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751071AbeAPUjN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jan 2018 15:39:13 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH] kconfig: Clarify menu and 'if' dependency propagation
Date: Tue, 16 Jan 2018 21:39:02 +0100
Message-Id: <20180116203902.28567-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, sam@ravnborg.org, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

It is not obvious that the last two cases refer to menus and ifs,
respectively, in the conditional that sets 'parentdep'.

Automatic submenu creation is done later, so the parent can't be a
symbol here.

No functional changes. Only comments added.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/menu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 92d3f06cd8a2..b81c9b053f6e 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -325,8 +325,10 @@ void menu_finalize(struct menu *parent)
 			}
 			parentdep = expr_alloc_symbol(sym);
 		} else if (parent->prompt)
+			/* Menu node for 'menu' */
 			parentdep = parent->prompt->visible.expr;
 		else
+			/* Menu node for 'if' */
 			parentdep = parent->dep;
 
 		/* For each child menu node... */
-- 
2.14.1

