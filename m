Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:34153 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932104AbbDHX5b (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Apr 2015 19:57:31 -0400
From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: [PATCH 1/2] kconfig: Print full defined and depends for multiply-defined symbols
Date: Wed,  8 Apr 2015 16:56:24 -0700
Message-Id: <1428537385-15089-1-git-send-email-gregory.0xf0@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, "open list:KCONFIG" <linux-kbuild@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

get_symbol_str() was assuming that symbols would only have a single
property for the purpose of printing define and depends information.
This is not true, and one current example is FRAME_POINTER which is
both in lib/Kconfig.debug and arch/arm/Kconfig.debug.

In order to print out the correct Defined and Depends info, iterate
over all properties associated with the given symbol, similarly to was
done for selects.  And for depends, rather than iterating over the
property, just use the direct dependency expression.

CONFIG_FRAME_POINTER text, before:
  Defined at lib/Kconfig.debug:323
  Depends on: DEBUG_KERNEL [=y] && (ARM [=y] || CRIS || M68K || FRV || UML || AVR32 || SUPERH || BLACKFIN || MN10300 || METAG) || ARCH_WANT_FRAME_POINTERS [=n]

After:
  Defined at lib/Kconfig.debug:323, arch/arm/Kconfig.debug:35
  Depends on: DEBUG_KERNEL [=y] && (ARM [=y] || CRIS || M68K || FRV || UML || AVR32 || SUPERH || BLACKFIN || MN10300 || METAG) || ARCH_WANT_FRAME_POINTERS [=n] || !THUMB2_KERNEL [=n]

Removes now-unused function get_symbol_prop().

Signed-off-by: Gregory Fong <gregory.0xf0@gmail.com>
---
 scripts/kconfig/menu.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 72c9dba..da482ff 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -601,18 +601,6 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 }
 
 /*
- * get property of type P_SYMBOL
- */
-static struct property *get_symbol_prop(struct symbol *sym)
-{
-	struct property *prop = NULL;
-
-	for_all_properties(sym, prop, P_SYMBOL)
-		break;
-	return prop;
-}
-
-/*
  * head is optional and may be NULL
  */
 void get_symbol_str(struct gstr *r, struct symbol *sym,
@@ -637,15 +625,22 @@ void get_symbol_str(struct gstr *r, struct symbol *sym,
 	for_all_prompts(sym, prop)
 		get_prompt_str(r, prop, head);
 
-	prop = get_symbol_prop(sym);
-	if (prop) {
-		str_printf(r, _("  Defined at %s:%d\n"), prop->menu->file->name,
+	hit = false;
+	for_all_properties(sym, prop, P_SYMBOL) {
+		if (!hit) {
+			str_append(r, "  Defined at ");
+			hit = true;
+		} else
+			str_append(r, ", ");
+		str_printf(r, _("%s:%d"), prop->menu->file->name,
 			prop->menu->lineno);
-		if (!expr_is_yes(prop->visible.expr)) {
-			str_append(r, _("  Depends on: "));
-			expr_gstr_print(prop->visible.expr, r);
-			str_append(r, "\n");
-		}
+	}
+	if (hit)
+		str_append(r, "\n");
+	if (!expr_is_yes(sym->dir_dep.expr)) {
+		str_append(r, _("  Depends on: "));
+		expr_gstr_print(sym->dir_dep.expr, r);
+		str_append(r, "\n");
 	}
 
 	hit = false;
-- 
1.9.1

