Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:36192 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752018AbdESPIm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 May 2017 11:08:42 -0400
Received: by mail-it0-f49.google.com with SMTP id o5so120179810ith.1
        for <linux-kbuild@vger.kernel.org>; Fri, 19 May 2017 08:08:42 -0700 (PDT)
From: Tycho Andersen <tycho@docker.com>
Subject: [PATCH] kconfig: always use user input symbols
Date: Fri, 19 May 2017 09:08:13 -0600
Message-Id: <20170519150813.27845-1-tycho@docker.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E . MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Tycho Andersen <tycho@docker.com>, Roman Zippel <zippel@linux-m68k.org>

...regardless of visibility.

When a symbol that is not visible by default (e.g. PNFS_FLEXFILE_LAYOUT)
has a default value, it is impossible to set the value to something not the
default:

~/packages/linux render-symbol-inputs grep FLEXFILE .config
CONFIG_PNFS_FLEXFILE_LAYOUT=y
~/packages/linux render-symbol-inputs make oldconfig
scripts/kconfig/conf  --oldconfig Kconfig
~/packages/linux render-symbol-inputs grep FLEXFILE .config
CONFIG_PNFS_FLEXFILE_LAYOUT=m

There are two reasons for this: the symbol's user input value is only
considered when it is visible (hunks 2 and 3), and the user values are
explicitly ignored (hunk 1) if the symbols are not visible.

It's not clear to me why hunk 1 exists. I'm sure it solve some problem, but
I'm not sure why we would ever want to discard user input values, and
causes a problem exactly as the comment describes.

Signed-off-by: Tycho Andersen <tycho@docker.com>
CC: Roman Zippel <zippel@linux-m68k.org>
---
I don't know much about how kconfig works, I just noticed this when trying
to do some automatic merging of configs. My main goal is to build a kernel
without modules, but after a merge and running `make oldconfig`, some
symbols always come back set as modules.
---
 scripts/kconfig/confdata.c |  7 -------
 scripts/kconfig/symbol.c   | 32 ++++++++++++++++++--------------
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 297b079..3537090 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -448,13 +448,6 @@ int conf_read(const char *name)
 
 	for_all_symbols(i, sym) {
 		if (sym_has_value(sym) && !sym_is_choice_value(sym)) {
-			/* Reset values of generates values, so they'll appear
-			 * as new, if they should become visible, but that
-			 * doesn't quite work if the Kconfig and the saved
-			 * configuration disagree.
-			 */
-			if (sym->visible == no && !conf_unsaved)
-				sym->flags &= ~SYMBOL_DEF_USER;
 			switch (sym->type) {
 			case S_STRING:
 			case S_INT:
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 20136ff..27fca39 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -386,17 +386,19 @@ void sym_calc_value(struct symbol *sym)
 			prop = sym_get_choice_prop(sym);
 			newval.tri = (prop_get_symbol(prop)->curr.val == sym) ? yes : no;
 		} else {
-			if (sym->visible != no) {
-				/* if the symbol is visible use the user value
-				 * if available, otherwise try the default value
-				 */
+			/* If the user defined a value, let's not ignore it,
+			 * even if the symbol is not visible.
+			 */
+			if (sym_has_value(sym)) {
 				sym->flags |= SYMBOL_WRITE;
-				if (sym_has_value(sym)) {
-					newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri,
-							      sym->visible);
-					goto calc_newval;
-				}
+				newval.tri = sym->def[S_DEF_USER].tri;
+				goto calc_newval;
 			}
+
+			if (sym->visible != no)
+				sym->flags |= SYMBOL_WRITE;
+
+			/* otherwise, let's use the default */
 			if (sym->rev_dep.tri != no)
 				sym->flags |= SYMBOL_WRITE;
 			if (!sym_is_choice(sym)) {
@@ -433,13 +435,15 @@ void sym_calc_value(struct symbol *sym)
 	case S_STRING:
 	case S_HEX:
 	case S_INT:
-		if (sym->visible != no) {
+		if (sym_has_value(sym)) {
 			sym->flags |= SYMBOL_WRITE;
-			if (sym_has_value(sym)) {
-				newval.val = sym->def[S_DEF_USER].val;
-				break;
-			}
+			newval.val = sym->def[S_DEF_USER].val;
+			goto calc_newval;
 		}
+
+		if (sym->visible != no)
+			sym->flags |= SYMBOL_WRITE;
+
 		prop = sym_get_default_prop(sym);
 		if (prop) {
 			struct symbol *ds = prop_get_symbol(prop);
-- 
2.9.3

