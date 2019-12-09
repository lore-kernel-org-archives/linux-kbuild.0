Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pj1-f65.google.com ([209.85.216.65]:32924 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfLIIT1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Dec 2019 03:19:27 -0500
From: Thomas Hebb <tommyhebb@gmail.com>
Subject: [PATCH 1/4] kconfig: list all definitions of a symbol in help text
Date: Mon,  9 Dec 2019 00:19:16 -0800
Message-Id: <1eaa4143fdb000563cde114bb7e0166b1fc229bf.1575879069.git.tommyhebb@gmail.com>
In-Reply-To: <cover.1575879069.git.tommyhebb@gmail.com>
References: <cover.1575879069.git.tommyhebb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Thomas Hebb <tommyhebb@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>

In Kconfig, each symbol (representing a config option) can be defined in
multiple places. Each definition may or may not have a prompt, which
allows the option to be set via an interface like menuconfig. Each
definition has a set of dependencies, which determine whether its prompt
is visible and whether other pieces of the definition, like a default
value, take effect.

Historically, a symbol's help text (i.e. what's shown when a user
presses '?' in menuconfig) contained some symbol-wide information not
tied to any particular definition (e.g. what other symbols it selects)
as well as the location (file name and line number) and dependencies of
each prompt. Notably, the help text did not show the location or
dependencies of definitions without prompts.

Because this made it hard to reason about symbols that had no prompts,
bcdedcc1afd6 ("menuconfig: print more info for symbol without prompts")
changed the help text so that, instead of containing the location and
dependencies of each prompt, it contained the location and dependencies
of the symbol's first definition, regardless of whether or not that
definition had a prompt.

For symbols with only one definition, that change makes sense. However,
it breaks down for symbols with multiple definitions: each definition
has its own set of dependencies (the `dep` field of `struct menu`), and
those dependencies are ORed together to get the symbol's dependency list
(the `dir_dep` field of `struct symbol`). By printing only the
dependencies of the first definition, the help text misleads users into
believing that an option is more narrowly-applicable than it actually
is.

For an extreme example of this, we can look at the SYS_TEXT_BASE symbol
in the Das U-Boot project, which also uses Kconfig. (I could not find an
illustrative example in the Linux source, unfortunately). This config
option specifies the load address of the built binary and, as such, is
applicable to basically every configuration possible. And yet, without
this patch, its help text is as follows:

  Symbol: SYS_TEXT_BASE [=0x00200000]
  Type  : hex
  Prompt: Text Base
    Location:
      -> Boot images
    Defined at arch/arm/mach-aspeed/Kconfig:9
    Depends on: ARM [=y] && ARCH_ASPEED [=n]

The help text indicates that the option only applicable for a specific
unselected architecture (aspeed), because that architecture's promptless
definition (which just sets a default value), happens to be the first
one seen.

Because source locations and dependencies are fundamentally properties
of definitions and not of symbols, we should treat them as such. This
patch brings back the pre-bcdedcc1afd6 behavior for definitions with
prompts but also separately prints the location and dependencies of
those without prompts, solving the original problem in a different way.
With this change, our SYS_TEXT_BASE example becomes

  Symbol: SYS_TEXT_BASE [=0x00200000]
  Type  : hex
  Defined with prompt at Kconfig:548
    Prompt: Text Base
    Depends on: !NIOS2 [=n] && !XTENSA [=n] && !EFI_APP [=n]
    Location:
      -> Boot images
  Defined without prompt at arch/arm/mach-aspeed/Kconfig:9
    Depends on: ARM [=y] && ARCH_ASPEED [=n]
  Defined without prompt at arch/arm/mach-socfpga/Kconfig:28
    Depends on: ARM [=y] && ARCH_SOCFPGA [=n]
  <snip>
  Defined without prompt at board/sifive/fu540/Kconfig:15
    Depends on: RISCV [=n] && TARGET_SIFIVE_FU540 [=n]

which is a much more accurate representation.

Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---
 scripts/kconfig/menu.c | 49 +++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index d9d16469859a..59fead4b8823 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -698,6 +698,15 @@ const char *menu_get_help(struct menu *menu)
 		return "";
 }
 
+static void get_dep_str(struct gstr *r, struct expr *expr, const char *prefix)
+{
+	if (!expr_is_yes(expr)) {
+		str_append(r, prefix);
+		expr_gstr_print(expr, r);
+		str_append(r, "\n");
+	}
+}
+
 static void get_prompt_str(struct gstr *r, struct property *prop,
 			   struct list_head *head)
 {
@@ -705,7 +714,11 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 	struct menu *submenu[8], *menu, *location = NULL;
 	struct jump_key *jump = NULL;
 
-	str_printf(r, "Prompt: %s\n", prop->text);
+	str_printf(r, "Defined with prompt at %s:%d\n",
+		   prop->menu->file->name, prop->menu->lineno);
+	str_printf(r, "  Prompt: %s\n", prop->text);
+
+	get_dep_str(r, prop->visible.expr, "  Depends on: ");
 	menu = prop->menu->parent;
 	for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent) {
 		bool accessible = menu_is_visible(menu);
@@ -755,18 +768,6 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 	}
 }
 
-/*
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
 static void get_symbol_props_str(struct gstr *r, struct symbol *sym,
 				 enum prop_type tok, const char *prefix)
 {
@@ -806,17 +807,17 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
 			}
 		}
 	}
-	for_all_prompts(sym, prop)
-		get_prompt_str(r, prop, head);
-
-	prop = get_symbol_prop(sym);
-	if (prop) {
-		str_printf(r, "  Defined at %s:%d\n", prop->menu->file->name,
-			prop->menu->lineno);
-		if (!expr_is_yes(prop->visible.expr)) {
-			str_append(r, "  Depends on: ");
-			expr_gstr_print(prop->visible.expr, r);
-			str_append(r, "\n");
+
+	/* Print the definitions with prompts before the ones without */
+	for_all_properties(sym, prop, P_SYMBOL)
+		if (prop->menu->prompt)
+			get_prompt_str(r, prop->menu->prompt, head);
+
+	for_all_properties(sym, prop, P_SYMBOL) {
+		if (!prop->menu->prompt) {
+			str_printf(r, "Defined without prompt at %s:%d\n",
+				   prop->menu->file->name, prop->menu->lineno);
+			get_dep_str(r, prop->menu->dep, "  Depends on: ");
 		}
 	}
 
-- 
2.24.0
