Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:39548 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbfKWN2B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 08:28:01 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 13/16] scripts/kallsyms: make check_symbol_range() void function
Date: Sat, 23 Nov 2019 22:27:24 +0900
Message-Id: <20191123132727.30151-14-yamada.masahiro@socionext.com>
In-Reply-To: <20191123132727.30151-1-yamada.masahiro@socionext.com>
References: <20191123132727.30151-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

There is no more reason to check the return value of
check_symbol_range().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 21f4d347f371..144f43363c4d 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -155,8 +155,8 @@ static bool is_ignored_symbol(const char *name, char type)
 	return false;
 }
 
-static int check_symbol_range(const char *sym, unsigned long long addr,
-			      struct addr_range *ranges, int entries)
+static void check_symbol_range(const char *sym, unsigned long long addr,
+			       struct addr_range *ranges, int entries)
 {
 	size_t i;
 	struct addr_range *ar;
@@ -166,14 +166,12 @@ static int check_symbol_range(const char *sym, unsigned long long addr,
 
 		if (strcmp(sym, ar->start_sym) == 0) {
 			ar->start = addr;
-			return 0;
+			return;
 		} else if (strcmp(sym, ar->end_sym) == 0) {
 			ar->end = addr;
-			return 0;
+			return;
 		}
 	}
-
-	return 1;
 }
 
 static int read_symbol(FILE *in, struct sym_entry *s)
@@ -200,9 +198,8 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 	/* Ignore most absolute/undefined (?) symbols. */
 	if (strcmp(sym, "_text") == 0)
 		_text = s->addr;
-	else if (check_symbol_range(sym, s->addr, text_ranges,
-				    ARRAY_SIZE(text_ranges)) == 0)
-		/* nothing to do */;
+
+	check_symbol_range(sym, s->addr, text_ranges, ARRAY_SIZE(text_ranges));
 
 	/* include the type field in the symbol name, so that it gets
 	 * compressed together */
-- 
2.17.1
