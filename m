Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:34784
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751733AbdILXx3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 19:53:29 -0400
From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 07/11] selftests: sync: use TEST_CUSTOM_PROGS instead of TEST_PROGS
Date: Tue, 12 Sep 2017 17:53:00 -0600
Message-Id: <00e68264b8ea46158a1fb2f09985d6b34595809d.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com, shuah@kernel.org, tglx@linutronix.de, mingo@redhat.com, peterz@infradead.org, bamvor.zhangjian@linaro.org, emilio.lopez@collabora.co.uk, corbet@lwn.net
Cc: Shuah Khan <shuahkh@osg.samsung.com>, tytso@mit.edu, ebiederm@xmission.com, Tim.Bird@sony.com, gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

lib.mk var TEST_CUSTOM_PROGS is for tests that need custom build
rules. TEST_PROGS is used for test shell scripts. Fix it to use
TEST_CUSTOM_PROGS. lib.mk will run and install them.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/sync/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/sync/Makefile b/tools/testing/selftests/sync/Makefile
index 4981c6b6d050..43db80b71e80 100644
--- a/tools/testing/selftests/sync/Makefile
+++ b/tools/testing/selftests/sync/Makefile
@@ -2,9 +2,11 @@ CFLAGS += -O2 -g -std=gnu89 -pthread -Wall -Wextra
 CFLAGS += -I../../../../usr/include/
 LDFLAGS += -pthread
 
-TEST_PROGS = sync_test
+# lib.mk TEST_CUSTOM_PROGS var is for custome tests that need special
+# build rules. lib.mk will run and install them.
+TEST_CUSTOM_PROGS = sync_test
 
-all: $(TEST_PROGS)
+all: $(TEST_CUSTOM_PROGS)
 
 include ../lib.mk
 
-- 
2.11.0

