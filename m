Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:40546 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728534AbeHVRQx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Aug 2018 13:16:53 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: test dead code/data elimination support in Kconfig
Date: Wed, 22 Aug 2018 22:51:09 +0900
Message-Id: <1534945869-17117-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This config option should be enabled only when both the compiler and
the linker support necessary flags.  Add proper dependencies to Kconfig.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile     | 8 ++------
 init/Kconfig | 2 ++
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 1289a01..2e2b009 100644
--- a/Makefile
+++ b/Makefile
@@ -790,8 +790,8 @@ KBUILD_CFLAGS += $(call cc-option, -fno-inline-functions-called-once)
 endif
 
 ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
-KBUILD_CFLAGS_KERNEL	+= $(call cc-option,-ffunction-sections,)
-KBUILD_CFLAGS_KERNEL	+= $(call cc-option,-fdata-sections,)
+KBUILD_CFLAGS_KERNEL += -ffunction-sections -fdata-sections
+LDFLAGS_vmlinux += --gc-sections
 endif
 
 # arch Makefile may override CC so keep this after arch Makefile is included
@@ -857,10 +857,6 @@ LDFLAGS_BUILD_ID := $(call ld-option, --build-id)
 KBUILD_LDFLAGS_MODULE += $(LDFLAGS_BUILD_ID)
 LDFLAGS_vmlinux += $(LDFLAGS_BUILD_ID)
 
-ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
-LDFLAGS_vmlinux	+= $(call ld-option, --gc-sections,)
-endif
-
 ifeq ($(CONFIG_STRIP_ASM_SYMS),y)
 LDFLAGS_vmlinux	+= $(call ld-option, -X,)
 endif
diff --git a/init/Kconfig b/init/Kconfig
index 9bd50ba..21b8559 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1085,6 +1085,8 @@ config LD_DEAD_CODE_DATA_ELIMINATION
 	bool "Dead code and data elimination (EXPERIMENTAL)"
 	depends on HAVE_LD_DEAD_CODE_DATA_ELIMINATION
 	depends on EXPERT
+	depends on $(cc-option,-ffunction-sections -fdata-sections)
+	depends on $(ld-option,--gc-sections)
 	help
 	  Enable this if you want to do dead code and data elimination with
 	  the linker by compiling with -ffunction-sections -fdata-sections,
-- 
2.7.4
