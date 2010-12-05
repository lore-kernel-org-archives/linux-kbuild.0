Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:48417 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481Ab0LEGgL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Dec 2010 01:36:11 -0500
Received: by yxt3 with SMTP id 3so4972274yxt.19
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 22:36:11 -0800 (PST)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 2/2] [RFC] kconfig/listnewconfig: show default value of new symbel
Date: Sun,  5 Dec 2010 01:35:19 -0500
Message-Id: <1291530919-5601-2-git-send-email-lacombar@gmail.com>
In-Reply-To: <1291530919-5601-1-git-send-email-lacombar@gmail.com>
References: <1291530919-5601-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>, Ben Hutchings <ben@decadent.org.uk>

note: I would not mind adding the KCONFIG_VERBOSE logic.

Original idea and implementation by Bastian Blank <waldi@debian.org>,
Maximilian Attems <max@stro.at> and Ben Hutchings <ben@decadent.org.uk>

CC: Ben Hutchings <ben@decadent.org.uk>
Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/conf.c     |   14 +++++++++++++-
 scripts/kconfig/confdata.c |    4 ++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 5459a38..1b58129 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -411,6 +411,17 @@ conf_childs:
 		indent -= 2;
 }
 
+
+static void
+listnewconfig_print_symbol(FILE *fp, struct symbol *sym, const char *val, void *arg)
+{
+	fprintf(fp, "%s%s (default: %s)\n", CONFIG_, sym->name, val);
+}
+
+static struct conf_printer listnewconfig_printers = {
+	.print_symbol = listnewconfig_print_symbol,
+};
+
 static void check_conf(struct menu *menu)
 {
 	struct symbol *sym;
@@ -425,7 +436,8 @@ static void check_conf(struct menu *menu)
 		    (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes)) {
 			if (input_mode == listnewconfig) {
 				if (sym->name && !sym_is_choice_value(sym)) {
-					printf("%s%s\n", CONFIG_, sym->name);
+					conf_write_symbol(stdout, sym,
+					    &listnewconfig_printers, NULL);
 				}
 			} else if (input_mode != oldnoconfig) {
 				if (!conf_cnt++)
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 31d06da..6f2f3a4 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -548,8 +548,8 @@ static struct conf_printer tristate_printer_cb =
  *
  */
 
-static void conf_write_symbol(FILE *fp, struct symbol *sym,
-			      struct conf_printer *printer, void *printer_arg)
+void conf_write_symbol(FILE *fp, struct symbol *sym,
+		       struct conf_printer *printer, void *printer_arg)
 {
 	const char *str;
 
-- 
1.7.2.30.gc37d7.dirty

