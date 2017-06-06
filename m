Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([59.151.112.132]:48908 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751246AbdFFJFa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Jun 2017 05:05:30 -0400
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: [PATCH v2] Kbuild: tiny correction on `make help`
Date: Tue, 6 Jun 2017 17:07:53 +0800
Message-ID: <1496740073-3320-1-git-send-email-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: mmarek@suse.com, yamada.masahiro@socionext.com

The help info of `make C=1` is little confusing, make it clear.

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index efa267a..bc9eb36 100644
--- a/Makefile
+++ b/Makefile
@@ -1417,7 +1417,7 @@ help:
 	@echo  '  make V=0|1 [targets] 0 => quiet build (default), 1 => verbose build'
 	@echo  '  make V=2   [targets] 2 => give reason for rebuild of target'
 	@echo  '  make O=dir [targets] Locate all output files in "dir", including .config'
-	@echo  '  make C=1   [targets] Check all c source with $$CHECK (sparse by default)'
+	@echo  '  make C=1   [targets] Check re-compiled c source with $$CHECK (sparse by default)'
 	@echo  '  make C=2   [targets] Force check of all c source with $$CHECK'
 	@echo  '  make RECORDMCOUNT_WARN=1 [targets] Warn about ignored mcount sections'
 	@echo  '  make W=n   [targets] Enable extra gcc checks, n=1,2,3 where'
-- 
2.1.0



