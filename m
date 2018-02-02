Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:52417 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752125AbeBBQVX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Feb 2018 11:21:23 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 7/7] Kbuild: lto: pass -m32/-m64 to to LDFINAL
Date: Fri,  2 Feb 2018 17:21:04 +0100
Message-Id: <20180202162104.2300532-7-arnd@arndb.de>
In-Reply-To: <20180202161550.2106846-1-arnd@arndb.de>
References: <20180202161550.2106846-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <ak@linux.intel.com>
Cc: Nicolas Pitre <nico@linaro.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

Building randconfig kernels with a biarch compiler fails with LTO
when the final link uses a different target architecture compared
to the earlier compilation stages.

Setting -m32 or -m64 in ${LDFINAL} solves this problem, though my
feeling is that there is a better way to do this. There might also
be other from KBUILD_CFLAGS that we may need in LDFINAL.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Makefile             | 2 +-
 arch/x86/Makefile    | 2 ++
 scripts/Makefile.lto | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 3b214c5a51a5..1a82fa39f82b 100644
--- a/Makefile
+++ b/Makefile
@@ -440,7 +440,7 @@ export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE CFLAGS_UBSAN
 export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
 export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_LDFLAGS_MODULE
 export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
-export KBUILD_ARFLAGS
+export KBUILD_ARFLAGS KBUILD_BIARCHFLAGS
 
 # When compiling out-of-tree modules, put MODVERDIR in the module
 # tree rather than in the kernel tree. The kernel tree might
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index e79f0fda9aea..12425aafc7fc 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -69,6 +69,7 @@ ifeq ($(CONFIG_X86_32),y)
         biarch := $(call cc-option,-m32)
         KBUILD_AFLAGS += $(biarch)
         KBUILD_CFLAGS += $(biarch)
+	KBUILD_BIARCHFLAGS += $(biarch)
 
         KBUILD_CFLAGS += -msoft-float -mregparm=3 -freg-struct-return
 
@@ -97,6 +98,7 @@ else
         biarch := -m64
         KBUILD_AFLAGS += -m64
         KBUILD_CFLAGS += -m64
+	KBUILD_BIARCHFLAGS += $(biarch)
 
         # Align jump targets to 1 byte, not the default 16 bytes:
         KBUILD_CFLAGS += $(call cc-option,-falign-jumps=1)
diff --git a/scripts/Makefile.lto b/scripts/Makefile.lto
index 2d6995ba7d0b..e57d025b7728 100644
--- a/scripts/Makefile.lto
+++ b/scripts/Makefile.lto
@@ -72,7 +72,7 @@ endif
 	KBUILD_CFLAGS += ${LTO_CFLAGS}
 
 	LDFINAL := ${CONFIG_SHELL} ${srctree}/scripts/gcc-ld \
-                  ${LTO_FINAL_CFLAGS}
+                  ${LTO_FINAL_CFLAGS} ${KBUILD_BIARCHFLAGS}
 
 	# LTO gcc creates a lot of files in TMPDIR, and with /tmp as tmpfs
 	# it's easy to drive the machine OOM. Use the object directory
-- 
2.9.0

