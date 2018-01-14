Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:43294 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751101AbeANOMV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Jan 2018 09:12:21 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH] kconfig: Clarify choice dependency propagation
Date: Sun, 14 Jan 2018 15:12:05 +0100
Message-Id: <20180114141205.26814-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, sam@ravnborg.org, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

It's easy to miss that choices are special-cased to pass on their mode
as the parent dependency.

No functional changes. Only comments added.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/menu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 92d3f06cd8a2..53964d911708 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -323,6 +323,13 @@ void menu_finalize(struct menu *parent)
 				if (menu->sym && menu->sym->type == S_UNKNOWN)
 					menu_set_type(sym->type);
 			}
+
+			/*
+			 * Use the choice itself as the parent dependency of
+			 * the contained items. This turns the mode of the
+			 * choice into an upper bound on the visibility of the
+			 * choice symbols.
+			 */
 			parentdep = expr_alloc_symbol(sym);
 		} else if (parent->prompt)
 			parentdep = parent->prompt->visible.expr;
-- 
2.14.1

