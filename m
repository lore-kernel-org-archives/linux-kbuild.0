Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:34718
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751385AbdILXxT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2017 19:53:19 -0400
From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 03/11] selftests: Makefile: clear LDFLAGS for make O=dir use-case
Date: Tue, 12 Sep 2017 17:52:56 -0600
Message-Id: <a7ded59eb81252b45ef4141759ee69744ea6be38.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1505257614.git.shuahkh@osg.samsung.com>
References: <cover.1505257614.git.shuahkh@osg.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com, shuah@kernel.org, tglx@linutronix.de, mingo@redhat.com, peterz@infradead.org, bamvor.zhangjian@linaro.org, emilio.lopez@collabora.co.uk, corbet@lwn.net
Cc: Shuah Khan <shuahkh@osg.samsung.com>, tytso@mit.edu, ebiederm@xmission.com, Tim.Bird@sony.com, gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org

kselftest target fails when object directory is specified to relocate
objects. Inherited "LDFLAGS = -m" fails the test builds. Clear it.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 26ce4f7168be..f4368db011ea 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -52,6 +52,10 @@ override LDFLAGS =
 override MAKEFLAGS =
 endif
 
+ifneq ($(KBUILD_SRC),)
+override LDFLAGS =
+endif
+
 BUILD := $(O)
 ifndef BUILD
   BUILD := $(KBUILD_OUTPUT)
-- 
2.11.0

