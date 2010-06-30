Return-Path: <linux-kbuild-owner@vger.kernel.org>
Message-Id: <4C2B50750200007800008CFC@vpn.id2.novell.com>
Date: Wed, 30 Jun 2010 13:11:01 +0100
From: "Jan Beulich" <JBeulich@novell.com>
Subject: [PATCH] don't write invisible choice values
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: zippel@linux-m68k.org, sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org

This makes it so "make oldconfig" really prompts for any choice where
options that previously weren't visible just became so. Previously one
would have to remember to go over all choice values and check whether
some that previously couldn't be selected now can be.

Signed-off-by: Jan Beulich <jbeulich@novell.com>

---
 scripts/kconfig/symbol.c |   24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

--- linux-2.6.35-rc3/scripts/kconfig/symbol.c
+++ 2.6.35-rc3-kconfig-invisible-choice-values/scripts/kconfig/symbol.c
@@ -222,13 +222,15 @@ static struct symbol *sym_calc_choice(st
 	struct property *prop;
 	struct expr *e;
 
+	/* first calculate all choice values' visibilities */
+	prop = sym_get_choice_prop(sym);
+	expr_list_for_each_sym(prop->expr, e, def_sym)
+		sym_calc_visibility(def_sym);
+
 	/* is the user choice visible? */
 	def_sym = sym->def[S_DEF_USER].val;
-	if (def_sym) {
-		sym_calc_visibility(def_sym);
-		if (def_sym->visible != no)
-			return def_sym;
-	}
+	if (def_sym && def_sym->visible != no)
+		return def_sym;
 
 	/* any of the defaults visible? */
 	for_all_defaults(sym, prop) {
@@ -236,18 +238,15 @@ static struct symbol *sym_calc_choice(st
 		if (prop->visible.tri == no)
 			continue;
 		def_sym = prop_get_symbol(prop);
-		sym_calc_visibility(def_sym);
 		if (def_sym->visible != no)
 			return def_sym;
 	}
 
 	/* just get the first visible value */
 	prop = sym_get_choice_prop(sym);
-	expr_list_for_each_sym(prop->expr, e, def_sym) {
-		sym_calc_visibility(def_sym);
+	expr_list_for_each_sym(prop->expr, e, def_sym)
 		if (def_sym->visible != no)
 			return def_sym;
-	}
 
 	/* no choice? reset tristate value */
 	sym->curr.tri = no;
@@ -365,12 +364,13 @@ void sym_calc_value(struct symbol *sym)
 
 	if (sym_is_choice(sym)) {
 		struct symbol *choice_sym;
-		int flags = sym->flags & (SYMBOL_CHANGED | SYMBOL_WRITE);
 
 		prop = sym_get_choice_prop(sym);
 		expr_list_for_each_sym(prop->expr, e, choice_sym) {
-			choice_sym->flags |= flags;
-			if (flags & SYMBOL_CHANGED)
+			if ((sym->flags & SYMBOL_WRITE) &&
+			    choice_sym->visible != no)
+				choice_sym->flags |= SYMBOL_WRITE;
+			if (sym->flags & SYMBOL_CHANGED)
 				sym_set_changed(choice_sym);
 		}
 	}



