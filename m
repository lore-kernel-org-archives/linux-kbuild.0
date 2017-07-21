Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f42.google.com ([74.125.83.42]:33691 "EHLO
        mail-pg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753516AbdGUV53 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Jul 2017 17:57:29 -0400
Received: by mail-pg0-f42.google.com with SMTP id k14so33701073pgr.0
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Jul 2017 14:57:29 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 2/2] x86/build: Fix stack alignment for CLang
Date: Fri, 21 Jul 2017 14:56:57 -0700
Message-Id: <20170721215657.81631-2-mka@chromium.org>
In-Reply-To: <20170721215657.81631-1-mka@chromium.org>
References: <20170721215657.81631-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Matthias Kaehlcke <mka@chromium.org>

Commit:

  d77698df39a5 ("x86/build: Specify stack alignment for clang")

intended to use the same stack alignment for clang as with gcc.

The two compilers use different options to configure the stack alignment
(gcc: -mpreferred-stack-boundary=n, clang: -mstack-alignment=n).

The above commit assumes that the clang option uses the same parameter
type as gcc, i.e. that the alignment is specified as 2^n. However clang
interprets the value of this option literally to use an alignment of n,
in consequence the stack remains misaligned.

Change the values used with -mstack-alignment to be the actual alignment
instead of a power of two.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/x86/Makefile | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 1e902f926be3..2b2f59c1a5f0 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -11,14 +11,6 @@ else
         KBUILD_DEFCONFIG := $(ARCH)_defconfig
 endif
 
-# For gcc stack alignment is specified with -mpreferred-stack-boundary,
-# clang has the option -mstack-alignment for that purpose.
-ifneq ($(call cc-option, -mpreferred-stack-boundary=4),)
-        cc_stack_align_opt := -mpreferred-stack-boundary
-else ifneq ($(call cc-option, -mstack-alignment=4),)
-        cc_stack_align_opt := -mstack-alignment
-endif
-
 # How to compile the 16-bit code.  Note we always compile for -march=i386;
 # that way we can complain to the user if the CPU is insufficient.
 #
@@ -36,7 +28,9 @@ REALMODE_CFLAGS	:= $(M16_CFLAGS) -g -Os -D__KERNEL__ \
 
 REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS), -ffreestanding)
 REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS), -fno-stack-protector)
-REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS), $(cc_stack_align_opt)=2)
+REALMODE_CFLAGS += $(call __cc-option-3, $(CC), $(REALMODE_CFLAGS),\
+	-mpreferred-stack-boundary=2,-mstack-alignment=4,)
+
 export REALMODE_CFLAGS
 
 # BITS is used as extension for files which are available in a 32 bit
@@ -76,7 +70,7 @@ ifeq ($(CONFIG_X86_32),y)
         # Align the stack to the register width instead of using the default
         # alignment of 16 bytes. This reduces stack usage and the number of
         # alignment instructions.
-        KBUILD_CFLAGS += $(call cc-option,$(cc_stack_align_opt)=2)
+        KBUILD_CFLAGS += $(call cc-option-3,-mpreferred-stack-boundary=2,-mstack-alignment=4,)
 
         # Disable unit-at-a-time mode on pre-gcc-4.0 compilers, it makes gcc use
         # a lot more stack due to the lack of sharing of stacklots:
@@ -115,7 +109,7 @@ else
         # default alignment which keep the stack *mis*aligned.
         # Furthermore an alignment to the register width reduces stack usage
         # and the number of alignment instructions.
-        KBUILD_CFLAGS += $(call cc-option,$(cc_stack_align_opt)=3)
+        KBUILD_CFLAGS += $(call cc-option-3,-mpreferred-stack-boundary=3,-mstack-alignment=8,)
 
 	# Use -mskip-rax-setup if supported.
 	KBUILD_CFLAGS += $(call cc-option,-mskip-rax-setup)
-- 
2.14.0.rc0.284.gd933b75aa4-goog

