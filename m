Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f47.google.com ([209.85.166.47]:44905 "EHLO
        mail-io1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbfIZWkS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Sep 2019 18:40:18 -0400
Received: by mail-io1-f47.google.com with SMTP id j4so10806094iog.11
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Sep 2019 15:40:17 -0700 (PDT)
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2] selftests: Add kselftest-all and kselftest-install targets
Date: Thu, 26 Sep 2019 16:40:14 -0600
Message-Id: <20190926224014.28910-1-skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net, shuah@kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Add kselftest-all target to build tests from the top level
Makefile. This is to simplify kselftest use-cases for CI and
distributions where build and test systems are different.

Current kselftest target builds and runs tests on a development
system which is a developer use-case.

Add kselftest-install target to install tests from the top level
Makefile. This is to simplify kselftest use-cases for CI and
distributions where build and test systems are different.

This change addresses requests from developers and testers to add
support for installing kselftest from the main Makefile.

In addition, make the install directory the same when install is
run using "make kselftest-install" or by running kselftest_install.sh.
Also fix the INSTALL_PATH variable conflict between main Makefile and
selftests Makefile.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
Changes since v1:
- Collpased two patches that added separate targets to
  build and install into one patch using pattern rule to
  invoke all, install, and clean targets from main Makefile.

 Makefile                                     | 5 ++---
 tools/testing/selftests/Makefile             | 8 ++++++--
 tools/testing/selftests/kselftest_install.sh | 4 ++--
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index d456746da347..ec296c60c1af 100644
--- a/Makefile
+++ b/Makefile
@@ -1237,9 +1237,8 @@ PHONY += kselftest
 kselftest:
 	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
 
-PHONY += kselftest-clean
-kselftest-clean:
-	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests clean
+kselftest-%: FORCE
+	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests $*
 
 PHONY += kselftest-merge
 kselftest-merge:
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index c3feccb99ff5..bad18145ed1a 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -171,9 +171,12 @@ run_pstore_crash:
 # 1. output_dir=kernel_src
 # 2. a separate output directory is specified using O= KBUILD_OUTPUT
 # 3. a separate output directory is specified using KBUILD_OUTPUT
+# Avoid conflict with INSTALL_PATH set by the main Makefile
 #
-INSTALL_PATH ?= $(BUILD)/install
-INSTALL_PATH := $(abspath $(INSTALL_PATH))
+KSFT_INSTALL_PATH ?= $(BUILD)/kselftest_install
+KSFT_INSTALL_PATH := $(abspath $(KSFT_INSTALL_PATH))
+# Avoid changing the rest of the logic here and lib.mk.
+INSTALL_PATH := $(KSFT_INSTALL_PATH)
 ALL_SCRIPT := $(INSTALL_PATH)/run_kselftest.sh
 
 install: all
@@ -203,6 +206,7 @@ ifdef INSTALL_PATH
 		echo "[ -w /dev/kmsg ] && echo \"kselftest: Running tests in $$TARGET\" >> /dev/kmsg" >> $(ALL_SCRIPT); \
 		echo "cd $$TARGET" >> $(ALL_SCRIPT); \
 		echo -n "run_many" >> $(ALL_SCRIPT); \
+		echo -n "Emit Tests for $$TARGET\n"; \
 		$(MAKE) -s --no-print-directory OUTPUT=$$BUILD_TARGET -C $$TARGET emit_tests >> $(ALL_SCRIPT); \
 		echo "" >> $(ALL_SCRIPT);	    \
 		echo "cd \$$ROOT" >> $(ALL_SCRIPT); \
diff --git a/tools/testing/selftests/kselftest_install.sh b/tools/testing/selftests/kselftest_install.sh
index ec304463883c..e2e1911d62d5 100755
--- a/tools/testing/selftests/kselftest_install.sh
+++ b/tools/testing/selftests/kselftest_install.sh
@@ -24,12 +24,12 @@ main()
 		echo "$0: Installing in specified location - $install_loc ..."
 	fi
 
-	install_dir=$install_loc/kselftest
+	install_dir=$install_loc/kselftest_install
 
 # Create install directory
 	mkdir -p $install_dir
 # Build tests
-	INSTALL_PATH=$install_dir make install
+	KSFT_INSTALL_PATH=$install_dir make install
 }
 
 main "$@"
-- 
2.20.1
