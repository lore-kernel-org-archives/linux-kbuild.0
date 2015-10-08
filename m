Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from szxga03-in.huawei.com ([119.145.14.66]:62380 "EHLO
	szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750951AbbJHClI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 7 Oct 2015 22:41:08 -0400
From: Wang Long <long.wanglong@huawei.com>
Subject: [PATCH v2] kselftest: add kselftest-clean rule
Date: Thu, 8 Oct 2015 02:41:18 +0000
Message-ID: <1444272078-7087-1-git-send-email-long.wanglong@huawei.com>
In-Reply-To: <560E9242.9000402@osg.samsung.com>
References: <560E9242.9000402@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: shuahkh@osg.samsung.com
Cc: mpe@ellerman.id.au, mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, peifeiyue@huawei.com

We use

    $make TARGETS="size timers" kselftest

to build and run selftests. but there is no rule
for us to clean the kselftest generated files.

This patch add the rules, for example:

	$ make TARGETS="size timers" kselftest-clean

can clean all kselftest generated files.

Signed-off-by: Wang Long <long.wanglong@huawei.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 1d341eb..3edd7b3 100644
--- a/Makefile
+++ b/Makefile
@@ -1075,6 +1075,9 @@ PHONY += kselftest
 kselftest:
 	$(Q)$(MAKE) -C tools/testing/selftests run_tests
 
+kselftest-clean:
+	$(Q)$(MAKE) -C tools/testing/selftests clean
+
 # ---------------------------------------------------------------------------
 # Modules
 
@@ -1282,6 +1285,7 @@ help:
 	@echo  '  kselftest       - Build and run kernel selftest (run as root)'
 	@echo  '                    Build, install, and boot kernel before'
 	@echo  '                    running kselftest on it'
+	@echo  '  kselftest-clean - Remove all generated kselftest files'
 	@echo  ''
 	@echo  'Kernel packaging:'
 	@$(MAKE) $(build)=$(package-dir) help
-- 
1.8.3.4

