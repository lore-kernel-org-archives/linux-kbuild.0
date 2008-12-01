Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:38388 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752667AbYLAWWE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Dec 2008 17:22:04 -0500
Message-Id: <200812012221.mB1ML37d013060@imap1.linux-foundation.org>
Subject: [patch 2/8] genksyms: allow to ignore symbol checksum changes
From: akpm@linux-foundation.org
Date: Mon, 01 Dec 2008 14:21:03 -0800
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, agruen@suse.de, randy.dunlap@oracle.com

From: Andreas Gruenbacher <agruen@suse.de>

This adds an "override" keyword for use in *.symvers / *.symref files. 
When a symbol is overridden, the symbol's old definition will be used for
computing checksums instead of the new one, preserving the previous
checksum.  (Genksyms will still warn about the change.)

This is meant to allow distributions to hide minor actual as well as fake
ABI changes.  (For example, when extra type information becomes available
because additional headers are included, this may change checksums even
though none of the types used have actully changed.)

This approach also allows to get rid of "#ifdef __GENKSYMS__" hacks in the
code, which are currently used in some vendor kernels to work around
checksum changes.

Signed-off-by: Andreas Gruenbacher <agruen@suse.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/genksyms/genksyms.c |   34 ++++++++++++++++++++++++++++++----
 scripts/genksyms/genksyms.h |    1 +
 2 files changed, 31 insertions(+), 4 deletions(-)

diff -puN scripts/genksyms/genksyms.c~genksyms-allow-to-ignore-symbol-checksum-changes scripts/genksyms/genksyms.c
--- a/scripts/genksyms/genksyms.c~genksyms-allow-to-ignore-symbol-checksum-changes
+++ a/scripts/genksyms/genksyms.c
@@ -191,11 +191,26 @@ struct symbol *__add_symbol(const char *
 				/* fall through */ ;
 			else if (sym->type == type &&
 				 equal_list(sym->defn, defn)) {
+				if (!sym->is_declared && sym->is_override) {
+					print_location();
+					print_type_name(type, name);
+					fprintf(stderr, " modversion is "
+						"unchanged\n");
+				}
 				sym->is_declared = 1;
 				return sym;
 			} else if (!sym->is_declared) {
-				status = is_unknown_symbol(sym) ?
-					STATUS_DEFINED : STATUS_MODIFIED;
+				if (sym->is_override && flag_preserve) {
+					print_location();
+					fprintf(stderr, "ignoring ");
+					print_type_name(type, name);
+					fprintf(stderr, " modversion change\n");
+					sym->is_declared = 1;
+					return sym;
+				} else {
+					status = is_unknown_symbol(sym) ?
+						STATUS_DEFINED : STATUS_MODIFIED;
+				}
 			} else {
 				error_with_pos("redefinition of %s", name);
 				return sym;
@@ -229,6 +244,7 @@ struct symbol *__add_symbol(const char *
 
 	sym->is_declared = !is_reference;
 	sym->status = status;
+	sym->is_override = 0;
 
 	if (flag_debug) {
 		fprintf(debugfile, "Defn for %s %s == <",
@@ -348,9 +364,16 @@ static void read_reference(FILE *f)
 	while (!feof(f)) {
 		struct string_list *defn = NULL;
 		struct string_list *sym, *def;
-		int is_extern = 0;
+		int is_extern = 0, is_override = 0;
+		struct symbol *subsym;
 
 		sym = read_node(f);
+		if (sym && sym->tag == SYM_NORMAL &&
+		    !strcmp(sym->string, "override")) {
+			is_override = 1;
+			free_node(sym);
+			sym = read_node(f);
+		}
 		if (!sym)
 			continue;
 		def = read_node(f);
@@ -365,8 +388,9 @@ static void read_reference(FILE *f)
 			defn = def;
 			def = read_node(f);
 		}
-		add_reference_symbol(xstrdup(sym->string), sym->tag,
+		subsym = add_reference_symbol(xstrdup(sym->string), sym->tag,
 					      defn, is_extern);
+		subsym->is_override = is_override;
 		free_node(sym);
 	}
 }
@@ -743,6 +767,8 @@ int main(int argc, char **argv)
 		while (visited_symbols != (struct symbol *)-1L) {
 			struct symbol *sym = visited_symbols;
 
+			if (sym->is_override)
+				fputs("override ", dumpfile);
 			if (sym->type != SYM_NORMAL) {
 				putc(symbol_type_name[sym->type][0], dumpfile);
 				putc('#', dumpfile);
diff -puN scripts/genksyms/genksyms.h~genksyms-allow-to-ignore-symbol-checksum-changes scripts/genksyms/genksyms.h
--- a/scripts/genksyms/genksyms.h~genksyms-allow-to-ignore-symbol-checksum-changes
+++ a/scripts/genksyms/genksyms.h
@@ -49,6 +49,7 @@ struct symbol {
 	int is_extern;
 	int is_declared;
 	enum symbol_status status;
+	int is_override;
 };
 
 typedef struct string_list **yystype;
_
