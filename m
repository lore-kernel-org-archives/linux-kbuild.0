Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:44487 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbfE0OkT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 May 2019 10:40:19 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/5] kconfig: make arch/*/configs/defconfig the default of KBUILD_DEFCONFIG
Date: Mon, 27 May 2019 23:37:24 +0900
Message-Id: <20190527143725.12542-4-yamada.masahiro@socionext.com>
In-Reply-To: <20190527143725.12542-1-yamada.masahiro@socionext.com>
References: <20190527143725.12542-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Paul Walmsley <paul@pwsan.com>, Firoz Khan <firoz.khan@linaro.org>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Greentime Hu <green.hu@gmail.com>, Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>, linux-alpha@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

Until recently, if KBUILD_DEFCONFIG was not set by the arch Makefile,
the default path arch/*/defconfig was used.

The last users of the default are gone by the following commits:

- Commit f3e20ad67b4c ("s390: move arch/s390/defconfig to
  arch/s390/configs/defconfig")

- Commit 986a13769c4b ("alpha: move arch/alpha/defconfig to
  arch/alpha/configs/defconfig")

Let's set arch/*/configs/defconfig as a new default. This saves
KBUILD_DEFCONFIG for some architectures.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/alpha/Makefile      | 2 --
 arch/arm64/Makefile      | 2 --
 arch/csky/Makefile       | 1 -
 arch/nds32/Makefile      | 2 --
 arch/riscv/Makefile      | 2 --
 arch/s390/Makefile       | 2 --
 scripts/kconfig/Makefile | 4 ++++
 7 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
index b3314e0dcb6f..12dee59b011c 100644
--- a/arch/alpha/Makefile
+++ b/arch/alpha/Makefile
@@ -8,8 +8,6 @@
 # Copyright (C) 1994 by Linus Torvalds
 #
 
-KBUILD_DEFCONFIG := defconfig
-
 NM := $(NM) -B
 
 LDFLAGS_vmlinux	:= -static -N #-relax
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index b025304bde46..970c41a30ed3 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -30,8 +30,6 @@ LDFLAGS_vmlinux	+= --fix-cortex-a53-843419
   endif
 endif
 
-KBUILD_DEFCONFIG := defconfig
-
 # Check for binutils support for specific extensions
 lseinstr := $(call as-instr,.arch_extension lse,-DCONFIG_AS_LSE=1)
 
diff --git a/arch/csky/Makefile b/arch/csky/Makefile
index f9aab9157c4a..fb1bbbd91954 100644
--- a/arch/csky/Makefile
+++ b/arch/csky/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 OBJCOPYFLAGS		:=-O binary
 GZFLAGS			:=-9
-KBUILD_DEFCONFIG	:= defconfig
 
 ifdef CONFIG_CPU_HAS_FPU
 FPUEXT = f
diff --git a/arch/nds32/Makefile b/arch/nds32/Makefile
index 14dab5ad88ef..ccdca7142020 100644
--- a/arch/nds32/Makefile
+++ b/arch/nds32/Makefile
@@ -2,8 +2,6 @@
 LDFLAGS_vmlinux	:= --no-undefined -X
 OBJCOPYFLAGS	:= -O binary -R .note -R .note.gnu.build-id -R .comment -S
 
-KBUILD_DEFCONFIG := defconfig
-
 ifdef CONFIG_FUNCTION_TRACER
 arch-y += -malways-save-lp -mno-relax
 endif
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 03e760267657..7a117be8297c 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -16,8 +16,6 @@ endif
 KBUILD_AFLAGS_MODULE += -fPIC
 KBUILD_CFLAGS_MODULE += -fPIC
 
-KBUILD_DEFCONFIG = defconfig
-
 export BITS
 ifeq ($(CONFIG_ARCH_RV64I),y)
 	BITS := 64
diff --git a/arch/s390/Makefile b/arch/s390/Makefile
index de8521fc9de5..df1d6a150f30 100644
--- a/arch/s390/Makefile
+++ b/arch/s390/Makefile
@@ -10,8 +10,6 @@
 # Copyright (C) 1994 by Linus Torvalds
 #
 
-KBUILD_DEFCONFIG := defconfig
-
 LD_BFD		:= elf64-s390
 KBUILD_LDFLAGS	:= -m elf64_s390
 KBUILD_AFLAGS_MODULE += -fPIC
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 059642bd6584..ab30fe724c43 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -12,6 +12,10 @@ else
 Kconfig := Kconfig
 endif
 
+ifndef KBUILD_DEFCONFIG
+KBUILD_DEFCONFIG := defconfig
+endif
+
 ifeq ($(quiet),silent_)
 silent := -s
 endif
-- 
2.17.1
