Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f182.google.com ([209.85.192.182]:36268 "EHLO
        mail-pf0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753958AbdFMXKH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jun 2017 19:10:07 -0400
Received: by mail-pf0-f182.google.com with SMTP id x63so74453293pff.3
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Jun 2017 16:10:06 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 4/4] x86/build: Specify stack alignment for clang
Date: Tue, 13 Jun 2017 16:08:54 -0700
Message-Id: <20170613230854.112282-5-mka@chromium.org>
In-Reply-To: <20170613230854.112282-1-mka@chromium.org>
References: <20170613230854.112282-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>

For gcc stack alignment is configured with -mpreferred-stack-boundary=N,
clang has the option -mstack-alignment=N for that purpose. Use the same
alignment as with gcc.

If the alignment is not specified clang assumes an alignment of
16 bytes, as required by the standard ABI. However as mentioned in
d9b0cde91c60 ("x86-64, gcc: Use -mpreferred-stack-boundary=3 if
supported") the standard kernel entry on x86-64 leaves the stack
on an 8-byte boundary, as a consequence clang will keep the stack
misaligned.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v2:
- Changed option name to cc_stack_align_opt
- Updated comments about stack alignment

 arch/x86/Makefile | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 6d3ae4b20a5b..9c3d13999dd3 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -11,6 +11,14 @@ else
         KBUILD_DEFCONFIG := $(ARCH)_defconfig
 endif
 
+# Handle different option names for specifying stack alignment with gcc and
+# clang.
+ifeq ($(cc-name),clang)
+	cc_stack_align_opt := -mstack-alignment
+else
+	cc_stack_align_opt := -mpreferred-stack-boundary
+endif
+
 # How to compile the 16-bit code.  Note we always compile for -march=i386;
 # that way we can complain to the user if the CPU is insufficient.
 #
@@ -28,7 +36,7 @@ REALMODE_CFLAGS	:= $(M16_CFLAGS) -g -Os -D__KERNEL__ \
 
 REALMODE_CFLAGS += $(call cc-option-raw, $(CC), $(REALMODE_CFLAGS), -ffreestanding)
 REALMODE_CFLAGS += $(call cc-option-raw, $(CC), $(REALMODE_CFLAGS), -fno-stack-protector)
-REALMODE_CFLAGS += $(call cc-option-raw, $(CC), $(REALMODE_CFLAGS), -mpreferred-stack-boundary=2)
+REALMODE_CFLAGS += $(call cc-option-raw, $(CC), $(REALMODE_CFLAGS), $(cc_stack_align_opt)=2)
 export REALMODE_CFLAGS
 
 # BITS is used as extension for files which are available in a 32 bit
@@ -65,8 +73,10 @@ ifeq ($(CONFIG_X86_32),y)
         # with nonstandard options
         KBUILD_CFLAGS += -fno-pic
 
-        # prevent gcc from keeping the stack 16 byte aligned
-        KBUILD_CFLAGS += $(call cc-option,-mpreferred-stack-boundary=2)
+        # Align the stack to the register width instead of using the default
+        # alignment of 16 bytes. This reduces stack usage and the number of
+        # alignment instructions.
+        KBUILD_CFLAGS += $(call cc-option,$(cc_stack_align_opt)=2)
 
         # Disable unit-at-a-time mode on pre-gcc-4.0 compilers, it makes gcc use
         # a lot more stack due to the lack of sharing of stacklots:
@@ -98,8 +108,14 @@ else
         KBUILD_CFLAGS += $(call cc-option,-mno-80387)
         KBUILD_CFLAGS += $(call cc-option,-mno-fp-ret-in-387)
 
-	# Use -mpreferred-stack-boundary=3 if supported.
-	KBUILD_CFLAGS += $(call cc-option,-mpreferred-stack-boundary=3)
+        # By default gcc and clang use a stack alignment of 16 bytes for x86.
+        # However the standard kernel entry on x86-64 leaves the stack on an
+        # 8-byte boundary. If the compiler isn't informed about the actual
+        # alignment it will generate extra alignment instructions for the
+        # default alignment which keep the stack *mis*aligned.
+        # Furthermore an alignment to the register width reduces stack usage
+        # and the number of alignment instructions.
+        KBUILD_CFLAGS += $(call cc-option,$(cc_stack_align_opt)=3)
 
 	# Use -mskip-rax-setup if supported.
 	KBUILD_CFLAGS += $(call cc-option,-mskip-rax-setup)
-- 
2.13.1.518.g3df882009-goog

