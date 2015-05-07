Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mo4-p04-ob.smtp.rzone.de ([81.169.146.176]:22543 "EHLO
	mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751078AbbEGNM1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 May 2015 09:12:27 -0400
From: Stefan Roese <sr@denx.de>
Subject: [PATCH] Kconfig: Enable usage of escape char '\' in string values
Date: Thu,  7 May 2015 15:06:22 +0200
Message-Id: <1431003982-992-1-git-send-email-sr@denx.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

I might have missed something, but I failed to use the escape char '\'
in strings. To pass a printf format string like "foo %d bar\n" via
Kconfig to the code.

Right now its not possible to use the escape character '\' in Kconfig
string values correctly to e.g. set this string value "test output\n".
The '\n' will be converted to 'n'.

The current implementation removes some of the '\' chars from the input
string in conf_set_sym_val(). Examples:

'\'	-> ''
'\\'	-> '\'
'\\\'	-> '\'
'\\\\'	-> '\\'
...

And then doubles the backslash chars in the output string in
sym_escape_string_value(). Example:

'\'	-> ''	-> ''
'\\'	-> '\'	-> '\\'
'\\\'	-> '\'	-> '\\'
'\\\\'	-> '\\'	-> '\\\\'
...

As you see in these examples, its impossible to generate a single '\'
charater in the output string as its needed for something like '\n'.

This patch now changes this behavior to not drop some backslashes in
conf_set_sym_val() and to not add new backslashes in the resulting
output string. Removing the function sym_escape_string_value()
completely as its not needed anymore.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.cz>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 scripts/kconfig/confdata.c | 20 +++++++++-----------
 scripts/kconfig/symbol.c   | 43 -------------------------------------------
 2 files changed, 9 insertions(+), 54 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index c814f57..0c4200a 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -161,18 +161,14 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 	case S_STRING:
 		if (*p++ != '"')
 			break;
-		for (p2 = p; (p2 = strpbrk(p2, "\"\\")); p2++) {
-			if (*p2 == '"') {
-				*p2 = 0;
-				break;
-			}
-			memmove(p2, p2 + 1, strlen(p2));
-		}
-		if (!p2) {
+		/* Last char has to be a '"' */
+		if (p[strlen(p) - 1] != '"') {
 			if (def != S_DEF_AUTO)
 				conf_warning("invalid string found");
 			return 1;
 		}
+		/* Overwrite '"' with \0 for string termination */
+		p[strlen(p) - 1] = 0;
 		/* fall through */
 	case S_INT:
 	case S_HEX:
@@ -630,6 +626,7 @@ static void conf_write_symbol(FILE *fp, struct symbol *sym,
 			      struct conf_printer *printer, void *printer_arg)
 {
 	const char *str;
+	char *str2;
 
 	switch (sym->type) {
 	case S_OTHER:
@@ -637,9 +634,10 @@ static void conf_write_symbol(FILE *fp, struct symbol *sym,
 		break;
 	case S_STRING:
 		str = sym_get_string_value(sym);
-		str = sym_escape_string_value(str);
-		printer->print_symbol(fp, sym, str, printer_arg);
-		free((void *)str);
+		str2 = xmalloc(strlen(str) + 2);
+		sprintf(str2, "\"%s\"", str);
+		printer->print_symbol(fp, sym, str2, printer_arg);
+		free((void *)str2);
 		break;
 	default:
 		str = sym_get_string_value(sym);
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 6731377..550e1d7 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -912,49 +912,6 @@ const char *sym_expand_string_value(const char *in)
 	return res;
 }
 
-const char *sym_escape_string_value(const char *in)
-{
-	const char *p;
-	size_t reslen;
-	char *res;
-	size_t l;
-
-	reslen = strlen(in) + strlen("\"\"") + 1;
-
-	p = in;
-	for (;;) {
-		l = strcspn(p, "\"\\");
-		p += l;
-
-		if (p[0] == '\0')
-			break;
-
-		reslen++;
-		p++;
-	}
-
-	res = xmalloc(reslen);
-	res[0] = '\0';
-
-	strcat(res, "\"");
-
-	p = in;
-	for (;;) {
-		l = strcspn(p, "\"\\");
-		strncat(res, p, l);
-		p += l;
-
-		if (p[0] == '\0')
-			break;
-
-		strcat(res, "\\");
-		strncat(res, p++, 1);
-	}
-
-	strcat(res, "\"");
-	return res;
-}
-
 struct sym_match {
 	struct symbol	*sym;
 	off_t		so, eo;
-- 
2.4.0

