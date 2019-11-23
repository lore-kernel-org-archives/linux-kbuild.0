Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:39549 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726802AbfKWN2A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 08:28:00 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 05/16] scripts/kallsyms: remove unneeded length check for prefix matching
Date: Sat, 23 Nov 2019 22:27:16 +0900
Message-Id: <20191123132727.30151-6-yamada.masahiro@socionext.com>
In-Reply-To: <20191123132727.30151-1-yamada.masahiro@socionext.com>
References: <20191123132727.30151-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

l <= strlen(sym_name) is unnecessary for prefix matching.
strncmp() will do.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 265475d3cffb..d06f373b3a96 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -246,8 +246,7 @@ static int symbol_valid(struct sym_entry *s)
 	for (i = 0; special_prefixes[i]; i++) {
 		int l = strlen(special_prefixes[i]);
 
-		if (l <= strlen(sym_name) &&
-		    strncmp(sym_name, special_prefixes[i], l) == 0)
+		if (strncmp(sym_name, special_prefixes[i], l) == 0)
 			return 0;
 	}
 
-- 
2.17.1
