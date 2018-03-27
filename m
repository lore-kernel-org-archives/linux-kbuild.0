Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:44622 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751897AbeC0FcA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 01:32:00 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 03/21] kconfig: move and rename sym_expand_string_value()
Date: Tue, 27 Mar 2018 14:29:17 +0900
Message-Id: <1522128575-5326-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

This helper expands symbols contained in a string.  I am about to
change it to expand environments instead of symbols.  Also, I will
add function expansion later.

Rename it to expand_string_value(), and move it to util.c, which is
a more suitable place.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kconfig/lkc.h       |  1 +
 scripts/kconfig/lkc_proto.h |  1 -
 scripts/kconfig/symbol.c    | 53 -------------------------------------------
 scripts/kconfig/util.c      | 55 ++++++++++++++++++++++++++++++++++++++++++++-
 scripts/kconfig/zconf.y     |  2 +-
 5 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index f4394af..c8d9e55 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -111,6 +111,7 @@ void menu_finalize(struct menu *parent);
 void menu_set_type(int type);
 
 /* util.c */
+char *expand_string_value(const char *in);
 struct file *file_lookup(const char *name);
 int file_write_dep(const char *name);
 void *xmalloc(size_t size);
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 9dc8abf..9884adc 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -31,7 +31,6 @@ extern struct symbol * symbol_hash[SYMBOL_HASHSIZE];
 
 struct symbol * sym_lookup(const char *name, int flags);
 struct symbol * sym_find(const char *name);
-char *sym_expand_string_value(const char *in);
 const char * sym_escape_string_value(const char *in);
 struct symbol ** sym_re_search(const char *pattern);
 const char * sym_type_name(enum symbol_type type);
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index f0b2e3b..03143b2 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -906,59 +906,6 @@ struct symbol *sym_find(const char *name)
 	return symbol;
 }
 
-/*
- * Expand symbol's names embedded in the string given in argument. Symbols'
- * name to be expanded shall be prefixed by a '$'. Unknown symbol expands to
- * the empty string.
- */
-char *sym_expand_string_value(const char *in)
-{
-	const char *src;
-	char *res;
-	size_t reslen;
-
-	/*
-	 * Note: 'in' might come from a token that's about to be
-	 * freed, so make sure to always allocate a new string
-	 */
-	reslen = strlen(in) + 1;
-	res = xmalloc(reslen);
-	res[0] = '\0';
-
-	while ((src = strchr(in, '$'))) {
-		char *p, name[SYMBOL_MAXLENGTH];
-		const char *symval = "";
-		struct symbol *sym;
-		size_t newlen;
-
-		strncat(res, in, src - in);
-		src++;
-
-		p = name;
-		while (isalnum(*src) || *src == '_')
-			*p++ = *src++;
-		*p = '\0';
-
-		sym = sym_find(name);
-		if (sym != NULL) {
-			sym_calc_value(sym);
-			symval = sym_get_string_value(sym);
-		}
-
-		newlen = strlen(res) + strlen(symval) + strlen(src) + 1;
-		if (newlen > reslen) {
-			reslen = newlen;
-			res = xrealloc(res, reslen);
-		}
-
-		strcat(res, symval);
-		in = src;
-	}
-	strcat(res, in);
-
-	return res;
-}
-
 const char *sym_escape_string_value(const char *in)
 {
 	const char *p;
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index c6f6e21..22201a4 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -10,11 +10,64 @@
 #include <string.h>
 #include "lkc.h"
 
+/*
+ * Expand symbol's names embedded in the string given in argument. Symbols'
+ * name to be expanded shall be prefixed by a '$'. Unknown symbol expands to
+ * the empty string.
+ */
+char *expand_string_value(const char *in)
+{
+	const char *src;
+	char *res;
+	size_t reslen;
+
+	/*
+	 * Note: 'in' might come from a token that's about to be
+	 * freed, so make sure to always allocate a new string
+	 */
+	reslen = strlen(in) + 1;
+	res = xmalloc(reslen);
+	res[0] = '\0';
+
+	while ((src = strchr(in, '$'))) {
+		char *p, name[SYMBOL_MAXLENGTH];
+		const char *symval = "";
+		struct symbol *sym;
+		size_t newlen;
+
+		strncat(res, in, src - in);
+		src++;
+
+		p = name;
+		while (isalnum(*src) || *src == '_')
+			*p++ = *src++;
+		*p = '\0';
+
+		sym = sym_find(name);
+		if (sym != NULL) {
+			sym_calc_value(sym);
+			symval = sym_get_string_value(sym);
+		}
+
+		newlen = strlen(res) + strlen(symval) + strlen(src) + 1;
+		if (newlen > reslen) {
+			reslen = newlen;
+			res = xrealloc(res, reslen);
+		}
+
+		strcat(res, symval);
+		in = src;
+	}
+	strcat(res, in);
+
+	return res;
+}
+
 /* file already present in list? If not add it */
 struct file *file_lookup(const char *name)
 {
 	struct file *file;
-	char *file_name = sym_expand_string_value(name);
+	char *file_name = expand_string_value(name);
 
 	for (file = file_list; file; file = file->next) {
 		if (!strcmp(name, file->name)) {
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index ad6305b..262c464 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -547,7 +547,7 @@ void conf_parse(const char *name)
 
 	tmp = rootmenu.prompt->text;
 	rootmenu.prompt->text = _(rootmenu.prompt->text);
-	rootmenu.prompt->text = sym_expand_string_value(rootmenu.prompt->text);
+	rootmenu.prompt->text = expand_string_value(rootmenu.prompt->text);
 	free((char*)tmp);
 
 	menu_finalize(&rootmenu);
-- 
2.7.4

