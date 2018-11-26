Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:38329 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbeKZSRy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Nov 2018 13:17:54 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kconfig: fix reverse dependency with tristate if-conditional
Date: Mon, 26 Nov 2018 16:22:48 +0900
Message-Id: <1543216969-2227-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Taehee Yoo <ap420073@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

A Kconfig property can have an optional if-expression, which describes
its visibility. The property is visible when the if-expression part is
evaluated to 'y' or 'm'.

The 'select' and 'imply' properties are internally converted to reverse
dependencies, but they are wrongly converted if they have a tristate
if-expression.

Example:

  config A
          tristate "a"

  config B
          tristate "b"
          select A if C

  config C
          tristate "c"

Currently, the reverse dependency of 'A' results in 'B && C'.
It is incorrect because the combination of B=y and C=m allows
'A' to become 'm', while its lower limit must be 'y'.

The reverse dependency should be 'B && C != n'.

Randy Dunlap reported that people are trying to fix an individual
Kconfig file [1], and I also found another example in the past,
commit 9d9c98e89ee2 ("pcmcia: fix yenta dependency on PCCARD_NONSTATIC")
but I suspect this is a bug of Kconfig itself.

[1] https://www.spinics.net/lists/netfilter-devel/msg56985.html

Reported-by: Taehee Yoo <ap420073@gmail.com>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/menu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 4cf15d4..2b18833 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -401,11 +401,13 @@ void menu_finalize(struct menu *parent)
 				if (prop->type == P_SELECT) {
 					struct symbol *es = prop_get_symbol(prop);
 					es->rev_dep.expr = expr_alloc_or(es->rev_dep.expr,
-							expr_alloc_and(expr_alloc_symbol(menu->sym), expr_copy(dep)));
+							expr_alloc_and(expr_alloc_symbol(menu->sym),
+									expr_trans_compare(dep, E_UNEQUAL, &symbol_no)));
 				} else if (prop->type == P_IMPLY) {
 					struct symbol *es = prop_get_symbol(prop);
 					es->implied.expr = expr_alloc_or(es->implied.expr,
-							expr_alloc_and(expr_alloc_symbol(menu->sym), expr_copy(dep)));
+							expr_alloc_and(expr_alloc_symbol(menu->sym),
+									expr_trans_compare(dep, E_UNEQUAL, &symbol_no)));
 				}
 			}
 		}
-- 
2.7.4
