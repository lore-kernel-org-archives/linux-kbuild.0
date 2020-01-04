Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:53563 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbgADPDA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jan 2020 10:03:00 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 06/13] initramfs: make compression options not depend on INITRAMFS_SOURCE
Date: Sun,  5 Jan 2020 00:02:31 +0900
Message-Id: <20200104150238.19834-7-masahiroy@kernel.org>
In-Reply-To: <20200104150238.19834-1-masahiroy@kernel.org>
References: <20200104150238.19834-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-kernel@vger.kernel.org

Even if INITRAMFS_SOURCE is empty, usr/gen_initramfs.sh generates a
tiny default initramfs, which is embedded in vmlinux.

So, defining INITRAMFS_COMPRESSION* options should be valid irrespective
of INITRAMFS_SOURCE.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 usr/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/usr/Kconfig b/usr/Kconfig
index 72f50a21c051..43934c128010 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -102,7 +102,6 @@ config RD_LZ4
 
 choice
 	prompt "Built-in initramfs compression mode"
-	depends on INITRAMFS_SOURCE!=""
 	optional
 	help
 	  This option allows you to decide by which algorithm the builtin
@@ -211,7 +210,6 @@ config INITRAMFS_COMPRESSION_LZ4
 endchoice
 
 config INITRAMFS_COMPRESSION
-	depends on INITRAMFS_SOURCE!=""
 	string
 	default ""      if INITRAMFS_COMPRESSION_NONE
 	default ".gz"   if INITRAMFS_COMPRESSION_GZIP
-- 
2.17.1
