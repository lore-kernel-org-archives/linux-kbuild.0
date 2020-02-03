Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f193.google.com ([209.85.222.193]:33219 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgBCVQr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 16:16:47 -0500
From: Arvind Sankar <nivedita@alum.mit.edu>
Subject: [PATCH] initramfs: don't double-compress built-in initramfs if the kernel is compressed
Date: Mon,  3 Feb 2020 16:16:44 -0500
Message-Id: <20200203211644.39847-1-nivedita@alum.mit.edu>
In-Reply-To: <20200203200656.GA455151@rani.riverdale.lan>
References: <20200203200656.GA455151@rani.riverdale.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Greg Thelen <gthelen@google.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Sam Ravnborg <sam@ravnborg.org>

If the kernel is going to be compressed anyway, there is no point in
double-compressing the built-in initramfs. Hide the built-in initramfs
compression choice in this case.

Signed-off-by: Arvind Sankar <nivedita@alum.mit.edu>
---
 init/Kconfig | 9 +++++++++
 usr/Kconfig  | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 24b23d843df1..88da0976bbfa 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -176,6 +176,9 @@ config HAVE_KERNEL_LZ4
 config HAVE_KERNEL_UNCOMPRESSED
 	bool
 
+config KERNEL_COMPRESSED
+	bool
+
 choice
 	prompt "Kernel compression mode"
 	default KERNEL_GZIP
@@ -201,6 +204,7 @@ choice
 config KERNEL_GZIP
 	bool "Gzip"
 	depends on HAVE_KERNEL_GZIP
+	select KERNEL_COMPRESSED
 	help
 	  The old and tried gzip compression. It provides a good balance
 	  between compression ratio and decompression speed.
@@ -208,6 +212,7 @@ config KERNEL_GZIP
 config KERNEL_BZIP2
 	bool "Bzip2"
 	depends on HAVE_KERNEL_BZIP2
+	select KERNEL_COMPRESSED
 	help
 	  Its compression ratio and speed is intermediate.
 	  Decompression speed is slowest among the choices.  The kernel
@@ -218,6 +223,7 @@ config KERNEL_BZIP2
 config KERNEL_LZMA
 	bool "LZMA"
 	depends on HAVE_KERNEL_LZMA
+	select KERNEL_COMPRESSED
 	help
 	  This compression algorithm's ratio is best.  Decompression speed
 	  is between gzip and bzip2.  Compression is slowest.
@@ -226,6 +232,7 @@ config KERNEL_LZMA
 config KERNEL_XZ
 	bool "XZ"
 	depends on HAVE_KERNEL_XZ
+	select KERNEL_COMPRESSED
 	help
 	  XZ uses the LZMA2 algorithm and instruction set specific
 	  BCJ filters which can improve compression ratio of executable
@@ -241,6 +248,7 @@ config KERNEL_XZ
 config KERNEL_LZO
 	bool "LZO"
 	depends on HAVE_KERNEL_LZO
+	select KERNEL_COMPRESSED
 	help
 	  Its compression ratio is the poorest among the choices. The kernel
 	  size is about 10% bigger than gzip; however its speed
@@ -249,6 +257,7 @@ config KERNEL_LZO
 config KERNEL_LZ4
 	bool "LZ4"
 	depends on HAVE_KERNEL_LZ4
+	select KERNEL_COMPRESSED
 	help
 	  LZ4 is an LZ77-type compressor with a fixed, byte-oriented encoding.
 	  A preliminary version of LZ4 de/compression tool is available at
diff --git a/usr/Kconfig b/usr/Kconfig
index bdf5bbd40727..f39eeb9ea2e3 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -102,7 +102,7 @@ config RD_LZ4
 
 choice
 	prompt "Built-in initramfs compression mode"
-	depends on INITRAMFS_SOURCE != ""
+	depends on INITRAMFS_SOURCE != "" && !KERNEL_COMPRESSED
 	help
 	  This option allows you to decide by which algorithm the builtin
 	  initramfs will be compressed.  Several compression algorithms are
-- 
2.24.1
