Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:34681
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751589AbdILXxP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 19:53:15 -0400
From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 01/11] Makefile: kselftest and kselftest-clean fail for make O=dir case
Date: Tue, 12 Sep 2017 17:52:54 -0600
Message-Id: <be0b069dde5b07b543498e274c3a9cc0c6e817c0.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com, shuah@kernel.org, tglx@linutronix.de, mingo@redhat.com, peterz@infradead.org, bamvor.zhangjian@linaro.org, emilio.lopez@collabora.co.uk, corbet@lwn.net
Cc: Shuah Khan <shuahkh@osg.samsung.com>, tytso@mit.edu, ebiederm@xmission.com, Tim.Bird@sony.com, gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

kselftest and kselftest-clean targets fail when object directory is
specified to relocate objects. Fix it so it can find the source tree
to build from.

make O=/tmp/kselftest_top kselftest

make[1]: Entering directory '/tmp/kselftest_top'
make[2]: Entering directory '/tmp/kselftest_top'
make[2]: *** tools/testing/selftests: No such file or directory.  Stop.
make[2]: Leaving directory '/tmp/kselftest_top'
./linux-kselftest/Makefile:1185: recipe for target
'kselftest' failed
make[1]: *** [kselftest] Error 2
make[1]: Leaving directory '/tmp/kselftest_top'
Makefile:145: recipe for target 'sub-make' failed
make: *** [sub-make] Error 2

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 Makefile | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index eccb8d704c23..6a85322d0b3e 100644
--- a/Makefile
+++ b/Makefile
@@ -1180,13 +1180,18 @@ headers_check: headers_install
 # ---------------------------------------------------------------------------
 # Kernel selftest
 
+PHONY += __kselftest
+	kselftest_src := tools/testing/selftests
+	ifneq ($(KBUILD_SRC),)
+		kselftest_src := $(KBUILD_SRC)/tools/testing/selftests
+	endif
 PHONY += kselftest
-kselftest:
-	$(Q)$(MAKE) -C tools/testing/selftests run_tests
+kselftest: __kselftest
+	$(Q)$(MAKE) -C $(kselftest_src) run_tests
 
 PHONY += kselftest-clean
-kselftest-clean:
-	$(Q)$(MAKE) -C tools/testing/selftests clean
+kselftest-clean: __kselftest
+	$(Q)$(MAKE) -C $(kselftest_src) clean
 
 PHONY += kselftest-merge
 kselftest-merge:
-- 
2.11.0

