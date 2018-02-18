Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35024 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751741AbeBRUsP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Feb 2018 15:48:15 -0500
Received: by mail-wm0-f68.google.com with SMTP id x21so11650599wmh.0
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Feb 2018 12:48:15 -0800 (PST)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: [PATCH v4 1/3] kconfig: Print reverse dependencies on new line consistently
Date: Sun, 18 Feb 2018 21:47:13 +0100
Message-Id: <1b98a85a5b65a13eb0367d072250775434a3a8fc.1518985888.git.erosca@de.adit-jv.com>
In-Reply-To: <cover.1518985888.git.erosca@de.adit-jv.com>
References: <cover.1518985888.git.erosca@de.adit-jv.com>
In-Reply-To: <cover.1518985888.git.erosca@de.adit-jv.com>
References: <cover.1518985888.git.erosca@de.adit-jv.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Ulf Magnusson <ulfalizer@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>, Eugeniu Rosca <rosca.eugeniu@gmail.com>, linux-kbuild@vger.kernel.org

From: Eugeniu Rosca <erosca@de.adit-jv.com>

Commit 1ccb27143360 ("kconfig: make "Selected by:" and "Implied by:"
readable") made an incredible improvement in how reverse dependencies
are perceived by the user, by breaking down the single (often
interminable) expression string into small readable chunks, each of
them displayed on a separate line:

Selected by:
- A && B
- C && (D || E)

Unfortunately, what happens with the non-OR (either E_SYMBOL or E_AND)
expressions is that they don't get a dedicated line:

Selected by: F && G

That's arguably a bug/misbehavior, but it puts some amount of burden in
implementing new ways of printing reverse dependencies to the user. As
example, if we prefix every reverse dependency top level "||" token by
its tristate value, then subjectively [2] looks more readable than [1].

[1] Selected by: [m] F && G
[2] Selected by:
    - [m] F && G

Also, if we print the reverse dependency sub-expressions in groups
(clustered by the tristate value they evaluate to), then
subjectively [4] looks more readable than [3].

[3] Selected by [m]: F && G
[4] Selected by [m]:
    - F && G

Based on the above, print all the reverse dependency sub-expressions on
a separate line _consistently_. An example of change contributed by this
commit is seen below.

| Symbol: NEED_SG_DMA_LENGTH [=y]
| ...
|   Selected by: IOMMU_DMA [=y] && IOMMU_SUPPORT [=y]

becomes:

| Symbol: NEED_SG_DMA_LENGTH [=y]
| ...
|   Selected by:
|   - IOMMU_DMA [=y] && IOMMU_SUPPORT [=y]

This patch has been tested using a tuned variant of zconfdump which
prints the reverse dependencies for each config symbol.

Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Suggested-by: Ulf Magnusson <ulfalizer@gmail.com>
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/expr.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index d45381986ac7..b89baed7f15c 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1179,6 +1179,16 @@ struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2)
 	return expr_get_leftmost_symbol(ret);
 }
 
+static void
+expr_print_newline(struct expr *e,
+		   void (*fn)(void *, struct symbol *, const char *),
+		   void *data,
+		   int prevtoken)
+{
+	fn(data, NULL, "\n  - ");
+	expr_print(e, fn, data, prevtoken);
+}
+
 static void __expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken, bool revdep)
 {
 	if (!e) {
@@ -1191,7 +1201,10 @@ static void __expr_print(struct expr *e, void (*fn)(void *, struct symbol *, con
 	switch (e->type) {
 	case E_SYMBOL:
 		if (e->left.sym->name)
-			fn(data, e->left.sym, e->left.sym->name);
+			if (!revdep)
+				fn(data, e->left.sym, e->left.sym->name);
+			else
+				expr_print_newline(e, fn, data, E_OR);
 		else
 			fn(data, NULL, "<choice>");
 		break;
@@ -1234,19 +1247,19 @@ static void __expr_print(struct expr *e, void (*fn)(void *, struct symbol *, con
 		fn(data, e->right.sym, e->right.sym->name);
 		break;
 	case E_OR:
-		if (revdep && e->left.expr->type != E_OR)
-			fn(data, NULL, "\n  - ");
 		__expr_print(e->left.expr, fn, data, E_OR, revdep);
-		if (revdep)
-			fn(data, NULL, "\n  - ");
-		else
+		if (!revdep)
 			fn(data, NULL, " || ");
 		__expr_print(e->right.expr, fn, data, E_OR, revdep);
 		break;
 	case E_AND:
-		expr_print(e->left.expr, fn, data, E_AND);
-		fn(data, NULL, " && ");
-		expr_print(e->right.expr, fn, data, E_AND);
+		if (!revdep) {
+			expr_print(e->left.expr, fn, data, E_AND);
+			fn(data, NULL, " && ");
+			expr_print(e->right.expr, fn, data, E_AND);
+		} else {
+			expr_print_newline(e, fn, data, E_OR);
+		}
 		break;
 	case E_LIST:
 		fn(data, e->right.sym, e->right.sym->name);
-- 
2.16.1

