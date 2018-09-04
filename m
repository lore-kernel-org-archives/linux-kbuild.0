Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:31383 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbeIDFIE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Sep 2018 01:08:04 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kallsyms: remove left-over Blackfin code
Date: Tue,  4 Sep 2018 09:42:24 +0900
Message-Id: <1536021744-2552-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Aaron Wu <Aaron.Wu@analog.com>, Bryan Wu <cooloney@gmail.com>, Robin Getz <robin.getz@analog.com>, Rusty Russell <rusty@rustcorp.com.au>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

These symbols were added by commit 028f042613c3 ("kallsyms: support
kernel symbols in Blackfin on-chip memory") for Blackfin.

The Blackfin support was removed by commit 4ba66a976072 ("arch: remove
blackfin port").

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index a9186a9..50af068 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -48,8 +48,6 @@ static unsigned long long relative_base;
 static struct addr_range text_ranges[] = {
 	{ "_stext",     "_etext"     },
 	{ "_sinittext", "_einittext" },
-	{ "_stext_l1",  "_etext_l1"  },	/* Blackfin on-chip L1 inst SRAM */
-	{ "_stext_l2",  "_etext_l2"  },	/* Blackfin on-chip L2 SRAM */
 };
 #define text_range_text     (&text_ranges[0])
 #define text_range_inittext (&text_ranges[1])
-- 
2.7.4
