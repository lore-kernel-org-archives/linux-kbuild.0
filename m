Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:53117 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750702Ab1EPEGl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 May 2011 00:06:41 -0400
Received: by iyb14 with SMTP id 14so3427601iyb.19
        for <linux-kbuild@vger.kernel.org>; Sun, 15 May 2011 21:06:40 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFC] kconfig: zconfdump() clean-up
Date: Mon, 16 May 2011 00:06:35 -0400
Message-Id: <1305518795-9360-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

Hi Michal,

The following patch is a summarize of changes I made in zconfdump() last week
when debugging Yann's multiple choice issue. This might help debugging a bit,
espectially by exposing the tree depth.

Considering the following Kconfig:

config A
   bool "A"
if A
choice C
   bool "C"
config C1
   bool "C1"
config C2
   bool "C2"
endchoice
endif # A

config B
   bool "B"
   depends on ! A
if B
choice C
   bool "C"
config C1
   bool "C1"
config C2
   bool "C2"
endchoice
endif # A

It generates the following output, after menu_finalize():

config A
  boolean
  symbol 
  prompt "A"

        choice C
          boolean
          symbol 
          #choice 
          prompt "C" if A

                config C1
                  boolean
                  symbol 
                  prompt "C1" if C
                  #choice 

                config C2
                  boolean
                  symbol 
                  prompt "C2" if C
                  #choice 

        endchoice

        config B
          boolean
          symbol 
          prompt "B" if !A

                choice C
                  boolean
                  symbol 
                  #choice 
                  prompt "C" if B

                        config C1
                          boolean
                          symbol 
                          prompt "C1" if C

                        config C2
                          boolean
                          symbol 
                          prompt "C2" if C

                endchoice

instead of:

config A
  boolean
  unknown prop 9!
  prompt "A"

choice
  boolean
  unknown prop 9!
  #choice value
  prompt "C" if A

config C1
  boolean
  unknown prop 9!
  prompt "C1" if C
  #choice value

config C2
  boolean
  unknown prop 9!
  prompt "C2" if C
  #choice value

config B
  boolean
  unknown prop 9!
  prompt "B" if !A

choice
  boolean
  unknown prop 9!
  #choice value
  prompt "C" if B

config C1
  boolean
  unknown prop 9!
  prompt "C1" if C

config C2
  boolean
  unknown prop 9!
  prompt "C2" if C

endmenu

Broken down patches are available at:

https://github.com/lacombar/linux-2.6/tree/kconfig-zconfdump

Not for merge for now, even if it merges fine with your kbuild/kconfig's tip.

Regards,
 - Arnaud

---
 scripts/kconfig/zconf.y |  161 +++++++++++++++++++----------------------------
 1 files changed, 66 insertions(+), 95 deletions(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 237ae2a..f18bc5a 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -612,129 +612,100 @@ static void print_quoted_string(FILE *out, const char *str)
 	putc('"', out);
 }
 
-static void print_symbol(FILE *out, struct menu *menu)
+static int indent;
+
+static void print_property(FILE *out, struct property *prop)
 {
-	struct symbol *sym = menu->sym;
-	struct property *prop;
+	const char *prop_string;
 
-	if (sym_is_choice(sym))
-		fprintf(out, "\nchoice\n");
-	else
-		fprintf(out, "\nconfig %s\n", sym->name);
-	switch (sym->type) {
-	case S_BOOLEAN:
-		fputs("  boolean\n", out);
-		break;
-	case S_TRISTATE:
-		fputs("  tristate\n", out);
+	prop_string = prop_get_type_name(prop->type);
+	if (prop_string == NULL)
+		return;
+
+	fprintf(out, "%*s  %s%s ", indent * 8, "",
+	    (prop->type == P_CHOICE) ? "#" : "",
+	    prop_string);
+
+	switch (prop->type) {
+	case P_PROMPT:
+		print_quoted_string(out, prop->text);
+		if (!expr_is_yes(prop->visible.expr)) {
+			fputs(" if ", out);
+			expr_fprint(prop->visible.expr, out);
+		}
 		break;
-	case S_STRING:
-		fputs("  string\n", out);
+	case P_DEFAULT:
+		expr_fprint(prop->expr, out);
+		if (!expr_is_yes(prop->visible.expr)) {
+			fputs(" if ", out);
+			expr_fprint(prop->visible.expr, out);
+		}
 		break;
-	case S_INT:
-		fputs("  integer\n", out);
+	case P_SELECT:
+	case P_RANGE:
+		expr_fprint(prop->expr, out);
 		break;
-	case S_HEX:
-		fputs("  hex\n", out);
+	case P_MENU:
+	case P_COMMENT:
+		print_quoted_string(out, prop->text);
 		break;
 	default:
-		fputs("  ???\n", out);
 		break;
 	}
+	fprintf(out, "\n");
+}
+
+static void print_symbol(FILE *out, struct menu *menu)
+{
+	struct symbol *sym = menu->sym;
+	struct property *prop;
+
+	fprintf(out, "%*s%s %s\n", indent * 8, "",
+	    (sym_is_choice(sym)) ? "choice" : "config",
+	    (sym->name) ? sym->name: "");
+	fprintf(out, "%*s  %s\n", indent * 8, "",
+	    sym_type_name(sym->type));
+
 	for (prop = sym->prop; prop; prop = prop->next) {
 		if (prop->menu != menu)
 			continue;
-		switch (prop->type) {
-		case P_PROMPT:
-			fputs("  prompt ", out);
-			print_quoted_string(out, prop->text);
-			if (!expr_is_yes(prop->visible.expr)) {
-				fputs(" if ", out);
-				expr_fprint(prop->visible.expr, out);
-			}
-			fputc('\n', out);
-			break;
-		case P_DEFAULT:
-			fputs( "  default ", out);
-			expr_fprint(prop->expr, out);
-			if (!expr_is_yes(prop->visible.expr)) {
-				fputs(" if ", out);
-				expr_fprint(prop->visible.expr, out);
-			}
-			fputc('\n', out);
-			break;
-		case P_CHOICE:
-			fputs("  #choice value\n", out);
-			break;
-		case P_SELECT:
-			fputs( "  select ", out);
-			expr_fprint(prop->expr, out);
-			fputc('\n', out);
-			break;
-		case P_RANGE:
-			fputs( "  range ", out);
-			expr_fprint(prop->expr, out);
-			fputc('\n', out);
-			break;
-		case P_MENU:
-			fputs( "  menu ", out);
-			print_quoted_string(out, prop->text);
-			fputc('\n', out);
-			break;
-		case P_SYMBOL:
-			break;
-		default:
-			fprintf(out, "  unknown prop %d!\n", prop->type);
-			break;
-		}
-	}
-	if (menu->help) {
-		int len = strlen(menu->help);
-		while (menu->help[--len] == '\n')
-			menu->help[len] = 0;
-		fprintf(out, "  help\n%s\n", menu->help);
+		print_property(out, prop);
 	}
+	fprintf(out, "\n");
 }
 
 void zconfdump(FILE *out)
 {
-	struct property *prop;
-	struct symbol *sym;
 	struct menu *menu;
 
 	menu = rootmenu.list;
 	while (menu) {
-		if ((sym = menu->sym))
+		if (menu->sym)
 			print_symbol(out, menu);
-		else if ((prop = menu->prompt)) {
-			switch (prop->type) {
-			case P_COMMENT:
-				fputs("\ncomment ", out);
-				print_quoted_string(out, prop->text);
-				fputs("\n", out);
-				break;
-			case P_MENU:
-				fputs("\nmenu ", out);
-				print_quoted_string(out, prop->text);
-				fputs("\n", out);
-				break;
-			default:
-				;
-			}
-			if (!expr_is_yes(prop->visible.expr)) {
-				fputs("  depends ", out);
-				expr_fprint(prop->visible.expr, out);
-				fputc('\n', out);
-			}
+
+		if (menu->help) {
+			int len = strlen(menu->help);
+			while (menu->help[--len] == '\n')
+				menu->help[len] = 0;
+			fprintf(out, "%*s  help\n%s\n", indent * 8, "",
+			    menu->help);
 		}
 
-		if (menu->list)
+		if (menu->list) {
+			indent++;
 			menu = menu->list;
+		}
 		else if (menu->next)
 			menu = menu->next;
 		else while ((menu = menu->parent)) {
-			if (menu->prompt && menu->prompt->type == P_MENU)
-				fputs("\nendmenu\n", out);
+			if (menu != &rootmenu)
+				indent--;
+			fprintf(out, "%*s", indent * 8, "");
+			if (menu->sym && sym_is_choice(menu->sym))
+				fprintf(out, "endchoice\n\n");
+			if (menu->prompt && menu->prompt->type == P_MENU &&
+			    menu != &rootmenu)
+				fprintf(out, "endmenu\n\n");
 			if (menu->next) {
 				menu = menu->next;
 				break;
-- 
1.7.3.4.574.g608b.dirty

