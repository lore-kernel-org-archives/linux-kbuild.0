Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f173.google.com ([209.85.215.173]:44731 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbgDAFiy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 01:38:54 -0400
From: Nick Terrell <nickrterrell@gmail.com>
Subject: [PATCH v4 5/8] usr: add support for zstd compressed initramfs
Date: Tue, 31 Mar 2020 22:39:10 -0700
Message-Id: <20200401053913.216783-6-nickrterrell@gmail.com>
In-Reply-To: <20200401053913.216783-1-nickrterrell@gmail.com>
References: <20200401053913.216783-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Terrell <terrelln@fb.com>
Cc: linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Nick Terrell <nickrterrell@gmail.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, rmikey@fb.com, mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>, Sedat Dilek <sedat.dilek@gmail.com>

From: Nick Terrell <terrelln@fb.com>

* Add support for a zstd compressed initramfs.
* Add compression for compressing built-in initramfs with zstd.

I have tested this patch by boot testing with buildroot and QEMU.
Specifically, I booted the kernel with both a zstd and gzip compressed
initramfs, both built into the kernel and separate. I ensured that the
correct compression algorithm was used. I tested on arm, aarch64, i386,
and x86_64.

This patch has been tested in production on aarch64 and x86_64 devices.

Additionally, I have performance measurements from internal use in
production. On an aarch64 device we saw 19 second boot time improvement
from switching from lzma to zstd (27 seconds to 8 seconds). On an x86_64
device we saw a 9 second boot time reduction from switching from xz to
zstd.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 usr/Kconfig  | 20 ++++++++++++++++++++
 usr/Makefile |  1 +
 2 files changed, 21 insertions(+)

diff --git a/usr/Kconfig b/usr/Kconfig
index bdf5bbd40727..43aca37d09b5 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -100,6 +100,15 @@ config RD_LZ4
 	  Support loading of a LZ4 encoded initial ramdisk or cpio buffer
 	  If unsure, say N.
 
+config RD_ZSTD
+	bool "Support initial ramdisk/ramfs compressed using ZSTD"
+	default y
+	depends on BLK_DEV_INITRD
+	select DECOMPRESS_ZSTD
+	help
+	  Support loading of a ZSTD encoded initial ramdisk or cpio buffer.
+	  If unsure, say N.
+
 choice
 	prompt "Built-in initramfs compression mode"
 	depends on INITRAMFS_SOURCE != ""
@@ -207,4 +216,15 @@ config INITRAMFS_COMPRESSION_LZ4
 	  If you choose this, keep in mind that most distros don't provide lz4
 	  by default which could cause a build failure.
 
+config INITRAMFS_COMPRESSION_ZSTD
+	bool "ZSTD"
+	depends on RD_ZSTD
+	help
+	  ZSTD is a compression algorithm targeting intermediate compression
+	  with fast decompression speed. It will compress better than GZIP and
+	  decompress around the same speed as LZO, but slower than LZ4.
+
+	  If you choose this, keep in mind that you may need to install the zstd
+	  tool to be able to compress the initram.
+
 endchoice
diff --git a/usr/Makefile b/usr/Makefile
index c12e6b15ce72..b1a81a40eab1 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -15,6 +15,7 @@ compress-$(CONFIG_INITRAMFS_COMPRESSION_LZMA)	:= lzma
 compress-$(CONFIG_INITRAMFS_COMPRESSION_XZ)	:= xzmisc
 compress-$(CONFIG_INITRAMFS_COMPRESSION_LZO)	:= lzo
 compress-$(CONFIG_INITRAMFS_COMPRESSION_LZ4)	:= lz4
+compress-$(CONFIG_INITRAMFS_COMPRESSION_ZSTD)	:= zstd
 
 obj-$(CONFIG_BLK_DEV_INITRD) := initramfs_data.o
 
-- 
2.26.0
