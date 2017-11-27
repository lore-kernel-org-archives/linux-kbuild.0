Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:55727 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751857AbdK0MPv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 07:15:51 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: move cc-option and cc-disable-warning after incl. arch Makefile
Date: Mon, 27 Nov 2017 21:15:13 +0900
Message-Id: <1511784913-3396-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Geert reported commit ae6b289a3789 ("kbuild: Set KBUILD_CFLAGS before
incl. arch Makefile") broke cross-compilation using a cross-compiler
that supports less compiler options than the host compiler.

For example,

  cc1: error: unrecognized command line option "-Wno-unused-but-set-variable"

This problem happens on architectures that setup CROSS_COMPILE in their
arch/*/Makefile.

Move the cc-option and cc-disable-warning back to the original position,
but keep the Clang target options.

Fixes: ae6b289a3789 ("kbuild: Set KBUILD_CFLAGS before incl. arch Makefile")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/Makefile b/Makefile
index aa67428..ac2d4e1 100644
--- a/Makefile
+++ b/Makefile
@@ -484,26 +484,6 @@ CLANG_GCC_TC	:= --gcc-toolchain=$(GCC_TOOLCHAIN)
 endif
 KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
 KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
-KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
-KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
-KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
-KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
-KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
-# Quiet clang warning: comparison of unsigned expression < 0 is always false
-KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
-# CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
-# source of a reference will be _MergedGlobals and not on of the whitelisted names.
-# See modpost pattern 2
-KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
-KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
-KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
-KBUILD_AFLAGS += $(call cc-option, -no-integrated-as)
-else
-
-# These warnings generated too much noise in a regular build.
-# Use make W=1 to enable them (see scripts/Makefile.extrawarn)
-KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
-KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
 endif
 
 ifeq ($(config-targets),1)
@@ -715,6 +695,29 @@ ifdef CONFIG_CC_STACKPROTECTOR
 endif
 KBUILD_CFLAGS += $(stackp-flag)
 
+ifeq ($(cc-name),clang)
+KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
+KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
+KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
+KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
+KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
+# Quiet clang warning: comparison of unsigned expression < 0 is always false
+KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
+# CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
+# source of a reference will be _MergedGlobals and not on of the whitelisted names.
+# See modpost pattern 2
+KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
+KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
+KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
+KBUILD_AFLAGS += $(call cc-option, -no-integrated-as)
+else
+
+# These warnings generated too much noise in a regular build.
+# Use make W=1 to enable them (see scripts/Makefile.extrawarn)
+KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
+KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
+endif
+
 ifdef CONFIG_FRAME_POINTER
 KBUILD_CFLAGS	+= -fno-omit-frame-pointer -fno-optimize-sibling-calls
 else
-- 
2.7.4

