Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:35815 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750899Ab1GBFKt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 2 Jul 2011 01:10:49 -0400
Received: by mail-iw0-f174.google.com with SMTP id 6so3288158iwn.19
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Jul 2011 22:10:49 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 1/5] kconfig: use calloc() for expr allocation
Date: Sat,  2 Jul 2011 01:10:36 -0400
Message-Id: <1309583440-4795-2-git-send-email-lacombar@gmail.com>
In-Reply-To: <1309583440-4795-1-git-send-email-lacombar@gmail.com>
References: <1307386711-8866-1-git-send-email-lacombar@gmail.com>
 <1309583440-4795-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>
Cc: Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/expr.c |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 792c62e..290ce41 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -13,8 +13,7 @@
 
 struct expr *expr_alloc_symbol(struct symbol *sym)
 {
-	struct expr *e = malloc(sizeof(*e));
-	memset(e, 0, sizeof(*e));
+	struct expr *e = calloc(1, sizeof(*e));
 	e->type = E_SYMBOL;
 	e->left.sym = sym;
 	return e;
@@ -22,8 +21,7 @@ struct expr *expr_alloc_symbol(struct symbol *sym)
 
 struct expr *expr_alloc_one(enum expr_type type, struct expr *ce)
 {
-	struct expr *e = malloc(sizeof(*e));
-	memset(e, 0, sizeof(*e));
+	struct expr *e = calloc(1, sizeof(*e));
 	e->type = type;
 	e->left.expr = ce;
 	return e;
@@ -31,8 +29,7 @@ struct expr *expr_alloc_one(enum expr_type type, struct expr *ce)
 
 struct expr *expr_alloc_two(enum expr_type type, struct expr *e1, struct expr *e2)
 {
-	struct expr *e = malloc(sizeof(*e));
-	memset(e, 0, sizeof(*e));
+	struct expr *e = calloc(1, sizeof(*e));
 	e->type = type;
 	e->left.expr = e1;
 	e->right.expr = e2;
@@ -41,8 +38,7 @@ struct expr *expr_alloc_two(enum expr_type type, struct expr *e1, struct expr *e
 
 struct expr *expr_alloc_comp(enum expr_type type, struct symbol *s1, struct symbol *s2)
 {
-	struct expr *e = malloc(sizeof(*e));
-	memset(e, 0, sizeof(*e));
+	struct expr *e = calloc(1, sizeof(*e));
 	e->type = type;
 	e->left.sym = s1;
 	e->right.sym = s2;
-- 
1.7.3.4.574.g608b.dirty

