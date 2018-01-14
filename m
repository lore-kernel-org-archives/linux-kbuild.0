Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:40123 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750915AbeANJ4g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Jan 2018 04:56:36 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH] kconfig: Document SYMBOL_OPTIONAL logic
Date: Sun, 14 Jan 2018 10:56:20 +0100
Message-Id: <20180114095620.12088-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, sam@ravnborg.org, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

Not obvious, especially if you don't already know how choices are
implemented.

No functional changes. Only comments added.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/menu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 92d3f06cd8a2..372eb5d9fef3 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -548,6 +548,15 @@ void menu_finalize(struct menu *parent)
 		sym->flags |= SYMBOL_WARNED;
 	}
 
+	/*
+	 * For non-optional choices, add a reverse dependency (corresponding to
+	 * a select) of '<visibility> && m'. This prevents the user from
+	 * setting the choice mode to 'n' when the choice is visible.
+	 *
+	 * This would also work for non-choice symbols, but only non-optional
+	 * choices clear SYMBOL_OPTIONAL as of writing. Choices are implemented
+	 * as a type of symbol.
+	 */
 	if (sym && !sym_is_optional(sym) && parent->prompt) {
 		sym->rev_dep.expr = expr_alloc_or(sym->rev_dep.expr,
 				expr_alloc_and(parent->prompt->visible.expr,
-- 
2.14.1

