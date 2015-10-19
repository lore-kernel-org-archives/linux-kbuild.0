Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from max.feld.cvut.cz ([147.32.192.36]:39425 "EHLO max.feld.cvut.cz"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752691AbbJSOvc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 19 Oct 2015 10:51:32 -0400
From: Michal Sojka <sojkam1@fel.cvut.cz>
Subject: [PATCH] kconfig: Fix copy&paste error
Date: Mon, 19 Oct 2015 16:51:02 +0200
Message-Id: <1445266262-14082-1-git-send-email-sojkam1@fel.cvut.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.cz>, Michal Sojka <sojkam1@fel.cvut.cz>, Martin Walch <walch.martin@web.de>, Jan Beulich <JBeulich@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: trivial@kernel.org

Signed-off-by: Michal Sojka <sojkam1@fel.cvut.cz>
---
 scripts/kconfig/expr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 667d1aa..cbf4996 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1113,7 +1113,7 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
 			fn(data, e->left.sym, e->left.sym->name);
 		else
 			fn(data, NULL, "<choice>");
-		fn(data, NULL, e->type == E_LEQ ? ">=" : ">");
+		fn(data, NULL, e->type == E_GEQ ? ">=" : ">");
 		fn(data, e->right.sym, e->right.sym->name);
 		break;
 	case E_UNEQUAL:
-- 
2.5.3

