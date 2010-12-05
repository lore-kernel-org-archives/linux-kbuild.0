Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:64339 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752263Ab0LEGmJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Dec 2010 01:42:09 -0500
Received: by yxt3 with SMTP id 3so4973107yxt.19
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 22:42:08 -0800 (PST)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 3/5] kconfig: fix typos
Date: Sun,  5 Dec 2010 01:41:16 -0500
Message-Id: <1291531278-7395-3-git-send-email-lacombar@gmail.com>
In-Reply-To: <1291531278-7395-1-git-send-email-lacombar@gmail.com>
References: <1291531278-7395-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/confdata.c |    6 +++---
 scripts/kconfig/symbol.c   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 6f2f3a4..b2d9486 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -992,7 +992,7 @@ static void randomize_choice_values(struct symbol *csym)
 	int cnt, def;
 
 	/*
-	 * If choice is mod then we may have more items slected
+	 * If choice is mod then we may have more items selected
 	 * and if no then no-one.
 	 * In both cases stop.
 	 */
@@ -1088,10 +1088,10 @@ void conf_set_all_new_symbols(enum conf_def_mode mode)
 
 	/*
 	 * We have different type of choice blocks.
-	 * If curr.tri equal to mod then we can select several
+	 * If curr.tri equals to mod then we can select several
 	 * choice symbols in one block.
 	 * In this case we do nothing.
-	 * If curr.tri equal yes then only one symbol can be
+	 * If curr.tri equals yes then only one symbol can be
 	 * selected in a choice block and we set it to yes,
 	 * and the rest to no.
 	 */
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index e42240d..3acce4d 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -688,7 +688,7 @@ const char *sym_get_string_default(struct symbol *sym)
 		switch (sym->type) {
 		case S_BOOLEAN:
 		case S_TRISTATE:
-			/* The visibility imay limit the value from yes => mod */
+			/* The visibility may limit the value from yes => mod */
 			val = EXPR_AND(expr_calc_value(prop->expr), prop->visible.tri);
 			break;
 		default:
-- 
1.7.2.30.gc37d7.dirty

