Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:46540 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750879AbeBWGJX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Feb 2018 01:09:23 -0500
Received: by mail-lf0-f47.google.com with SMTP id r80so10771359lfe.13
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Feb 2018 22:09:23 -0800 (PST)
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH] kconfig: do not write 'n' defaults to .config
Date: Fri, 23 Feb 2018 07:09:01 +0100
Message-Id: <20180223060901.4052-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com
Cc: sam@ravnborg.org, arnd@arndb.de, Ulf Magnusson <ulfalizer@gmail.com>

=== Background ===

A "# CONFIG_FOO is not set" line is written to .config for visible
bool/tristate symbols with value n. The idea is to remember the user
selection without having to set a Makefile variable (having undefined
Make variables correspond to n is handy when testing them in the
Makefiles).

Currently, a "# CONFIG_FOO is not set" line is also written to .config
for all bool/tristate symbols that get the value n through a 'default'.
This is inconsistent with how 'select' and 'imply' work, which only
write non-n symbols. It also seems redundant:

  - If the symbol is visible and has value n, then
    "# CONFIG_FOO is not set" will always be written anyway.

  - If the symbol is not visible, then "# CONFIG_FOO is not set" has no
    effect on it.

  - If the symbol becomes visible later, there shouldn't be any harm in
    recalculating the default value at that point.

=== Changes ===

Change sym_calc_value() to only set SYMBOL_WRITE (write to .config) for
non-n defaults. This reduces the size of the x86 .config on my system by
about 1% (due to removed "# CONFIG_FOO is not set" entries).

One side effect of this change is making 'default n' equivalent to
having no explicit default. That might make it clearer to people that
'default n' is redundant.

This change only affects generated .config files and not autoconf.h:
autoconf.h only includes #defines for non-n bool/tristate symbols.

=== Testing ===

The following testing was done with the x86 Kconfigs:

 - .config files generated before and after the change were compared to
   verify that the only difference is some '# CONFIG_FOO is not set'
   entries disappearing. A couple of these were inspected manually, and
   most turned out to be from redundant 'default n/def_bool n'
   properties.

 - The generated include/generated/autoconf.h was compared before and
   after the change and verified to be identical.

 - As a sanity check, the same modification was done to Kconfiglib.
   The Kconfiglib test suite was then run to check for any mismatches
   against the output of the C implementation.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/symbol.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index cca9663be5dd..02eb8b10a83c 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -403,9 +403,10 @@ void sym_calc_value(struct symbol *sym)
 			if (!sym_is_choice(sym)) {
 				prop = sym_get_default_prop(sym);
 				if (prop) {
-					sym->flags |= SYMBOL_WRITE;
 					newval.tri = EXPR_AND(expr_calc_value(prop->expr),
 							      prop->visible.tri);
+					if (newval.tri != no)
+						sym->flags |= SYMBOL_WRITE;
 				}
 				if (sym->implied.tri != no) {
 					sym->flags |= SYMBOL_WRITE;
-- 
2.14.1

