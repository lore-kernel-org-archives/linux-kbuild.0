Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49446 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726784AbfKWQFB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:01 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 09/16] scripts/kallsyms: make find_token() return (unsigned char *)
Date: Sun, 24 Nov 2019 01:04:37 +0900
Message-Id: <20191123160444.11251-10-yamada.masahiro@socionext.com>
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The callers of this function expect (unsigned char *). I do not see
a good reason to make this function return (void *).

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 89cc7c098c51..274a77bfbd63 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -503,7 +503,8 @@ static void build_initial_tok_table(void)
 		learn_symbol(table[i].sym, table[i].len);
 }
 
-static void *find_token(unsigned char *str, int len, unsigned char *token)
+static unsigned char *find_token(unsigned char *str, int len,
+				 unsigned char *token)
 {
 	int i;
 
-- 
2.17.1
