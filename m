Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:36326 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756501AbeEJFR1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 May 2018 01:17:27 -0400
Received: by mail-pl0-f66.google.com with SMTP id v24-v6so611024plo.3
        for <linux-kbuild@vger.kernel.org>; Wed, 09 May 2018 22:17:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 5/5] powerpc/kbuild: move -mprofile-kernel check to Kconfig
Date: Thu, 10 May 2018 15:16:59 +1000
Message-Id: <20180510051659.15356-6-npiggin@gmail.com>
In-Reply-To: <20180510051659.15356-1-npiggin@gmail.com>
References: <20180510051659.15356-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org

This eliminates the workaround that requires disabling
-mprofile-kernel by default in Kconfig.

[ Note: this depends on https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kconfig-shell-v3 ]

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                            | 16 +---------------
 arch/powerpc/Makefile                           | 14 ++------------
 arch/powerpc/tools/gcc-check-mprofile-kernel.sh |  4 ++--
 3 files changed, 5 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 512fcc177c87..af527f894f9b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -460,23 +460,9 @@ config LD_HEAD_STUB_CATCH
 
 	  If unsure, say "N".
 
-config DISABLE_MPROFILE_KERNEL
-	bool "Disable use of mprofile-kernel for kernel tracing"
-	depends on PPC64 && CPU_LITTLE_ENDIAN
-	default y
-	help
-	  Selecting this options disables use of the mprofile-kernel ABI for
-	  kernel tracing. That will cause options such as live patching
-	  (CONFIG_LIVEPATCH) which depend on CONFIG_DYNAMIC_FTRACE_WITH_REGS to
-	  be disabled also.
-
-	  If you have a toolchain which supports mprofile-kernel, then you can
-	  disable this. Otherwise leave it enabled. If you're not sure, say
-	  "Y".
-
 config MPROFILE_KERNEL
 	depends on PPC64 && CPU_LITTLE_ENDIAN
-	def_bool !DISABLE_MPROFILE_KERNEL
+	def_bool $(success $(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -I$(srctree)/include -D__KERNEL__)
 
 config IOMMU_HELPER
 	def_bool PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 5f3ec8029e50..9f69b1599c61 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -156,18 +156,8 @@ CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=powerpc64
 endif
 
 ifdef CONFIG_MPROFILE_KERNEL
-    ifeq ($(shell $(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -I$(srctree)/include -D__KERNEL__),OK)
-        CC_FLAGS_FTRACE := -pg -mprofile-kernel
-        KBUILD_CPPFLAGS += -DCC_USING_MPROFILE_KERNEL
-    else
-        # If the user asked for mprofile-kernel but the toolchain doesn't
-        # support it, emit a warning and deliberately break the build later
-        # with mprofile-kernel-not-supported. We would prefer to make this an
-        # error right here, but then the user would never be able to run
-        # oldconfig to change their configuration.
-        $(warning Compiler does not support mprofile-kernel, set CONFIG_DISABLE_MPROFILE_KERNEL)
-        CC_FLAGS_FTRACE := -mprofile-kernel-not-supported
-    endif
+	CC_FLAGS_FTRACE := -pg -mprofile-kernel
+	KBUILD_CPPFLAGS += -DCC_USING_MPROFILE_KERNEL
 endif
 
 CFLAGS-$(CONFIG_CELL_CPU) += $(call cc-option,-mcpu=cell)
diff --git a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
index 061f8035bdbe..ec4486a9c4a3 100755
--- a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
+++ b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
@@ -10,13 +10,13 @@ set -o pipefail
 # Test whether the compile option -mprofile-kernel exists and generates
 # profiling code (ie. a call to _mcount()).
 echo "int func() { return 0; }" | \
-    $* -S -x c -O2 -p -mprofile-kernel - -o - 2> /dev/null | \
+    $* -m64 -S -x c -O2 -p -mprofile-kernel - -o - 2> /dev/null | \
     grep -q "_mcount"
 
 # Test whether the notrace attribute correctly suppresses calls to _mcount().
 
 echo -e "#include <linux/compiler.h>\nnotrace int func() { return 0; }" | \
-    $* -S -x c -O2 -p -mprofile-kernel - -o - 2> /dev/null | \
+    $* -m64 -S -x c -O2 -p -mprofile-kernel - -o - 2> /dev/null | \
     grep -q "_mcount" && \
     exit 1
 
-- 
2.17.0

