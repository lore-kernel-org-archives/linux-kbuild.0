Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:34387 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752339AbdFUH44 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jun 2017 03:56:56 -0400
Received: by mail-pf0-f194.google.com with SMTP id d5so28344422pfe.1
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Jun 2017 00:56:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 2/2] tile: thin archives fix linking
Date: Wed, 21 Jun 2017 17:56:38 +1000
Message-Id: <20170621075638.19251-3-npiggin@gmail.com>
In-Reply-To: <20170621075638.19251-1-npiggin@gmail.com>
References: <20170621075638.19251-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org, Chris Metcalf <cmetcalf@mellanox.com>

The VDSO symbols can't be linked into built-in.o when building with
thin archives, so change this to linking them into the final link.

Cc: Chris Metcalf <cmetcalf@mellanox.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/tile/Makefile             | 2 ++
 arch/tile/kernel/vdso/Makefile | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/tile/Makefile b/arch/tile/Makefile
index 4dc380a519d4..eb43ffb999b6 100644
--- a/arch/tile/Makefile
+++ b/arch/tile/Makefile
@@ -30,6 +30,8 @@ endif
 # In kernel modules, this causes load failures due to unsupported relocations.
 KBUILD_CFLAGS   += -fno-asynchronous-unwind-tables
 
+LDFLAGS_vmlinux	+= -R arch/tile/kernel/vdso/vdso-syms.o
+
 LIBGCC_PATH     := \
   $(shell $(CC) $(KBUILD_CFLAGS) $(KCFLAGS) -print-libgcc-file-name)
 
diff --git a/arch/tile/kernel/vdso/Makefile b/arch/tile/kernel/vdso/Makefile
index c54fff37b5ff..84daaf2c5e2c 100644
--- a/arch/tile/kernel/vdso/Makefile
+++ b/arch/tile/kernel/vdso/Makefile
@@ -50,8 +50,6 @@ $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso)
 # table and layout of the linked DSO.  With ld -R we can then refer to
 # these symbols in the kernel code rather than hand-coded addresses.
 extra-y += vdso-syms.o
-$(obj)/built-in.o: $(obj)/vdso-syms.o
-$(obj)/built-in.o: ld_flags += -R $(obj)/vdso-syms.o
 
 SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
                             $(call cc-ldoption, -Wl$(comma)--hash-style=both)
-- 
2.11.0

