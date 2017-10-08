Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:52350 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751519AbdJHRgS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Oct 2017 13:36:18 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 1/3] kconfig: Fix automatic menu creation mem leak
Date: Sun,  8 Oct 2017 19:35:44 +0200
Message-Id: <1507484146-23617-2-git-send-email-ulfalizer@gmail.com>
In-Reply-To: <1507484146-23617-1-git-send-email-ulfalizer@gmail.com>
References: <1507484146-23617-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, michal.lkml@markovi.net, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, walch.martin@web.de, JBeulich@suse.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

expr_trans_compare() always allocates and returns a new expression,
giving the following leak outline:

	...
	*Allocate*
	basedep = expr_trans_compare(basedep, E_UNEQUAL, &symbol_no);
	...
	for (menu = parent->next; menu; menu = menu->next) {
		...
		*Copy*
		dep2 = expr_copy(basedep);
		...
		*Free copy*
		expr_free(dep2);
	}
	*basedep lost!*

Fix by freeing 'basedep' after the loop.

Summary from Valgrind on 'menuconfig' (ARCH=x86) before the fix:

	LEAK SUMMARY:
	   definitely lost: 344,376 bytes in 14,349 blocks
	   ...

Summary after the fix:

	LEAK SUMMARY:
	   definitely lost: 44,448 bytes in 1,852 blocks
	   ...

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/menu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index e935793..749c2bd 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -372,6 +372,7 @@ void menu_finalize(struct menu *parent)
 			menu->parent = parent;
 			last_menu = menu;
 		}
+		expr_free(basedep);
 		if (last_menu) {
 			parent->list = parent->next;
 			parent->next = last_menu->next;
-- 
2.7.4

