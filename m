Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49418 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727684AbfLQEOw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:14:52 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 7/8] kconfig: remove sym from struct property
Date: Tue, 17 Dec 2019 13:14:22 +0900
Message-Id: <20191217041424.29285-8-masahiroy@kernel.org>
In-Reply-To: <20191217041424.29285-1-masahiroy@kernel.org>
References: <20191217041424.29285-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

struct property can reference to the symbol that it is associated with
by prop->menu->sym.

Fix up the one usage of prop->sym, and remove sym from struct property.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.h   | 1 -
 scripts/kconfig/parser.y | 2 +-
 scripts/kconfig/symbol.c | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 017843c9a4f4..6e102a3b8bd5 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -191,7 +191,6 @@ enum prop_type {
 
 struct property {
 	struct property *next;     /* next property - null if last */
-	struct symbol *sym;        /* the symbol for which the property is associated */
 	enum prop_type type;       /* type of property */
 	const char *text;          /* the prompt value - P_PROMPT, P_MENU, P_COMMENT */
 	struct expr_value visible;
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 40e46996e6a5..d5c41a5c370c 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -671,7 +671,7 @@ static void print_symbol(FILE *out, struct menu *menu)
 			break;
 		case P_SYMBOL:
 			fputs( "  symbol ", out);
-			fprintf(out, "%s\n", prop->sym->name);
+			fprintf(out, "%s\n", prop->menu->sym->name);
 			break;
 		default:
 			fprintf(out, "  unknown prop %d!\n", prop->type);
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index f56eec5ea4c7..dbc5365d8bbc 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1281,7 +1281,6 @@ struct property *prop_alloc(enum prop_type type, struct symbol *sym)
 	prop = xmalloc(sizeof(*prop));
 	memset(prop, 0, sizeof(*prop));
 	prop->type = type;
-	prop->sym = sym;
 	prop->file = current_file;
 	prop->lineno = zconf_lineno();
 
-- 
2.17.1
