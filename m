Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:47408 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727396AbfBDByi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Feb 2019 20:54:38 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/3] kallsyms: include <asm/bitsperlong.h> instead of <asm/types.h>
Date: Mon,  4 Feb 2019 10:53:18 +0900
Message-Id: <1549245198-6182-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1549245198-6182-1-git-send-email-yamada.masahiro@socionext.com>
References: <1549245198-6182-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Jan Beulich <JBeulich@suse.com>, nixiaoming <nixiaoming@huawei.com>, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Mathias Krause <minipli@googlemail.com>

<asm/bitsperlong.h> is enough to include the definition of
BITS_PER_LONG.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index f1b5749..03ff265 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -331,7 +331,7 @@ static void write_src(void)
 	unsigned int *markers;
 	char buf[KSYM_NAME_LEN];
 
-	printf("#include <asm/types.h>\n");
+	printf("#include <asm/bitsperlong.h>\n");
 	printf("#if BITS_PER_LONG == 64\n");
 	printf("#define PTR .quad\n");
 	printf("#define ALGN .balign 8\n");
-- 
2.7.4
