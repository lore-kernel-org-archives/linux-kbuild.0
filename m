Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:52352 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752085AbdJHRgU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Oct 2017 13:36:20 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 3/3] kconfig: Fix choice symbol expression leak
Date: Sun,  8 Oct 2017 19:35:46 +0200
Message-Id: <1507484146-23617-4-git-send-email-ulfalizer@gmail.com>
In-Reply-To: <1507484146-23617-1-git-send-email-ulfalizer@gmail.com>
References: <1507484146-23617-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, michal.lkml@markovi.net, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, walch.martin@web.de, JBeulich@suse.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

When propagating dependencies from parents after parsing, an expression
node is allocated if the parent symbol is a 'choice'. This node was
never freed.

Outline of leak:

	if (sym && sym_is_choice(sym)) {
		...
		*Allocate (in this case only)*
		parentdep = expr_alloc_symbol(sym);
	} else if (parent->prompt)
		parentdep = parent->prompt->visible.expr;
	else
		parentdep = parent->dep;

	for (menu = parent->list; menu; menu = menu->next) {
		...
		*Copy*
		basedep = expr_alloc_and(expr_copy(parentdep), basedep);
		...
	}
	*parentdep lost if the parent is a choice!*

Fix by freeing 'parentdep' after the loop if the parent symbol is a
choice. Note that this only frees the expression node and not the choice
symbol itself.

Summary from Valgrind on 'menuconfig' (ARCH=x86) before the fix:

	LEAK SUMMARY:
	   definitely lost: 1,608 bytes in 67 blocks
	   ...

Summary after the fix:

	LEAK SUMMARY:
	   definitely lost: 0 bytes in 0 blocks
	   ...

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/menu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 749c2bd..e0badd9 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -344,6 +344,10 @@ void menu_finalize(struct menu *parent)
 				}
 			}
 		}
+
+		if (sym && sym_is_choice(sym))
+			expr_free(parentdep);
+
 		for (menu = parent->list; menu; menu = menu->next)
 			menu_finalize(menu);
 	} else if (sym) {
-- 
2.7.4

