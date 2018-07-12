Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:56386 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbeGLILp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 04:11:45 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/6] kbuild: remove redundant LDFLAGS clearing in arch/*/Makefile
Date: Thu, 12 Jul 2018 17:01:33 +0900
Message-Id: <1531382496-3719-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1531382496-3719-1-git-send-email-yamada.masahiro@socionext.com>
References: <1531382496-3719-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, x86@kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, Jeff Dike <jdike@addtoit.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Masahiro Yamada <yamada.masahiro@socionext.com>

Since commit ce99d0bf312d ("kbuild: clear LDFLAGS in the top Makefile"),
the top-level Makefile caters to this.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/Makefile      | 3 ---
 arch/openrisc/Makefile | 1 -
 arch/riscv/Makefile    | 1 -
 3 files changed, 5 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 62ebeae..e7d703d 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -10,9 +10,6 @@
 #
 # Copyright (C) 1995-2001 by Russell King
 
-# Ensure linker flags are correct
-LDFLAGS		:=
-
 LDFLAGS_vmlinux	:=-p --no-undefined -X --pic-veneer
 ifeq ($(CONFIG_CPU_ENDIAN_BE8),y)
 LDFLAGS_vmlinux	+= --be8
diff --git a/arch/openrisc/Makefile b/arch/openrisc/Makefile
index 89076a6..70e06d3 100644
--- a/arch/openrisc/Makefile
+++ b/arch/openrisc/Makefile
@@ -19,7 +19,6 @@
 
 KBUILD_DEFCONFIG := or1ksim_defconfig
 
-LDFLAGS         :=
 OBJCOPYFLAGS    := -O binary -R .note -R .comment -S
 LDFLAGS_vmlinux :=
 LIBGCC 		:= $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 6d4a5f6c..2627e48 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -8,7 +8,6 @@
 # for more details.
 #
 
-LDFLAGS         :=
 OBJCOPYFLAGS    := -O binary
 LDFLAGS_vmlinux :=
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
-- 
2.7.4

