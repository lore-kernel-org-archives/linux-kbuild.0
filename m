Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:34070 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725968AbeJKFrw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Oct 2018 01:47:52 -0400
From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH] kbuild: Fail the build early when no lz4 present
Date: Thu, 11 Oct 2018 00:23:33 +0200
Message-Id: <20181010222333.17794-1-bp@alien8.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

When building randconfigs, the build fails at kernel compression stage
due to missing lz4 on the system but CONFIG_KERNEL_LZ4 has been selected
by randconfig. The result looks somethins like this:

    (cat arch/x86/boot/compressed/vmlinux.bin arch/x86/boot/compressed/vmlinux.relocs | lz4c -l -c1 stdin stdout && printf \334\141\301\001) > arch/x86/boot/compressed/vmlinux.bin.lz4 || (rm -f arch/x86/boot/compressed/vmlinux.bin.lz4 ; false)
  /bin/sh: 1: lz4c: not found
  make[2]: *** [arch/x86/boot/compressed/Makefile:143: arch/x86/boot/compressed/vmlinux.bin.lz4] Error 1
  make[1]: *** [arch/x86/boot/Makefile:112: arch/x86/boot/compressed/vmlinux] Error 2
  make: *** [arch/x86/Makefile:290: bzImage] Error 2

Fail the build much earlier by checking for lz4c presence before doing
anything else.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index a0c32de80482..f91de649234b 100644
--- a/Makefile
+++ b/Makefile
@@ -788,6 +788,12 @@ KBUILD_CFLAGS_KERNEL += -ffunction-sections -fdata-sections
 LDFLAGS_vmlinux += --gc-sections
 endif
 
+ifdef CONFIG_KERNEL_LZ4
+ifeq ($(CONFIG_SHELL which lz4c),)
+$(error "lz4 tool not found on this system but CONFIG_KERNEL_LZ4 enabled")
+endif
+endif
+
 # arch Makefile may override CC so keep this after arch Makefile is included
 NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 
-- 
2.19.0.271.gfe8321ec057f
