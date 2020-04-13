Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:22932 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728194AbgDMPgE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Apr 2020 11:36:04 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: do not assign a variable in the return statement
Date: Tue, 14 Apr 2020 00:35:42 +0900
Message-Id: <20200413153542.94064-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

I am not a big fan of doing assignment in a return statement.
Split it into two lines.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/menu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index e436ba44c9c5..a5fbd6ccc006 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -65,7 +65,8 @@ void menu_add_entry(struct symbol *sym)
 struct menu *menu_add_menu(void)
 {
 	last_entry_ptr = &current_entry->list;
-	return current_menu = current_entry;
+	current_menu = current_entry;
+	return current_menu;
 }
 
 void menu_end_menu(void)
-- 
2.25.1
