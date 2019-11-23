Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:39586 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbfKWN2B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 08:28:01 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 12/16] scripts/kallsyms: move ignored symbol types to is_ignored_symbol()
Date: Sat, 23 Nov 2019 22:27:23 +0900
Message-Id: <20191123132727.30151-13-yamada.masahiro@socionext.com>
In-Reply-To: <20191123132727.30151-1-yamada.masahiro@socionext.com>
References: <20191123132727.30151-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Collect the ignored patterns to is_ignored_symbol().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 63473924d4de..21f4d347f371 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -137,6 +137,21 @@ static bool is_ignored_symbol(const char *name, char type)
 			return true;
 	}
 
+	if (type == 'U' || type == 'u')
+		return true;
+	/* exclude debugging symbols */
+	if (type == 'N' || type == 'n')
+		return true;
+
+	if (toupper(type) == 'A') {
+		/* Keep these useful absolute symbols */
+		if (strcmp(name, "__kernel_syscall_via_break") &&
+		    strcmp(name, "__kernel_syscall_via_epc") &&
+		    strcmp(name, "__kernel_sigtramp") &&
+		    strcmp(name, "__gp"))
+			return true;
+	}
+
 	return false;
 }
 
@@ -188,21 +203,6 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 	else if (check_symbol_range(sym, s->addr, text_ranges,
 				    ARRAY_SIZE(text_ranges)) == 0)
 		/* nothing to do */;
-	else if (toupper(stype) == 'A')
-	{
-		/* Keep these useful absolute symbols */
-		if (strcmp(sym, "__kernel_syscall_via_break") &&
-		    strcmp(sym, "__kernel_syscall_via_epc") &&
-		    strcmp(sym, "__kernel_sigtramp") &&
-		    strcmp(sym, "__gp"))
-			return -1;
-
-	}
-	else if (toupper(stype) == 'U')
-		return -1;
-	/* exclude debugging symbols */
-	else if (stype == 'N' || stype == 'n')
-		return -1;
 
 	/* include the type field in the symbol name, so that it gets
 	 * compressed together */
-- 
2.17.1
