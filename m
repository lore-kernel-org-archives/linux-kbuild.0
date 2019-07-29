Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:61233 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfG2JQ3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 05:16:29 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: initialize CLANG_FLAGS correctly in the top Makefile
Date: Mon, 29 Jul 2019 18:15:17 +0900
Message-Id: <20190729091517.5334-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Stephen Boyd <swboyd@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, stable@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org

CLANG_FLAGS is initialized by the following line:

  CLANG_FLAGS     := --target=$(notdir $(CROSS_COMPILE:%-=%))

..., which is run only when CROSS_COMPILE is set.

Some build targets (bindeb-pkg etc.) recurse to the top Makefile.

When you build the kernel with Clang but without CROSS_COMPILE,
the same compiler flags such as -no-integrated-as are accumulated
into CLANG_FLAGS.

If you run 'make CC=clang' and then 'make CC=clang bindeb-pkg',
Kbuild will recompile everything needlessly due to the build command
change.

Fix this by correctly initializing CLANG_FLAGS.

Fixes: 238bcbc4e07f ("kbuild: consolidate Clang compiler flags")
Cc: <stable@vger.kernel.org> # v4.20+
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index fa0fbe7851ea..5ee6f6889869 100644
--- a/Makefile
+++ b/Makefile
@@ -472,6 +472,7 @@ KBUILD_CFLAGS_MODULE  := -DMODULE
 KBUILD_LDFLAGS_MODULE := -T $(srctree)/scripts/module-common.lds
 KBUILD_LDFLAGS :=
 GCC_PLUGINS_CFLAGS :=
+CLANG_FLAGS :=
 
 export ARCH SRCARCH CONFIG_SHELL HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP PAHOLE KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS
@@ -519,7 +520,7 @@ endif
 
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
 ifneq ($(CROSS_COMPILE),)
-CLANG_FLAGS	:= --target=$(notdir $(CROSS_COMPILE:%-=%))
+CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
 CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)
 GCC_TOOLCHAIN	:= $(realpath $(GCC_TOOLCHAIN_DIR)/..)
-- 
2.17.1
