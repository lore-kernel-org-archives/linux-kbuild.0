Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:39547 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbfKWN2A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 08:28:00 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 14/16] scripts/kallsyms: check no valid symbol earlier
Date: Sat, 23 Nov 2019 22:27:25 +0900
Message-Id: <20191123132727.30151-15-yamada.masahiro@socionext.com>
In-Reply-To: <20191123132727.30151-1-yamada.masahiro@socionext.com>
References: <20191123132727.30151-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

insert_real_symbols_in_table() does not touch table_cnt, so the
no valid symbol check can be moved before it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 144f43363c4d..919cb45ce9db 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -608,14 +608,14 @@ static void optimize_token_table(void)
 {
 	build_initial_tok_table();
 
-	insert_real_symbols_in_table();
-
 	/* When valid symbol is not registered, exit to error */
 	if (!table_cnt) {
 		fprintf(stderr, "No valid symbol.\n");
 		exit(1);
 	}
 
+	insert_real_symbols_in_table();
+
 	optimize_result();
 }
 
-- 
2.17.1
