Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f180.google.com ([209.85.161.180]:58930 "EHLO
	mail-gx0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481Ab0LEGgC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Dec 2010 01:36:02 -0500
Received: by gxk19 with SMTP id 19so5952339gxk.11
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Dec 2010 22:36:01 -0800 (PST)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 2/5] kconfig: add more S_INT and S_HEX consistency checks
Date: Sun,  5 Dec 2010 01:29:25 -0500
Message-Id: <1291530566-23531-2-git-send-email-lacombar@gmail.com>
In-Reply-To: <1291530566-23531-1-git-send-email-lacombar@gmail.com>
References: <1291530566-23531-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>

This patch add more number consistency checkg, trying to catch the following
situation:

config FOO0
	hex
	default 42

config FOO1
	string

config BAR0
	int
	default FOO1

config BAR1
	hex
	default FOO1

config FOO2
	hex
	default 42h

config FOO3
	int
	default "1bar"

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/menu.c |   15 ++++++++++++---
 1 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 7e83aef..8a8bc9b 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -183,7 +183,7 @@ void menu_add_option(int token, char *arg)
 	}
 }
 
-static int menu_range_valid_sym(struct symbol *sym, struct symbol *sym2)
+static int menu_validate_number(struct symbol *sym, struct symbol *sym2)
 {
 	return sym2->type == S_INT || sym2->type == S_HEX ||
 	       (sym2->type == S_UNKNOWN && sym_string_valid(sym, sym2->name));
@@ -201,6 +201,15 @@ static void sym_check_prop(struct symbol *sym)
 				prop_warn(prop,
 				    "default for config symbol '%s'"
 				    " must be a single symbol", sym->name);
+			if (prop->expr->type != E_SYMBOL)
+				break;
+			sym2 = prop_get_symbol(prop);
+			if (sym->type == S_HEX || sym->type == S_INT) {
+				if (!menu_validate_number(sym, sym2))
+					prop_warn(prop,
+					    "'%s': number is invalid",
+					    sym->name);
+			}
 			break;
 		case P_SELECT:
 			sym2 = prop_get_symbol(prop);
@@ -220,8 +229,8 @@ static void sym_check_prop(struct symbol *sym)
 			if (sym->type != S_INT && sym->type != S_HEX)
 				prop_warn(prop, "range is only allowed "
 				                "for int or hex symbols");
-			if (!menu_range_valid_sym(sym, prop->expr->left.sym) ||
-			    !menu_range_valid_sym(sym, prop->expr->right.sym))
+			if (!menu_validate_number(sym, prop->expr->left.sym) ||
+			    !menu_validate_number(sym, prop->expr->right.sym))
 				prop_warn(prop, "range is invalid");
 			break;
 		default:
-- 
1.7.2.30.gc37d7.dirty

