Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:61998 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbgFZTAN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 15:00:13 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] kbuild: remove cc-option test of -ffreestanding
Date: Sat, 27 Jun 2020 03:59:13 +0900
Message-Id: <20200626185913.92890-2-masahiroy@kernel.org>
In-Reply-To: <20200626185913.92890-1-masahiroy@kernel.org>
References: <20200626185913.92890-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: clang-built-linux@googlegroups.com, x86@kernel.org, linux-efi@vger.kernel.org, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>

Some Makefiles already pass -ffreestanding unconditionally.
For example, arch/arm64/lib/Makefile, arch/x86/purgatory/Makefile.
No problem report so far about hard-coding this option. So, we can
assume all supported compilers know -ffreestanding.

I confirmed GCC 4.8 and Clang manuals document this option.

Get rid of cc-option from -ffreestanding.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/s390/Makefile                    | 2 +-
 arch/x86/Makefile                     | 2 +-
 arch/x86/boot/compressed/Makefile     | 2 +-
 drivers/firmware/efi/libstub/Makefile | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/s390/Makefile b/arch/s390/Makefile
index 8dfa2cf1f05c..ba94b03c8b2f 100644
--- a/arch/s390/Makefile
+++ b/arch/s390/Makefile
@@ -27,7 +27,7 @@ KBUILD_CFLAGS_DECOMPRESSOR := $(CLANG_FLAGS) -m64 -O2
 KBUILD_CFLAGS_DECOMPRESSOR += -DDISABLE_BRANCH_PROFILING -D__NO_FORTIFY
 KBUILD_CFLAGS_DECOMPRESSOR += -fno-delete-null-pointer-checks -msoft-float
 KBUILD_CFLAGS_DECOMPRESSOR += -fno-asynchronous-unwind-tables
-KBUILD_CFLAGS_DECOMPRESSOR += $(call cc-option,-ffreestanding)
+KBUILD_CFLAGS_DECOMPRESSOR += -ffreestanding
 KBUILD_CFLAGS_DECOMPRESSOR += $(call cc-disable-warning, address-of-packed-member)
 KBUILD_CFLAGS_DECOMPRESSOR += $(if $(CONFIG_DEBUG_INFO),-g)
 KBUILD_CFLAGS_DECOMPRESSOR += $(if $(CONFIG_DEBUG_INFO_DWARF4), $(call cc-option, -gdwarf-4,))
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 89c3cdfba753..edc68538a04e 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -36,7 +36,7 @@ REALMODE_CFLAGS	:= $(M16_CFLAGS) -g -Os -DDISABLE_BRANCH_PROFILING \
 		   -fno-strict-aliasing -fomit-frame-pointer -fno-pic \
 		   -mno-mmx -mno-sse
 
-REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS), -ffreestanding)
+REALMODE_CFLAGS += -ffreestanding
 REALMODE_CFLAGS += -fno-stack-protector
 REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS), -Wno-address-of-packed-member)
 REALMODE_CFLAGS += $(call __cc-option, $(CC), $(REALMODE_CFLAGS), $(cc_stack_align4))
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index c88a31569a5e..b7beabecef8a 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -35,7 +35,7 @@ cflags-$(CONFIG_X86_32) := -march=i386
 cflags-$(CONFIG_X86_64) := -mcmodel=small
 KBUILD_CFLAGS += $(cflags-y)
 KBUILD_CFLAGS += -mno-mmx -mno-sse
-KBUILD_CFLAGS += $(call cc-option,-ffreestanding)
+KBUILD_CFLAGS += -ffreestanding
 KBUILD_CFLAGS += -fno-stack-protector
 KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
 KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index f8418763cd79..296b18fbd7a2 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -28,7 +28,7 @@ cflags-$(CONFIG_EFI_GENERIC_STUB) += -I$(srctree)/scripts/dtc/libfdt
 KBUILD_CFLAGS			:= $(cflags-y) -Os -DDISABLE_BRANCH_PROFILING \
 				   -include $(srctree)/drivers/firmware/efi/libstub/hidden.h \
 				   -D__NO_FORTIFY \
-				   $(call cc-option,-ffreestanding) \
+				   -ffreestanding \
 				   -fno-stack-protector \
 				   $(call cc-option,-fno-addrsig) \
 				   -D__DISABLE_EXPORTS
-- 
2.25.1
