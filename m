Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:46559 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754425AbYAFWLb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 6 Jan 2008 17:11:31 -0500
Date: Sun, 6 Jan 2008 23:11:34 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [RFC] kconfig: add a few comments to expr.h
Message-ID: <20080106221134.GA6265@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Roman.

I have added a few comments to expr.h with the intent
of making it a bit easier to hack on the kconfig backend.

Can I request you to review the comments and add the few
missing bits.

I deleted one unused flag (SYMBOL_PRINTED) - if you
have future plans with it let me now and I will re-add it.

Thanks,
	Sam


diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index a195986..c2153a1 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -63,9 +63,13 @@ enum symbol_type {
 	S_UNKNOWN, S_BOOLEAN, S_TRISTATE, S_INT, S_HEX, S_STRING, S_OTHER
 };
 
+/* enum values are used as index to symbol.def[] */
 enum {
 	S_DEF_USER,		/* main user value */
-	S_DEF_AUTO,
+	S_DEF_AUTO,		/* values read from auto.conf */
+	S_DEF_DEF3,		/* Reserved for UI usage */
+	S_DEF_DEF4,		/* Reserved for UI usage */
+	S_DEF_COUNT
 };
 
 struct symbol {
@@ -73,7 +77,7 @@ struct symbol {
 	char *name;
 	enum symbol_type type;
 	struct symbol_value curr;
-	struct symbol_value def[4];
+	struct symbol_value def[S_DEF_COUNT];
 	tristate visible;
 	int flags;
 	struct property *prop;
@@ -82,42 +86,66 @@ struct symbol {
 
 #define for_all_symbols(i, sym) for (i = 0; i < 257; i++) for (sym = symbol_hash[i]; sym; sym = sym->next) if (sym->type != S_OTHER)
 
-#define SYMBOL_CONST		0x0001
-#define SYMBOL_CHECK		0x0008
-#define SYMBOL_CHOICE		0x0010
-#define SYMBOL_CHOICEVAL	0x0020
-#define SYMBOL_PRINTED		0x0040
-#define SYMBOL_VALID		0x0080
-#define SYMBOL_OPTIONAL		0x0100
-#define SYMBOL_WRITE		0x0200
-#define SYMBOL_CHANGED		0x0400
-#define SYMBOL_AUTO		0x1000
-#define SYMBOL_CHECKED		0x2000
-#define SYMBOL_WARNED		0x8000
-#define SYMBOL_DEF		0x10000
-#define SYMBOL_DEF_USER		0x10000
-#define SYMBOL_DEF_AUTO		0x20000
-#define SYMBOL_DEF3		0x40000
-#define SYMBOL_DEF4		0x80000
+/* symbol.flags bits */
+#define SYMBOL_CONST		0x0001    /* symbol is const */
+#define SYMBOL_SPARE_2		0x0002
+#define SYMBOL_SPARE_4		0x0004
+#define SYMBOL_CHECK		0x0008    /* used during dependency checking */
+#define SYMBOL_CHOICE		0x0010    /* symbol represent start of a choice block (null name) */
+#define SYMBOL_CHOICEVAL	0x0020    /* symbol is used as a value in a choice block */
+#define SYMBOL_SPARE_40		0x0040
+#define SYMBOL_VALID		0x0080    /* set when symbol.curr is calculated (and valid) */
+#define SYMBOL_OPTIONAL		0x0100    /* a choice marked optional can have all values equal 'n'
+                                           * Also used for menus ? */
+#define SYMBOL_WRITE		0x0200    /* ? */
+#define SYMBOL_CHANGED		0x0400    /* ? */
+#define SYMBOL_AUTO		0x1000    /* value has been assing by kconfig (from environment variable or modules) */
+#define SYMBOL_CHECKED		0x2000    /* used during dependency checking */
+#define SYMBOL_WARNED		0x8000    /* set when a warning has been issued for this symbol */
+#define SYMBOL_DEF		0x10000   /* First bit of SYMBOL_DEF used to support << */
+#define SYMBOL_DEF_USER		0x10000   /* Data in symbol.def[S_DEF_USER] are valid */
+#define SYMBOL_DEF_AUTO		0x20000   /* Data in symbol.def[S_DEF_AUTO] are valid */
+#define SYMBOL_DEF3		0x40000   /* Data in symbol.def[S_DEF_DEF3] are valid */
+#define SYMBOL_DEF4		0x80000   /* Data in symbol.def[S_DEF_DEF4] are valid */
 
 #define SYMBOL_MAXLENGTH	256
 #define SYMBOL_HASHSIZE		257
 #define SYMBOL_HASHMASK		0xff
 
+/* A property represent the config options that can be associated
+ * with a config "symbol".
+ * Sample:
+ * config FOO
+ *         default y
+ *         prompt "foo prompt"
+ *         select BAR
+ * config BAZ
+ *         int "BAZ Value"
+ *         range 1..255
+ */
 enum prop_type {
-	P_UNKNOWN, P_PROMPT, P_COMMENT, P_MENU, P_DEFAULT, P_CHOICE, P_SELECT, P_RANGE
+	P_UNKNOWN,
+	P_PROMPT,     /* prompt "foo prompt" or "BAZ Value" */
+	P_COMMENT,    /* A text associated with a comment (the prompt of the comment) */
+	P_MENU,       /* The prompt associated with a menuconfig option */
+	P_DEFAULT,    /* default y */
+	P_CHOICE,     /* ? */
+	P_SELECT,     /* select BAR */
+	P_RANGE       /* range 7..100 (for a symbol) */
 };
 
 struct property {
-	struct property *next;
-	struct symbol *sym;
-	enum prop_type type;
-	const char *text;
+	struct property *next;       /* next property in chained list - null if last */
+	struct symbol *sym;          /* the symbol for which the properti is associated */
+	enum prop_type type;         /* type of property */
+	const char *text;            /* the prompt value - P_PROMPT, P_MENU, P_COMMENT */
 	struct expr_value visible;
-	struct expr *expr;
-	struct menu *menu;
-	struct file *file;
-	int lineno;
+	struct expr *expr;           /* the optional conditional part of the property */
+	struct menu *menu;           /* the menu the property are associated with
+	                              * valid for: P_SELECT, P_RANGE, P_CHOICE,
+	                              * P_PROMPT, P_DEFAULT, P_MENU, P_COMMENT */
+	struct file *file;           /* In what file was this property defined */
+	int lineno;                  /* At what lineno was this property defined */
 };
 
 #define for_all_properties(sym, st, tok) \
diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 262908c..df910cb 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -119,8 +119,6 @@ const char *dbg_print_flags(int val)
 		strcat(buf, "choice/");
 	if (val & SYMBOL_CHOICEVAL)
 		strcat(buf, "choiceval/");
-	if (val & SYMBOL_PRINTED)
-		strcat(buf, "printed/");
 	if (val & SYMBOL_VALID)
 		strcat(buf, "valid/");
 	if (val & SYMBOL_OPTIONAL)
