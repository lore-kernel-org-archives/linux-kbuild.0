Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49451 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbfKWQFB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:01 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 06/16] scripts/kallsyms: remove unneeded length check for prefix matching
Date: Sun, 24 Nov 2019 01:04:34 +0900
Message-Id: <20191123160444.11251-7-yamada.masahiro@socionext.com>
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

l <= strlen(sym_name) is unnecessary for prefix matching.
strncmp() will do.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 14a50c8d3f34..a57636c6f84f 100644
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
