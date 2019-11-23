Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49450 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbfKWQFC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:02 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 04/16] scripts/kallsyms: set relative_base more effectively
Date: Sun, 24 Nov 2019 01:04:32 +0900
Message-Id: <20191123160444.11251-5-yamada.masahiro@socionext.com>
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Currently, record_relative_base() iterates over the entire table to
find the minimum address, but it is not efficient because we sort
the table anyway.

After sort_symbol(), the table is sorted by address. (kallsyms parses
the 'nm -n' output, so the data is already sorted by address, but this
commit does not rely on it.)

Move record_relative_base() after sort_symbols(), and take the first
non-absolute symbol value.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index de986eda41a6..c9efb67c6ecb 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -739,11 +739,15 @@ static void record_relative_base(void)
 {
 	unsigned int i;
 
-	relative_base = -1ULL;
 	for (i = 0; i < table_cnt; i++)
-		if (!symbol_absolute(&table[i]) &&
-		    table[i].addr < relative_base)
+		if (!symbol_absolute(&table[i])) {
+			/*
+			 * The table is sorted by address.
+			 * Take the first non-absolute symbol value.
+			 */
 			relative_base = table[i].addr;
+			return;
+		}
 }
 
 int main(int argc, char **argv)
@@ -767,9 +771,9 @@ int main(int argc, char **argv)
 	shrink_table();
 	if (absolute_percpu)
 		make_percpus_absolute();
+	sort_symbols();
 	if (base_relative)
 		record_relative_base();
-	sort_symbols();
 	optimize_token_table();
 	write_src();
 
-- 
2.17.1
