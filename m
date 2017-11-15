Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:41730 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934331AbdKOUmo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 15:42:44 -0500
Received: by mail-it0-f68.google.com with SMTP id x28so3291853ita.0
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Nov 2017 12:42:44 -0800 (PST)
From: Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v3] kbuild: Set KBUILD_CFLAGS before incl. arch Makefile
Date: Wed, 15 Nov 2017 12:42:30 -0800
Message-Id: <20171115204231.34914-1-ndesaulniers@google.com>
In-Reply-To: <CAK7LNAS1NaqPRhK6FOXN=YTMhLagpSrR2=tXn-uWZbpzr=NeoQ@mail.gmail.com>
References: <CAK7LNAS1NaqPRhK6FOXN=YTMhLagpSrR2=tXn-uWZbpzr=NeoQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Behan Webster <behanw@converseincode.com>, =?UTF-8?q?Jan-Simon=20M=C3=B6ller?= <dl9pf@gmx.de>, Mark Charlebois <charlebm@gmail.com>, Greg Hackmann <ghackmann@google.com>, Matthias Kaehlcke <mka@chromium.org>, Douglas Anderson <dianders@chromium.org>, Chris Fries <cfries@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

From: Chris Fries <cfries@google.com>

Set the clang KBUILD_CFLAGS up before including arch/ Makefiles,
so that ld-options (etc.) can work correctly.

This fixes errors with clang such as ld-options trying to CC
against your host architecture, but LD trying to link against
your target architecture.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Chris Fries <cfries@google.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Tested-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes since v2:
* Move clang block lower in Makefile, so as not to run it when running
  configuration, per Masahiro.
* Remove paragraphs from commit message, per Masahiro.
* Add Masahiro to Suggested-by line in commit message.

 Makefile | 64 ++++++++++++++++++++++++++++++++--------------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/Makefile b/Makefile
index a7476e6934f1..b3352becc7df 100644
--- a/Makefile
+++ b/Makefile
@@ -608,6 +608,38 @@ CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage -fno-tree-loop-im $(call cc-disabl
 CFLAGS_KCOV	:= $(call cc-option,-fsanitize-coverage=trace-pc,)
 export CFLAGS_GCOV CFLAGS_KCOV
 
+ifeq ($(cc-name),clang)
+ifneq ($(CROSS_COMPILE),)
+CLANG_TARGET	:= -target $(notdir $(CROSS_COMPILE:%-=%))
+GCC_TOOLCHAIN	:= $(realpath $(dir $(shell which $(LD)))/..)
+endif
+ifneq ($(GCC_TOOLCHAIN),)
+CLANG_GCC_TC	:= -gcc-toolchain $(GCC_TOOLCHAIN)
+endif
+KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
+KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
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
 # The arch Makefile can set ARCH_{CPP,A,C}FLAGS to override the default
 # values of the respective KBUILD_* variables
 ARCH_CPPFLAGS :=
@@ -682,38 +714,6 @@ ifdef CONFIG_CC_STACKPROTECTOR
 endif
 KBUILD_CFLAGS += $(stackp-flag)
 
-ifeq ($(cc-name),clang)
-ifneq ($(CROSS_COMPILE),)
-CLANG_TARGET	:= -target $(notdir $(CROSS_COMPILE:%-=%))
-GCC_TOOLCHAIN	:= $(realpath $(dir $(shell which $(LD)))/..)
-endif
-ifneq ($(GCC_TOOLCHAIN),)
-CLANG_GCC_TC	:= -gcc-toolchain $(GCC_TOOLCHAIN)
-endif
-KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
-KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
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
-endif
-
 ifdef CONFIG_FRAME_POINTER
 KBUILD_CFLAGS	+= -fno-omit-frame-pointer -fno-optimize-sibling-calls
 else
-- 
2.15.0.448.gf294e3d99a-goog

