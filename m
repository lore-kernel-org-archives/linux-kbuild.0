Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:64714 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbgACR7k (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 12:59:40 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 04/12] initramfs: remove redundant dependency on BLK_DEV_INITRD
Date: Sat,  4 Jan 2020 02:59:07 +0900
Message-Id: <20200103175915.26663-5-masahiroy@kernel.org>
In-Reply-To: <20200103175915.26663-1-masahiroy@kernel.org>
References: <20200103175915.26663-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-kernel@vger.kernel.org

init/Kconfig includes usr/Kconfig inside the "if BLK_DEV_INITRD" ...
"endif" block:

    if BLK_DEV_INITRD

    source "usr/Kconfig"

    endif

Hence, all the defines in usr/Kconfig depend on BLK_DEV_INITRD.

Remove the redundant "depends on BLK_DEV_INITRD".

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 usr/Kconfig | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/usr/Kconfig b/usr/Kconfig
index a6b68503d177..72f50a21c051 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -54,7 +54,6 @@ config INITRAMFS_ROOT_GID
 
 config RD_GZIP
 	bool "Support initial ramdisk/ramfs compressed using gzip"
-	depends on BLK_DEV_INITRD
 	default y
 	select DECOMPRESS_GZIP
 	help
@@ -64,7 +63,6 @@ config RD_GZIP
 config RD_BZIP2
 	bool "Support initial ramdisk/ramfs compressed using bzip2"
 	default y
-	depends on BLK_DEV_INITRD
 	select DECOMPRESS_BZIP2
 	help
 	  Support loading of a bzip2 encoded initial ramdisk or cpio buffer
@@ -73,7 +71,6 @@ config RD_BZIP2
 config RD_LZMA
 	bool "Support initial ramdisk/ramfs compressed using LZMA"
 	default y
-	depends on BLK_DEV_INITRD
 	select DECOMPRESS_LZMA
 	help
 	  Support loading of a LZMA encoded initial ramdisk or cpio buffer
@@ -81,7 +78,6 @@ config RD_LZMA
 
 config RD_XZ
 	bool "Support initial ramdisk/ramfs compressed using XZ"
-	depends on BLK_DEV_INITRD
 	default y
 	select DECOMPRESS_XZ
 	help
@@ -91,7 +87,6 @@ config RD_XZ
 config RD_LZO
 	bool "Support initial ramdisk/ramfs compressed using LZO"
 	default y
-	depends on BLK_DEV_INITRD
 	select DECOMPRESS_LZO
 	help
 	  Support loading of a LZO encoded initial ramdisk or cpio buffer
@@ -100,7 +95,6 @@ config RD_LZO
 config RD_LZ4
 	bool "Support initial ramdisk/ramfs compressed using LZ4"
 	default y
-	depends on BLK_DEV_INITRD
 	select DECOMPRESS_LZ4
 	help
 	  Support loading of a LZ4 encoded initial ramdisk or cpio buffer
-- 
2.17.1
