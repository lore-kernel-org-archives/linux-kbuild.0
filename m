Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from szxga03-in.huawei.com ([119.145.14.66]:35888 "EHLO
	szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753280AbbIWJeK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Sep 2015 05:34:10 -0400
From: Wang Long <long.wanglong@huawei.com>
Subject: [PATCH] kselftest: add cleankselftest rule
Date: Wed, 23 Sep 2015 09:33:38 +0000
Message-ID: <1443000818-118964-1-git-send-email-long.wanglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: shuahkh@osg.samsung.com, mmarek@suse.com
Cc: long.wanglong@huawei.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, wanglong@laoqinren.net, peifeiyue@huawei.com

We use

    $make TARGETS="size timers" kselftest

to build and run selftests. but there is no rule
for us to clean the kselftest generated files.

This patch add the rules, for example:

	$ make TARGETS="size timers" cleankselftest

can clean all kselftst generated files.

Signed-off-by: Wang Long <long.wanglong@huawei.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 84f4b31..c25d139 100644
--- a/Makefile
+++ b/Makefile
@@ -1075,6 +1075,9 @@ PHONY += kselftest
 kselftest:
 	$(Q)$(MAKE) -C tools/testing/selftests run_tests
 
+cleankselftest:
+	$(Q)$(MAKE) -C tools/testing/selftests clean
+
 # ---------------------------------------------------------------------------
 # Modules
 
@@ -1282,6 +1285,7 @@ help:
 	@echo  '  kselftest       - Build and run kernel selftest (run as root)'
 	@echo  '                    Build, install, and boot kernel before'
 	@echo  '                    running kselftest on it'
+	@echo  '  cleankselftest  - Remove all generated kselftest files'
 	@echo  ''
 	@echo  'Kernel packaging:'
 	@$(MAKE) $(build)=$(package-dir) help
-- 
1.8.3.4

