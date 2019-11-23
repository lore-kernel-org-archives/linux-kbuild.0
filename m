Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49452 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbfKWQFC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:02 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 10/16] scripts/kallsyms: add const qualifiers where possible
Date: Sun, 24 Nov 2019 01:04:38 +0900
Message-Id: <20191123160444.11251-11-yamada.masahiro@socionext.com>
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Add 'const' where a function does not write to the pointer dereferenes.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 274a77bfbd63..056bde436540 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -170,11 +170,11 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 	return 0;
 }
 
-static int symbol_in_range(struct sym_entry *s, struct addr_range *ranges,
-			   int entries)
+static int symbol_in_range(const struct sym_entry *s,
+			   const struct addr_range *ranges, int entries)
 {
 	size_t i;
-	struct addr_range *ar;
+	const struct addr_range *ar;
 
 	for (i = 0; i < entries; ++i) {
 		ar = &ranges[i];
@@ -186,14 +186,14 @@ static int symbol_in_range(struct sym_entry *s, struct addr_range *ranges,
 	return 0;
 }
 
-static int symbol_valid(struct sym_entry *s)
+static int symbol_valid(const struct sym_entry *s)
 {
 	/* Symbols which vary between passes.  Passes 1 and 2 must have
 	 * identical symbol lists.  The kallsyms_* symbols below are only added
 	 * after pass 1, they would be included in pass 2 when --all-symbols is
 	 * specified so exclude them to get a stable symbol list.
 	 */
-	static char *special_symbols[] = {
+	static const char * const special_symbols[] = {
 		"kallsyms_addresses",
 		"kallsyms_offsets",
 		"kallsyms_relative_base",
@@ -208,12 +208,12 @@ static int symbol_valid(struct sym_entry *s)
 		"_SDA2_BASE_",		/* ppc */
 		NULL };
 
-	static char *special_prefixes[] = {
+	static const char * const special_prefixes[] = {
 		"__crc_",		/* modversions */
 		"__efistub_",		/* arm64 EFI stub namespace */
 		NULL };
 
-	static char *special_suffixes[] = {
+	static const char * const special_suffixes[] = {
 		"_veneer",		/* arm */
 		"_from_arm",		/* arm */
 		"_from_thumb",		/* arm */
@@ -305,7 +305,7 @@ static void read_map(FILE *in)
 	}
 }
 
-static void output_label(char *label)
+static void output_label(const char *label)
 {
 	printf(".globl %s\n", label);
 	printf("\tALGN\n");
@@ -314,7 +314,7 @@ static void output_label(char *label)
 
 /* uncompress a compressed symbol. When this function is called, the best table
  * might still be compressed itself, so the function needs to be recursive */
-static int expand_symbol(unsigned char *data, int len, char *result)
+static int expand_symbol(const unsigned char *data, int len, char *result)
 {
 	int c, rlen, total=0;
 
@@ -339,7 +339,7 @@ static int expand_symbol(unsigned char *data, int len, char *result)
 	return total;
 }
 
-static int symbol_absolute(struct sym_entry *s)
+static int symbol_absolute(const struct sym_entry *s)
 {
 	return s->percpu_absolute;
 }
@@ -477,7 +477,7 @@ static void write_src(void)
 /* table lookup compression functions */
 
 /* count all the possible tokens in a symbol */
-static void learn_symbol(unsigned char *symbol, int len)
+static void learn_symbol(const unsigned char *symbol, int len)
 {
 	int i;
 
@@ -486,7 +486,7 @@ static void learn_symbol(unsigned char *symbol, int len)
 }
 
 /* decrease the count for all the possible tokens in a symbol */
-static void forget_symbol(unsigned char *symbol, int len)
+static void forget_symbol(const unsigned char *symbol, int len)
 {
 	int i;
 
@@ -504,7 +504,7 @@ static void build_initial_tok_table(void)
 }
 
 static unsigned char *find_token(unsigned char *str, int len,
-				 unsigned char *token)
+				 const unsigned char *token)
 {
 	int i;
 
@@ -517,7 +517,7 @@ static unsigned char *find_token(unsigned char *str, int len,
 
 /* replace a given token in all the valid symbols. Use the sampled symbols
  * to update the counts */
-static void compress_symbols(unsigned char *str, int idx)
+static void compress_symbols(const unsigned char *str, int idx)
 {
 	unsigned int i, len, size;
 	unsigned char *p1, *p2;
-- 
2.17.1
