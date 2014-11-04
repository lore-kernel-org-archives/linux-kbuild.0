Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout.easymail.ca ([64.68.201.169]:50541 "EHLO
	mailout.easymail.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752155AbaKDRSV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Nov 2014 12:18:21 -0500
From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 20/20] selftests/user: add install target to enable installing test
Date: Tue,  4 Nov 2014 10:11:16 -0700
Message-Id: <8492c16c4963938f3f289f06885ff9029478065c.1415117102.git.shuahkh@osg.samsung.com>
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
 tools/testing/selftests/user/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/user/Makefile b/tools/testing/selftests/user/Makefile
index 12c9d15..c8e3863 100644
--- a/tools/testing/selftests/user/Makefile
+++ b/tools/testing/selftests/user/Makefile
@@ -3,5 +3,12 @@
 # No binaries, but make sure arg-less "make" doesn't trigger "run_tests"
 all:
 
+install: all
+	install ./test_user_copy.sh $(INSTALL_KSFT_PATH)
+	echo "\necho \"Start user copy test ....\"" >> $(KSELFTEST)
+	echo "./test_user_copy.sh" >> $(KSELFTEST)
+	echo "echo \"End user copy test ....\"" >> $(KSELFTEST)
+	echo "echo \"==============================\"" >> $(KSELFTEST)
+
 run_tests: all
 	./test_user_copy.sh
-- 
1.9.1

