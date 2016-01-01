Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:17724 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751718AbcAAQeQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 1 Jan 2016 11:34:16 -0500
From: Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH] kconfig: return 'false' instead of 'no' in bool function
Date: Fri,  1 Jan 2016 17:34:05 +0100
Message-Id: <1451666045-12198-1-git-send-email-vegard.nossum@oracle.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>, Arnaud Lacombe <lacombar@gmail.com>, Mauro Carvalho Chehab <mchehab@redhat.com>

menu_is_visible() is a bool function and should use boolean return
values. "no" is a tristate value which happens to also have a value
of 0, but we should nevertheless use the right symbol for it.

This is a very minor cleanup with no semantic change.

Fixes: 86e187ff9 ("kconfig: add an option to determine a menu's visibility")
Cc: Arnaud Lacombe <lacombar@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 scripts/kconfig/menu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index b05cc3d..aed678e 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -477,7 +477,7 @@ bool menu_is_visible(struct menu *menu)
 
 	if (menu->visibility) {
 		if (expr_calc_value(menu->visibility) == no)
-			return no;
+			return false;
 	}
 
 	sym = menu->sym;
-- 
1.9.1

