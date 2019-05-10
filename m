Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:61512 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727521AbfEJOLM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 10:11:12 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] kbuild: add all Clang-specific flags unconditionally
Date: Fri, 10 May 2019 23:10:09 +0900
Message-Id: <1557497409-18037-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Sedat Dilek <sedat.dilek@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

We do not support old Clang versions. Upgrade your clang version
if any of these flags is unsupported.

Let's add all flags within ifdef CONFIG_CC_IS_CLANG unconditionally.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
---

Changes in v2:
  - Rebase on top of Nathan's patch
     https://patchwork.kernel.org/patch/10937055/

 Makefile                   | 10 +++++-----
 scripts/Makefile.extrawarn | 12 ++++++------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 914a3ad..1152fc4 100644
--- a/Makefile
+++ b/Makefile
@@ -731,15 +731,15 @@ stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
 KBUILD_CFLAGS += $(stackp-flags-y)
 
 ifdef CONFIG_CC_IS_CLANG
-KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
-KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
-KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
+KBUILD_CPPFLAGS += -Qunused-arguments
+KBUILD_CFLAGS += -Wno-format-invalid-specifier
+KBUILD_CFLAGS += -Wno-gnu
 # Quiet clang warning: comparison of unsigned expression < 0 is always false
-KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
+KBUILD_CFLAGS += -Wno-tautological-compare
 # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
 # source of a reference will be _MergedGlobals and not on of the whitelisted names.
 # See modpost pattern 2
-KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
+KBUILD_CFLAGS += -mno-global-merge
 else
 
 # These warnings generated too much noise in a regular build.
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 768306a..523c4ca 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -66,11 +66,11 @@ KBUILD_CFLAGS += $(warning)
 else
 
 ifdef CONFIG_CC_IS_CLANG
-KBUILD_CFLAGS += $(call cc-disable-warning, initializer-overrides)
-KBUILD_CFLAGS += $(call cc-disable-warning, unused-value)
-KBUILD_CFLAGS += $(call cc-disable-warning, format)
-KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
-KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
-KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
+KBUILD_CFLAGS += -Wno-initializer-overrides
+KBUILD_CFLAGS += -Wno-unused-value
+KBUILD_CFLAGS += -Wno-format
+KBUILD_CFLAGS += -Wno-sign-compare
+KBUILD_CFLAGS += -Wno-format-zero-length
+KBUILD_CFLAGS += -Wno-uninitialized
 endif
 endif
-- 
2.7.4
