Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from forward104j.mail.yandex.net ([5.45.198.247]:36385 "EHLO
        forward104j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728011AbfLDXCM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Dec 2019 18:02:12 -0500
From: Dmitry Golovin <dima@golovin.in>
Subject: [PATCH] x86/boot: kbuild: allow readelf executable to be specified
Date: Thu,  5 Dec 2019 00:54:41 +0200
Message-Id: <20191204225446.202981-1-dima@golovin.in>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Dmitry Golovin <dima@golovin.in>, Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Bruce Ashfield <bruce.ashfield@gmail.com>, Ross Philipson <ross.philipson@oracle.com>, Ross Burton <ross.burton@intel.com>, Chao Fan <fanc.fnst@cn.fujitsu.com>, Daniel Kiper <daniel.kiper@oracle.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com

Introduce a new READELF variable to top-level Makefile, so the name of
readelf binary can be specified.

Before this change the name of the binary was hardcoded to
"$(CROSS_COMPILE)readelf" which might not be present for every
toolchain.

This allows to build with LLVM Object Reader by using make parameter
READELF=llvm-readelf.

Link: https://github.com/ClangBuiltLinux/linux/issues/771
Signed-off-by: Dmitry Golovin <dima@golovin.in>
Cc: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile                          | 3 ++-
 arch/x86/boot/compressed/Makefile | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 999a197d67d2..612a55d25442 100644
--- a/Makefile
+++ b/Makefile
@@ -414,6 +414,7 @@ STRIP		= $(CROSS_COMPILE)strip
 OBJCOPY		= $(CROSS_COMPILE)objcopy
 OBJDUMP		= $(CROSS_COMPILE)objdump
 OBJSIZE		= $(CROSS_COMPILE)size
+READELF		= $(CROSS_COMPILE)readelf
 PAHOLE		= pahole
 LEX		= flex
 YACC		= bison
@@ -472,7 +473,7 @@ GCC_PLUGINS_CFLAGS :=
 CLANG_FLAGS :=
 
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
-export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE PAHOLE LEX YACC AWK INSTALLKERNEL
+export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON PYTHON2 PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
 
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index aa976adb7094..1dac210f7d44 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -103,7 +103,7 @@ vmlinux-objs-$(CONFIG_EFI_MIXED) += $(obj)/efi_thunk_$(BITS).o
 quiet_cmd_check_data_rel = DATAREL $@
 define cmd_check_data_rel
 	for obj in $(filter %.o,$^); do \
-		${CROSS_COMPILE}readelf -S $$obj | grep -qF .rel.local && { \
+		$(READELF) -S $$obj | grep -qF .rel.local && { \
 			echo "error: $$obj has data relocations!" >&2; \
 			exit 1; \
 		} || true; \
-- 
2.23.0
