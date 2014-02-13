Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:49724 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754527AbaBMM5X (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 13 Feb 2014 07:57:23 -0500
Received: from tacticalops.localnet ([95.112.149.120]) by smtp.web.de
 (mrweb003) with ESMTPSA (Nemesis) id 0MdLsp-1Vx5gw3xxb-00IVmB for
 <linux-kbuild@vger.kernel.org>; Thu, 13 Feb 2014 13:57:22 +0100
From: Martin Walch <walch.martin@web.de>
Subject: [PATCH 2/2] kconfig: trivial - adjust comments
Date: Thu, 13 Feb 2014 13:57:21 +0100
Message-ID: <1552040.ObFWAZURHi@tacticalops>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>

From: Martin Walch <walch.martin@web.de>
Date: Thu, 13 Feb 2014 12:17:06 +0100
Subject: [PATCH 2/2] kconfig: trivial - adjust comments

the line
(a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b'
is probably copy & paste from above, missing the adjustment done in the code.
It should probably read
(a!='b') && (a='c') -> 'b'='c' ? 'n' : a='c'

the second case is similar:
(a!='m') && (a!='n') -> (a='m')
should be
(a!='m') && (a!='n') -> (a='y')

This patch intentionally violates the checkpatch.pl style check by keeping C99 comments:
there are many of them, and consequently they all should be converted, but this is beyond
the scope of this patch.

Signed-off-by: Martin Walch <walch.martin@web.de>
---
 scripts/kconfig/expr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 4aa171b..4b73854 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -460,7 +460,7 @@ static struct expr *expr_join_and(struct expr *e1, struct expr *e2)
 							     : expr_alloc_symbol(&symbol_no);
 		}
 		if (e1->type == E_UNEQUAL && e2->type == E_EQUAL) {
-			// (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b'
+			// (a!='b') && (a='c') -> 'b'='c' ? 'n' : a='c'
 			sym2 = e2->right.sym;
 			if ((e1->right.sym->flags & SYMBOL_CONST) && (sym2->flags & SYMBOL_CONST))
 				return sym2 != e1->right.sym ? expr_alloc_comp(E_EQUAL, sym1, sym2)
@@ -481,7 +481,7 @@ static struct expr *expr_join_and(struct expr *e1, struct expr *e2)
 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
 			   ((e1->right.sym == &symbol_mod && e2->right.sym == &symbol_no) ||
 			    (e1->right.sym == &symbol_no && e2->right.sym == &symbol_mod)))
-			// (a!='m') && (a!='n') -> (a='m')
+			// (a!='m') && (a!='n') -> (a='y')
 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
 
 		if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_mod) ||
-- 
1.8.3.2


