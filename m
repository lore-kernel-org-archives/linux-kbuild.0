Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:44494 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753643AbdKGTqh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Nov 2017 14:46:37 -0500
Received: by mail-io0-f195.google.com with SMTP id m16so3415629iod.1
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Nov 2017 11:46:36 -0800 (PST)
From: Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v2] kbuild: Set KBUILD_CFLAGS before incl. arch Makefile
Date: Tue,  7 Nov 2017 11:46:13 -0800
Message-Id: <20171107194614.89371-1-ndesaulniers@google.com>
In-Reply-To: <CAKwvOdn4EWb_T6QgcYmEN1JKvVzC6otJ=g+2OUa8Chtq7aY1mw@mail.gmail.com>
References: <CAKwvOdn4EWb_T6QgcYmEN1JKvVzC6otJ=g+2OUa8Chtq7aY1mw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Behan Webster <behanw@converseincode.com>, =?UTF-8?q?Jan-Simon=20M=C3=B6ller?= <dl9pf@gmx.de>, Mark Charlebois <charlebm@gmail.com>, Greg Hackmann <ghackmann@google.com>, Matthias Kaehlcke <mka@chromium.org>, Chris Fries <cfries@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

From: Chris Fries <cfries@google.com>

Set the clang KBUILD_CFLAGS up before including arch/ Makefiles,
so that ld-options (etc.) can work correctly.

This fixes errors with clang such as ld-options trying to CC
against your host architecture, but LD trying to link against
your target architecture.

We didn't notice this problem on Android, because we took the original
LLVMLinux patch into our 4.4 kernels, which did not have this issue. We
ran into this taking the proper upstream patch on newer kernel versions.
The original LLVMLinux patch can be seen at:

http://git.linuxfoundation.org/?p=llvmlinux/kernel.git;a=blobdiff;f=Makefile;h=389006c4ef494cda3a1ee52bf355618673ab4f31;hp=e41a3356abee83f08288362950bfceebd25ec3c2;hb=ef9126da11b18ff34eb1f01561f53c378860336c;hpb=f800c25b7a762d445ba1439a2428c8362157eba6

It seems that when the patch was re-upstreamed, a V2 was requested that
moved the definition of Clang's target triple to be later in the top
level Makefile than the inclusion of the arch specific Makefile,
breaking macros like ld-option when cross compiling. V2 was requested
at:

https://lkml.org/lkml/2017/4/21/116

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Chris Fries <cfries@google.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes since v1:
* Rebase on kbuild tree, as per Masahiro.
* Add mka's RB/TB line to commit message.

 Makefile | 64 ++++++++++++++++++++++++++++++++--------------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/Makefile b/Makefile
index a7476e6934f1..d349734c7ef7 100644
--- a/Makefile
+++ b/Makefile
@@ -472,6 +472,38 @@ ifneq ($(KBUILD_SRC),)
 	    $(srctree) $(objtree) $(VERSION) $(PATCHLEVEL)
 endif
 
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
 ifeq ($(config-targets),1)
 # ===========================================================================
 # *config targets only - make sure prerequisites are updated, and descend
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
2.15.0.403.gc27cc4dac6-goog

