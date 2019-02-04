Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:47475 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727396AbfBDByl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Feb 2019 20:54:41 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] kallsyms: remove unneeded memset() calls
Date: Mon,  4 Feb 2019 10:53:17 +0900
Message-Id: <1549245198-6182-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1549245198-6182-1-git-send-email-yamada.masahiro@socionext.com>
References: <1549245198-6182-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, nixiaoming <nixiaoming@huawei.com>, Jan Beulich <JBeulich@suse.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Mathias Krause <minipli@googlemail.com>

Global variables in the .bss section are zeroed out before the program
starts to run.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index fc00bb0..f1b5749 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -596,9 +596,6 @@ static void insert_real_symbols_in_table(void)
 {
 	unsigned int i, j, c;
 
-	memset(best_table, 0, sizeof(best_table));
-	memset(best_table_len, 0, sizeof(best_table_len));
-
 	for (i = 0; i < table_cnt; i++) {
 		for (j = 0; j < table[i].len; j++) {
 			c = table[i].sym[j];
-- 
2.7.4
