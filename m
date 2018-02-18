Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:38599 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751741AbeBRUsV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Feb 2018 15:48:21 -0500
Received: by mail-wm0-f65.google.com with SMTP id z9so6404051wmb.3
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Feb 2018 12:48:20 -0800 (PST)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: [PATCH v4 3/3] kconfig: Print reverse dependencies in groups
Date: Sun, 18 Feb 2018 21:47:15 +0100
Message-Id: <d65e743dabe7c6ac474fb137040055b9dd049ae5.1518985888.git.erosca@de.adit-jv.com>
In-Reply-To: <cover.1518985888.git.erosca@de.adit-jv.com>
References: <cover.1518985888.git.erosca@de.adit-jv.com>
In-Reply-To: <cover.1518985888.git.erosca@de.adit-jv.com>
References: <cover.1518985888.git.erosca@de.adit-jv.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Ulf Magnusson <ulfalizer@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>, Eugeniu Rosca <rosca.eugeniu@gmail.com>, linux-kbuild@vger.kernel.org

From: Eugeniu Rosca <erosca@de.adit-jv.com>

Assuming commit 617aebe6a97e ("Merge tag 'usercopy-v4.16-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux"), ARCH=arm64
and vanilla arm64 defconfig, here is the top 10 CONFIG options with
the highest amount of top level "||" sub-expressions/tokens that make
up the final "{Selected,Implied} by" reverse dependency expression.

| Config                        | Revdep all | Revdep ![=n] |
|-------------------------------|------------|--------------|
| REGMAP_I2C                    | 212        | 9            |
| CRC32                         | 167        | 25           |
| FW_LOADER                     | 128        | 5            |
| MFD_CORE                      | 124        | 9            |
| FB_CFB_IMAGEBLIT              | 114        | 2            |
| FB_CFB_COPYAREA               | 111        | 2            |
| FB_CFB_FILLRECT               | 110        | 2            |
| SND_PCM                       | 103        | 2            |
| CRYPTO_HASH                   | 87         | 19           |
| WATCHDOG_CORE                 | 86         | 6            |

The story behind the above is that users need to visually
review/evaluate 212 expressions which *potentially* select REGMAP_I2C
in order to identify the expressions which *actually* select REGMAP_I2C,
for a particular ARCH and for a particular defconfig used.

To make this experience smoother, change the way reverse dependencies
are displayed to the user from [1] to [2].

[1] Old representation of reverse dependencies for DMA_ENGINE_RAID:
  Selected by:
  - AMCC_PPC440SPE_ADMA [=n] && DMADEVICES [=y] && (440SPe || 440SP)
  - BCM_SBA_RAID [=m] && DMADEVICES [=y] && (ARM64 [=y] || ...
  - FSL_RAID [=n] && DMADEVICES [=y] && FSL_SOC && ...
  - INTEL_IOATDMA [=n] && DMADEVICES [=y] && PCI [=y] && X86_64
  - MV_XOR [=n] && DMADEVICES [=y] && (PLAT_ORION || ARCH_MVEBU [=y] ...
  - MV_XOR_V2 [=y] && DMADEVICES [=y] && ARM64 [=y]
  - XGENE_DMA [=n] && DMADEVICES [=y] && (ARCH_XGENE [=y] || ...
  - DMATEST [=n] && DMADEVICES [=y] && DMA_ENGINE [=y]

[2] New representation of reverse dependencies for DMA_ENGINE_RAID:
  Selected by [y]:
  - MV_XOR_V2 [=y] && DMADEVICES [=y] && ARM64 [=y]
  Selected by [m]:
  - BCM_SBA_RAID [=m] && DMADEVICES [=y] && (ARM64 [=y] || ...
  Selected by [n]:
  - AMCC_PPC440SPE_ADMA [=n] && DMADEVICES [=y] && (440SPe || ...
  - FSL_RAID [=n] && DMADEVICES [=y] && FSL_SOC && ...
  - INTEL_IOATDMA [=n] && DMADEVICES [=y] && PCI [=y] && X86_64
  - MV_XOR [=n] && DMADEVICES [=y] && (PLAT_ORION || ARCH_MVEBU [=y] ...
  - XGENE_DMA [=n] && DMADEVICES [=y] && (ARCH_XGENE [=y] || ...
  - DMATEST [=n] && DMADEVICES [=y] && DMA_ENGINE [=y]

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
 scripts/kconfig/expr.c      | 63 ++++++++++++++++++++++++++++++++++++++-------
 scripts/kconfig/expr.h      |  4 +++
 scripts/kconfig/lkc_proto.h |  1 +
 scripts/kconfig/menu.c      | 37 +++++++++++++++++++-------
 4 files changed, 86 insertions(+), 19 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 66b435bca80c..95dc058a236f 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1180,13 +1180,19 @@ struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2)
 }
 
 static void
-expr_print_newline(struct expr *e,
-		   void (*fn)(void *, struct symbol *, const char *),
-		   void *data,
-		   int prevtoken)
+expr_print_revdep(struct expr *e,
+		  void (*fn)(void *, struct symbol *, const char *),
+		  void *data,
+		  int prevtoken,
+		  enum print_type type)
 {
-	fn(data, NULL, "\n  - ");
-	expr_print(e, fn, data, prevtoken);
+	if (type == PRINT_REVDEP_ALL				  ||
+	    type == PRINT_REVDEP_YES && expr_calc_value(e) == yes ||
+	    type == PRINT_REVDEP_MOD && expr_calc_value(e) == mod ||
+	    type == PRINT_REVDEP_NO  && expr_calc_value(e) == no) {
+		fn(data, NULL, "\n  - ");
+		expr_print(e, fn, data, prevtoken);
+	}
 }
 
 static void
@@ -1211,7 +1217,10 @@ __expr_print(struct expr *e,
 				fn(data, e->left.sym, e->left.sym->name);
 				break;
 			case PRINT_REVDEP_ALL:
-				expr_print_newline(e, fn, data, E_OR);
+			case PRINT_REVDEP_YES:
+			case PRINT_REVDEP_MOD:
+			case PRINT_REVDEP_NO:
+				expr_print_revdep(e, fn, data, E_OR, type);
 				break;
 			}
 		else
@@ -1269,7 +1278,10 @@ __expr_print(struct expr *e,
 			expr_print(e->right.expr, fn, data, E_AND);
 			break;
 		case PRINT_REVDEP_ALL:
-			expr_print_newline(e, fn, data, E_OR);
+		case PRINT_REVDEP_YES:
+		case PRINT_REVDEP_MOD:
+		case PRINT_REVDEP_NO:
+			expr_print_revdep(e, fn, data, E_OR, type);
 			break;
 		}
 		break;
@@ -1349,10 +1361,43 @@ void expr_gstr_print(struct expr *e, struct gstr *gs)
 	expr_print(e, expr_print_gstr_helper, gs, E_NONE);
 }
 
+/*
+ * Allow front ends to check if a specific reverse dependency expression
+ * has at least one top level "||" member which evaluates to "val". This,
+ * will allow front ends to, as example, avoid printing "Selected by [y]:"
+ * line when there are actually no top level "||" sub-expressions which
+ * evaluate to =y.
+ */
+bool expr_revdep_contains(struct expr *e, tristate val)
+{
+	bool ret = false;
+
+	if (!e)
+		return ret;
+
+	switch (e->type) {
+	case E_SYMBOL:
+	case E_AND:
+		if (expr_calc_value(e) == val)
+			ret = true;
+		break;
+	case E_OR:
+		if (expr_revdep_contains(e->left.expr, val))
+			ret = true;
+		else if (expr_revdep_contains(e->right.expr, val))
+			ret = true;
+		break;
+	default:
+		break;
+	}
+	return ret;
+}
+
 /*
  * Transform the top level "||" tokens into newlines and prepend each
  * line with a minus. This makes expressions much easier to read.
- * Suitable for reverse dependency expressions.
+ * Suitable for reverse dependency expressions. In addition, allow
+ * selective printing of tokens/sub-expressions by their tristate value.
  */
 void expr_gstr_print_revdep(struct expr *e, struct gstr *gs, enum print_type t)
 {
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 21cb67c15091..d5b096725ca8 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -37,6 +37,9 @@ enum expr_type {
 enum print_type {
 	PRINT_NORMAL,
 	PRINT_REVDEP_ALL,
+	PRINT_REVDEP_YES,
+	PRINT_REVDEP_MOD,
+	PRINT_REVDEP_NO,
 };
 
 union expr_data {
@@ -316,6 +319,7 @@ void expr_fprint(struct expr *e, FILE *out);
 struct gstr; /* forward */
 void expr_gstr_print(struct expr *e, struct gstr *gs);
 void expr_gstr_print_revdep(struct expr *e, struct gstr *gs, enum print_type t);
+bool expr_revdep_contains(struct expr *e, tristate val);
 
 static inline int expr_is_yes(struct expr *e)
 {
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 9dc8abfb1dc3..69ed1477e4ef 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -25,6 +25,7 @@ bool menu_has_help(struct menu *menu);
 const char * menu_get_help(struct menu *menu);
 struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head);
 void menu_get_ext_help(struct menu *menu, struct gstr *help);
+void get_revdep_by_type(struct expr *e, char *s, struct gstr *r);
 
 /* symbol.c */
 extern struct symbol * symbol_hash[SYMBOL_HASHSIZE];
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 5b8edba105f2..029da77fe1b0 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -790,6 +790,31 @@ static void get_symbol_props_str(struct gstr *r, struct symbol *sym,
 		str_append(r, "\n");
 }
 
+void get_revdep_by_type(struct expr *e, char *s, struct gstr *r)
+{
+	if (!e)
+		return;
+
+	if (expr_revdep_contains(e, yes)) {
+		str_append(r, s);
+		str_append(r, " [y]:");
+		expr_gstr_print_revdep(e, r, PRINT_REVDEP_YES);
+		str_append(r, "\n");
+	}
+	if (expr_revdep_contains(e, mod)) {
+		str_append(r, s);
+		str_append(r, " [m]:");
+		expr_gstr_print_revdep(e, r, PRINT_REVDEP_MOD);
+		str_append(r, "\n");
+	}
+	if (expr_revdep_contains(e, no)) {
+		str_append(r, s);
+		str_append(r, " [n]:");
+		expr_gstr_print_revdep(e, r, PRINT_REVDEP_NO);
+		str_append(r, "\n");
+	}
+}
+
 /*
  * head is optional and may be NULL
  */
@@ -826,18 +851,10 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
 	}
 
 	get_symbol_props_str(r, sym, P_SELECT, _("  Selects: "));
-	if (sym->rev_dep.expr) {
-		str_append(r, _("  Selected by: "));
-		expr_gstr_print_revdep(sym->rev_dep.expr, r, PRINT_REVDEP_ALL);
-		str_append(r, "\n");
-	}
+	get_revdep_by_type(sym->rev_dep.expr, "  Selected by", r);
 
 	get_symbol_props_str(r, sym, P_IMPLY, _("  Implies: "));
-	if (sym->implied.expr) {
-		str_append(r, _("  Implied by: "));
-		expr_gstr_print_revdep(sym->implied.expr, r, PRINT_REVDEP_ALL);
-		str_append(r, "\n");
-	}
+	get_revdep_by_type(sym->implied.expr, "  Implied by", r);
 
 	str_append(r, "\n\n");
 }
-- 
2.16.1

