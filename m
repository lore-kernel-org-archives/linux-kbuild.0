Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:34733
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751651AbdILXxW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 19:53:22 -0400
From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 04/11] selftests: lib.mk: fix test executable status check to use full path
Date: Tue, 12 Sep 2017 17:52:57 -0600
Message-Id: <d5a8c0ed220b6d14e46018447f5a57187a1dccfd.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com, shuah@kernel.org, tglx@linutronix.de, mingo@redhat.com, peterz@infradead.org, bamvor.zhangjian@linaro.org, emilio.lopez@collabora.co.uk, corbet@lwn.net
Cc: Shuah Khan <shuahkh@osg.samsung.com>, tytso@mit.edu, ebiederm@xmission.com, Tim.Bird@sony.com, gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

Fix test executable status check to use full path for make O=dir case,m
when tests are relocated to user specified object directory. Without the
full path, this check fails to find the file and fails the test.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/lib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index e779c8758e15..22032ba802ba 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -21,7 +21,7 @@ define RUN_TESTS
 		test_num=`echo $$test_num+1 | bc`;	\
 		echo "selftests: $$BASENAME_TEST";	\
 		echo "========================================";	\
-		if [ ! -x $$BASENAME_TEST ]; then	\
+		if [ ! -x $$TEST ]; then	\
 			echo "selftests: Warning: file $$BASENAME_TEST is not executable, correct this.";\
 			echo "not ok 1..$$test_num selftests: $$BASENAME_TEST [FAIL]"; \
 		else					\
-- 
2.11.0

