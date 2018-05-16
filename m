Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:35634 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751595AbeEPOPN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 May 2018 10:15:13 -0400
Received: by mail-pl0-f65.google.com with SMTP id i5-v6so512572plt.2
        for <linux-kbuild@vger.kernel.org>; Wed, 16 May 2018 07:15:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v4 1/4] powerpc/kbuild: set default generic machine type for 32-bit compile
Date: Thu, 17 May 2018 00:14:55 +1000
Message-Id: <20180516141458.18996-2-npiggin@gmail.com>
In-Reply-To: <20180516141458.18996-1-npiggin@gmail.com>
References: <20180516141458.18996-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Segher Boessenkool <segher@kernel.crashing.org>

Some 64-bit toolchains uses the wrong ISA variant for compiling 32-bit
kernels, even with -m32. Debian's powerpc64le is one such case, and
that is because it is built with --with-cpu=power8.

So when cross compiling a 32-bit kernel with a 64-bit toolchain, set
-mcpu=powerpc initially, which is the generic 32-bit powerpc machine
type and scheduling model. CPU and platform code can override this
with subsequent -mcpu flags if necessary.

This is not done for 32-bit toolchains otherwise it would override
their defaults, which are presumably set appropriately for the
environment (moreso than a 64-bit cross compiler).

This fixes a lot of build failures due to incompatible assembly when
compiling 32-bit kernel with th Debian powerpc64le 64-bit toolchain.

Cc: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Makefile | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 95813df90801..15ca4bafad82 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -24,9 +24,20 @@ ifeq ($(HAS_BIARCH),y)
 ifeq ($(CROSS32_COMPILE),)
 CROSS32CC	:= $(CC) -m32
 KBUILD_ARFLAGS	+= --target=elf32-powerpc
+
+ifdef CONFIG_PPC32
+# These options will be overridden by any -mcpu option that the CPU
+# or platform code sets later on the command line, but they are needed
+# to set a sane 32-bit cpu target for the 64-bit cross compiler which
+# may default to the wrong ISA.
+KBUILD_CFLAGS		+= -mcpu=powerpc
+KBUILD_AFLAGS		+= -mcpu=powerpc
+endif
+
 endif
 endif
 
+
 export CROSS32CC CROSS32AR
 
 ifeq ($(CROSS_COMPILE),)
-- 
2.17.0

