Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:39536 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbfKWN2A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 08:28:00 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 07/16] scripts/kallsyms: replace prefix_underscores_count() with strspn()
Date: Sat, 23 Nov 2019 22:27:18 +0900
Message-Id: <20191123132727.30151-8-yamada.masahiro@socionext.com>
In-Reply-To: <20191123132727.30151-1-yamada.masahiro@socionext.com>
References: <20191123132727.30151-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

You can do equivalent with strspn(). I do not see noticeable performance
difference.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 7b00b4030be4..a007d901c3a5 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -653,16 +653,6 @@ static int may_be_linker_script_provide_symbol(const struct sym_entry *se)
 	return 0;
 }
 
-static int prefix_underscores_count(const char *str)
-{
-	const char *tail = str;
-
-	while (*tail == '_')
-		tail++;
-
-	return tail - str;
-}
-
 static int compare_symbols(const void *a, const void *b)
 {
 	const struct sym_entry *sa;
@@ -691,8 +681,8 @@ static int compare_symbols(const void *a, const void *b)
 		return wa - wb;
 
 	/* sort by the number of prefix underscores */
-	wa = prefix_underscores_count(sym_name(sa));
-	wb = prefix_underscores_count(sym_name(sb));
+	wa = strspn(sym_name(sa), "_");
+	wb = strspn(sym_name(sb), "_");
 	if (wa != wb)
 		return wa - wb;
 
-- 
2.17.1
