Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49454 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbfKWQFC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:02 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 03/16] scripts/kallsyms: shrink table before sorting it
Date: Sun, 24 Nov 2019 01:04:31 +0900
Message-Id: <20191123160444.11251-4-yamada.masahiro@socionext.com>
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Currently, build_initial_tok_table() trims unused symbols, which is
called after sort_symbol().

It is not efficient to sort the huge table that contains unused entries.
Shrink the table before sorting it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
 - New patch

 scripts/kallsyms.c | 49 +++++++++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 79641874d860..de986eda41a6 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -268,6 +268,30 @@ static int symbol_valid(struct sym_entry *s)
 	return 1;
 }
 
+/* remove all the invalid symbols from the table */
+static void shrink_table(void)
+{
+	unsigned int i, pos;
+
+	pos = 0;
+	for (i = 0; i < table_cnt; i++) {
+		if (symbol_valid(&table[i])) {
+			if (pos != i)
+				table[pos] = table[i];
+			pos++;
+		} else {
+			free(table[i].sym);
+		}
+	}
+	table_cnt = pos;
+
+	/* When valid symbol is not registered, exit to error */
+	if (!table_cnt) {
+		fprintf(stderr, "No valid symbol.\n");
+		exit(1);
+	}
+}
+
 static void read_map(FILE *in)
 {
 	while (!feof(in)) {
@@ -475,23 +499,13 @@ static void forget_symbol(unsigned char *symbol, int len)
 		token_profit[ symbol[i] + (symbol[i + 1] << 8) ]--;
 }
 
-/* remove all the invalid symbols from the table and do the initial token count */
+/* do the initial token count */
 static void build_initial_tok_table(void)
 {
-	unsigned int i, pos;
+	unsigned int i;
 
-	pos = 0;
-	for (i = 0; i < table_cnt; i++) {
-		if ( symbol_valid(&table[i]) ) {
-			if (pos != i)
-				table[pos] = table[i];
-			learn_symbol(table[pos].sym, table[pos].len);
-			pos++;
-		} else {
-			free(table[i].sym);
-		}
-	}
-	table_cnt = pos;
+	for (i = 0; i < table_cnt; i++)
+		learn_symbol(table[i].sym, table[i].len);
 }
 
 static void *find_token(unsigned char *str, int len, unsigned char *token)
@@ -614,12 +628,6 @@ static void optimize_token_table(void)
 
 	insert_real_symbols_in_table();
 
-	/* When valid symbol is not registered, exit to error */
-	if (!table_cnt) {
-		fprintf(stderr, "No valid symbol.\n");
-		exit(1);
-	}
-
 	optimize_result();
 }
 
@@ -756,6 +764,7 @@ int main(int argc, char **argv)
 		usage();
 
 	read_map(stdin);
+	shrink_table();
 	if (absolute_percpu)
 		make_percpus_absolute();
 	if (base_relative)
-- 
2.17.1
