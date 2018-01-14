Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:36876 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751445AbeANLiu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Jan 2018 06:38:50 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 2/2] kconfig: Improve auto. menu documentation accuracy
Date: Sun, 14 Jan 2018 12:38:20 +0100
Message-Id: <20180114113820.19017-2-ulfalizer@gmail.com>
In-Reply-To: <20180114113820.19017-1-ulfalizer@gmail.com>
References: <20180114113345.18623-1-ulfalizer@gmail.com>
 <20180114113820.19017-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, sam@ravnborg.org, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

An 'if', 'menu', or 'choice' that depends on a preceding symbol will
also generate a submenu.

No functional changes. Only comments updated.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/menu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 1f7bcceacde3..86031dc36f7d 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -414,9 +414,10 @@ void menu_finalize(struct menu *parent)
 			menu_finalize(menu);
 	} else if (sym) {
 		/*
-		 * Automatic submenu creation. If sym, A, B, C, ..., are
-		 * consecutive symbols and A, B, C, ... all depend on sym, the
-		 * following menu structure will be created:
+		 * Automatic submenu creation. If sym is a symbol and A, B, C,
+		 * ... are consecutive items (symbols, menus, ifs, etc.) that
+		 * all depend on sym, then the following menu structure is
+		 * created:
 		 *
 		 *	sym
 		 *	 +-A
@@ -425,7 +426,7 @@ void menu_finalize(struct menu *parent)
 		 *	 ...
 		 *
 		 * This also works recursively, giving the following structure
-		 * if B depends on A:
+		 * if A is a symbol and B depends on A:
 		 *
 		 *	sym
 		 *	 +-A
-- 
2.14.1

