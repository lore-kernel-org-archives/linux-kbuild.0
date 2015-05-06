Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:52650 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751632AbbEFSYD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 May 2015 14:24:03 -0400
Message-Id: <20150506182359.216601202@goodmis.org>
Date: Wed, 06 May 2015 14:18:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [RFC][PATCH 2/2] kallsyms: Do not display SyS_foo() syscall aliases in kallsyms
References: <20150506181831.145849116@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=0002-kallsyms-Do-not-display-SyS_foo-syscall-aliases-in-k.patch
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>, Borislav Petkov <bp@alien8.de>

From: "Steven Rostedt (Red Hat)" <rostedt@goodmis.org>

The SyS_foo() alias wrapper was added to make sure that system call
arguments were signed extended. The call itself is to never be used
by anything, only the sys_foo() version is. But this symbol is stored
in /proc/kallsyms, and is returned sometimes as the name of system
call functions when a ksym lookup is made, it confuses the function
tracer interface (see available_filter_functions in the tracefs
directory).

Al Viro even suggested that this should be removed from kallsyms
as well:

Link: http://lkml.kernel.org/r/20130510211716.GN25399@ZenIV.linux.org.uk

Modify the compile time kallsyms.c to check if the function name
begins with SyS_ and is before or after the same name that starts
with sys_ and if so, do not record it. This saves some space and
more importantly removes the confusing variations of the system
call name.

 wc kallsyms.*
  90151  284644 3819255 kallsyms.orig
  89826  283669 3808628 kallsyms.patched

 size vmlinux*
   text    data     bss     dec     hex filename
9990933 2368592 1249280 13608805         cfa765 vmlinux.orig
9986837 2368592 1249280 13604709         cf9765 vmlinux.patched

This patch only removes SyS_*, it does not do anything with
compat_SyS_*.

Cc: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 scripts/kallsyms.c | 43 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 8fa81e84e295..a64d89c6641c 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -193,8 +193,22 @@ static int symbol_in_range(struct sym_entry *s, struct addr_range *ranges,
 	return 0;
 }
 
-static int symbol_valid(struct sym_entry *s)
+static const char *skip_prefix(const char *sym)
 {
+	if (symbol_prefix_char && *sym == symbol_prefix_char)
+		return sym + 1;
+	return sym;
+}
+
+static int match_sys(const char *sym, const char *sys)
+{
+	return !strncmp(sys, "sys_", 4) && !strcmp(sym + 4, sys + 4);
+}
+
+static int symbol_valid(int idx)
+{
+	struct sym_entry *s = &table[idx];
+
 	/* Symbols which vary between passes.  Passes 1 and 2 must have
 	 * identical symbol lists.  The kallsyms_* symbols below are only added
 	 * after pass 1, they would be included in pass 2 when --all-symbols is
@@ -224,9 +238,7 @@ static int symbol_valid(struct sym_entry *s)
 	if (s->addr < kernel_start_addr)
 		return 0;
 
-	/* skip prefix char */
-	if (symbol_prefix_char && *sym_name == symbol_prefix_char)
-		sym_name++;
+	sym_name = skip_prefix(sym_name);
 
 
 	/* if --all-symbols is not specified, then symbols outside the text
@@ -255,6 +267,27 @@ static int symbol_valid(struct sym_entry *s)
 		if (strcmp(sym_name, special_symbols[i]) == 0)
 			return 0;
 
+	/* Ignore SyS_* alias system calls */
+	if (!strncmp(sym_name, "SyS_", 4)) {
+		char *sym_name_before = "";
+		char *sym_name_after = "";
+
+		if (i > 0) {
+			sym_name_before = (char *)table[idx-1].sym + 1;
+			sym_name_before = skip_prefix(sym_name_before);
+		}
+
+		if (i < table_cnt - 1) {
+			sym_name_after = (char *)table[idx+1].sym + 1;
+			sym_name_after = skip_prefix(sym_name_after);
+		}
+
+		/* If SyS_foo matches a sys_foo, skip it */
+		if (match_sys(sym_name, sym_name_before) ||
+		    match_sys(sym_name, sym_name_after))
+			return 0;
+	}
+
 	for (i = 0; special_suffixes[i]; i++) {
 		int l = strlen(sym_name) - strlen(special_suffixes[i]);
 
@@ -447,7 +480,7 @@ static void build_initial_tok_table(void)
 
 	pos = 0;
 	for (i = 0; i < table_cnt; i++) {
-		if ( symbol_valid(&table[i]) ) {
+		if ( symbol_valid(i) ) {
 			if (pos != i)
 				table[pos] = table[i];
 			learn_symbol(table[pos].sym, table[pos].len);
-- 
2.1.4


