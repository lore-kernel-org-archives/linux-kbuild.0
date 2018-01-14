Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:38689 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751085AbeANLin (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Jan 2018 06:38:43 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 1/2] kconfig: Document 'if' flattening logic
Date: Sun, 14 Jan 2018 12:38:19 +0100
Message-Id: <20180114113820.19017-1-ulfalizer@gmail.com>
In-Reply-To: <20180114113345.18623-1-ulfalizer@gmail.com>
References: <20180114113345.18623-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, sam@ravnborg.org, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

It is not obvious that this refers to an 'if', making the code pretty
cryptic:

	if (menu->list && (!menu->prompt || !menu->prompt->text)) {

Kconfig keeps the 'if' menu nodes even after flattening. Reflect that in
the example to be accurate.

No functional changes. Only comments added.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/menu.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 372eb5d9fef3..1f7bcceacde3 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -524,6 +524,30 @@ void menu_finalize(struct menu *parent)
 			*ep = expr_alloc_one(E_LIST, NULL);
 			(*ep)->right.sym = menu->sym;
 		}
+
+		/*
+		 * Flatten 'if' blocks, which do not specify a submenu and only
+		 * add dependencies.
+		 *
+		 * (Automatic submenu creation might still create a submenu from
+		 * an 'if' before this code runs.)
+		 *
+		 * Before:
+		 *
+		 *	A
+		 *	if ...
+		 *	 +-B
+		 *	 +-C
+		 *	D
+		 *
+		 * After:
+		 *
+		 *	A
+		 *	if ...
+		 *	B
+		 *	C
+		 *	D
+		 */
 		if (menu->list && (!menu->prompt || !menu->prompt->text)) {
 			for (last_menu = menu->list; ; last_menu = last_menu->next) {
 				last_menu->parent = parent;
-- 
2.14.1

