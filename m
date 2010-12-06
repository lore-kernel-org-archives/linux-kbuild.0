Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:37061 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750891Ab0LFAvC convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Dec 2010 19:51:02 -0500
From: Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Date: Mon, 06 Dec 2010 00:50:49 +0000
Message-ID: <1291596649.8025.104.camel@localhost>
Mime-Version: 1.0
Subject: [PATCHv3] Kbuild: kconfig: Verbose version of --listnewconfig
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, Roman Zippel <zippel@linux-m68k.org>
Cc: Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild@vger.kernel.org, Debian kernel maintainers <debian-kernel@lists.debian.org>

If the KCONFIG_VERBOSE environment variable is set, show the default
values of new symbols and not just their names.

Based on work by Bastian Blank <waldi@debian.org> and
maximilian attems <max@stro.at>.  Simplified by Michal Marek
<mmarek@suse.cz>.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
I believe this incorporates all the comments made on v2.

Ben.

 scripts/kconfig/conf.c      |   37 +++++++++++++++++++++++++++----------
 scripts/kconfig/confdata.c  |    5 +++--
 scripts/kconfig/expr.h      |    2 ++
 scripts/kconfig/lkc_proto.h |    1 +
 4 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 5459a38..31e4e7d 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -363,7 +363,6 @@ static void conf(struct menu *menu)
 		switch (prop->type) {
 		case P_MENU:
 			if ((input_mode == silentoldconfig ||
-			     input_mode == listnewconfig ||
 			     input_mode == oldnoconfig) &&
 			    rootEntry != menu) {
 				check_conf(menu);
@@ -423,11 +422,7 @@ static void check_conf(struct menu *menu)
 	if (sym && !sym_has_value(sym)) {
 		if (sym_is_changable(sym) ||
 		    (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes)) {
-			if (input_mode == listnewconfig) {
-				if (sym->name && !sym_is_choice_value(sym)) {
-					printf("%s%s\n", CONFIG_, sym->name);
-				}
-			} else if (input_mode != oldnoconfig) {
+			if (input_mode != oldnoconfig) {
 				if (!conf_cnt++)
 					printf(_("*\n* Restart config...\n*\n"));
 				rootEntry = menu_get_parent_menu(menu);
@@ -440,6 +435,27 @@ static void check_conf(struct menu *menu)
 		check_conf(child);
 }
 
+static void report_conf(struct menu *menu, bool verbose)
+{
+	struct symbol *sym;
+	struct menu *child;
+
+	if (!menu_is_visible(menu))
+		return;
+
+	sym = menu->sym;
+	if (sym && (sym->flags & SYMBOL_NEW) &&
+	    sym_is_changable(sym) && sym->name && !sym_is_choice_value(sym)) {
+		if (verbose)
+			conf_write_symbol(sym, sym->type, stdout, true);
+		else
+			printf("%s%s\n", CONFIG_, sym->name);
+	}
+
+	for (child = menu->list; child; child = child->next)
+		report_conf(child, verbose);
+}
+
 static struct option long_opts[] = {
 	{"oldaskconfig",    no_argument,       NULL, oldaskconfig},
 	{"oldconfig",       no_argument,       NULL, oldconfig},
@@ -604,16 +620,17 @@ int main(int ac, char **av)
 		input_mode = silentoldconfig;
 		/* fall through */
 	case oldconfig:
-	case listnewconfig:
 	case oldnoconfig:
 	case silentoldconfig:
 		/* Update until a loop caused no more changes */
 		do {
 			conf_cnt = 0;
 			check_conf(&rootmenu);
-		} while (conf_cnt &&
-			 (input_mode != listnewconfig &&
-			  input_mode != oldnoconfig));
+		} while (conf_cnt && input_mode != oldnoconfig);
+		break;
+	case listnewconfig:
+		conf_set_all_new_symbols(def_default);
+		report_conf(&rootmenu, getenv("KCONFIG_VERBOSE") != NULL);
 		break;
 	}
 
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index c06f150..fbbacac 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -440,8 +440,8 @@ static void conf_write_string(bool headerfile, const char *name,
 	fputs("\"\n", out);
 }
 
-static void conf_write_symbol(struct symbol *sym, enum symbol_type type,
-                              FILE *out, bool write_no)
+void conf_write_symbol(struct symbol *sym, enum symbol_type type,
+		       FILE *out, bool write_no)
 {
 	const char *str;
 
@@ -1009,6 +1009,7 @@ void conf_set_all_new_symbols(enum conf_def_mode mode)
 	for_all_symbols(i, sym) {
 		if (sym_has_value(sym))
 			continue;
+		sym->flags |= SYMBOL_NEW;
 		switch (sym_get_type(sym)) {
 		case S_BOOLEAN:
 		case S_TRISTATE:
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 184eb6a..b267933 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -108,6 +108,8 @@ struct symbol {
 #define SYMBOL_DEF3       0x40000  /* symbol.def[S_DEF_3] is valid */
 #define SYMBOL_DEF4       0x80000  /* symbol.def[S_DEF_4] is valid */
 
+#define SYMBOL_NEW        0x100000 /* symbol is new (loaded config did not provide a value) */
+
 #define SYMBOL_MAXLENGTH	256
 #define SYMBOL_HASHSIZE		9973
 
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 17342fe..6da571b 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -7,6 +7,7 @@ P(conf_read_simple,int,(const char *name, int));
 P(conf_write_defconfig,int,(const char *name));
 P(conf_write,int,(const char *name));
 P(conf_write_autoconf,int,(void));
+P(conf_write_symbol, void,(struct symbol*, enum symbol_type, FILE*, bool));
 P(conf_get_changed,bool,(void));
 P(conf_set_changed_callback, void,(void (*fn)(void)));
 P(conf_set_message_callback, void,(void (*fn)(const char *fmt, va_list ap)));
-- 
1.7.2.3


