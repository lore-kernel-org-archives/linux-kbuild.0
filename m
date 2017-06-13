Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f52.google.com ([74.125.83.52]:33109 "EHLO
        mail-pg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753241AbdFMA4E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Jun 2017 20:56:04 -0400
Received: by mail-pg0-f52.google.com with SMTP id f185so52292276pgc.0
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2017 17:56:04 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 3/3] x86/build: Specify stack alignment for clang
Date: Mon, 12 Jun 2017 17:55:31 -0700
Message-Id: <20170613005531.77656-4-mka@chromium.org>
In-Reply-To: <20170613005531.77656-1-mka@chromium.org>
References: <20170613005531.77656-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>

For gcc stack alignment is configured with -mpreferred-stack-boundary=N,
clang has the option -mstack-alignment=N for that purpose. Use the same
alignment as for gcc.

If the alignment is not specified clang assumes an alignment of
16 bytes, as required by the standard ABI. However as mentioned in
d9b0cde91c60 ("x86-64, gcc: Use -mpreferred-stack-boundary=3 if
supported") the standard kernel entry on x86-64 leaves the stack
on an 8-byte boundary, as a consequence clang will keep the stack
misaligned.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/x86/Makefile | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 86b725d69423..7f6c33f4d428 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -11,6 +11,14 @@ else
         KBUILD_DEFCONFIG := $(ARCH)_defconfig
 endif
 
+# Handle different option names for specifying stack alignment with gcc and
+# clang.
+ifeq ($(cc-name),clang)
+	stack_align_opt := -mstack-alignment
+else
+	stack_align_opt := -mpreferred-stack-boundary
+endif
+
 # How to compile the 16-bit code.  Note we always compile for -march=i386;
 # that way we can complain to the user if the CPU is insufficient.
 #
@@ -28,7 +36,7 @@ REALMODE_CFLAGS	:= $(M16_CFLAGS) -g -Os -D__KERNEL__ \
 
 REALMODE_CFLAGS += $(call cc-option-no-kbuild, $(REALMODE_CFLAGS), -ffreestanding)
 REALMODE_CFLAGS += $(call cc-option-no-kbuild, $(REALMODE_CFLAGS), -fno-stack-protector)
-REALMODE_CFLAGS += $(call cc-option-no-kbuild, $(REALMODE_CFLAGS), -mpreferred-stack-boundary=2)
+REALMODE_CFLAGS += $(call cc-option-no-kbuild, $(REALMODE_CFLAGS), $(stack_align_opt)=2)
 export REALMODE_CFLAGS
 
 # BITS is used as extension for files which are available in a 32 bit
@@ -65,8 +73,8 @@ ifeq ($(CONFIG_X86_32),y)
         # with nonstandard options
         KBUILD_CFLAGS += -fno-pic
 
-        # prevent gcc from keeping the stack 16 byte aligned
-        KBUILD_CFLAGS += $(call cc-option,-mpreferred-stack-boundary=2)
+        # prevent the compiler from keeping the stack 16 byte aligned
+        KBUILD_CFLAGS += $(call cc-option,$(stack_align_opt)=2)
 
         # Disable unit-at-a-time mode on pre-gcc-4.0 compilers, it makes gcc use
         # a lot more stack due to the lack of sharing of stacklots:
@@ -98,8 +106,8 @@ else
         KBUILD_CFLAGS += $(call cc-option,-mno-80387)
         KBUILD_CFLAGS += $(call cc-option,-mno-fp-ret-in-387)
 
-	# Use -mpreferred-stack-boundary=3 if supported.
-	KBUILD_CFLAGS += $(call cc-option,-mpreferred-stack-boundary=3)
+	# Align the stack to 8 bytes if supported.
+	KBUILD_CFLAGS += $(call cc-option,$(stack_align_opt)=3)
 
 	# Use -mskip-rax-setup if supported.
 	KBUILD_CFLAGS += $(call cc-option,-mskip-rax-setup)
-- 
2.13.1.508.gb3defc5cc-goog

