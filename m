Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:48333 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751803Ab3J3Vqc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Oct 2013 17:46:32 -0400
Received: by mail-wg0-f49.google.com with SMTP id x12so1967931wgg.16
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2013 14:46:31 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 6/7] kconfig: fix bug in search results string: use strlen(gstr->s), not gstr->len
Date: Wed, 30 Oct 2013 22:46:19 +0100
Message-Id: <503c823048e81cc85c0e9d8c297cc70203e335e5.1383168460.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1383168460.git.yann.morin.1998@free.fr>
References: <cover.1383168460.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Martin Walch <walch.martin@web.de>, "Yann E. MORIN" <yann.morin.1998@free.fr>

From: Martin Walch <walch.martin@web.de>

The struct gstr has a capacity that may differ from the actual string length.

However, a string manipulation in the function search_conf made the assumption
that it is the same, which led to messing up some search results, especially
when the content of the gstr in use had not yet reached at least 63 chars.

Signed-off-by: Martin Walch <walch.martin@web.de>
Acked-by: Wang YanQing <udknight@gmail.com>
Acked-by: Benjamin Poirier <bpoirier@suse.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/kconfig/menu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 9e69f19..db1512a 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -584,7 +584,7 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 		for (j = 4; --i >= 0; j += 2) {
 			menu = submenu[i];
 			if (head && location && menu == location)
-				jump->offset = r->len - 1;
+				jump->offset = strlen(r->s);
 			str_printf(r, "%*c-> %s", j, ' ',
 				   _(menu_get_prompt(menu)));
 			if (menu->sym) {
-- 
1.8.1.2

