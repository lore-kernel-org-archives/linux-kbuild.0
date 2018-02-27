Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:31275 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751952AbeB0IQZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Feb 2018 03:16:25 -0500
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: [PATCH] kbuild/kallsyms: trivial typo fix
Date: Tue, 27 Feb 2018 16:16:19 +0800
Message-ID: <20180227081619.23935-1-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: michal.lkml@markovi.net, yamada.masahiro@socionext.com

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
I guess this belongs to kbuild though get_maintainer.pl doesn't tell me that.

 scripts/kallsyms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 9ee9bf7fd1a2..65792650c630 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -595,7 +595,7 @@ static void optimize_result(void)
 		 * original char code */
 		if (!best_table_len[i]) {
 
-			/* find the token with the breates profit value */
+			/* find the token with the best profit value */
 			best = find_best_token();
 			if (token_profit[best] == 0)
 				break;
-- 
2.14.3



