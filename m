Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:39539 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726759AbfKWN2A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 08:28:00 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 04/16] scripts/kallsyms: remove redundant is_arm_mapping_symbol()
Date: Sat, 23 Nov 2019 22:27:15 +0900
Message-Id: <20191123132727.30151-5-yamada.masahiro@socionext.com>
In-Reply-To: <20191123132727.30151-1-yamada.masahiro@socionext.com>
References: <20191123132727.30151-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Since commit 6f00df24ee39 ("[PATCH] Strip local symbols from kallsyms"),
all symbols starting '$' are ignored.

is_arm_mapping_symbol() particularly ignores $a, $t, etc. but it is
redundant.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 0959e1de381c..265475d3cffb 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -74,16 +74,6 @@ static void usage(void)
 	exit(1);
 }
 
-/*
- * This ignores the intensely annoying "mapping symbols" found
- * in ARM ELF files: $a, $t and $d.
- */
-static int is_arm_mapping_symbol(const char *str)
-{
-	return str[0] == '$' && strchr("axtd", str[1])
-	       && (str[2] == '\0' || str[2] == '.');
-}
-
 static int check_symbol_range(const char *sym, unsigned long long addr,
 			      struct addr_range *ranges, int entries)
 {
@@ -139,10 +129,13 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 			return -1;
 
 	}
-	else if (toupper(stype) == 'U' ||
-		 is_arm_mapping_symbol(sym))
+	else if (toupper(stype) == 'U')
 		return -1;
-	/* exclude also MIPS ELF local symbols ($L123 instead of .L123) */
+	/*
+	 * Ignore generated symbols such as:
+	 *  - mapping symbols in ARM ELF files ($a, $t, and $d)
+	 *  - MIPS ELF local symbols ($L123 instead of .L123)
+	 */
 	else if (sym[0] == '$')
 		return -1;
 	/* exclude debugging symbols */
-- 
2.17.1
