Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:59724 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752176Ab1HPFUc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Aug 2011 01:20:32 -0400
Received: by yxj19 with SMTP id 19so3556331yxj.19
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Aug 2011 22:20:32 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH] kconfig: fix __enabled_ macros definition for invisible and un-selected symbols
Date: Tue, 16 Aug 2011 01:20:20 -0400
Message-Id: <1313472020-14018-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: rabin@rab.in, Arnaud Lacombe <lacombar@gmail.com>

__enabled_<sym-name> are only generated on visible or selected entries, do not
reflect the purpose of its introduction.

Fix this by always generating these entries for named symbol.

Reported-by: Rabin Vincent <rabin@rab.in>
Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/confdata.c |   49 ++++++++++++++++++++++++++++++++-----------
 1 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 59b667c..5a58965 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -503,17 +503,6 @@ header_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
 			fprintf(fp, "#define %s%s%s 1\n",
 			    CONFIG_, sym->name, suffix);
 		}
-		/*
-		 * Generate the __enabled_CONFIG_* and
-		 * __enabled_CONFIG_*_MODULE macros for use by the
-		 * IS_{ENABLED,BUILTIN,MODULE} macros. The _MODULE variant is
-		 * generated even for booleans so that the IS_ENABLED() macro
-		 * works.
-		 */
-		fprintf(fp, "#define __enabled_" CONFIG_ "%s %d\n",
-				sym->name, (*value == 'y'));
-		fprintf(fp, "#define __enabled_" CONFIG_ "%s_MODULE %d\n",
-				sym->name, (*value == 'm'));
 		break;
 	}
 	case S_HEX: {
@@ -565,6 +554,35 @@ static struct conf_printer header_printer_cb =
 };
 
 /*
+ * Generate the __enabled_CONFIG_* and __enabled_CONFIG_*_MODULE macros for
+ * use by the IS_{ENABLED,BUILTIN,MODULE} macros. The _MODULE variant is
+ * generated even for booleans so that the IS_ENABLED() macro works.
+ */
+static void
+header_print__enabled_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
+{
+
+	switch (sym->type) {
+	case S_BOOLEAN:
+	case S_TRISTATE: {
+		fprintf(fp, "#define __enabled_" CONFIG_ "%s %d\n",
+		    sym->name, (*value == 'y'));
+		fprintf(fp, "#define __enabled_" CONFIG_ "%s_MODULE %d\n",
+		    sym->name, (*value == 'm'));
+		break;
+	}
+	default:
+		break;
+	}
+}
+
+static struct conf_printer header__enabled_printer_cb =
+{
+	.print_symbol = header_print__enabled_symbol,
+	.print_comment = header_print_comment,
+};
+
+/*
  * Tristate printer
  *
  * This printer is used when generating the `include/config/tristate.conf' file.
@@ -945,11 +963,16 @@ int conf_write_autoconf(void)
 	conf_write_heading(out_h, &header_printer_cb, NULL);
 
 	for_all_symbols(i, sym) {
+		if (!sym->name)
+			continue;
+
 		sym_calc_value(sym);
-		if (!(sym->flags & SYMBOL_WRITE) || !sym->name)
+
+		conf_write_symbol(out_h, sym, &header__enabled_printer_cb, NULL);
+
+		if (!(sym->flags & SYMBOL_WRITE))
 			continue;
 
-		/* write symbol to auto.conf, tristate and header files */
 		conf_write_symbol(out, sym, &kconfig_printer_cb, (void *)1);
 
 		conf_write_symbol(tristate, sym, &tristate_printer_cb, (void *)1);
-- 
1.7.6.153.g78432

