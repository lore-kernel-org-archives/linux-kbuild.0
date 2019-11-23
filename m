Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49458 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbfKWQFC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:02 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 07/16] scripts/kallsyms: add sym_name() to mitigate cast ugliness
Date: Sun, 24 Nov 2019 01:04:35 +0900
Message-Id: <20191123160444.11251-8-yamada.masahiro@socionext.com>
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

sym_entry::sym is (unsigned char *) instead of (char *) because
kallsyms exploits the MSB for compression, and the characters are
used as the index of token_profit array.

However, it requires casting (unsigned char *) to (char *) in some
places since standard library functions such as strcmp(), strlen()
expect (char *).

Introduce a new helper, sym_name(), which advances the given pointer
by 1 and casts it to (char *).

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index a57636c6f84f..baa2fa5692b0 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -74,6 +74,11 @@ static void usage(void)
 	exit(1);
 }
 
+static char *sym_name(const struct sym_entry *s)
+{
+	return (char *)s->sym + 1;
+}
+
 static int check_symbol_range(const char *sym, unsigned long long addr,
 			      struct addr_range *ranges, int entries)
 {
@@ -154,7 +159,7 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 			"unable to allocate required amount of memory\n");
 		exit(EXIT_FAILURE);
 	}
-	strcpy((char *)s->sym + 1, sym);
+	strcpy(sym_name(s), sym);
 	s->sym[0] = stype;
 
 	s->percpu_absolute = 0;
@@ -215,7 +220,7 @@ static int symbol_valid(struct sym_entry *s)
 		NULL };
 
 	int i;
-	char *sym_name = (char *)s->sym + 1;
+	const char *name = sym_name(s);
 
 	/* if --all-symbols is not specified, then symbols outside the text
 	 * and inittext sections are discarded */
@@ -230,30 +235,28 @@ static int symbol_valid(struct sym_entry *s)
 		 * rules.
 		 */
 		if ((s->addr == text_range_text->end &&
-				strcmp(sym_name,
-				       text_range_text->end_sym)) ||
+		     strcmp(name, text_range_text->end_sym)) ||
 		    (s->addr == text_range_inittext->end &&
-				strcmp(sym_name,
-				       text_range_inittext->end_sym)))
+		     strcmp(name, text_range_inittext->end_sym)))
 			return 0;
 	}
 
 	/* Exclude symbols which vary between passes. */
 	for (i = 0; special_symbols[i]; i++)
-		if (strcmp(sym_name, special_symbols[i]) == 0)
+		if (strcmp(name, special_symbols[i]) == 0)
 			return 0;
 
 	for (i = 0; special_prefixes[i]; i++) {
 		int l = strlen(special_prefixes[i]);
 
-		if (strncmp(sym_name, special_prefixes[i], l) == 0)
+		if (strncmp(name, special_prefixes[i], l) == 0)
 			return 0;
 	}
 
 	for (i = 0; special_suffixes[i]; i++) {
-		int l = strlen(sym_name) - strlen(special_suffixes[i]);
+		int l = strlen(name) - strlen(special_suffixes[i]);
 
-		if (l >= 0 && strcmp(sym_name + l, special_suffixes[i]) == 0)
+		if (l >= 0 && strcmp(name + l, special_suffixes[i]) == 0)
 			return 0;
 	}
 
@@ -626,7 +629,7 @@ static void optimize_token_table(void)
 /* guess for "linker script provide" symbol */
 static int may_be_linker_script_provide_symbol(const struct sym_entry *se)
 {
-	const char *symbol = (char *)se->sym + 1;
+	const char *symbol = sym_name(se);
 	int len = se->len - 1;
 
 	if (len < 8)
@@ -696,8 +699,8 @@ static int compare_symbols(const void *a, const void *b)
 		return wa - wb;
 
 	/* sort by the number of prefix underscores */
-	wa = prefix_underscores_count((const char *)sa->sym + 1);
-	wb = prefix_underscores_count((const char *)sb->sym + 1);
+	wa = prefix_underscores_count(sym_name(sa));
+	wb = prefix_underscores_count(sym_name(sb));
 	if (wa != wb)
 		return wa - wb;
 
-- 
2.17.1
