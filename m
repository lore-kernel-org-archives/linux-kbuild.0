Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f54.google.com ([74.125.83.54]:35263 "EHLO
        mail-pg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933857AbdGKVaK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Jul 2017 17:30:10 -0400
Received: by mail-pg0-f54.google.com with SMTP id j186so2222942pge.2
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Jul 2017 14:30:09 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] x86/build: Fix stack alignment for clang
Date: Tue, 11 Jul 2017 14:29:40 -0700
Message-Id: <20170711212940.101416-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Matthias Kaehlcke <mka@chromium.org>

Commit d77698df39a5 ("x86/build: Specify stack alignment for clang")
intended to use the same stack alignment for clang as with gcc. The
two compilers use different options to configure the stack alignment
(gcc: -mpreferred-stack-boundary=n, clang: -mstack-alignment=n).
The above commit assumes that the clang option uses the same parameter
type as gcc, i.e. that the alignment is specified as 2^n. However clang
interprets the value of this option literally to use an alignment of n,
in consequence the stack remains misaligned.

Change the values used with -mstack-alignment to be the actual alignment
instead of a power of two.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Apparently I had really bad luck when testing d77698df39a5. It fixed the
crash I was investigating and the stack in the debugged function looked
good with the patch, so I didn't had any doubt that -mstack-alignment=3
(for x86-64) was the correct solution :(

If anyone has suggestions for macro magic to encapsulate the different
option name and paramater type I'm happy to adapt the patch. I
experimented a bit but didn't find a good solution.

 arch/x86/Makefile | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 1e902f926be3..9c6f11ebf288 100644
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
@@ -36,7 +28,8 @@ REALMODE_CFLAGS	:= $(M16_CFLAGS) -g -Os -D__KERNEL__ \
 
 REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS), -ffreestanding)
 REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS), -fno-stack-protector)
-REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS), $(cc_stack_align_opt)=2)
+REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS),\
+	-mpreferred-stack-boundary=2,-mstack-alignment=4)
 export REALMODE_CFLAGS
 
 # BITS is used as extension for files which are available in a 32 bit
@@ -76,7 +69,7 @@ ifeq ($(CONFIG_X86_32),y)
         # Align the stack to the register width instead of using the default
         # alignment of 16 bytes. This reduces stack usage and the number of
         # alignment instructions.
-        KBUILD_CFLAGS += $(call cc-option,$(cc_stack_align_opt)=2)
+        KBUILD_CFLAGS += $(call cc-option,-mpreferred-stack-boundary=2,-mstack-alignment=4)
 
         # Disable unit-at-a-time mode on pre-gcc-4.0 compilers, it makes gcc use
         # a lot more stack due to the lack of sharing of stacklots:
@@ -115,7 +108,7 @@ else
         # default alignment which keep the stack *mis*aligned.
         # Furthermore an alignment to the register width reduces stack usage
         # and the number of alignment instructions.
-        KBUILD_CFLAGS += $(call cc-option,$(cc_stack_align_opt)=3)
+        KBUILD_CFLAGS += $(call cc-option,-mpreferred-stack-boundary=3,-mstack-alignment=8)
 
 	# Use -mskip-rax-setup if supported.
 	KBUILD_CFLAGS += $(call cc-option,-mskip-rax-setup)
-- 
2.13.2.725.g09c95d1e9-goog

