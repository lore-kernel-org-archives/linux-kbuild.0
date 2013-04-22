Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:64434 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753878Ab3DVVbp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Apr 2013 17:31:45 -0400
Received: by mail-we0-f175.google.com with SMTP id t11so7157158wey.34
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Apr 2013 14:31:43 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 6/6] kconfig: do randomise choice entries in presence of KCONFIG_ALLCONFIG
Date: Mon, 22 Apr 2013 23:31:25 +0200
Message-Id: <4fc22ca2dc3096784fbd87c1cfef7e2bce153f40.1366665922.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1366665921.git.yann.morin.1998@free.fr>
References: <cover.1366665921.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1366665921.git.yann.morin.1998@free.fr>
References: <cover.1366665921.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Sam Ravnborg <sam@ravnborg.org>, Arnaud Lacombe <lacombar@gmail.com>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, randconfig does randomise choice entries, unless KCONFIG_ALLCONFIG
is specified.

For example, given those two files (Thomas' test-case):

    ---8<--- Config.test.in
    config OPTIONA
        bool "Option A"

    choice
        prompt "This is a choice"

    config CHOICE_OPTIONA
        bool "Choice Option A"

    config CHOICE_OPTIONB
        bool "Choice Option B"

    endchoice

    config OPTIONB
        bool "Option B"
    ---8<--- Config.test.in

    ---8<--- config.defaults
    CONFIG_OPTIONA=y
    ---8<--- config.defaults

And running:
    ./scripts/kconfig/conf --randconfig Config.test.in

does properly randomise the two choice symbols (and the two booleans).

However, running:
    KCONFIG_ALLCONFIG=config.defaults \
    ./scripts/kconfig/conf --randconfig Config.test.in

does *not* reandomise the two choice entries, and only CHOICE_OPTIONA
will ever be selected. (OPTIONA will always be set (expected), and
OPTIONB will be be properly randomised (expected).)

This patch defers setting that a choice has a value until a symbol for
that choice is indeed set, so that choices are properly randomised when
KCONFIG_ALLCONFIG is set, but not if a symbol for that choice is set.

Also, as a side-efect, this patch fixes the following case:

    ---8<---
    choice
    config OPTION_A
        bool "Option A"
    config OPTION_B
        bool "Option B"
    config OPTION_C
        bool "Option C"
    endchoice
    ---8<---

which could previously generate such .config files:

    ---8<---                            ---8<---
    CONFIG_OPTION_A=y                   CONFIG_OPTION_A=y
    CONFIG_OPTION_B=y                   # CONFIG_OPTION_B is not set
    # CONFIG_OPTION_C is not set        CONFIG_OPTION_C=y
    ---8<---                            ---8<---

Ie., the first entry in a choice is always set, plus zero or one of
the other options may be set.

This patch ensures that only one option may be set for a choice.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Michal Marek <mmarek@suse.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Arnaud Lacombe <lacombar@gmail.com>

---
Changes v2 -> v3
  - ensure only one symbol is set in a choice

Changes v1 -> v2:
  - further postpone setting that a choice has a value until
    one is indeed set
  - do not print symbols that are part of an invisible choice
---
 scripts/kconfig/confdata.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 8d8d853..5487279 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -288,8 +288,6 @@ load:
 	for_all_symbols(i, sym) {
 		sym->flags |= SYMBOL_CHANGED;
 		sym->flags &= ~(def_flags|SYMBOL_VALID);
-		if (sym_is_choice(sym))
-			sym->flags |= def_flags;
 		switch (sym->type) {
 		case S_INT:
 		case S_HEX:
@@ -379,13 +377,13 @@ setsym:
 			case mod:
 				if (cs->def[def].tri == yes) {
 					conf_warning("%s creates inconsistent choice state", sym->name);
-					cs->flags &= ~def_flags;
 				}
 				break;
 			case yes:
 				if (cs->def[def].tri != no)
 					conf_warning("override: %s changes choice state", sym->name);
 				cs->def[def].val = sym;
+				cs->flags |= def_flags;
 				break;
 			}
 			cs->def[def].tri = EXPR_OR(cs->def[def].tri, sym->def[def].tri);
@@ -791,6 +789,8 @@ int conf_write(const char *name)
 			sym_calc_value(sym);
 			if (!(sym->flags & SYMBOL_WRITE))
 				goto next;
+			if (sym_is_choice_value(sym) && !menu_is_visible(menu->parent))
+				goto next;
 			sym->flags &= ~SYMBOL_WRITE;
 
 			conf_write_symbol(out, sym, &kconfig_printer_cb, NULL);
@@ -1077,6 +1077,7 @@ static void randomize_choice_values(struct symbol *csym)
 		else {
 			sym->def[S_DEF_USER].tri = no;
 		}
+		sym->flags &= ~(SYMBOL_VALID);
 	}
 	csym->flags |= SYMBOL_DEF_USER;
 	/* clear VALID to get value calculated */
-- 
1.7.10.4

