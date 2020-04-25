Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:62627 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgDYFSl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 25 Apr 2020 01:18:41 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] h8300: suppress error messages for 'make clean'
Date: Sat, 25 Apr 2020 14:18:16 +0900
Message-Id: <20200425051816.791423-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, uclinux-h8-devel@lists.sourceforge.jp, Masahiro Yamada <masahiroy@kernel.org>

'make ARCH=h8300 clean' emits error messages as follows:

  $ make ARCH=h8300 clean
  gcc: error: missing argument to '-Wframe-larger-than='
  gcc: error: unrecognized command line option '-mint32'

You can suppress the second one by setting the correct CROSS_COMPILE=,
but we should not require any compiler for cleaning.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/h8300/boot/compressed/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/h8300/boot/compressed/Makefile b/arch/h8300/boot/compressed/Makefile
index 9e2701069bbe..5942793f77a0 100644
--- a/arch/h8300/boot/compressed/Makefile
+++ b/arch/h8300/boot/compressed/Makefile
@@ -18,7 +18,7 @@ CONFIG_MEMORY_START     ?= 0x00400000
 CONFIG_BOOT_LINK_OFFSET ?= 0x00280000
 IMAGE_OFFSET := $(shell printf "0x%08x" $$(($(CONFIG_MEMORY_START)+$(CONFIG_BOOT_LINK_OFFSET))))
 
-LIBGCC := $(shell $(CROSS-COMPILE)$(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
+LIBGCC := $(shell $(CROSS-COMPILE)$(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name 2>/dev/null)
 LDFLAGS_vmlinux := -Ttext $(IMAGE_OFFSET) -estartup -T $(obj)/vmlinux.lds \
 	--defsym output=$(CONFIG_MEMORY_START)
 
-- 
2.25.1
