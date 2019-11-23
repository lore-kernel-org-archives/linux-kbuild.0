Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:39535 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbfKWN2A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 08:28:00 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 08/16] scripts/kallsyms: make find_token() return (unsigned char *)
Date: Sat, 23 Nov 2019 22:27:19 +0900
Message-Id: <20191123132727.30151-9-yamada.masahiro@socionext.com>
In-Reply-To: <20191123132727.30151-1-yamada.masahiro@socionext.com>
References: <20191123132727.30151-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The callers of this function expect (unsigned char *). I do not see
a good reason to make this function return (void *).

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index a007d901c3a5..c4f7f20ecfb7 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -489,7 +489,8 @@ static void build_initial_tok_table(void)
 	table_cnt = pos;
 }
 
-static void *find_token(unsigned char *str, int len, unsigned char *token)
+static unsigned char *find_token(unsigned char *str, int len,
+				 unsigned char *token)
 {
 	int i;
 
-- 
2.17.1
