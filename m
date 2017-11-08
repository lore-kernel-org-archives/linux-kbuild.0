Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:54195 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753058AbdKHVKQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Nov 2017 16:10:16 -0500
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 1/1] kconfig/symbol.c: use correct pointer type argument for sizeof
Date: Wed,  8 Nov 2017 22:09:59 +0100
Message-Id: <20171108210959.16470-1-xypron.glpk@gmx.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E . MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>

sym_arr is of type struct symbol **.
So in malloc we need sizeof(struct symbol *).

The problem was indicated by coccinelle.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 scripts/kconfig/symbol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 20136ffefb23..3c8bd9bb4267 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1061,7 +1061,7 @@ struct symbol **sym_re_search(const char *pattern)
 	}
 	if (sym_match_arr) {
 		qsort(sym_match_arr, cnt, sizeof(struct sym_match), sym_rel_comp);
-		sym_arr = malloc((cnt+1) * sizeof(struct symbol));
+		sym_arr = malloc((cnt+1) * sizeof(struct symbol *));
 		if (!sym_arr)
 			goto sym_re_search_free;
 		for (i = 0; i < cnt; i++)
-- 
2.14.2

