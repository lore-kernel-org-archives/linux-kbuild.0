Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:39550 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbfKWN17 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 08:27:59 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 02/16] scripts/kallsyms: fix definitely-lost memory leak
Date: Sat, 23 Nov 2019 22:27:13 +0900
Message-Id: <20191123132727.30151-3-yamada.masahiro@socionext.com>
In-Reply-To: <20191123132727.30151-1-yamada.masahiro@socionext.com>
References: <20191123132727.30151-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

build_initial_tok_table() overwrites unused sym_entry to shrink the
table size. Before the entry is overwritten, table[i].sym must be freed
since it is malloc'ed data.

This fixes the 'definitely lost' report from valgrind. I ran valgrind
against x86_64_defconfig of v5.4-rc8 kernel, and here is the summary:

[Before the fix]

  LEAK SUMMARY:
     definitely lost: 53,184 bytes in 2,874 blocks

[After the fix]

  LEAK SUMMARY:
     definitely lost: 0 bytes in 0 blocks

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 918c2ba071b5..79641874d860 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -487,6 +487,8 @@ static void build_initial_tok_table(void)
 				table[pos] = table[i];
 			learn_symbol(table[pos].sym, table[pos].len);
 			pos++;
+		} else {
+			free(table[i].sym);
 		}
 	}
 	table_cnt = pos;
-- 
2.17.1
