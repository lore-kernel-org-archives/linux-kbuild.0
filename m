Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:56771
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752309AbdHRVln (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Aug 2017 17:41:43 -0400
From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH] Makefile: add kselftest-clean to PHOMY target list
Date: Fri, 18 Aug 2017 15:41:38 -0600
Message-Id: <20170818214138.2020-1-shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

kselftest-clean isn't in the PHONY target list. Add it.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index b4fb9a1d1594..eccb8d704c23 100644
--- a/Makefile
+++ b/Makefile
@@ -1184,6 +1184,7 @@ PHONY += kselftest
 kselftest:
 	$(Q)$(MAKE) -C tools/testing/selftests run_tests
 
+PHONY += kselftest-clean
 kselftest-clean:
 	$(Q)$(MAKE) -C tools/testing/selftests clean
 
-- 
2.11.0

