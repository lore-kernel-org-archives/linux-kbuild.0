Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from resqmta-ch2-12v.sys.comcast.net ([69.252.207.44]:41044 "EHLO
	resqmta-ch2-12v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932407AbbAFTsw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 6 Jan 2015 14:48:52 -0500
From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH v4 09/20] selftests/memory-hotplug: add install target to enable test install
Date: Tue,  6 Jan 2015 12:43:23 -0700
Message-Id: <8576f564ad9b944e7efe53f5c038ad69c6f392d5.1420571615.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1420571615.git.shuahkh@osg.samsung.com>
References: <cover.1420571615.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1420571615.git.shuahkh@osg.samsung.com>
References: <cover.1420571615.git.shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz, gregkh@linuxfoundation.org, akpm@linux-foundation.org, rostedt@goodmis.org, mingo@redhat.com, davem@davemloft.net, keescook@chromium.org, tranmanphong@gmail.com, mpe@ellerman.id.au, cov@codeaurora.org, dh.herrmann@gmail.com, hughd@google.com, bobby.prani@gmail.com, serge.hallyn@ubuntu.com, ebiederm@xmission.com, tim.bird@sonymobile.com, josh@joshtriplett.org, koct9i@gmail.com, masami.hiramatsu.pt@hitachi.com
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, netdev@vger.kernel.org

Add a new make target to enable installing test. This target
installs test in the kselftest install location and add to the
kselftest script to run the test. Install target can be run
only from top level kernel source directory.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/memory-hotplug/Makefile            | 14 ++++++++++++--
 .../memory-hotplug/{on-off-test.sh => mem-on-off-test.sh}  |  0
 2 files changed, 12 insertions(+), 2 deletions(-)
 rename tools/testing/selftests/memory-hotplug/{on-off-test.sh => mem-on-off-test.sh} (100%)

diff --git a/tools/testing/selftests/memory-hotplug/Makefile b/tools/testing/selftests/memory-hotplug/Makefile
index d46b8d4..3bb0a99 100644
--- a/tools/testing/selftests/memory-hotplug/Makefile
+++ b/tools/testing/selftests/memory-hotplug/Makefile
@@ -1,9 +1,19 @@
+TEST_STR=/bin/bash ./mem-on-off-test.sh -r 2 || echo 'memory-hotplug selftests: [FAIL]'
+
 all:
 
+install:
+ifdef INSTALL_KSFT_PATH
+	install ./mem-on-off-test.sh $(INSTALL_KSFT_PATH)/mem-on-off-test.sh
+	@echo "$(TEST_STR)" >> $(KSELFTEST) >> $(KSELFTEST)
+else
+	@echo "Run make kselftest_install in top level source directory"
+endif
+
 run_tests:
-	@/bin/bash ./on-off-test.sh -r 2 || echo "memory-hotplug selftests: [FAIL]"
+	@$(TEST_STR)
 
 run_full_test:
-	@/bin/bash ./on-off-test.sh || echo "memory-hotplug selftests: [FAIL]"
+	@/bin/bash ./mem-on-off-test.sh || echo "memory-hotplug selftests: [FAIL]"
 
 clean:
diff --git a/tools/testing/selftests/memory-hotplug/on-off-test.sh b/tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
similarity index 100%
rename from tools/testing/selftests/memory-hotplug/on-off-test.sh
rename to tools/testing/selftests/memory-hotplug/mem-on-off-test.sh
-- 
2.1.0

