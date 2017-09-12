Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:34822
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751824AbdILXxe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 19:53:34 -0400
From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 10/11] selftests: futex: copy sub-dir test scripts for make O=dir run
Date: Tue, 12 Sep 2017 17:53:03 -0600
Message-Id: <de8bf636371f4318503fdf23fe51352941e739d7.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com, shuah@kernel.org, tglx@linutronix.de, mingo@redhat.com, peterz@infradead.org, bamvor.zhangjian@linaro.org, emilio.lopez@collabora.co.uk, corbet@lwn.net
Cc: Shuah Khan <shuahkh@osg.samsung.com>, tytso@mit.edu, ebiederm@xmission.com, Tim.Bird@sony.com, gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

For make O=dir run_tests to work, test scripts from sub-directories
need to be copied over to the object directory. Running tests from the
object directory is necessary to avoid making the source tree dirty.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/futex/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/futex/Makefile b/tools/testing/selftests/futex/Makefile
index 7c647f619d63..9358cb210fd5 100644
--- a/tools/testing/selftests/futex/Makefile
+++ b/tools/testing/selftests/futex/Makefile
@@ -11,10 +11,13 @@ all:
 		BUILD_TARGET=$(OUTPUT)/$$DIR;	\
 		mkdir $$BUILD_TARGET  -p;	\
 		make OUTPUT=$$BUILD_TARGET -C $$DIR $@;\
+		if [ -e $$DIR/$(TEST_PROGS) ]; then
+			rsync -a $$DIR/$(TEST_PROGS) $$BUILD_TARGET/;
+		fi
 	done
 
 override define RUN_TESTS
-	$(OUTPUT)/run.sh
+	cd $(OUTPUT); ./run.sh
 endef
 
 override define INSTALL_RULE
-- 
2.11.0

