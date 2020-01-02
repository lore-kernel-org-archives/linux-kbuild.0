Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f194.google.com ([209.85.222.194]:36011 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbgABXOE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Jan 2020 18:14:04 -0500
From: Arvind Sankar <nivedita@alum.mit.edu>
Subject: [PATCH] kconfig: restore prompt dependencies in help text
Date: Thu,  2 Jan 2020 18:14:02 -0500
Message-Id: <20200102231402.1052657-1-nivedita@alum.mit.edu>
In-Reply-To: <0ea3e528-4835-ff9c-f5a2-f711666ba75f@infradead.org>
References: <0ea3e528-4835-ff9c-f5a2-f711666ba75f@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Al Viro <viro@zeniv.linux.org.uk>, Rob Landley <rob@landley.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org

Commit bcdedcc1afd6 ("menuconfig: print more info for symbol without
prompts") moved some code from get_prompt_str to get_symbol_str so that
dependency information for symbols without prompts could be shown.

This code would be better copied rather than moved, as the change had
the side-effect of not showing any extra dependencies that the prompt
might have over the symbol.

Put back a copy of the dependency printing code in get_prompt_str.

The following is an example for NAMESPACES:

Before:
	Symbol: NAMESPACES [=y]
	Type  : bool
	Prompt: Namespaces support
	  Location:
	(2) -> General setup
	  Defined at init/Kconfig:1064
	  Depends on: MULTIUSER [=y]

After:
	Symbol: NAMESPACES [=y]
	Type  : bool
	Prompt: Namespaces support
	  Editable if: MULTIUSER [=y] && EXPERT [=y]
	  Location:
	(2) -> General setup
	  Defined at init/Kconfig:1064
	  Depends on: MULTIUSER [=y]

Fixes: bcdedcc1afd6 ("menuconfig: print more info for symbol without prompts")
Signed-off-by: Arvind Sankar <nivedita@alum.mit.edu>
---
 scripts/kconfig/menu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index d9d16469859a..6fbbe41302dc 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -706,6 +706,12 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 	struct jump_key *jump = NULL;
 
 	str_printf(r, "Prompt: %s\n", prop->text);
+	if (!expr_is_yes(prop->visible.expr)) {
+		str_append(r, "  Editable if: ");
+		expr_gstr_print(prop->visible.expr, r);
+		str_append(r, "\n");
+	}
+
 	menu = prop->menu->parent;
 	for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent) {
 		bool accessible = menu_is_visible(menu);
-- 
2.24.1
