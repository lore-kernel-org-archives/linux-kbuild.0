Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36230 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752392AbbBXPjO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Feb 2015 10:39:14 -0500
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 3/3] kconfig: Remove unnecessary prototypes from headers
Date: Tue, 24 Feb 2015 16:39:03 +0100
Message-Id: <1424792343-25621-3-git-send-email-mmarek@suse.cz>
In-Reply-To: <1424792343-25621-1-git-send-email-mmarek@suse.cz>
References: <1424792343-25621-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 scripts/kconfig/confdata.c  |  5 +++++
 scripts/kconfig/expr.c      | 18 ++++++++++++------
 scripts/kconfig/expr.h      |  5 -----
 scripts/kconfig/lkc.h       | 11 -----------
 scripts/kconfig/lkc_proto.h |  3 ---
 scripts/kconfig/menu.c      |  4 ++--
 scripts/kconfig/symbol.c    | 42 +++++++++++++++++++++---------------------
 7 files changed, 40 insertions(+), 48 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 28df18d..c814f57 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -16,6 +16,11 @@
 
 #include "lkc.h"
 
+struct conf_printer {
+	void (*print_symbol)(FILE *, struct symbol *, const char *, void *);
+	void (*print_comment)(FILE *, const char *, void *);
+};
+
 static void conf_warning(const char *fmt, ...)
 	__attribute__ ((format (printf, 1, 2)));
 
diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 4b4cf8e..fb0a2a2 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -11,6 +11,12 @@
 
 #define DEBUG_EXPR	0
 
+static int expr_eq(struct expr *e1, struct expr *e2);
+static struct expr *expr_eliminate_yn(struct expr *e);
+static struct expr *expr_extract_eq_and(struct expr **ep1, struct expr **ep2);
+static struct expr *expr_extract_eq_or(struct expr **ep1, struct expr **ep2);
+static void expr_extract_eq(enum expr_type type, struct expr **ep, struct expr **ep1, struct expr **ep2);
+
 struct expr *expr_alloc_symbol(struct symbol *sym)
 {
 	struct expr *e = xcalloc(1, sizeof(*e));
@@ -186,7 +192,7 @@ void expr_eliminate_eq(struct expr **ep1, struct expr **ep2)
 #undef e1
 #undef e2
 
-int expr_eq(struct expr *e1, struct expr *e2)
+static int expr_eq(struct expr *e1, struct expr *e2)
 {
 	int res, old_count;
 
@@ -228,7 +234,7 @@ int expr_eq(struct expr *e1, struct expr *e2)
 	return 0;
 }
 
-struct expr *expr_eliminate_yn(struct expr *e)
+static struct expr *expr_eliminate_yn(struct expr *e)
 {
 	struct expr *tmp;
 
@@ -823,7 +829,7 @@ bool expr_depends_symbol(struct expr *dep, struct symbol *sym)
  	return false;
 }
 
-struct expr *expr_extract_eq_and(struct expr **ep1, struct expr **ep2)
+static struct expr *expr_extract_eq_and(struct expr **ep1, struct expr **ep2)
 {
 	struct expr *tmp = NULL;
 	expr_extract_eq(E_AND, &tmp, ep1, ep2);
@@ -834,7 +840,7 @@ struct expr *expr_extract_eq_and(struct expr **ep1, struct expr **ep2)
 	return tmp;
 }
 
-struct expr *expr_extract_eq_or(struct expr **ep1, struct expr **ep2)
+static struct expr *expr_extract_eq_or(struct expr **ep1, struct expr **ep2)
 {
 	struct expr *tmp = NULL;
 	expr_extract_eq(E_OR, &tmp, ep1, ep2);
@@ -845,7 +851,7 @@ struct expr *expr_extract_eq_or(struct expr **ep1, struct expr **ep2)
 	return tmp;
 }
 
-void expr_extract_eq(enum expr_type type, struct expr **ep, struct expr **ep1, struct expr **ep2)
+static void expr_extract_eq(enum expr_type type, struct expr **ep, struct expr **ep1, struct expr **ep2)
 {
 #define e1 (*ep1)
 #define e2 (*ep2)
@@ -976,7 +982,7 @@ tristate expr_calc_value(struct expr *e)
 	}
 }
 
-int expr_compare_type(enum expr_type t1, enum expr_type t2)
+static int expr_compare_type(enum expr_type t1, enum expr_type t2)
 {
 	if (t1 == t2)
 		return 0;
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 412ea8a..a2fc96a 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -205,18 +205,13 @@ struct expr *expr_alloc_and(struct expr *e1, struct expr *e2);
 struct expr *expr_alloc_or(struct expr *e1, struct expr *e2);
 struct expr *expr_copy(const struct expr *org);
 void expr_free(struct expr *e);
-int expr_eq(struct expr *e1, struct expr *e2);
 void expr_eliminate_eq(struct expr **ep1, struct expr **ep2);
 tristate expr_calc_value(struct expr *e);
-struct expr *expr_eliminate_yn(struct expr *e);
 struct expr *expr_trans_bool(struct expr *e);
 struct expr *expr_eliminate_dups(struct expr *e);
 struct expr *expr_transform(struct expr *e);
 int expr_contains_symbol(struct expr *dep, struct symbol *sym);
 bool expr_depends_symbol(struct expr *dep, struct symbol *sym);
-struct expr *expr_extract_eq_and(struct expr **ep1, struct expr **ep2);
-struct expr *expr_extract_eq_or(struct expr **ep1, struct expr **ep2);
-void expr_extract_eq(enum expr_type type, struct expr **ep, struct expr **ep1, struct expr **ep2);
 struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symbol *sym);
 struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2);
 
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 9f845ea..91ca126 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -68,9 +68,6 @@ struct kconf_id {
 	enum symbol_type stype;
 };
 
-extern int zconfdebug;
-
-int zconfparse(void);
 void zconfdump(FILE *out);
 void zconf_starthelp(void);
 FILE *zconf_fopen(const char *name);
@@ -88,11 +85,6 @@ void sym_add_change_count(int count);
 bool conf_set_all_new_symbols(enum conf_def_mode mode);
 void set_all_choice_values(struct symbol *csym);
 
-struct conf_printer {
-	void (*print_symbol)(FILE *, struct symbol *, const char *, void *);
-	void (*print_comment)(FILE *, const char *, void *);
-};
-
 /* confdata.c and expr.c */
 static inline void xfwrite(const void *str, size_t len, size_t count, FILE *out)
 {
@@ -111,7 +103,6 @@ void menu_add_entry(struct symbol *sym);
 void menu_end_entry(void);
 void menu_add_dep(struct expr *dep);
 void menu_add_visibility(struct expr *dep);
-struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *expr, struct expr *dep);
 struct property *menu_add_prompt(enum prop_type type, char *prompt, struct expr *dep);
 void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep);
 void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep);
@@ -145,8 +136,6 @@ extern struct expr *sym_env_list;
 
 void sym_init(void);
 void sym_clear_all_valid(void);
-void sym_set_all_changed(void);
-void sym_set_changed(struct symbol *sym);
 struct symbol *sym_choice_default(struct symbol *sym);
 const char *sym_get_string_default(struct symbol *sym);
 struct symbol *sym_check_deps(struct symbol *sym);
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index ceddbcf..d539871 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -22,7 +22,6 @@ struct menu * menu_get_root_menu(struct menu *menu);
 struct menu * menu_get_parent_menu(struct menu *menu);
 bool menu_has_help(struct menu *menu);
 const char * menu_get_help(struct menu *menu);
-void get_symbol_str(struct gstr *r, struct symbol *sym, struct list_head *head);
 struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head);
 void menu_get_ext_help(struct menu *menu, struct gstr *help);
 
@@ -45,11 +44,9 @@ bool sym_string_within_range(struct symbol *sym, const char *str);
 bool sym_set_string_value(struct symbol *sym, const char *newval);
 bool sym_is_changable(struct symbol *sym);
 struct property * sym_get_choice_prop(struct symbol *sym);
-struct property * sym_get_default_prop(struct symbol *sym);
 const char * sym_get_string_value(struct symbol *sym);
 
 const char * prop_get_type_name(enum prop_type type);
 
 /* expr.c */
-int expr_compare_type(enum expr_type t1, enum expr_type t2);
 void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 72c9dba..b05cc3d 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -125,7 +125,7 @@ void menu_set_type(int type)
 		sym_type_name(sym->type), sym_type_name(type));
 }
 
-struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *expr, struct expr *dep)
+static struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *expr, struct expr *dep)
 {
 	struct property *prop = prop_alloc(type, current_entry->sym);
 
@@ -615,7 +615,7 @@ static struct property *get_symbol_prop(struct symbol *sym)
 /*
  * head is optional and may be NULL
  */
-void get_symbol_str(struct gstr *r, struct symbol *sym,
+static void get_symbol_str(struct gstr *r, struct symbol *sym,
 		    struct list_head *head)
 {
 	bool hit;
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 7caabdb..6731377 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -112,7 +112,7 @@ struct property *sym_get_env_prop(struct symbol *sym)
 	return NULL;
 }
 
-struct property *sym_get_default_prop(struct symbol *sym)
+static struct property *sym_get_default_prop(struct symbol *sym)
 {
 	struct property *prop;
 
@@ -186,6 +186,26 @@ static void sym_validate_range(struct symbol *sym)
 	sym->curr.val = strdup(str);
 }
 
+static void sym_set_changed(struct symbol *sym)
+{
+	struct property *prop;
+
+	sym->flags |= SYMBOL_CHANGED;
+	for (prop = sym->prop; prop; prop = prop->next) {
+		if (prop->menu)
+			prop->menu->flags |= MENU_CHANGED;
+	}
+}
+
+static void sym_set_all_changed(void)
+{
+	struct symbol *sym;
+	int i;
+
+	for_all_symbols(i, sym)
+		sym_set_changed(sym);
+}
+
 static void sym_calc_visibility(struct symbol *sym)
 {
 	struct property *prop;
@@ -451,26 +471,6 @@ void sym_clear_all_valid(void)
 		sym_calc_value(modules_sym);
 }
 
-void sym_set_changed(struct symbol *sym)
-{
-	struct property *prop;
-
-	sym->flags |= SYMBOL_CHANGED;
-	for (prop = sym->prop; prop; prop = prop->next) {
-		if (prop->menu)
-			prop->menu->flags |= MENU_CHANGED;
-	}
-}
-
-void sym_set_all_changed(void)
-{
-	struct symbol *sym;
-	int i;
-
-	for_all_symbols(i, sym)
-		sym_set_changed(sym);
-}
-
 bool sym_tristate_within_range(struct symbol *sym, tristate val)
 {
 	int type = sym_get_type(sym);
-- 
2.1.2

