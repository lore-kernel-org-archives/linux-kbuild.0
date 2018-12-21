Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:57506 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730556AbeLUGXK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Dec 2018 01:23:10 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kconfig: remove unused "file" field of yylval union
Date: Fri, 21 Dec 2018 15:23:02 +0900
Message-Id: <1545373382-29088-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This has never been used.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.y | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 8a4d029..60ee8e7 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -36,7 +36,6 @@ static struct menu *current_menu, *current_entry;
 %union
 {
 	char *string;
-	struct file *file;
 	struct symbol *symbol;
 	struct expr *expr;
 	struct menu *menu;
-- 
2.7.4
