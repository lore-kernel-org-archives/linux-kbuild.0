Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:36355 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751726AbYF2Lue (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 29 Jun 2008 07:50:34 -0400
Date: Sun, 29 Jun 2008 13:51:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: kconfig - hex are considered decimal
Message-ID: <20080629115120.GA4654@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Roman.

I was applying an old patch from you that introduces
conf_set_all_new_symbols().

But when I tested it I noticed that all symbols
of type "hex" were saved as decimal vlaues in .config.

Sample (first line is with unmodifed kconfig):

-CONFIG_RADIO_ZOLTRIX_PORT=0x20c
+CONFIG_RADIO_ZOLTRIX_PORT=20c

I guess this has something to do with the way we
represent a hex value internally. But I have not yet
dived into it.

Can you see where it goes wrong?

I have attached two patches.
The first is the one from you and the second is the
one where I started to use the new function.

	Sam

From 23a6db63846ef5658fd2e036064f03b98ea0ecec Mon Sep 17 00:00:00 2001
From: Roman Zippel <zippel@linux-m68k.org>
Date: Tue, 6 May 2008 04:55:55 +0200
Subject: [PATCH] kconfig: set all new symbols automatically

Add conf_set_all_new_symbols() which set all symbols (which don't have a
value yet) to a specifed value.

Signed-off-by: Roman Zippel <zippel@linux-m68k.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/kconfig/confdata.c |   70 ++++++++++++++++++++++++++++++++++++++++++++
 scripts/kconfig/lkc.h      |    9 +++++
 2 files changed, 79 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index ee5fe94..0759761 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -812,3 +812,73 @@ void conf_set_changed_callback(void (*fn)(void))
 {
 	conf_changed_callback = fn;
 }
+
+
+void conf_set_all_new_symbols(enum conf_def_mode mode)
+{
+	struct symbol *sym, *csym;
+	struct property *prop;
+	struct expr *e;
+	int i, cnt, def;
+
+	for_all_symbols(i, sym) {
+		if (sym_has_value(sym))
+			continue;
+		switch (sym_get_type(sym)) {
+		case S_BOOLEAN:
+		case S_TRISTATE:
+			switch (mode) {
+			case def_yes:
+				sym->def[S_DEF_USER].tri = yes;
+				break;
+			case def_mod:
+				sym->def[S_DEF_USER].tri = mod;
+				break;
+			case def_no:
+				sym->def[S_DEF_USER].tri = no;
+				break;
+			case def_random:
+				sym->def[S_DEF_USER].tri = (tristate)(rand() % 3);
+				break;
+			default:
+				continue;
+			}
+			if (!sym_is_choice(sym) || mode != def_random)
+				sym->flags |= SYMBOL_DEF_USER;
+			break;
+		default:
+			break;
+		}
+
+	}
+
+	if (modules_sym)
+		sym_calc_value(modules_sym);
+
+	if (mode != def_random)
+		return;
+
+	for_all_symbols(i, csym) {
+		if (sym_has_value(csym) || !sym_is_choice(csym))
+			continue;
+
+		sym_calc_value(csym);
+		prop = sym_get_choice_prop(csym);
+		def = -1;
+		while (1) {
+			cnt = 0;
+			expr_list_for_each_sym(prop->expr, e, sym) {
+				if (sym->visible == no)
+					continue;
+				if (def == cnt++) {
+					csym->def[S_DEF_USER].val = sym;
+					break;
+				}
+			}
+			if (def >= 0 || cnt < 2)
+				break;
+			def = (rand() % cnt) + 1;
+		}
+		csym->flags |= SYMBOL_DEF_USER;
+	}
+}
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 96521cb..4a9af6f 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -42,6 +42,14 @@ extern "C" {
 #define TF_PARAM	0x0002
 #define TF_OPTION	0x0004
 
+enum conf_def_mode {
+	def_default,
+	def_yes,
+	def_mod,
+	def_no,
+	def_random
+};
+
 #define T_OPT_MODULES		1
 #define T_OPT_DEFCONFIG_LIST	2
 #define T_OPT_ENV		3
@@ -69,6 +77,7 @@ const char *conf_get_configname(void);
 char *conf_get_default_confname(void);
 void sym_set_change_count(int count);
 void sym_add_change_count(int count);
+void conf_set_all_new_symbols(enum conf_def_mode mode);
 
 /* kconfig_load.c */
 void kconfig_load(void);
-- 
1.5.4.1.143.ge7e51


diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index fda6313..bd2a27e 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -76,7 +76,6 @@ static void check_stdin(void)
 static int conf_askvalue(struct symbol *sym, const char *def)
 {
 	enum symbol_type type = sym_get_type(sym);
-	tristate val;
 
 	if (!sym_has_value(sym))
 		printf(_("(NEW) "));
@@ -92,15 +91,6 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 	}
 
 	switch (input_mode) {
-	case set_no:
-	case set_mod:
-	case set_yes:
-	case set_random:
-		if (sym_has_value(sym)) {
-			printf("%s\n", def);
-			return 0;
-		}
-		break;
 	case ask_new:
 	case ask_silent:
 		if (sym_has_value(sym)) {
@@ -128,52 +118,6 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 	default:
 		;
 	}
-	switch (input_mode) {
-	case set_yes:
-		if (sym_tristate_within_range(sym, yes)) {
-			line[0] = 'y';
-			line[1] = '\n';
-			line[2] = 0;
-			break;
-		}
-	case set_mod:
-		if (type == S_TRISTATE) {
-			if (sym_tristate_within_range(sym, mod)) {
-				line[0] = 'm';
-				line[1] = '\n';
-				line[2] = 0;
-				break;
-			}
-		} else {
-			if (sym_tristate_within_range(sym, yes)) {
-				line[0] = 'y';
-				line[1] = '\n';
-				line[2] = 0;
-				break;
-			}
-		}
-	case set_no:
-		if (sym_tristate_within_range(sym, no)) {
-			line[0] = 'n';
-			line[1] = '\n';
-			line[2] = 0;
-			break;
-		}
-	case set_random:
-		do {
-			val = (tristate)(rand() % 3);
-		} while (!sym_tristate_within_range(sym, val));
-		switch (val) {
-		case no: line[0] = 'n'; break;
-		case mod: line[0] = 'm'; break;
-		case yes: line[0] = 'y'; break;
-		}
-		line[1] = '\n';
-		line[2] = 0;
-		break;
-	default:
-		break;
-	}
 	printf("%s", line);
 	return 1;
 }
@@ -374,16 +318,12 @@ static int conf_choice(struct menu *menu)
 			else
 				continue;
 			break;
-		case set_random:
-			if (is_new)
-				def = (rand() % cnt) + 1;
 		case set_default:
-		case set_yes:
-		case set_mod:
-		case set_no:
 			cnt = def;
 			printf("%d\n", cnt);
 			break;
+		default:
+			break;
 		}
 
 	conf_childs:
@@ -494,6 +434,43 @@ static void check_conf(struct menu *menu)
 		check_conf(child);
 }
 
+static void conf_do_update(void)
+{
+	/* Update until a loop caused no more changes */
+	do {
+		conf_cnt = 0;
+		check_conf(&rootmenu);
+	} while (conf_cnt);
+}
+
+static int conf_silent_update(void)
+{
+	const char *name;
+
+	if (conf_get_changed()) {
+		name = getenv("KCONFIG_NOSILENTUPDATE");
+		if (name && *name) {
+			fprintf(stderr,
+			_("\n*** Kernel configuration requires explicit update.\n\n"));
+			return 1;
+		}
+		conf_do_update();
+	}
+	return 0;
+}
+
+static int conf_update(void)
+{
+	rootEntry = &rootmenu;
+	conf(&rootmenu);
+	if (input_mode == ask_all) {
+		input_mode = ask_silent;
+		valid_stdin = 1;
+	}
+	conf_do_update();
+	return 0;
+}
+
 int main(int ac, char **av)
 {
 	int opt;
@@ -599,36 +576,41 @@ int main(int ac, char **av)
 	default:
 		break;
 	}
+	switch (input_mode) {
+	case set_no:
+		conf_set_all_new_symbols(def_no);
+		break;
+	case set_yes:
+		conf_set_all_new_symbols(def_yes);
+		break;
+	case set_mod:
+		conf_set_all_new_symbols(def_mod);
+		break;
+	case set_random:
+		conf_set_all_new_symbols(def_random);
+		break;
+	case ask_silent:
+		if (conf_silent_update())
+			exit(1);
+		break;
+	case ask_new:
+	case ask_all:
+	case set_default:
+		if (conf_update())
+			exit(1);
+		break;
+	}
 
-	if (input_mode != ask_silent) {
-		rootEntry = &rootmenu;
-		conf(&rootmenu);
-		if (input_mode == ask_all) {
-			input_mode = ask_silent;
-			valid_stdin = 1;
-		}
-	} else if (conf_get_changed()) {
-		name = getenv("KCONFIG_NOSILENTUPDATE");
-		if (name && *name) {
-			fprintf(stderr, _("\n*** Kernel configuration requires explicit update.\n\n"));
-			return 1;
-		}
-	} else
-		goto skip_check;
-
-	do {
-		conf_cnt = 0;
-		check_conf(&rootmenu);
-	} while (conf_cnt);
-	if (conf_write(NULL)) {
+	if (conf_get_changed() && conf_write(NULL)) {
 		fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
-		return 1;
+		exit(1);
 	}
-skip_check:
+	/* ask_silent is used during the build so we shall update autoconf.
+	 * All other commands are only used to generate a config.
+	 */
 	if (input_mode == ask_silent && conf_write_autoconf()) {
 		fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
 		return 1;
 	}
-
 	return 0;
 }

