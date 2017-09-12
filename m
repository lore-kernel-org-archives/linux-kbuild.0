Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:34795
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751787AbdILXxa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 19:53:30 -0400
From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 08/11] selftests: sync: kselftest and kselftest-clean fail for make O=dir case
Date: Tue, 12 Sep 2017 17:53:01 -0600
Message-Id: <76d92d77e631edef931a130ca480c102f2bc74c3.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com, shuah@kernel.org, tglx@linutronix.de, mingo@redhat.com, peterz@infradead.org, bamvor.zhangjian@linaro.org, emilio.lopez@collabora.co.uk, corbet@lwn.net
Cc: Shuah Khan <shuahkh@osg.samsung.com>, tytso@mit.edu, ebiederm@xmission.com, Tim.Bird@sony.com, gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

sync test fails to build when object directory is specified to relocate
object files. Fix it to specify the correct path. Fix clean target to
remove objects. Also include simplified logic to use TEST_CUSTOM_PROGS
in build and clean targets instead of hard-coding the test name each
time.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/sync/Makefile | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/sync/Makefile b/tools/testing/selftests/sync/Makefile
index 43db80b71e80..8e04d0afcbd7 100644
--- a/tools/testing/selftests/sync/Makefile
+++ b/tools/testing/selftests/sync/Makefile
@@ -2,14 +2,16 @@ CFLAGS += -O2 -g -std=gnu89 -pthread -Wall -Wextra
 CFLAGS += -I../../../../usr/include/
 LDFLAGS += -pthread
 
-# lib.mk TEST_CUSTOM_PROGS var is for custome tests that need special
+.PHONY: all clean
+
+include ../lib.mk
+
+# lib.mk TEST_CUSTOM_PROGS var is for custom tests that need special
 # build rules. lib.mk will run and install them.
-TEST_CUSTOM_PROGS = sync_test
 
+TEST_CUSTOM_PROGS := $(OUTPUT)/sync_test
 all: $(TEST_CUSTOM_PROGS)
 
-include ../lib.mk
-
 OBJS = sync_test.o sync.o
 
 TESTS += sync_alloc.o
@@ -20,6 +22,16 @@ TESTS += sync_stress_parallelism.o
 TESTS += sync_stress_consumer.o
 TESTS += sync_stress_merge.o
 
-sync_test: $(OBJS) $(TESTS)
+OBJS := $(patsubst %,$(OUTPUT)/%,$(OBJS))
+TESTS := $(patsubst %,$(OUTPUT)/%,$(TESTS))
+
+$(TEST_CUSTOM_PROGS): $(TESTS) $(OBJS)
+	$(CC) -o $(TEST_CUSTOM_PROGS) $(OBJS) $(TESTS) $(CFLAGS) $(LDFLAGS)
+
+$(OBJS): $(OUTPUT)/%.o: %.c
+	$(CC) -c $^ -o $@
+
+$(TESTS): $(OUTPUT)/%.o: %.c
+	$(CC) -c $^ -o $@
 
-EXTRA_CLEAN := sync_test $(OBJS) $(TESTS)
+EXTRA_CLEAN := $(TEST_CUSTOM_PROGS) $(OBJS) $(TESTS)
-- 
2.11.0

