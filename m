Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f67.google.com ([209.85.166.67]:42423 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731028AbfIYXFI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Sep 2019 19:05:08 -0400
Received: by mail-io1-f67.google.com with SMTP id n197so1296800iod.9
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2019 16:05:07 -0700 (PDT)
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 1/2] Makefile: Add kselftest_build target to build tests
Date: Wed, 25 Sep 2019 17:04:34 -0600
Message-Id: <f13deab77f9e118bd290b6a978734871efac4bf2.1569452305.git.skhan@linuxfoundation.org>
In-Reply-To: <cover.1569452305.git.skhan@linuxfoundation.org>
References: <cover.1569452305.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net, shuah@kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Add kselftest_build target to build tests from the top level
Makefile. This is to simplify kselftest use-cases for CI and
distributions where build and test systems are different.

Current kselftest target builds and runs tests on a development
system which is a developer use-case.

This change addresses requests from developers and testers to add
support for building from the main Makefile.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index d456746da347..ac4af6fc4b50 100644
--- a/Makefile
+++ b/Makefile
@@ -1233,6 +1233,10 @@ scripts_unifdef: scripts_basic
 # ---------------------------------------------------------------------------
 # Kernel selftest
 
+PHONY += kselftest_build
+kselftest_build:
+	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests all
+
 PHONY += kselftest
 kselftest:
 	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
-- 
2.20.1
