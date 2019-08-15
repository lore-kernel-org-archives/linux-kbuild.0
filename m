Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f202.google.com ([209.85.222.202]:40272 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbfHOSUe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Aug 2019 14:20:34 -0400
Received: by mail-qk1-f202.google.com with SMTP id g125so2879902qkd.7
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2019 11:20:33 -0700 (PDT)
Date: Thu, 15 Aug 2019 11:20:29 -0700
Message-Id: <20190815182029.197604-1-nhuck@google.com>
Mime-Version: 1.0
Subject: [PATCH] kbuild: Require W=1 for -Wimplicit-fallthrough with clang
From: Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net, joe@perches.com, miguel.ojeda.sandonis@gmail.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Nathan Huckleberry <nhuck@google.com>

Clang is updating to support -Wimplicit-fallthrough on C
https://reviews.llvm.org/D64838. Since clang does not
support the comment version of fallthrough annotations
this update causes an additional 50k warnings. Most
of these warnings (>49k) are duplicates from header files.

This patch is intended to be reverted after the warnings
have been cleaned up.

Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 Makefile                   | 4 ++++
 scripts/Makefile.extrawarn | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index 1b23f95db176..93b9744e66a2 100644
--- a/Makefile
+++ b/Makefile
@@ -846,7 +846,11 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 KBUILD_CFLAGS += -Wdeclaration-after-statement
 
 # Warn about unmarked fall-throughs in switch statement.
+# If the compiler is clang, this warning is only enabled if W=1 in
+# Makefile.extrawarn
+ifndef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
+endif
 
 # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
 KBUILD_CFLAGS += -Wvla
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index a74ce2e3c33e..e12359d69bb7 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -30,6 +30,9 @@ warning-1 += $(call cc-option, -Wunused-but-set-variable)
 warning-1 += $(call cc-option, -Wunused-const-variable)
 warning-1 += $(call cc-option, -Wpacked-not-aligned)
 warning-1 += $(call cc-option, -Wstringop-truncation)
+ifdef CONFIG_CC_IS_CLANG
+KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
+endif
 # The following turn off the warnings enabled by -Wextra
 warning-1 += -Wno-missing-field-initializers
 warning-1 += -Wno-sign-compare
-- 
2.23.0.rc1.153.gdeed80330f-goog
