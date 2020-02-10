Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:65330 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbgBJQT3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Feb 2020 11:19:29 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] scripts/kallsyms: fix memory corruption caused by write over-run
Date: Tue, 11 Feb 2020 01:18:52 +0900
Message-Id: <20200210161852.842-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: youling257 <youling257@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>

scripts/kallsyms crashes because memcpy() writes one more byte than
allocated.

Fixes: 8d60526999aa ("scripts/kallsyms: change table to store (strcut sym_entry *)")
Reported-by: youling257 <youling257@gmail.com>
Reported-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kallsyms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index a566d8201b56..0133dfaaf352 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -210,7 +210,7 @@ static struct sym_entry *read_symbol(FILE *in)
 
 	len = strlen(name) + 1;
 
-	sym = malloc(sizeof(*sym) + len);
+	sym = malloc(sizeof(*sym) + len + 1);
 	if (!sym) {
 		fprintf(stderr, "kallsyms failure: "
 			"unable to allocate required amount of memory\n");
@@ -219,7 +219,7 @@ static struct sym_entry *read_symbol(FILE *in)
 	sym->addr = addr;
 	sym->len = len;
 	sym->sym[0] = type;
-	memcpy(sym_name(sym), name, len);
+	strcpy(sym_name(sym), name);
 	sym->percpu_absolute = 0;
 
 	return sym;
-- 
2.17.1
