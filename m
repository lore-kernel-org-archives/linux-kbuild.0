Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:33337 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752053AbbDLVQg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 Apr 2015 17:16:36 -0400
Received: by paboj16 with SMTP id oj16so81111106pab.0
        for <linux-kbuild@vger.kernel.org>; Sun, 12 Apr 2015 14:16:36 -0700 (PDT)
From: David VomLehn <dvomlehn@gmail.com>
Date: Sun, 12 Apr 2015 14:16:24 -0700
Subject: [PATCH] kconfig: Add support for floating point configuration
 variables
Message-ID: <20150412211624.GA19749@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr

Add support for floating point configuration variables using C syntax.
---
 kconfig-frontends/docs/kconfig-language.txt |    2 +-
 kconfig-frontends/frontends/conf/conf.c     |    3 +++
 kconfig-frontends/frontends/gconf/gconf.c   |    3 +++
 kconfig-frontends/frontends/mconf/mconf.c   |    4 ++++
 kconfig-frontends/frontends/nconf/nconf.c   |    3 +++
 kconfig-frontends/frontends/qconf/qconf.cc  |    3 +++
 kconfig-frontends/libs/parser/symbol.c      |   24 +++++++++++++++++++++---
 kconfig-frontends/utils/gettext.c           |    3 +++
 8 files changed, 41 insertions(+), 4 deletions(-)

Index: kconfig-frontends-float/kconfig-frontends/docs/kconfig-language.txt
===================================================================
--- kconfig-frontends-float.orig/kconfig-frontends/docs/kconfig-language.txt
+++ kconfig-frontends-float/kconfig-frontends/docs/kconfig-language.txt
@@ -48,7 +48,7 @@ Menu attributes
 A menu entry can have a number of attributes. Not all of them are
 applicable everywhere (see syntax).
 
-- type definition: "bool"/"tristate"/"string"/"hex"/"int"
+- type definition: "bool"/"tristate"/"string"/"hex"/"int"/"float"
   Every config option must have a type. There are only two basic types:
   tristate and string; the other types are based on these two. The type
   definition optionally accepts an input prompt, so these two examples
Index: kconfig-frontends-float/kconfig-frontends/frontends/conf/conf.c
===================================================================
--- kconfig-frontends-float.orig/kconfig-frontends/frontends/conf/conf.c
+++ kconfig-frontends-float/kconfig-frontends/frontends/conf/conf.c
@@ -16,6 +16,8 @@
 #include <errno.h>
 
 #include "lkc.h"
+#include <stdio.h>
+FILE *log_fp;
 
 static void conf(struct menu *menu);
 static void check_conf(struct menu *menu);
@@ -494,6 +496,7 @@ int main(int ac, char **av)
 	int opt;
 	const char *name, *defconfig_file = NULL /* gcc uninit */;
 	struct stat tmpstat;
+log_fp = fopen("/tmp/t", "w");
 
 	setlocale(LC_ALL, "");
 	bindtextdomain(PACKAGE, LOCALEDIR);
Index: kconfig-frontends-float/kconfig-frontends/frontends/gconf/gconf.c
===================================================================
--- kconfig-frontends-float.orig/kconfig-frontends/frontends/gconf/gconf.c
+++ kconfig-frontends-float/kconfig-frontends/frontends/gconf/gconf.c
@@ -23,6 +23,8 @@
 #include <string.h>
 #include <unistd.h>
 #include <time.h>
+#include <stdio.h>
+FILE *log_fp;
 
 //#define DEBUG
 
@@ -1472,6 +1474,7 @@ int main(int ac, char *av[])
 	char *env;
 #endif
 	gchar *glade_file = GUI_PATH;
+log_fp = fopen("/tmp/t", "w");
 
 	bindtextdomain(PACKAGE, LOCALEDIR);
 	bind_textdomain_codeset(PACKAGE, "UTF-8");
Index: kconfig-frontends-float/kconfig-frontends/frontends/mconf/mconf.c
===================================================================
--- kconfig-frontends-float.orig/kconfig-frontends/frontends/mconf/mconf.c
+++ kconfig-frontends-float/kconfig-frontends/frontends/mconf/mconf.c
@@ -21,6 +21,8 @@
 
 #include "lkc.h"
 #include "lxdialog/dialog.h"
+#include <stdio.h>
+FILE *log_fp;
 
 static const char mconf_readme[] = N_(
 "Overview\n"
@@ -1005,6 +1007,7 @@ int main(int ac, char **av)
 {
 	char *mode;
 	int res;
+log_fp = fopen("/tmp/t", "w");
 
 	setlocale(LC_ALL, "");
 	bindtextdomain(PACKAGE, LOCALEDIR);
@@ -1014,6 +1017,7 @@ int main(int ac, char **av)
 
 	conf_parse(av[1]);
 	conf_read(NULL);
+zconfdump(log_fp);
 
 	mode = getenv("MENUCONFIG_MODE");
 	if (mode) {
Index: kconfig-frontends-float/kconfig-frontends/frontends/nconf/nconf.c
===================================================================
--- kconfig-frontends-float.orig/kconfig-frontends/frontends/nconf/nconf.c
+++ kconfig-frontends-float/kconfig-frontends/frontends/nconf/nconf.c
@@ -12,6 +12,8 @@
 #include "lkc.h"
 #include "nconf.h"
 #include <ctype.h>
+#include <stdio.h>
+FILE *log_fp;
 
 static const char nconf_global_help[] = N_(
 "Help windows\n"
@@ -1477,6 +1479,7 @@ int main(int ac, char **av)
 {
 	int lines, columns;
 	char *mode;
+log_fp = fopen("/tmp/t", "w");
 
 	setlocale(LC_ALL, "");
 	bindtextdomain(PACKAGE, LOCALEDIR);
Index: kconfig-frontends-float/kconfig-frontends/frontends/qconf/qconf.cc
===================================================================
--- kconfig-frontends-float.orig/kconfig-frontends/frontends/qconf/qconf.cc
+++ kconfig-frontends-float/kconfig-frontends/frontends/qconf/qconf.cc
@@ -48,6 +48,8 @@
 
 #include "qconf.moc"
 #include "images.h"
+#include <stdio.h>
+FILE *log_fp;
 
 #ifdef _
 # undef _
@@ -1749,6 +1751,7 @@ int main(int ac, char** av)
 {
 	ConfigMainWindow* v;
 	const char *name;
+log_fp = fopen("/tmp/t", "w");
 
 	bindtextdomain(PACKAGE, LOCALEDIR);
 	textdomain(PACKAGE);
Index: kconfig-frontends-float/kconfig-frontends/libs/parser/symbol.c
===================================================================
--- kconfig-frontends-float.orig/kconfig-frontends/libs/parser/symbol.c
+++ kconfig-frontends-float/kconfig-frontends/libs/parser/symbol.c
@@ -10,6 +10,10 @@
 #include <sys/utsname.h>
 
 #include "lkc.h"
+extern FILE *log_fp;
+
+/* Maximum number of characters for a value in int/hex/float including NUL */
+#define MAX_VALUE_LEN	64
 
 struct symbol symbol_yes = {
 	.name = "y",
@@ -139,6 +143,7 @@ static struct property *sym_get_range_pr
 static long long sym_get_range_val(struct symbol *sym, int base)
 {
 	sym_calc_value(sym);
+fprintf(log_fp, "%s: type is %d S_INT %d\n", __func__, sym->type, S_INT);
 	switch (sym->type) {
 	case S_INT:
 		base = 10;
@@ -157,8 +162,9 @@ static void sym_validate_range(struct sy
 	struct property *prop;
 	int base;
 	long long val, val2;
-	char str[64];
+	char str[MAX_VALUE_LEN];
 
+fprintf(log_fp, "%s: type of %s %d name %s\n", __func__, (char *)sym->curr.val, sym->type, sym->name);
 	switch (sym->type) {
 	case S_INT:
 		base = 10;
@@ -173,6 +179,8 @@ static void sym_validate_range(struct sy
 	if (!prop)
 		return;
 	val = strtoll(sym->curr.val, NULL, base);
+
+fprintf(log_fp, "%s: prop is not NULL\n", __func__);
 	val2 = sym_get_range_val(prop->expr->left.sym, base);
 	if (val >= val2) {
 		val2 = sym_get_range_val(prop->expr->right.sym, base);
@@ -596,7 +604,9 @@ bool sym_string_within_range(struct symb
 {
 	struct property *prop;
 	long long val;
+	long long left, right;
 
+fprintf(log_fp, "%s: validating '%s' of type %d\n", __func__, str, sym->type);
 	switch (sym->type) {
 	case S_STRING:
 		return sym_string_valid(sym, str);
@@ -607,8 +617,16 @@ bool sym_string_within_range(struct symb
 		if (!prop)
 			return true;
 		val = strtoll(str, NULL, 10);
-		return val >= sym_get_range_val(prop->expr->left.sym, 10) &&
-		       val <= sym_get_range_val(prop->expr->right.sym, 10);
+fprintf(log_fp, "%s: value is %lld\n", __func__, val);
+		left = sym_get_range_val(prop->expr->left.sym, 10);
+fprintf(log_fp, "%s: left is %lld\n", __func__, left);
+		if (val < left)
+			return false;
+		right = sym_get_range_val(prop->expr->right.sym, 10);
+fprintf(log_fp, "%s: right is %lld\n", __func__, right);
+		if (val > right)
+			return false;
+		return true;
 	case S_HEX:
 		if (!sym_string_valid(sym, str))
 			return false;
Index: kconfig-frontends-float/kconfig-frontends/utils/gettext.c
===================================================================
--- kconfig-frontends-float.orig/kconfig-frontends/utils/gettext.c
+++ kconfig-frontends-float/kconfig-frontends/utils/gettext.c
@@ -8,6 +8,8 @@
 #include <string.h>
 
 #include "lkc.h"
+#include <stdio.h>
+FILE *log_fp;
 
 static char *escape(const char* text, char *bf, int len)
 {
@@ -227,6 +229,7 @@ static void menu__xgettext(void)
 
 int main(int ac, char **av)
 {
+log_fp = fopen("/tmp/t", "w");
 	conf_parse(av[1]);
 
 	menu_build_message_list(menu_get_root_menu(NULL));
