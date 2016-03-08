Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:65379 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933940AbcCHAb7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 7 Mar 2016 19:31:59 -0500
From: Kamil Rytarowski <n54@gmx.com>
Subject: [PATCH] Fix ctype(3) usage in the kconfig code on NetBSD
Date: Tue,  8 Mar 2016 01:31:25 +0100
Message-Id: <1457397085-10907-1-git-send-email-n54@gmx.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr

The current code produces set of warnings on NetBSD-7.99.25 (GCC 4.8.5):

In file included from scripts/kconfig/zconf.tab.c:2576:0:
scripts/kconfig/confdata.c: In function 'conf_expand_value':
scripts/kconfig/confdata.c:97:3:
warning: array subscript has type 'char' [-Wchar-subscripts]
   while (isalnum(*src) || *src == '_')
   ^
scripts/kconfig/confdata.c: In function 'conf_set_sym_val':
scripts/kconfig/confdata.c:155:4:
warning: array subscript has type 'char' [-Wchar-subscripts]
    for (p2 = p; *p2 && !isspace(*p2); p2++)
    ^
scripts/kconfig/confdata.c: In function 'tristate_print_symbol':
scripts/kconfig/confdata.c:617:3:
warning: array subscript has type 'char' [-Wchar-subscripts]
   fprintf(fp, "%s%s=%c\n", CONFIG_, sym->name, (char)toupper(*value));
   ^

Fix this portability issue by explicit casting to unsigned char.

 CAVEATS
  The first argument of these functions is of type int, but only a very
  restricted subset of values are actually valid.  The argument must either
  be the value of the macro EOF (which has a negative value), or must be a
  non-negative value within the range representable as unsigned char.
  Passing invalid values leads to undefined behavior.

  --- The NetBSD ctype(3) man-page

  This behavior is POSIX and Standard C:

  The c argument is an int, the value of which the application shall ensure
  is a character representable as an unsigned char or equal to the value of
  the macro EOF. If the argument has any other value, the behavior is
  undefined.

    -- The Open Group Base Specifications Issue 6
       IEEE Std 1003.1, 2004 Edition

  The header declares several functions useful for classifying and mapping
  characters In all cases the argument is an int, the value of which shall
  be representable as an unsigned char or shall equal the value of the
  macro EOF. If the argument has any other value, the behavior is
  undefined.

    -- C11 standard 7.4 Character handling <ctype.h> paragraph 1

Signed-off-by: Kamil Rytarowski <n54@gmx.com>
---
 scripts/basic/fixdep.c               |  2 +-
 scripts/checkpatch.pl                |  2 +-
 scripts/kconfig/conf.c               |  6 +++---
 scripts/kconfig/confdata.c           |  9 +++++----
 scripts/kconfig/expr.c               |  3 ++-
 scripts/kconfig/lxdialog/checklist.c |  3 ++-
 scripts/kconfig/lxdialog/inputbox.c  |  3 ++-
 scripts/kconfig/lxdialog/menubox.c   | 11 +++++++----
 scripts/kconfig/lxdialog/util.c      |  5 +++--
 scripts/kconfig/menu.c               |  4 ++--
 scripts/kconfig/nconf.c              |  3 ++-
 scripts/kconfig/nconf.gui.c          |  3 ++-
 scripts/kconfig/symbol.c             |  8 ++++----
 13 files changed, 36 insertions(+), 26 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 5b327c6..efaea2e 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -236,7 +236,7 @@ static void parse_config_file(const char *map, size_t len)
 			continue;
 		p += 7;
 		for (q = p; q < map + len; q++) {
-			if (!(isalnum(*q) || *q == '_'))
+			if (!(isalnum((unsigned char)*q) || *q == '_'))
 				goto found;
 		}
 		continue;
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 0147c91..ecaf943 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1,4 +1,4 @@
-#!/usr/bin/perl -w
+#!/usr/bin/env perl
 # (c) 2001, Dave Jones. (the file handling bit)
 # (c) 2005, Joel Schopp <jschopp@austin.ibm.com> (the ugly bit)
 # (c) 2007,2008, Andy Whitcroft <apw@uk.ibm.com> (new conditions, test suite)
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 866369f..954f19f 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -60,7 +60,7 @@ static void strip(char *str)
 	char *p = str;
 	int l;
 
-	while ((isspace(*p)))
+	while ((isspace((unsigned char)*p)))
 		p++;
 	l = strlen(p);
 	if (p != str)
@@ -68,7 +68,7 @@ static void strip(char *str)
 	if (!l)
 		return;
 	p = str + l - 1;
-	while ((isspace(*p)))
+	while ((isspace((unsigned char)*p)))
 		*p-- = 0;
 }
 
@@ -320,7 +320,7 @@ static int conf_choice(struct menu *menu)
 			}
 			if (!line[0])
 				cnt = def;
-			else if (isdigit(line[0]))
+			else if (isdigit((unsigned char)line[0]))
 				cnt = atoi(line);
 			else
 				continue;
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 0b7dc2f..048f85b 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -94,7 +94,7 @@ static char *conf_expand_value(const char *in)
 		strncat(res_value, in, src - in);
 		src++;
 		dst = name;
-		while (isalnum(*src) || *src == '_')
+		while (isalnum((unsigned char)*src) || *src == '_')
 			*dst++ = *src++;
 		*dst = 0;
 		sym = sym_lookup(name, 0);
@@ -152,7 +152,7 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 		return 1;
 	case S_OTHER:
 		if (*p != '"') {
-			for (p2 = p; *p2 && !isspace(*p2); p2++)
+			for (p2 = p; *p2 && !isspace((unsigned char)*p2); p2++)
 				;
 			sym->type = S_STRING;
 			goto done;
@@ -614,7 +614,8 @@ tristate_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg
 {
 
 	if (sym->type == S_TRISTATE && *value != 'n')
-		fprintf(fp, "%s%s=%c\n", CONFIG_, sym->name, (char)toupper(*value));
+		fprintf(fp, "%s%s=%c\n", CONFIG_, sym->name,
+			(char)toupper((unsigned char)*value));
 }
 
 static struct conf_printer tristate_printer_cb =
@@ -906,7 +907,7 @@ static int conf_split_config(void)
 		s = sym->name;
 		d = path;
 		while ((c = *s++)) {
-			c = tolower(c);
+			c = tolower((unsigned char)c);
 			*d++ = (c == '_') ? '/' : c;
 		}
 		strcpy(d, ".h");
diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index cbf4996..4bb98cd 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -910,7 +910,8 @@ static enum string_value_kind expr_parse_string(const char *str,
 	default:
 		return k_invalid;
 	}
-	return !errno && !*tail && tail > str && isxdigit(tail[-1])
+	return !errno && !*tail && tail > str &&
+	       isxdigit((unsigned char)tail[-1])
 	       ? kind : k_string;
 }
 
diff --git a/scripts/kconfig/lxdialog/checklist.c b/scripts/kconfig/lxdialog/checklist.c
index 8d016fa..c358a79 100644
--- a/scripts/kconfig/lxdialog/checklist.c
+++ b/scripts/kconfig/lxdialog/checklist.c
@@ -210,7 +210,8 @@ do_resize:
 
 		for (i = 0; i < max_choice; i++) {
 			item_set(i + scroll);
-			if (toupper(key) == toupper(item_str()[0]))
+			if (toupper((unsigned char)key) ==
+			    toupper((unsigned char)item_str()[0]))
 				break;
 		}
 
diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
index d58de1d..dc1092e 100644
--- a/scripts/kconfig/lxdialog/inputbox.c
+++ b/scripts/kconfig/lxdialog/inputbox.c
@@ -194,7 +194,8 @@ do_resize:
 				}
 				continue;
 			default:
-				if (key < 0x100 && isprint(key)) {
+				if (key < 0x100 &&
+				    isprint((unsigned char)key)) {
 					if (len < MAX_LEN) {
 						wattrset(dialog, dlg.inputbox.atr);
 						if (pos < len) {
diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/lxdialog/menubox.c
index 11ae9ad..5d35c0f 100644
--- a/scripts/kconfig/lxdialog/menubox.c
+++ b/scripts/kconfig/lxdialog/menubox.c
@@ -282,8 +282,8 @@ do_resize:
 	while (key != KEY_ESC) {
 		key = wgetch(menu);
 
-		if (key < 256 && isalpha(key))
-			key = tolower(key);
+		if (key < 256 && isalpha((unsigned char)key))
+			key = tolower((unsigned char)key);
 
 		if (strchr("ynmh", key))
 			i = max_choice;
@@ -291,14 +291,17 @@ do_resize:
 			for (i = choice + 1; i < max_choice; i++) {
 				item_set(scroll + i);
 				j = first_alpha(item_str(), "YyNnMmHh");
-				if (key == tolower(item_str()[j]))
+				if (key ==
+				    tolower((unsigned char)item_str()[j]))
 					break;
 			}
 			if (i == max_choice)
 				for (i = 0; i < max_choice; i++) {
 					item_set(scroll + i);
 					j = first_alpha(item_str(), "YyNnMmHh");
-					if (key == tolower(item_str()[j]))
+					if (key ==
+					    tolower((unsigned char)
+						    item_str()[j]))
 						break;
 				}
 		}
diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
index f7abdeb..0b4d858 100644
--- a/scripts/kconfig/lxdialog/util.c
+++ b/scripts/kconfig/lxdialog/util.c
@@ -534,14 +534,15 @@ int first_alpha(const char *string, const char *exempt)
 	int i, in_paren = 0, c;
 
 	for (i = 0; i < strlen(string); i++) {
-		c = tolower(string[i]);
+		c = tolower((unsigned char)string[i]);
 
 		if (strchr("<[(", c))
 			++in_paren;
 		if (strchr(">])", c) && in_paren > 0)
 			--in_paren;
 
-		if ((!in_paren) && isalpha(c) && strchr(exempt, c) == 0)
+		if ((!in_paren) && isalpha((unsigned char)c) &&
+		    strchr(exempt, c) == 0)
 			return i;
 	}
 
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index aed678e..2165c71 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -134,9 +134,9 @@ static struct property *menu_add_prop(enum prop_type type, char *prompt, struct
 	prop->visible.expr = menu_check_dep(dep);
 
 	if (prompt) {
-		if (isspace(*prompt)) {
+		if (isspace((unsigned char)*prompt)) {
 			prop_warn(prop, "leading whitespace ignored");
-			while (isspace(*prompt))
+			while (isspace((unsigned char)*prompt))
 				prompt++;
 		}
 		if (current_entry->prompt && current_entry != &rootmenu)
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index d42d534..7200869 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -1032,7 +1032,8 @@ static int do_match(int key, struct match_state *state, int *ans)
 	} else if (!state->in_search)
 		return 1;
 
-	if (isalnum(c) || isgraph(c) || c == ' ') {
+	if (isalnum((unsigned char)c) || isgraph((unsigned char)c) ||
+	    c == ' ') {
 		state->pattern[strlen(state->pattern)] = c;
 		state->pattern[strlen(state->pattern)] = '\0';
 		adj_match_dir(&state->match_direction);
diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 8275f0e..01a3953 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -474,7 +474,8 @@ int dialog_inputbox(WINDOW *main_window,
 			cursor_form_win = min(cursor_position, prompt_width-1);
 			break;
 		default:
-			if ((isgraph(res) || isspace(res))) {
+			if ((isgraph((unsigned char)res) ||
+			    isspace((unsigned char)res))) {
 				/* one for new char, one for '\0' */
 				if (len+2 > *result_len) {
 					*result_len = len+2;
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 25cf0c2..47536a2 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -559,12 +559,12 @@ bool sym_string_valid(struct symbol *sym, const char *str)
 		ch = *str++;
 		if (ch == '-')
 			ch = *str++;
-		if (!isdigit(ch))
+		if (!isdigit((unsigned char)ch))
 			return false;
 		if (ch == '0' && *str != 0)
 			return false;
 		while ((ch = *str++)) {
-			if (!isdigit(ch))
+			if (!isdigit((unsigned char)ch))
 				return false;
 		}
 		return true;
@@ -573,7 +573,7 @@ bool sym_string_valid(struct symbol *sym, const char *str)
 			str += 2;
 		ch = *str++;
 		do {
-			if (!isxdigit(ch))
+			if (!isxdigit((unsigned char)ch))
 				return false;
 		} while ((ch = *str++));
 		return true;
@@ -887,7 +887,7 @@ const char *sym_expand_string_value(const char *in)
 		src++;
 
 		p = name;
-		while (isalnum(*src) || *src == '_')
+		while (isalnum((unsigned char)*src) || *src == '_')
 			*p++ = *src++;
 		*p = '\0';
 
-- 
2.7.1

