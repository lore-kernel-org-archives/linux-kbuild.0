Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:44422 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751060AbeANOty (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Jan 2018 09:49:54 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH v2 1/2] kconfig: Document 'if' flattening logic
Date: Sun, 14 Jan 2018 15:49:26 +0100
Message-Id: <20180114144926.29162-1-ulfalizer@gmail.com>
In-Reply-To: <20180114113820.19017-1-ulfalizer@gmail.com>
References: <20180114113820.19017-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, sam@ravnborg.org, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

It is not obvious that this might refer to an 'if', making the code
pretty cryptic:

	if (menu->list && (!menu->prompt || !menu->prompt->text)) {

Kconfig keeps the 'if' menu nodes even after flattening. Reflect that in
the example to be accurate.

No functional changes. Only comments added.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
Changelog

v2:
I forgot to mention that this code also undoes automatic submenus created below
promptless symbols.

 scripts/kconfig/menu.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 53964d911708..a8af08aabfd6 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -531,6 +531,35 @@ void menu_finalize(struct menu *parent)
 			*ep = expr_alloc_one(E_LIST, NULL);
 			(*ep)->right.sym = menu->sym;
 		}
+
+		/*
+		 * This code serves two purposes:
+		 *
+		 * (1) Flattening 'if' blocks, which do not specify a submenu
+		 *     and only add dependencies.
+		 *
+		 *     (Automatic submenu creation might still create a submenu
+		 *     from an 'if' before this code runs.)
+		 *
+		 * (2) "Undoing" any automatic submenus created earlier below
+		 *     promptless symbols.
+		 *
+		 * Before:
+		 *
+		 *	A
+		 *	if ... (or promptless symbol)
+		 *	 +-B
+		 *	 +-C
+		 *	D
+		 *
+		 * After:
+		 *
+		 *	A
+		 *	if ... (or promptless symbol)
+		 *	B
+		 *	C
+		 *	D
+		 */
 		if (menu->list && (!menu->prompt || !menu->prompt->text)) {
 			for (last_menu = menu->list; ; last_menu = last_menu->next) {
 				last_menu->parent = parent;
-- 
2.14.1

