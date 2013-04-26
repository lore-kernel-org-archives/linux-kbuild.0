Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([119.145.14.65]:30858 "EHLO
	szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759348Ab3DZJ4h (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Apr 2013 05:56:37 -0400
Message-ID: <517A4F21.1070503@huawei.com>
Date: Fri, 26 Apr 2013 17:55:45 +0800
From: Libo Chen <clbchenlibo.chen@huawei.com>
MIME-Version: 1.0
Subject: [PATCH] menuconfig: print more info for symbol without prompts
References: <517A4DC3.1010604@huawei.com>
In-Reply-To: <517A4DC3.1010604@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

From: Wengmeiling <wengmeiling.weng@huawei.com>

When we search a config symbol, if it has no prompt the position of this
symbol in the Kconfig file and it's dependencies are not printed. This can
be inconvenient, especially when it's set to n and we want to find out why.

the following is an example:

before:

Symbol: GENERIC_SMP_IDLE_THREAD [=y]
Type  : boolean
  Selected by: X86 [=y]

after:

Symbol: GENERIC_SMP_IDLE_THREAD [=y]
Type  : boolean
  Defined at arch/Kconfig:213
  Selected by: X86 [=y]

Signed-off-by: Weng Meiling <wengmeiling.weng@huawei.com>
Signed-off-by: Libo Chen <libo.chen@huawei.com>
---
 scripts/kconfig/menu.c |   27 ++++++++++++++++++++-------
 1 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index f3bffa3..826da66 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -515,13 +515,6 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 	struct jump_key *jump;

 	str_printf(r, _("Prompt: %s\n"), _(prop->text));
-	str_printf(r, _("  Defined at %s:%d\n"), prop->menu->file->name,
-		prop->menu->lineno);
-	if (!expr_is_yes(prop->visible.expr)) {
-		str_append(r, _("  Depends on: "));
-		expr_gstr_print(prop->visible.expr, r);
-		str_append(r, "\n");
-	}
 	menu = prop->menu->parent;
 	for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent) {
 		bool accessible = menu_is_visible(menu);
@@ -572,6 +565,18 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 }

 /*
+ * get peoperty of type P_SYMBOL
+ */
+static struct property *get_symbol_prop(struct symbol *sym)
+{
+	struct property *prop = NULL;
+
+	for_all_properties(sym, prop, P_SYMBOL)
+		break;
+	return prop;
+}
+
+/*
  * head is optional and may be NULL
  */
 void get_symbol_str(struct gstr *r, struct symbol *sym,
@@ -595,6 +600,14 @@ void get_symbol_str(struct gstr *r, struct symbol *sym,
 	}
 	for_all_prompts(sym, prop)
 		get_prompt_str(r, prop, head);
+	prop = get_symbol_prop(sym);
+	str_printf(r, _("  Defined at %s:%d\n"), prop->menu->file->name,
+		prop->menu->lineno);
+	if (!expr_is_yes(prop->visible.expr)) {
+		str_append(r, _("  Depends on: "));
+		expr_gstr_print(prop->visible.expr, r);
+		str_append(r, "\n");
+	}
 	hit = false;
 	for_all_properties(sym, prop, P_SELECT) {
 		if (!hit) {
-- 
1.7.1


.




