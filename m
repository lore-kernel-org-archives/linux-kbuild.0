Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([65.50.211.136]:48877 "EHLO mail.zytor.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751955AbdFSUem (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Jun 2017 16:34:42 -0400
Date: Mon, 19 Jun 2017 13:17:03 -0700
In-Reply-To: <20170619183757.124992-4-mka@chromium.org>
References: <20170619183757.124992-1-mka@chromium.org> <20170619183757.124992-4-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Re: [PATCH v4 3/3] x86/build: Specify stack alignment for clang
From: hpa@zytor.com
Message-ID: <EAA687B2-ECD0-42C7-907E-BE8BDF311EC1@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>

On June 19, 2017 11:37:57 AM PDT, Matthias Kaehlcke <mka@chromium.org> wrote:
>For gcc stack alignment is configured with
>-mpreferred-stack-boundary=N,
>clang has the option -mstack-alignment=N for that purpose. Use the same
>alignment as with gcc.
>
>If the alignment is not specified clang assumes an alignment of
>16 bytes, as required by the standard ABI. However as mentioned in
>d9b0cde91c60 ("x86-64, gcc: Use -mpreferred-stack-boundary=3 if
>supported") the standard kernel entry on x86-64 leaves the stack
>on an 8-byte boundary, as a consequence clang will keep the stack
>misaligned.
>
>Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
>---
> arch/x86/Makefile | 26 +++++++++++++++++++++-----
> 1 file changed, 21 insertions(+), 5 deletions(-)
>
>diff --git a/arch/x86/Makefile b/arch/x86/Makefile
>index b2dae639f778..9406d3670452 100644
>--- a/arch/x86/Makefile
>+++ b/arch/x86/Makefile
>@@ -11,6 +11,14 @@ else
>         KBUILD_DEFCONFIG := $(ARCH)_defconfig
> endif
> 
>+# Handle different option names for specifying stack alignment with
>gcc and
>+# clang.
>+ifeq ($(cc-name),clang)
>+	cc_stack_align_opt := -mstack-alignment
>+else
>+	cc_stack_align_opt := -mpreferred-stack-boundary
>+endif
>+
># How to compile the 16-bit code.  Note we always compile for
>-march=i386;
> # that way we can complain to the user if the CPU is insufficient.
> #
>@@ -28,7 +36,7 @@ REALMODE_CFLAGS	:= $(M16_CFLAGS) -g -Os -D__KERNEL__
>\
> 
>REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS),
>-ffreestanding)
>REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS),
>-fno-stack-protector)
>-REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS),
>-mpreferred-stack-boundary=2)
>+REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS),
>$(cc_stack_align_opt)=2)
> export REALMODE_CFLAGS
> 
> # BITS is used as extension for files which are available in a 32 bit
>@@ -65,8 +73,10 @@ ifeq ($(CONFIG_X86_32),y)
>         # with nonstandard options
>         KBUILD_CFLAGS += -fno-pic
> 
>-        # prevent gcc from keeping the stack 16 byte aligned
>-        KBUILD_CFLAGS += $(call
>cc-option,-mpreferred-stack-boundary=2)
>+        # Align the stack to the register width instead of using the
>default
>+        # alignment of 16 bytes. This reduces stack usage and the
>number of
>+        # alignment instructions.
>+        KBUILD_CFLAGS += $(call cc-option,$(cc_stack_align_opt)=2)
> 
># Disable unit-at-a-time mode on pre-gcc-4.0 compilers, it makes gcc
>use
>         # a lot more stack due to the lack of sharing of stacklots:
>@@ -98,8 +108,14 @@ else
>         KBUILD_CFLAGS += $(call cc-option,-mno-80387)
>         KBUILD_CFLAGS += $(call cc-option,-mno-fp-ret-in-387)
> 
>-	# Use -mpreferred-stack-boundary=3 if supported.
>-	KBUILD_CFLAGS += $(call cc-option,-mpreferred-stack-boundary=3)
>+        # By default gcc and clang use a stack alignment of 16 bytes
>for x86.
>+        # However the standard kernel entry on x86-64 leaves the stack
>on an
>+        # 8-byte boundary. If the compiler isn't informed about the
>actual
>+        # alignment it will generate extra alignment instructions for
>the
>+        # default alignment which keep the stack *mis*aligned.
>+        # Furthermore an alignment to the register width reduces stack
>usage
>+        # and the number of alignment instructions.
>+        KBUILD_CFLAGS += $(call cc-option,$(cc_stack_align_opt)=3)
> 
> 	# Use -mskip-rax-setup if supported.
> 	KBUILD_CFLAGS += $(call cc-option,-mskip-rax-setup)

Goddammit.

How many times do I have to say NAK to

>+ifeq ($(cc-name),clang)

... before it sinks in?
-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
