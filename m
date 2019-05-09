Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:40658 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbfEIGqB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 02:46:01 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: add most of Clang-specific flags unconditionally
Date: Thu,  9 May 2019 15:44:55 +0900
Message-Id: <20190509064455.1173-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Arnd Bergmann <arnd@arndb.de>, clang-built-linux@googlegroups.com, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

We do not support old Clang versions. Upgrade your clang version
if any of these flags is unsupported.

Let's add flags within ifdef CONFIG_CC_IS_CLANG unconditionally,
except -fcatch-undefined-behavior.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile                   | 10 +++++-----
 scripts/Makefile.extrawarn | 12 ++++++------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index bd7ae11947cb..c71ffb6f55b5 100644
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
 KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
 else
 
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 768306add591..523c4cafe2dc 100644
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
2.17.1
