Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:34699
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751405AbdILXxQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 19:53:16 -0400
From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 02/11] selftests: lib.mk: kselftest and kselftest-clean fail for make O=dir case
Date: Tue, 12 Sep 2017 17:52:55 -0600
Message-Id: <dd63fd5880f99775267c5e19c873903355b1c78c.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com, shuah@kernel.org, tglx@linutronix.de, mingo@redhat.com, peterz@infradead.org, bamvor.zhangjian@linaro.org, emilio.lopez@collabora.co.uk, corbet@lwn.net
Cc: Shuah Khan <shuahkh@osg.samsung.com>, tytso@mit.edu, ebiederm@xmission.com, Tim.Bird@sony.com, gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

kselftest and kselftest-clean targets fail when object directory is
specified to relocate objects. Main Makefile make O= path clears the
built-in defines LINK.c, COMPILE.S, LINK.S, and RM that are used in
lib.mk to build and clean targets. Define them.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/lib.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 693616651da5..e779c8758e15 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -7,6 +7,7 @@ OUTPUT := $(shell pwd)
 endif
 
 TEST_GEN_PROGS := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_PROGS))
+TEST_GEN_PROGS_EXTENDED := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_PROGS_EXTENDED))
 TEST_GEN_FILES := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_FILES))
 
 all: $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED) $(TEST_GEN_FILES)
@@ -62,6 +63,11 @@ endef
 emit_tests:
 	$(EMIT_TESTS)
 
+# define if isn't already. It is undefined in make O= case.
+ifeq ($(RM),)
+RM := rm -f
+endif
+
 define CLEAN
 	$(RM) -r $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED) $(TEST_GEN_FILES) $(EXTRA_CLEAN)
 endef
@@ -69,6 +75,15 @@ endef
 clean:
 	$(CLEAN)
 
+# When make O= with kselftest target from main level
+# the following aren't defined.
+#
+ifneq ($(KBUILD_SRC),)
+LINK.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
+COMPILE.S = $(CC) $(ASFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c
+LINK.S = $(CC) $(ASFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH)
+endif
+
 $(OUTPUT)/%:%.c
 	$(LINK.c) $^ $(LDLIBS) -o $@
 
-- 
2.11.0

