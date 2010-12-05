Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f180.google.com ([209.85.161.180]:38377 "EHLO
	mail-gx0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751186Ab0LEGjV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Dec 2010 01:39:21 -0500
Received: by gxk19 with SMTP id 19so5953082gxk.11
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 22:39:20 -0800 (PST)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] kconfig: nuke second argument of conf_write_symbol()
Date: Sun,  5 Dec 2010 01:33:16 -0500
Message-Id: <1291530796-16379-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>

Replacing S_TRISTATE by S_BOOLEAN is a no-op for conf_write_symbol().

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/confdata.c |   17 +++++------------
 1 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index f349bdc..6fd43d7 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -440,12 +440,11 @@ static void conf_write_string(bool headerfile, const char *name,
 	fputs("\"\n", out);
 }
 
-static void conf_write_symbol(struct symbol *sym, enum symbol_type type,
-                              FILE *out, bool write_no)
+static void conf_write_symbol(struct symbol *sym, FILE *out, bool write_no)
 {
 	const char *str;
 
-	switch (type) {
+	switch (sym->type) {
 	case S_BOOLEAN:
 	case S_TRISTATE:
 		switch (sym_get_tristate_value(sym)) {
@@ -532,7 +531,7 @@ int conf_write_defconfig(const char *filename)
 						goto next_menu;
 				}
 			}
-			conf_write_symbol(sym, sym->type, out, true);
+			conf_write_symbol(sym, out, true);
 		}
 next_menu:
 		if (menu->list != NULL) {
@@ -633,14 +632,8 @@ int conf_write(const char *name)
 			if (!(sym->flags & SYMBOL_WRITE))
 				goto next;
 			sym->flags &= ~SYMBOL_WRITE;
-			type = sym->type;
-			if (type == S_TRISTATE) {
-				sym_calc_value(modules_sym);
-				if (modules_sym->curr.tri == no)
-					type = S_BOOLEAN;
-			}
 			/* Write config symbol to file */
-			conf_write_symbol(sym, type, out, true);
+			conf_write_symbol(sym, out, true);
 		}
 
 next:
@@ -842,7 +835,7 @@ int conf_write_autoconf(void)
 			continue;
 
 		/* write symbol to config file */
-		conf_write_symbol(sym, sym->type, out, false);
+		conf_write_symbol(sym, out, false);
 
 		/* update autoconf and tristate files */
 		switch (sym->type) {
-- 
1.7.2.30.gc37d7.dirty

