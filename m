Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout.easymail.ca ([64.68.201.169]:50516 "EHLO
	mailout.easymail.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752037AbaKDRSO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Nov 2014 12:18:14 -0500
From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 09/20] selftests/ipc: add install target to enable installing test
Date: Tue,  4 Nov 2014 10:11:05 -0700
Message-Id: <3b90e49219f215a333306778fe2683e997b44ec9.1415117102.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1415117102.git.shuahkh@osg.samsung.com>
References: <cover.1415117102.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1415117102.git.shuahkh@osg.samsung.com>
References: <cover.1415117102.git.shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: gregkh@linuxfoundation.org, akpm@linux-foundation.org, mmarek@suse.cz, davem@davemloft.net, keescook@chromium.org, tranmanphong@gmail.com, dh.herrmann@gmail.com, hughd@google.com, bobby.prani@gmail.com, ebiederm@xmission.com, serge.hallyn@ubuntu.com
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, netdev@vger.kernel.org

Add a new make target to enable installing test. This target
installs test in the kselftest install location and add to the
kselftest script to run the test.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/ipc/Makefile | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/ipc/Makefile b/tools/testing/selftests/ipc/Makefile
index 74bbefd..cd1c5af 100644
--- a/tools/testing/selftests/ipc/Makefile
+++ b/tools/testing/selftests/ipc/Makefile
@@ -18,6 +18,17 @@ else
 	echo "Not an x86 target, can't build msgque selftest"
 endif
 
+install: all
+ifeq ($(ARCH),x86)
+	install ./msgque_test $(INSTALL_KSFT_PATH)
+	echo "\necho \"Start ipc msgque test ....\"" >> $(KSELFTEST)
+	echo "./msgque_test || echo \"ipc msgque test: [FAIL]\"" >> $(KSELFTEST)
+	echo "echo \"End msgque test ....\"" >> $(KSELFTEST)
+	echo "echo \"==============================\"" >> $(KSELFTEST)
+else
+	echo "Not an x86 target, can't install ipc msgque selftests"
+endif
+
 run_tests: all
 	./msgque_test
 
-- 
1.9.1

