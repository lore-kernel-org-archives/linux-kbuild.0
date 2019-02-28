Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:55267 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbfB1Jcr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Feb 2019 04:32:47 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove commented-out INITRD_COMPRESS
Date: Thu, 28 Feb 2019 18:32:01 +0900
Message-Id: <1551346321-3676-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: J P <ppandit@redhat.com>, Jan Beulich <JBeulich@suse.com>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This code has been commented out since commit b7000adef17a
("Don't set the INITRD_COMPRESS environment variable automatically").

Clean it up now.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Makefile b/Makefile
index a8ca8f9..302e1f8 100644
--- a/Makefile
+++ b/Makefile
@@ -936,19 +936,6 @@ ifdef CONFIG_MODULE_COMPRESS
 endif # CONFIG_MODULE_COMPRESS
 export mod_compress_cmd
 
-# Select initial ramdisk compression format, default is gzip(1).
-# This shall be used by the dracut(8) tool while creating an initramfs image.
-#
-INITRD_COMPRESS-y                  := gzip
-INITRD_COMPRESS-$(CONFIG_RD_BZIP2) := bzip2
-INITRD_COMPRESS-$(CONFIG_RD_LZMA)  := lzma
-INITRD_COMPRESS-$(CONFIG_RD_XZ)    := xz
-INITRD_COMPRESS-$(CONFIG_RD_LZO)   := lzo
-INITRD_COMPRESS-$(CONFIG_RD_LZ4)   := lz4
-# do not export INITRD_COMPRESS, since we didn't actually
-# choose a sane default compression above.
-# export INITRD_COMPRESS := $(INITRD_COMPRESS-y)
-
 ifdef CONFIG_MODULE_SIG_ALL
 $(eval $(call config_filename,MODULE_SIG_KEY))
 
-- 
2.7.4
