Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:51414 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752561AbbELKbg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 May 2015 06:31:36 -0400
Date: Tue, 12 May 2015 13:31:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [RFC] kconfig: a new command line tool to set configs
Message-ID: <20150512103128.GA25706@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

This is an ugly hack job I made last night and it barely works.  It
does two things:

1)  Sometimes I want to search for a config so I have to load
    menuconfig, then search for the config entry, then exit.  With
    this script I simply run:

	./scripts/kconfig/kconfig search COMEDI

2)  I quite often try to enable something by doing:

	echo CONFIG_FOO=y >> .config
	make oldconfig
	grep CONFIG_FOO .config

    The grep is to see if the setting worked.  Now I can do:

	./scripts/kconfig/kconfig set CONFIG_FOO=y

Parsing dependencies barely works, but that's just a matter of writing
some more code in expr_parse().

The main questions I have at this point are:

1)  If I have a symbol pointer, is it possible to get a help text from
    that?

2)  For some reason, when I do sym_set_tristate_value() it doesn't
    actually set anything until I write the config file so I have to do:

		if (sym_set_tristate_value(sym, newval)) {
			/* FIXME: if I don't write it doesn't save */
			conf_write(NULL);
			return 1;
		}

    It makes the output really messy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index d9b1fef..ae338a5 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -33,6 +33,9 @@ config: $(obj)/conf
 nconfig: $(obj)/nconf
 	$< $(silent) $(Kconfig)
 
+lconfig: $(obj)/lconf
+	$< $(silent) $(Kconfig)
+
 silentoldconfig: $(obj)/conf
 	$(Q)mkdir -p include/config include/generated
 	$< $(silent) --$@ $(Kconfig)
@@ -169,12 +172,13 @@ lxdialog += lxdialog/textbox.o lxdialog/yesno.o lxdialog/menubox.o
 conf-objs	:= conf.o  zconf.tab.o
 mconf-objs     := mconf.o zconf.tab.o $(lxdialog)
 nconf-objs     := nconf.o zconf.tab.o nconf.gui.o
+lconf-objs     := lconf.o zconf.tab.o
 kxgettext-objs	:= kxgettext.o zconf.tab.o
 qconf-cxxobjs	:= qconf.o
 qconf-objs	:= zconf.tab.o
 gconf-objs	:= gconf.o zconf.tab.o
 
-hostprogs-y := conf nconf mconf kxgettext qconf gconf
+hostprogs-y := conf nconf mconf kxgettext qconf gconf lconf
 
 clean-files	:= qconf.moc .tmp_qtcheck .tmp_gtkcheck
 clean-files	+= zconf.tab.c zconf.lex.c zconf.hash.c gconf.glade.h
diff --git a/scripts/kconfig/kconfig b/scripts/kconfig/kconfig
new file mode 100755
index 0000000..beab8fc
--- /dev/null
+++ b/scripts/kconfig/kconfig
@@ -0,0 +1,33 @@
+#!/bin/sh
+
+usage() {
+	echo "kconfig [search|set] string"
+	exit 1;
+}
+
+if [ "$1" = "" ] ; then
+	usage
+fi
+
+if [ "$1" = "search" ] ; then
+
+	search=$2
+	NCONFIG_MODE=kconfig_search SEARCH=${search} make lconfig
+
+elif [ "$1" = "set" ] ; then
+
+	config=$2
+	setting=$3
+
+	if [ $config = "" ] ; then
+		echo "nothing to set"
+		exit 1
+	fi
+
+	NCONFIG_MODE=kconfig_set CONFIG=${config} SETTING=${setting} make lconfig
+
+else
+	usage
+fi
+
+
diff --git a/scripts/kconfig/lconf.c b/scripts/kconfig/lconf.c
new file mode 100644
index 0000000..aa8551e
--- /dev/null
+++ b/scripts/kconfig/lconf.c
@@ -0,0 +1,314 @@
+/*
+ * Copyright (C) 2015 Oracle
+ * Released under the terms of the GNU GPL v2.0.
+ *
+ */
+#define _GNU_SOURCE
+#include <string.h>
+#include <stdlib.h>
+
+#include "lkc.h"
+#include "nconf.h"
+#include <ctype.h>
+
+static int indent;
+static char line[128];
+
+static int get_depends(struct symbol *sym);
+
+static void strip(char *str)
+{
+	char *p = str;
+	int l;
+
+	while ((isspace(*p)))
+		p++;
+	l = strlen(p);
+	if (p != str)
+		memmove(str, p, l + 1);
+	if (!l)
+		return;
+	p = str + l - 1;
+	while ((isspace(*p)))
+		*p-- = 0;
+}
+
+static void xfgets(char *str, int size, FILE *in)
+{
+	if (fgets(str, size, in) == NULL)
+		fprintf(stderr, "\nError in reading or end of file.\n");
+}
+
+static int conf_askvalue(struct symbol *sym, const char *def)
+{
+	enum symbol_type type = sym_get_type(sym);
+
+	if (!sym_has_value(sym))
+		printf(_("(NEW) "));
+
+	line[0] = '\n';
+	line[1] = 0;
+
+	if (!sym_is_changable(sym)) {
+		printf("%s\n", def);
+		line[0] = '\n';
+		line[1] = 0;
+		return 0;
+	}
+
+	fflush(stdout);
+	xfgets(line, 128, stdin);
+
+	switch (type) {
+	case S_INT:
+	case S_HEX:
+	case S_STRING:
+		printf("%s\n", def);
+		return 1;
+	default:
+		;
+	}
+	printf("%s", line);
+	return 1;
+}
+
+static struct property *get_symbol_prop(struct symbol *sym)
+{
+	struct property *prop = NULL;
+
+	for_all_properties(sym, prop, P_SYMBOL)
+		break;
+	return prop;
+}
+
+static int conf_sym(struct symbol *sym)
+{
+	tristate oldval, newval;
+	struct property *prop;
+
+	while (1) {
+		if (sym->name)
+			printf("%s: ", sym->name);
+		for_all_prompts(sym, prop)
+			printf("%*s%s ", indent - 1, "",  _(prop->text));
+		putchar('[');
+		oldval = sym_get_tristate_value(sym);
+		switch (oldval) {
+		case no:
+			putchar('N');
+			break;
+		case mod:
+			putchar('M');
+			break;
+		case yes:
+			putchar('Y');
+			break;
+		}
+		if (oldval != no && sym_tristate_within_range(sym, no))
+			printf("/n");
+		if (oldval != mod && sym_tristate_within_range(sym, mod))
+			printf("/m");
+		if (oldval != yes && sym_tristate_within_range(sym, yes))
+			printf("/y");
+		/* FIXME: I don't know how to get the help text from the sym */
+		printf("] ");
+		if (!conf_askvalue(sym, sym_get_string_value(sym)))
+			return 0;
+		strip(line);
+
+		switch (line[0]) {
+		case 'n':
+		case 'N':
+			newval = no;
+			if (!line[1] || !strcmp(&line[1], "o"))
+				break;
+			continue;
+		case 'm':
+		case 'M':
+			newval = mod;
+			if (!line[1])
+				break;
+			continue;
+		case 'y':
+		case 'Y':
+			newval = yes;
+			if (!line[1] || !strcmp(&line[1], "es"))
+				break;
+			continue;
+		case 0:
+			newval = oldval;
+			break;
+		default:
+			continue;
+		}
+		if (sym_set_tristate_value(sym, newval)) {
+			/* FIXME: if I don't write it doesn't save */
+			conf_write(NULL);
+			return 1;
+		}
+	}
+}
+
+static int enable_sym(struct symbol *sym)
+{
+	if (sym_get_tristate_value(sym) != no)
+		return 0;
+
+	if (!sym->visible) {
+		printf("%s: has missing dependencies\n", sym->name);
+		if (!get_depends(sym))
+			return 0;
+	}
+
+	return conf_sym(sym);
+}
+
+static void expr_parse(struct expr *e)
+{
+	if (!e)
+		return;
+
+	switch (e->type) {
+	case E_EQUAL:
+		printf("set '%s' to '%s'\n", e->left.sym->name, e->right.sym->name);
+		break;
+
+	case E_AND:
+		expr_parse(e->left.expr);
+		expr_parse(e->right.expr);
+		break;
+
+	case E_SYMBOL:
+		enable_sym(e->left.sym);
+		break;
+
+	case E_NOT:
+	case E_UNEQUAL:
+	case E_OR:
+	case E_LIST:
+	case E_RANGE:
+	default:
+		printf("HELP.  Lot of unimplemented code\n");
+		break;
+	}
+}
+
+static int get_depends(struct symbol *sym)
+{
+	struct property *prop;
+	struct gstr res = str_new();
+
+	prop = get_symbol_prop(sym);
+	if (!prop)
+		return 0;
+
+	expr_gstr_print(prop->visible.expr, &res);
+	printf("%s\n\n", str_get(&res));
+
+	expr_parse(prop->visible.expr);
+
+	return 1;
+}
+
+static void kconfig_search(void)
+{
+	char *search_str;
+	struct symbol **sym_arr;
+	struct gstr res;
+
+	search_str = getenv("SEARCH");
+	if (!search_str)
+		return;
+
+	sym_arr = sym_re_search(search_str);
+	res = get_relations_str(sym_arr, NULL);
+	printf("%s", str_get(&res));
+}
+
+static void kconfig_set(void)
+{
+	struct symbol *sym;
+	char *config;
+	char *setting;
+	int res;
+
+	config = getenv("CONFIG");
+	if (!config)
+		return;
+	if (strncmp(config, "CONFIG_", 7) == 0)
+		config += 7;
+
+	setting = strchr(config, '=');
+	if (setting) {
+		*setting = '\0';
+		setting++;
+	} else {
+		setting = getenv("SETTING");
+		if (setting && *setting == '\0')
+			setting = NULL;
+	}
+
+	sym = sym_find(config);
+	if (!sym) {
+		printf("Error: '%s' not found.\n", config);
+		return;
+	}
+
+	if (!sym->visible) {
+		printf("\n%s: has missing dependencies\n", sym->name);
+		if (!get_depends(sym))
+			return;
+	}
+	if (!sym->visible) {
+		printf("Error: unmet dependencies\n");
+		return;
+	}
+
+	if (!setting) {
+		conf_sym(sym);
+	} else if (!sym_set_string_value(sym, setting)) {
+		printf("Error: setting '%s=%s' failed.\n", sym->name, setting);
+		return;
+	}
+
+	res = conf_write(NULL);
+	if (res) {
+		printf("Error during writing of configuration.\n"
+			"Your configuration changes were NOT saved.\n");
+		return;
+	}
+
+	printf("set: %s=%s\n", config, sym_get_string_value(sym));
+}
+
+int main(int ac, char **av)
+{
+	char *mode;
+
+	setlocale(LC_ALL, "");
+	bindtextdomain(PACKAGE, LOCALEDIR);
+	textdomain(PACKAGE);
+
+	if (ac > 1 && strcmp(av[1], "-s") == 0) {
+		/* Silence conf_read() until the real callback is set up */
+		conf_set_message_callback(NULL);
+		av++;
+	}
+	conf_parse(av[1]);
+	conf_read(NULL);
+
+	mode = getenv("NCONFIG_MODE");
+	if (!mode)
+		return 1;
+
+	if (strcmp(mode, "kconfig_search") == 0) {
+		kconfig_search();
+		return 0;
+	}
+	if (strcmp(mode, "kconfig_set") == 0) {
+		kconfig_set();
+		return 0;
+	}
+
+	return 1;
+}
