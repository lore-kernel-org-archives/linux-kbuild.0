Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from scrub.xs4all.nl ([194.109.195.176]:3419 "EHLO scrub.xs4all.nl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753148AbYBKUOF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Feb 2008 15:14:05 -0500
Date: Mon, 11 Feb 2008 21:13:47 +0100 (CET)
From: Roman Zippel <zippel@linux-m68k.org>
Subject: Re: kconfig creates strange (invalid?) configuration
In-Reply-To: <20080210143333.GC2436@cs181133002.pp.htv.fi>
Message-ID: <Pine.LNX.4.64.0802112048070.3378@scrub.home>
References: <20080210143333.GC2436@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: sam@ravnborg.org, linux-kbuild@vger.kernel.org

Hi,

On Sun, 10 Feb 2008, Adrian Bunk wrote:

> The attached .config (with current -git) results in a compile 
> error since it contains:
> 
> CONFIG_X86=y
> # CONFIG_EMBEDDED is not set
> CONFIG_SERIO=m
> CONFIG_SERIO_I8042=y
> 
> Looking at drivers/input/serio/Kconfig I simply don't get how this 
> can happen.

You've hit the rather subtle rules of select vs default. What happened is 
that SERIO is selected to m, but SERIO_I8042 isn't selected so the default 
of y is used instead.
We already had the problem in the past that select and default don't work 
well together, so this patch cleans this up and makes the rule hopefully 
more straightforward. Basically now the value is calculated like this:

	(value && dependency) || select

where the value is the user choice (if available and the symbol is 
visible) or default.

In this case it means SERIO and SERIO_I8042 are both set to y due to their 
default and if SERIO didn't had the default, then the SERIO_I8042 value 
would be limited to m due to the dependency.

I tested this patch with more 10000 random configs and above case is the 
only the difference that showed up, so I hope there is nothing that 
depended on the old more complex and subtle rules.

bye, Roman

Signed-off-by: Roman Zippel <zippel@linux-m68k.org>

---
 scripts/kconfig/symbol.c |   34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

Index: linux-2.6.k.git/scripts/kconfig/symbol.c
===================================================================
--- linux-2.6.k.git.orig/scripts/kconfig/symbol.c	2008-02-11 15:29:38.000000000 +0100
+++ linux-2.6.k.git/scripts/kconfig/symbol.c	2008-02-11 20:45:44.000000000 +0100
@@ -298,22 +298,30 @@ void sym_calc_value(struct symbol *sym)
 		if (sym_is_choice_value(sym) && sym->visible == yes) {
 			prop = sym_get_choice_prop(sym);
 			newval.tri = (prop_get_symbol(prop)->curr.val == sym) ? yes : no;
-		} else if (EXPR_OR(sym->visible, sym->rev_dep.tri) != no) {
-			sym->flags |= SYMBOL_WRITE;
-			if (sym_has_value(sym))
-				newval.tri = sym->def[S_DEF_USER].tri;
-			else if (!sym_is_choice(sym)) {
-				prop = sym_get_default_prop(sym);
-				if (prop)
-					newval.tri = expr_calc_value(prop->expr);
+		} else {
+			if (sym->visible != no) {
+				/* if the symbol is visible use the user value
+				 * if available, otherwise try the default value
+				 */
+				sym->flags |= SYMBOL_WRITE;
+				if (sym_has_value(sym)) {
+					newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri,
+							      sym->visible);
+					goto calc_newval;
+				}
 			}
-			newval.tri = EXPR_OR(EXPR_AND(newval.tri, sym->visible), sym->rev_dep.tri);
-		} else if (!sym_is_choice(sym)) {
-			prop = sym_get_default_prop(sym);
-			if (prop) {
+			if (sym->rev_dep.tri != no)
 				sym->flags |= SYMBOL_WRITE;
-				newval.tri = expr_calc_value(prop->expr);
+			if (!sym_is_choice(sym)) {
+				prop = sym_get_default_prop(sym);
+				if (prop) {
+					sym->flags |= SYMBOL_WRITE;
+					newval.tri = EXPR_AND(expr_calc_value(prop->expr),
+							      prop->visible.tri);
+				}
 			}
+		calc_newval:
+			newval.tri = EXPR_OR(newval.tri, sym->rev_dep.tri);
 		}
 		if (newval.tri == mod && sym_get_type(sym) == S_BOOLEAN)
 			newval.tri = yes;
