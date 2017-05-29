Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([59.151.112.132]:32145 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750854AbdE2DS6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 May 2017 23:18:58 -0400
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: [PATCH] Top Makefile: tiny correction on `make help`
Date: Mon, 29 May 2017 11:21:01 +0800
Message-ID: <1496028061-19285-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The help info of `make -C=1` is little confusing, make it clear.

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index efa267a..b34a34d 100644
--- a/Makefile
+++ b/Makefile
@@ -1417,7 +1417,7 @@ help:
 	@echo  '  make V=0|1 [targets] 0 => quiet build (default), 1 => verbose build'
 	@echo  '  make V=2   [targets] 2 => give reason for rebuild of target'
 	@echo  '  make O=dir [targets] Locate all output files in "dir", including .config'
-	@echo  '  make C=1   [targets] Check all c source with $$CHECK (sparse by default)'
+	@echo  '  make C=1   [targets] Check re-compiled c source only with $$CHECK (sparse by default)'
 	@echo  '  make C=2   [targets] Force check of all c source with $$CHECK'
 	@echo  '  make RECORDMCOUNT_WARN=1 [targets] Warn about ignored mcount sections'
 	@echo  '  make W=n   [targets] Enable extra gcc checks, n=1,2,3 where'
-- 
2.1.0



