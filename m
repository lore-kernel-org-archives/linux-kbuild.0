Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50193 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731465AbgCPOak (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Mar 2020 10:30:40 -0400
Received: by mail-wm1-f68.google.com with SMTP id z13so1855355wml.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2020 07:30:37 -0700 (PDT)
From: Petr Malat <oss@malat.biz>
Subject: [PATCH v2 2/2] x86: Enable support for ZSTD-compressed kernel
Date: Mon, 16 Mar 2020 15:30:17 +0100
Message-Id: <20200316143018.1366-2-oss@malat.biz>
In-Reply-To: <20200316143018.1366-1-oss@malat.biz>
References: <20200316140745.GB4041840@kroah.com>
 <20200316143018.1366-1-oss@malat.biz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org
Cc: terrelln@fb.com, clm@fb.com, gregkh@linuxfoundation.org, keescook@chromium.org, Petr Malat <oss@malat.biz>

ZSTD compression ratio is roughly 10% worst than xz, but the
decompression is 10x faster. Currently, this is one of the optimal
algorithms available in the kernel, as there isn't an algorithm,
which would provide a better compression ratio and a shorter
decompression time.

Signed-off-by: Petr Malat <oss@malat.biz>
---
 arch/x86/Kconfig                  | 1 +
 arch/x86/boot/compressed/Makefile | 5 ++++-
 arch/x86/boot/compressed/misc.c   | 4 ++++
 arch/x86/include/asm/boot.h       | 4 ++--
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5e8949953660..b22312aae674 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -180,6 +180,7 @@ config X86
 	select HAVE_KERNEL_LZMA
 	select HAVE_KERNEL_LZO
 	select HAVE_KERNEL_XZ
+	select HAVE_KERNEL_ZSTD
 	select HAVE_KPROBES
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_FUNCTION_ERROR_INJECTION
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 1dac210f7d44..a87dc1e41772 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -24,7 +24,7 @@ OBJECT_FILES_NON_STANDARD	:= y
 KCOV_INSTRUMENT		:= n
 
 targets := vmlinux vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz2 vmlinux.bin.lzma \
-	vmlinux.bin.xz vmlinux.bin.lzo vmlinux.bin.lz4
+	vmlinux.bin.xz vmlinux.bin.lzo vmlinux.bin.lz4 vmlinux.bin.zst
 
 KBUILD_CFLAGS := -m$(BITS) -O2
 KBUILD_CFLAGS += -fno-strict-aliasing $(call cc-option, -fPIE, -fPIC)
@@ -145,6 +145,8 @@ $(obj)/vmlinux.bin.lzo: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lzo)
 $(obj)/vmlinux.bin.lz4: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lz4)
+$(obj)/vmlinux.bin.zst: $(vmlinux.bin.all-y) FORCE
+	$(call if_changed,zstd)
 
 suffix-$(CONFIG_KERNEL_GZIP)	:= gz
 suffix-$(CONFIG_KERNEL_BZIP2)	:= bz2
@@ -152,6 +154,7 @@ suffix-$(CONFIG_KERNEL_LZMA)	:= lzma
 suffix-$(CONFIG_KERNEL_XZ)	:= xz
 suffix-$(CONFIG_KERNEL_LZO) 	:= lzo
 suffix-$(CONFIG_KERNEL_LZ4) 	:= lz4
+suffix-$(CONFIG_KERNEL_ZSTD) 	:= zst
 
 quiet_cmd_mkpiggy = MKPIGGY $@
       cmd_mkpiggy = $(obj)/mkpiggy $< > $@
diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
index 9652d5c2afda..39e592d0e0b4 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -77,6 +77,10 @@ static int lines, cols;
 #ifdef CONFIG_KERNEL_LZ4
 #include "../../../../lib/decompress_unlz4.c"
 #endif
+
+#ifdef CONFIG_KERNEL_ZSTD
+#include "../../../../lib/decompress_unzstd.c"
+#endif
 /*
  * NOTE: When adding a new decompressor, please update the analysis in
  * ../header.S.
diff --git a/arch/x86/include/asm/boot.h b/arch/x86/include/asm/boot.h
index 680c320363db..9838c183e9a8 100644
--- a/arch/x86/include/asm/boot.h
+++ b/arch/x86/include/asm/boot.h
@@ -24,9 +24,9 @@
 # error "Invalid value for CONFIG_PHYSICAL_ALIGN"
 #endif
 
-#ifdef CONFIG_KERNEL_BZIP2
+#if CONFIG_KERNEL_BZIP2 || CONFIG_KERNEL_ZSTD
 # define BOOT_HEAP_SIZE		0x400000
-#else /* !CONFIG_KERNEL_BZIP2 */
+#else /* !(CONFIG_KERNEL_BZIP2 || CONFIG_KERNEL_ZSTD)  */
 # define BOOT_HEAP_SIZE		 0x10000
 #endif
 
-- 
2.20.1
