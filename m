Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:34837
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751850AbdILXxh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 19:53:37 -0400
From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 11/11] selftests: mqueue: Use full path to run tests from Makefile
Date: Tue, 12 Sep 2017 17:53:04 -0600
Message-Id: <55c564bf16b9dfb0c7d7fab2e350db2a9e5165f5.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com, shuah@kernel.org, tglx@linutronix.de, mingo@redhat.com, peterz@infradead.org, bamvor.zhangjian@linaro.org, emilio.lopez@collabora.co.uk, corbet@lwn.net
Cc: Shuah Khan <shuahkh@osg.samsung.com>, tytso@mit.edu, ebiederm@xmission.com, Tim.Bird@sony.com, gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

Use full path including $(OUTPUT) to run tests from Makefile for
normal case when objects reside in the source tree as well as when
objects are relocated with make O=dir. In both cases $(OUTPUT) will
be set correctly by lib.mk.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/mqueue/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mqueue/Makefile b/tools/testing/selftests/mqueue/Makefile
index 79a664aeb8d7..0f5e347b068d 100644
--- a/tools/testing/selftests/mqueue/Makefile
+++ b/tools/testing/selftests/mqueue/Makefile
@@ -5,8 +5,8 @@ TEST_GEN_PROGS := mq_open_tests mq_perf_tests
 include ../lib.mk
 
 override define RUN_TESTS
-	@./mq_open_tests /test1 || echo "selftests: mq_open_tests [FAIL]"
-	@./mq_perf_tests || echo "selftests: mq_perf_tests [FAIL]"
+	$(OUTPUT)/mq_open_tests /test1 || echo "selftests: mq_open_tests [FAIL]"
+	$(OUTPUT)//mq_perf_tests || echo "selftests: mq_perf_tests [FAIL]"
 endef
 
 override define EMIT_TESTS
-- 
2.11.0

