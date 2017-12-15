Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:49790 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932189AbdLOPj7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Dec 2017 10:39:59 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kconfig: drop 'boolean' keyword
Date: Sat, 16 Dec 2017 00:38:02 +0900
Message-Id: <1513352282-4437-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1513352282-4437-1-git-send-email-yamada.masahiro@socionext.com>
References: <1513352282-4437-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

No more users of this keyword.  Drop it according to the notice by
commit 6341e62b212a ("kconfig: use bool instead of boolean for type
definition attributes").

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/confdata.c | 2 +-
 scripts/kconfig/kconf_id.c | 1 -
 scripts/kconfig/mconf.c    | 2 +-
 scripts/kconfig/menu.c     | 4 ++--
 scripts/kconfig/symbol.c   | 2 +-
 scripts/kconfig/zconf.y    | 2 +-
 6 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 297b079..027f5b4 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -1123,7 +1123,7 @@ void set_all_choice_values(struct symbol *csym)
 bool conf_set_all_new_symbols(enum conf_def_mode mode)
 {
 	struct symbol *sym, *csym;
-	int i, cnt, pby, pty, ptm;	/* pby: probability of boolean  = y
+	int i, cnt, pby, pty, ptm;	/* pby: probability of bool     = y
 					 * pty: probability of tristate = y
 					 * ptm: probability of tristate = m
 					 */
diff --git a/scripts/kconfig/kconf_id.c b/scripts/kconfig/kconf_id.c
index 5abbc72..3ea9c5f 100644
--- a/scripts/kconfig/kconf_id.c
+++ b/scripts/kconfig/kconf_id.c
@@ -20,7 +20,6 @@ static struct kconf_id kconf_id_array[] = {
 	{ "tristate",		T_TYPE,			TF_COMMAND, S_TRISTATE },
 	{ "def_tristate",	T_DEFAULT,		TF_COMMAND, S_TRISTATE },
 	{ "bool",		T_TYPE,			TF_COMMAND, S_BOOLEAN },
-	{ "boolean",		T_TYPE,			TF_COMMAND, S_BOOLEAN },
 	{ "def_bool",		T_DEFAULT,		TF_COMMAND, S_BOOLEAN },
 	{ "int",		T_TYPE,			TF_COMMAND, S_INT },
 	{ "hex",		T_TYPE,			TF_COMMAND, S_HEX },
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 315ce2c..c829be8b 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -246,7 +246,7 @@ search_help[] = N_(
 	"  Selected by: BAR [=n]\n"
 	"-----------------------------------------------------------------\n"
 	"o The line 'Type:' shows the type of the configuration option for\n"
-	"  this symbol (boolean, tristate, string, ...)\n"
+	"  this symbol (bool, tristate, string, ...)\n"
 	"o The line 'Prompt:' shows the text used in the menu structure for\n"
 	"  this symbol\n"
 	"o The 'Defined at' line tells at what file / line number the symbol\n"
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 2baebe3..5878876 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -274,13 +274,13 @@ static void sym_check_prop(struct symbol *sym)
 			if (sym->type != S_BOOLEAN && sym->type != S_TRISTATE)
 				prop_warn(prop,
 				    "config symbol '%s' uses %s, but is "
-				    "not boolean or tristate", sym->name, use);
+				    "not bool or tristate", sym->name, use);
 			else if (sym2->type != S_UNKNOWN &&
 				 sym2->type != S_BOOLEAN &&
 				 sym2->type != S_TRISTATE)
 				prop_warn(prop,
 				    "'%s' has wrong type. '%s' only "
-				    "accept arguments of boolean and "
+				    "accept arguments of bool and "
 				    "tristate type", sym2->name, use);
 			break;
 		case P_RANGE:
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 35e0937..23142a5 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -77,7 +77,7 @@ const char *sym_type_name(enum symbol_type type)
 {
 	switch (type) {
 	case S_BOOLEAN:
-		return "boolean";
+		return "bool";
 	case S_TRISTATE:
 		return "tristate";
 	case S_INT:
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 4b2cf41..dd926e0 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -623,7 +623,7 @@ static void print_symbol(FILE *out, struct menu *menu)
 		fprintf(out, "\nconfig %s\n", sym->name);
 	switch (sym->type) {
 	case S_BOOLEAN:
-		fputs("  boolean\n", out);
+		fputs("  bool\n", out);
 		break;
 	case S_TRISTATE:
 		fputs("  tristate\n", out);
-- 
2.7.4

