Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49453 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbfKWQFB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:01 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 16/16] scripts/kallsyms: remove redundant initializers
Date: Sun, 24 Nov 2019 01:04:44 +0900
Message-Id: <20191123160444.11251-17-yamada.masahiro@socionext.com>
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

These are set to zero without the explicit initializers.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index b9b1a4cf1c65..fb55f262f42d 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -57,9 +57,9 @@ static struct addr_range percpu_range = {
 
 static struct sym_entry *table;
 static unsigned int table_size, table_cnt;
-static int all_symbols = 0;
-static int absolute_percpu = 0;
-static int base_relative = 0;
+static int all_symbols;
+static int absolute_percpu;
+static int base_relative;
 
 static int token_profit[0x10000];
 
-- 
2.17.1
