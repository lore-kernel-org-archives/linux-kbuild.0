Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:23362 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751766AbdESHKx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 May 2017 03:10:53 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: add GNU Make version check
Date: Fri, 19 May 2017 16:10:06 +0900
Message-Id: <1495177806-24124-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

As Documentation/process/changes.rst says, Kbuild now depends on
GNU Make 3.81 or later.

If invoked with older versions, it fails with an unclear error
message.

$ make defconfig
  HOSTCC  scripts/basic/fixdep
scripts/Makefile.host:135: *** missing separator.  Stop.
make: *** [defconfig] Error 2

Stop building with a clearer message:

Makefile:16: *** GNU Make >= 3.81 is required.  You are running version 3.80.  Stop.

I borrowed the idea from Buildroot.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index d8b5c4230da0..5baaebf8f23a 100644
--- a/Makefile
+++ b/Makefile
@@ -10,6 +10,12 @@ NAME = Fearless Coyote
 # Comments in this file are targeted only to the developer, do not
 # expect to learn how to build the kernel reading this file.
 
+# Check Make version (note: this check will break at Make 10.x)
+MIN_MAKE_VERSION := 3.81
+ifneq ($(firstword $(sort $(MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MAKE_VERSION))
+$(error GNU Make >= $(MIN_MAKE_VERSION) is required.  You are running version $(MAKE_VERSION))
+endif
+
 # o Do not use make's built-in rules and variables
 #   (this increases performance and avoids hard-to-debug behaviour);
 # o Look for make include files relative to root of kernel src
-- 
2.7.4

