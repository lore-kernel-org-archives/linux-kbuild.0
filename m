Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it1-f194.google.com ([209.85.166.194]:35686 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbfDSXYM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Apr 2019 19:24:12 -0400
Received: by mail-it1-f194.google.com with SMTP id w15so10421902itc.0
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Apr 2019 16:24:11 -0700 (PDT)
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH] Makefile: add kselftest-build target
Date: Fri, 19 Apr 2019 17:24:04 -0600
Message-Id: <20190419232404.9746-1-skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

One of the use-cases is building kselftest and then installing.
Adding a target to just build the tests from the main Makefile
will help users and makes it easier.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 15c8251d4d5e..38a2ce3c343f 100644
--- a/Makefile
+++ b/Makefile
@@ -1195,6 +1195,9 @@ endif
 # ---------------------------------------------------------------------------
 # Kernel selftest
 
+PHONY += kselftest-build
+kselftest-build:
+	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests all
 PHONY += kselftest
 kselftest:
 	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
-- 
2.17.1
