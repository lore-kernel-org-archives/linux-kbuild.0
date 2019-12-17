Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49223 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfLQEOo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:14:44 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/8] kconfig: remove the rootmenu check in menu_add_prop()
Date: Tue, 17 Dec 2019 13:14:16 +0900
Message-Id: <20191217041424.29285-2-masahiroy@kernel.org>
In-Reply-To: <20191217041424.29285-1-masahiroy@kernel.org>
References: <20191217041424.29285-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

This reverts commit ba6ff60d5eb4 ("kconfig: don't emit warning upon
rootmenu's prompt redefinition").

At that time, rootmenu.prompt was always set first, then it was set
again if a "mainmenu" statement was specified in the Kconfig file.

This is no longer the case since commit 0724a7c32a54 ("kconfig: Don't
leak main menus during parsing"). Remove the unneeded check.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/menu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index d9d16469859a..b1b1ee8cf987 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -138,7 +138,7 @@ static struct property *menu_add_prop(enum prop_type type, char *prompt, struct
 			while (isspace(*prompt))
 				prompt++;
 		}
-		if (current_entry->prompt && current_entry != &rootmenu)
+		if (current_entry->prompt)
 			prop_warn(prop, "prompt redefined");
 
 		/* Apply all upper menus' visibilities to actual prompts. */
-- 
2.17.1
