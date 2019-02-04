Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:47654 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727396AbfBDByr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Feb 2019 20:54:47 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] kallsyms: add static qualifiers where missing
Date: Mon,  4 Feb 2019 10:53:16 +0900
Message-Id: <1549245198-6182-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, nixiaoming <nixiaoming@huawei.com>, Jan Beulich <JBeulich@suse.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, linux-kernel@vger.kernel.org, "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Mathias Krause <minipli@googlemail.com>

Fix the following sparse warnings:

scripts/kallsyms.c:65:5: warning: symbol 'token_profit' was not declared. Should it be static?
scripts/kallsyms.c:68:15: warning: symbol 'best_table' was not declared. Should it be static?
scripts/kallsyms.c:69:15: warning: symbol 'best_table_len' was not declared. Should it be static?

Also, remove 'inline' from is_arm_mapping_symbol(). The compiler
will inline it anyway when it is appropriate to do so.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 77cebad..fc00bb0 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -62,11 +62,11 @@ static int all_symbols = 0;
 static int absolute_percpu = 0;
 static int base_relative = 0;
 
-int token_profit[0x10000];
+static int token_profit[0x10000];
 
 /* the table that holds the result of the compression */
-unsigned char best_table[256][2];
-unsigned char best_table_len[256];
+static unsigned char best_table[256][2];
+static unsigned char best_table_len[256];
 
 
 static void usage(void)
@@ -80,7 +80,7 @@ static void usage(void)
  * This ignores the intensely annoying "mapping symbols" found
  * in ARM ELF files: $a, $t and $d.
  */
-static inline int is_arm_mapping_symbol(const char *str)
+static int is_arm_mapping_symbol(const char *str)
 {
 	return str[0] == '$' && strchr("axtd", str[1])
 	       && (str[2] == '\0' || str[2] == '.');
-- 
2.7.4
