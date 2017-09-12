Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:34746
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751710AbdILXxZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 19:53:25 -0400
From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 05/11] selftests: watchdog: fix to use TEST_GEN_PROGS and remove clean
Date: Tue, 12 Sep 2017 17:52:58 -0600
Message-Id: <b005abce8b52867b26a2f8c025e8cac13c6bbe5b.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com, shuah@kernel.org, tglx@linutronix.de, mingo@redhat.com, peterz@infradead.org, bamvor.zhangjian@linaro.org, emilio.lopez@collabora.co.uk, corbet@lwn.net
Cc: Shuah Khan <shuahkh@osg.samsung.com>, tytso@mit.edu, ebiederm@xmission.com, Tim.Bird@sony.com, gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

TEST_PROGS should be used for test scripts that don't ned to be built.
Use TEST_GEN_PROGS instead which is intended for test executables.

Remove clean target and let the common clean take care of cleaning.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/watchdog/Makefile | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tools/testing/selftests/watchdog/Makefile b/tools/testing/selftests/watchdog/Makefile
index f863c664e3d1..ee068511fd0b 100644
--- a/tools/testing/selftests/watchdog/Makefile
+++ b/tools/testing/selftests/watchdog/Makefile
@@ -1,8 +1,3 @@
-TEST_PROGS := watchdog-test
-
-all: $(TEST_PROGS)
+TEST_GEN_PROGS := watchdog-test
 
 include ../lib.mk
-
-clean:
-	rm -fr $(TEST_PROGS)
-- 
2.11.0

