Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:33083 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755753AbcANSNv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 14 Jan 2016 13:13:51 -0500
Date: Thu, 14 Jan 2016 18:13:49 +0000
From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: [PATCH] unbreak allmodconfig KCONFIG_ALLCONFIG=...
Message-ID: <20160114181349.GZ17997@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>

	Prior to 3.13 make allmodconfig KCONFIG_ALLCONFIG=/dev/null used
to be equivalent to make allmodconfig; these days it hardwires MODULES to n.
In fact, any KCONFIG_ALLCONFIG that doesn't set MODULES explicitly is
treated as if it set it to n.

	Regression had been introduced by commit cfa98f ("kconfig: do not
override symbols already set"); what happens is that conf_read_simple()
does sym_calc_value(modules_sym) on exit, which leaves SYMBOL_VALID set and
has conf_set_all_new_symbols() skip modules_sym.

	It's pretty easy to fix - simply move that call of sym_calc_value()
into the callers, except for the ones in KCONFIG_ALLCONFIG handling.
Objections?

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 0b7dc2f..dd243d2 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -267,10 +267,8 @@ int conf_read_simple(const char *name, int def)
 		if (in)
 			goto load;
 		sym_add_change_count(1);
-		if (!sym_defconfig_list) {
-			sym_calc_value(modules_sym);
+		if (!sym_defconfig_list)
 			return 1;
-		}
 
 		for_all_defaults(sym_defconfig_list, prop) {
 			if (expr_calc_value(prop->visible.expr) == no ||
@@ -403,7 +401,6 @@ setsym:
 	}
 	free(line);
 	fclose(in);
-	sym_calc_value(modules_sym);
 	return 0;
 }
 
@@ -414,8 +411,12 @@ int conf_read(const char *name)
 
 	sym_set_change_count(0);
 
-	if (conf_read_simple(name, S_DEF_USER))
+	if (conf_read_simple(name, S_DEF_USER)) {
+		sym_calc_value(modules_sym);
 		return 1;
+	}
+
+	sym_calc_value(modules_sym);
 
 	for_all_symbols(i, sym) {
 		sym_calc_value(sym);
@@ -846,6 +847,7 @@ static int conf_split_config(void)
 
 	name = conf_get_autoconfig_name();
 	conf_read_simple(name, S_DEF_AUTO);
+	sym_calc_value(modules_sym);
 
 	if (chdir("include/config"))
 		return 1;
