Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:35092 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756220AbeEJFRO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 May 2018 01:17:14 -0400
Received: by mail-pf0-f196.google.com with SMTP id x9-v6so495238pfm.2
        for <linux-kbuild@vger.kernel.org>; Wed, 09 May 2018 22:17:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 1/5] powerpc/kbuild: set default generic machine type for 32-bit compile
Date: Thu, 10 May 2018 15:16:55 +1000
Message-Id: <20180510051659.15356-2-npiggin@gmail.com>
In-Reply-To: <20180510051659.15356-1-npiggin@gmail.com>
References: <20180510051659.15356-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org

The 64-bit toolchain uses the wrong ISA variant for compiling 32-bit
kernels, eve with -m32. Set -mcpu=powerpc which is the generic 32-bit
powerpc machine type and scheduling model. 32-bit platforms and CPUs
can override this with -mcpu= options that come later on the command
line.

This fixes a lot of build failures due to incompatible assembly when
compiling 32-bit kernel with 64-bit toolchain.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 95813df90801..7034b1ad50e0 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -27,6 +27,14 @@ KBUILD_ARFLAGS	+= --target=elf32-powerpc
 endif
 endif
 
+ifdef CONFIG_PPC32
+# These options will be overridden by any -mcpu option that comes
+# later on the command line, but they are needed to set a sane
+# 32-bit cpu target for the 64-bit cross compiler.
+KBUILD_CFLAGS		+= -mcpu=powerpc
+KBUILD_AFLAGS		+= -mcpu=powerpc
+endif
+
 export CROSS32CC CROSS32AR
 
 ifeq ($(CROSS_COMPILE),)
-- 
2.17.0

