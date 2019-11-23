Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49456 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbfKWQFC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:02 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 12/16] scripts/kallsyms: move more patterns to the ignored_prefixes array
Date: Sun, 24 Nov 2019 01:04:40 +0900
Message-Id: <20191123160444.11251-13-yamada.masahiro@socionext.com>
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Refactoring for shortening the code.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 843615c1d384..04a1dd16edcf 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -105,6 +105,8 @@ static bool is_ignored_symbol(const char *name, char type)
 	};
 
 	static const char * const ignored_prefixes[] = {
+		"$",			/* local symbols for ARM, MIPS, etc. */
+		".LASANPC",		/* s390 kasan local symbols */
 		"__crc_",		/* modversions */
 		"__efistub_",		/* arm64 EFI stub namespace */
 		NULL
@@ -198,19 +200,9 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 	}
 	else if (toupper(stype) == 'U')
 		return -1;
-	/*
-	 * Ignore generated symbols such as:
-	 *  - mapping symbols in ARM ELF files ($a, $t, and $d)
-	 *  - MIPS ELF local symbols ($L123 instead of .L123)
-	 */
-	else if (sym[0] == '$')
-		return -1;
 	/* exclude debugging symbols */
 	else if (stype == 'N' || stype == 'n')
 		return -1;
-	/* exclude s390 kasan local symbols */
-	else if (!strncmp(sym, ".LASANPC", 8))
-		return -1;
 
 	/* include the type field in the symbol name, so that it gets
 	 * compressed together */
-- 
2.17.1
