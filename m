Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:52273 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934348AbeF2JN3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Jun 2018 05:13:29 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH v2 1/2] kconfig: expr_print(): print constant symbols within quotes
Date: Fri, 29 Jun 2018 11:12:36 +0200
Message-Id: <20180629091237.16620-2-dirk@gouders.net>
In-Reply-To: <20180629091237.16620-1-dirk@gouders.net>
References: <ghd0wc58z6.fsf@lena.gouders.net>
 <20180629091237.16620-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Dirk Gouders <dirk@gouders.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Motivation for this commit was the problem that xfwrite() uses
assert() to ensure it does not operate on empty strings.  This caused
aborts when the dependency for an empty default string was printed.

A possibility to fix this issue would be to print all string
constants in quotes which has the positive effect that empty
strings have a length of 2 and do not trigger aborts.

But currently, constant symbols are typeless, so this patch implements
a fix by identifying all constant symbols by the symbol flag
SYMBOL_CONST and printing their names within quotes.

Note:

The symbols y, m and n are statically defined as constants in symbol.c
and hence also printed within quotes.  Kconfig files contain a mixture
of those symbols specified within and without quotes and we cannot
reproduce that after parsing.

Also, the kconfig language allows for (semantically meant) constant
string, int and hex symbols to be specified within quotes or without,
which is OK as long as there is no other symbol that is something
other than the constant symbol that was meant to be; the following
Kconfig file tries to illustrate this:

config a
       int "Meant to have default 5..."
       default 5

config 5
       int "but this symbol plays games."
       default "7"

This implementation reproduces exactly the described mixture from the
Kconfig files, thus original data.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 scripts/kconfig/expr.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index e1a39e90841d..b36e94e36f84 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1141,6 +1141,8 @@ void expr_print(struct expr *e,
 		void (*fn)(void *, struct symbol *, const char *),
 		void *data, int prevtoken)
 {
+	const char *quoted;
+
 	if (!e) {
 		fn(data, NULL, "y");
 		return;
@@ -1151,7 +1153,15 @@ void expr_print(struct expr *e,
 	switch (e->type) {
 	case E_SYMBOL:
 		if (e->left.sym->name)
-			fn(data, e->left.sym, e->left.sym->name);
+			/*
+			 * Print constant symbols within quotes
+			 */
+			if (e->left.sym->flags & SYMBOL_CONST) {
+				quoted = sym_escape_string_value(e->left.sym->name);
+				fn(data, e->left.sym, quoted);
+				free((void*)quoted);
+			} else
+				fn(data, e->left.sym, e->left.sym->name);
 		else
 			fn(data, NULL, "<choice>");
 		break;
-- 
2.16.1

