Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:35084 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751576AbbINTGJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Sep 2015 15:06:09 -0400
Received: by wicge5 with SMTP id ge5so155721108wic.0
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2015 12:06:08 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
Subject: [PATCH 1/1] [RFC] kconfig: menuconfig make "Selected by:" readable
Date: Mon, 14 Sep 2015 21:05:43 +0200
Message-Id: <1442257543-6194-2-git-send-email-petr.vorel@gmail.com>
In-Reply-To: <1442257543-6194-1-git-send-email-petr.vorel@gmail.com>
References: <1442257543-6194-1-git-send-email-petr.vorel@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Paul Bolle <pebolle@tiscali.nl>, Randy Dunlap <rdunlap@infradead.org>, Petr Vorel <petr.vorel@gmail.com>

From: Paul Bolle <pebolle@tiscali.nl>

rev_dep expressions can get rather unwieldy, especially if a symbol is
selected by more than a handful of other symbols. Ie, it's possible to
have near endless expressions like:
   A && B && !C || D || F && (G || H) || [...]

Chop these expressions into actually readable chunks:
   - A && B && !C
   - D
   - F && (G || H)
   - [...]

Ie, transform the top level "||" tokens into newlines and prepend each
line with a minus. This makes the "Selected by:" blurb much easier to
read.
---
Today I found myself wondering why a certain Kconfig was selected.
Currently menuconfig's help is of no use in complicated cases. Please
look at the help of USB or CRYPTO to see what I mean.

This is a _hack_ to show what might be a better way to do this. It
parses a stringified version of the reverse dependency, and not the
actual reverse dependecy expression. But that was easier to cobble
together.

One cool improvement would be to change to minus in front of the
subexpressions to Y or M for those that actually set the symbol. Anyhow,
other suggestions and feedback is welcome.

Not-yet-signed-off-by: Paul Bolle <pebolle@tiscali.nl>
Tested-by: Petr Vorel <petr.vorel@gmail.com>
Cc: Paul Bolle <pebolle@tiscali.nl>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Petr Vorel <petr.vorel@gmail.com>
---
 scripts/kconfig/menu.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index b05cc3d..a8b37a2 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -613,6 +613,86 @@ static struct property *get_symbol_prop(struct symbol *sym)
 }
 
 /*
+ * Assuming we're just past an opening parenthesis in a NUL terminated string,
+ * find it's closing parenthesis and return its postion. Die otherwise.
+ */
+static const char *matching_paren(const char *s)
+{
+	int lvl = 1;
+
+	while (1) {
+		if (*s == '(')
+			lvl++;
+		else if (*s == ')')
+			lvl--;
+		if (lvl == 0)
+			break;
+		if (*s == '\0')
+			/* huh? */
+			exit(1);
+		s++;
+	}
+
+	return s;
+}
+
+/*
+ * rev_dep expressions can get rather unwieldy, especially if a symbol is
+ * selected by more than a handful of other symbols. Ie, it's possible to
+ * have near endless expressions like:
+ *    A && B && !C || D || F && (G || H) || [...]
+ *
+ * Chop these expressions into actually readable chunks:
+ *    - A && B && !C
+ *    - D
+ *    - F && (G || H)
+ *    - [...]
+ *
+ * Ie, transform the top level "||" tokens into newlines and prepend each line
+ * with a minus. This makes the "Selected by:" blurb much easier to read.
+ */
+static void rev_dep_gstr_print(struct expr *e, struct gstr *gs)
+{
+	struct gstr tmp = str_new();
+	const char *prev, *start;
+	char *beam;
+
+	expr_gstr_print(e, &tmp);
+	prev = start = str_get(&tmp);
+
+	str_append(gs, "\n  - ");
+
+	while ((beam = index(start, '|'))) {
+		char *lparen = index(start, '(');
+
+		/* don't split "(I || J)" */
+		if (lparen && (lparen < beam)) {
+			const char *rparen = matching_paren(++lparen);
+
+			/* skip the expression inside parentheses */
+			start = ++rparen;
+			continue;
+		}
+
+		/* we can assume we're fed a sane string, so the space before
+		 * the beam gets turned into a NUL */
+		*(beam - 1) = '\0';
+		str_append(gs, prev);
+		str_append(gs, "\n  - ");
+		/* assume sane string, so skip the second beam */
+		beam++;
+		/* trim */
+		while (*++beam == ' ')
+			;
+		prev = start = beam;
+	}
+
+	str_append(gs, prev);
+
+	str_free(&tmp);
+}
+
+/*
  * head is optional and may be NULL
  */
 static void get_symbol_str(struct gstr *r, struct symbol *sym,
@@ -661,8 +741,7 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,
 		str_append(r, "\n");
 	if (sym->rev_dep.expr) {
 		str_append(r, _("  Selected by: "));
-		expr_gstr_print(sym->rev_dep.expr, r);
-		str_append(r, "\n");
+		rev_dep_gstr_print(sym->rev_dep.expr, r);
 	}
 	str_append(r, "\n\n");
 }
-- 
1.8.0

