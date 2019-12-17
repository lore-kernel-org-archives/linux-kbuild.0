Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35930 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729000AbfLQQPx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Dec 2019 11:15:53 -0500
From: Thomas Hebb <tommyhebb@gmail.com>
Subject: [PATCH v2 1/3] kconfig: list all definitions of a symbol in help text
Date: Tue, 17 Dec 2019 08:15:43 -0800
Message-Id: <351ce34a887733d966b4822ac9f831e68a5a16f6.1576599202.git.tommyhebb@gmail.com>
In-Reply-To: <cover.1576599202.git.tommyhebb@gmail.com>
References: <cover.1576599202.git.tommyhebb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Thomas Hebb <tommyhebb@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org

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
commit bcdedcc1afd6 ("menuconfig: print more info for symbol without
prompts") changed the help text so that, instead of containing the
location and dependencies of each prompt, it contained the location and
dependencies of the symbol's first definition, regardless of whether or
not that definition had a prompt.

For symbols with only one definition, that change makes sense. However,
it breaks down for symbols with multiple definitions: each definition
has its own set of dependencies (the `dep` field of `struct menu`), and
those dependencies are ORed together to get the symbol's dependency list
(the `dir_dep` field of `struct symbol`). By printing only the
dependencies of the first definition, the help text misleads users into
believing that an option is more narrowly-applicable than it actually
is.

For an extreme example of this, we can look at the SYS_TEXT_BASE symbol
in the Das U-Boot project (version 2019.10), which also uses Kconfig. (I
unfortunately could not find an illustrative example in Linux.) This
config option specifies the load address of the built binary and, as
such, is applicable to basically every configuration possible. And yet,
without this patch, its help text is as follows:

  Symbol: SYS_TEXT_BASE [=]
  Type  : hex
  Prompt: U-Boot base address
    Location:
      -> ARM architecture
  Prompt: Text Base
    Location:
      -> Boot images
    Defined at arch/arm/mach-aspeed/Kconfig:9
    Depends on: ARM [=n] && ARCH_ASPEED [=n]

The help text indicates that the option is applicable only for a
specific unselected architecture (aspeed), because that architecture's
promptless definition (which just sets a default value), happens to be
the first one seen. No definition or dependency information is printed
for either of the two prompts listed.

Because source locations and dependencies are fundamentally properties
of definitions and not of symbols, we should treat them as such. This
patch brings back the pre-bcdedcc1afd6 behavior for definitions with
prompts but also separately prints the location and dependencies of
those without prompts, solving the original problem in a different way.
With this change, our SYS_TEXT_BASE example becomes

   Symbol: SYS_TEXT_BASE [=]
   Type  : hex
   Defined at arch/arm/mach-stm32mp/Kconfig:83
     Prompt: U-Boot base address
     Depends on: ARM [=n] && ARCH_STM32MP [=n]
     Location:
       -> ARM architecture
   Defined at Kconfig:532
     Prompt: Text Base
     Depends on: !NIOS2 [=n] && !XTENSA [=n] && !EFI_APP [=n]
     Location:
       -> Boot images
   Defined at arch/arm/mach-aspeed/Kconfig:9
     Depends on: ARM [=n] && ARCH_ASPEED [=n]
   Defined  at arch/arm/mach-socfpga/Kconfig:25
     Depends on: ARM [=n] && ARCH_SOCFPGA [=n]
   <snip>
   Defined at board/sifive/fu540/Kconfig:15
     Depends on: RISCV [=n] && TARGET_SIFIVE_FU540 [=n]

which is a much more accurate representation.

Note that there is one notable difference between what gets printed for
prompts after this change and what got printed before bcdedcc1afd6: the
"Depends on" line now accurately represents the prompt's dependencies
instead of conflating those with the prompt's visibility (which can
include extra conditions). See the patch later in this series titled
"kconfig: distinguish between dependencies and visibility in help text"
for more details and better handling of that nuance.

Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---

Changes in v2:
- Added explicit U-Boot version in commit message + other rewordings
- Made the new "Depends on:" line print actual dependencies instead of
  visibility to avoid an intra-series regression, and noted that in the
  commit message.
- Get rid of redundant "with prompt" and "without prompt" notes in
  definition text, but continue to ensure that definitions with prompts
  are printed before ones without.

 scripts/kconfig/menu.c | 55 ++++++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 24 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index d9d16469859a..0e54632d2043 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -698,6 +698,21 @@ const char *menu_get_help(struct menu *menu)
 		return "";
 }
 
+static void get_def_str(struct gstr *r, struct menu *menu)
+{
+	str_printf(r, "Defined at %s:%d\n",
+		   menu->file->name, menu->lineno);
+}
+
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
@@ -705,7 +720,9 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 	struct menu *submenu[8], *menu, *location = NULL;
 	struct jump_key *jump = NULL;
 
-	str_printf(r, "Prompt: %s\n", prop->text);
+	str_printf(r, "  Prompt: %s\n", prop->text);
+
+	get_dep_str(r, prop->menu->dep, "  Depends on: ");
 	menu = prop->menu->parent;
 	for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent) {
 		bool accessible = menu_is_visible(menu);
@@ -755,18 +772,6 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
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
@@ -806,17 +811,19 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
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
+	for_all_properties(sym, prop, P_SYMBOL) {
+		if (prop->menu->prompt) {
+			get_def_str(r, prop->menu);
+			get_prompt_str(r, prop->menu->prompt, head);
+		}
+	}
+
+	for_all_properties(sym, prop, P_SYMBOL) {
+		if (!prop->menu->prompt) {
+			get_def_str(r, prop->menu);
+			get_dep_str(r, prop->menu->dep, "  Depends on: ");
 		}
 	}
 
-- 
2.24.1
