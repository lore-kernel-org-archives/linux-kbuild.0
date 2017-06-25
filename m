Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:49278 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750944AbdFYDQG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Jun 2017 23:16:06 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] tile: fix dependency and .*.cmd inclusion for incremental build
Date: Sun, 25 Jun 2017 12:15:31 +0900
Message-Id: <1498360531-10891-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Chris Metcalf <cmetcalf@mellanox.com>, linux-kernel@vger.kernel.org

Build targets using if_changed(_rule) must depend on FORCE so that
they are evaluated every time.

In order to include .*.cmd files correctly, build targets added to
"targets" must not be prefixed with $(obj)/ because it is done by
scripts/Makefile.lib .

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I found this Makefile in the mainline is already broken
for incremental building.

I inserted this before thin archive migration patches.

 arch/tile/kernel/vdso/Makefile | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/tile/kernel/vdso/Makefile b/arch/tile/kernel/vdso/Makefile
index c54fff3..cf162a2 100644
--- a/arch/tile/kernel/vdso/Makefile
+++ b/arch/tile/kernel/vdso/Makefile
@@ -42,10 +42,9 @@ $(obj)/vdso.o: $(obj)/vdso.so
 
 # link rule for the .so file, .lds has to be first
 SYSCFLAGS_vdso.so.dbg = $(c_flags)
-$(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso)
+$(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso) FORCE
 	$(call if_changed,vdsold)
 
-
 # We also create a special relocatable object that should mirror the symbol
 # table and layout of the linked DSO.  With ld -R we can then refer to
 # these symbols in the kernel code rather than hand-coded addresses.
@@ -96,17 +95,17 @@ KBUILD_CFLAGS_32 := $(filter-out -m64,$(KBUILD_CFLAGS))
 KBUILD_CFLAGS_32 += -m32 -fPIC -shared
 
 obj-vdso32 = $(patsubst %, v%32.o, $(vdso-syms))
-obj-vdso32 := $(addprefix $(obj)/, $(obj-vdso32))
 
 targets += $(obj-vdso32) vdso32.so vdso32.so.dbg
+obj-vdso32 := $(addprefix $(obj)/, $(obj-vdso32))
 
 $(obj-vdso32:%=%): KBUILD_AFLAGS = $(KBUILD_AFLAGS_32)
 $(obj-vdso32:%=%): KBUILD_CFLAGS = $(KBUILD_CFLAGS_32)
 
-$(obj)/vgettimeofday32.o: $(obj)/vgettimeofday.c
+$(obj)/vgettimeofday32.o: $(obj)/vgettimeofday.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
-$(obj)/vrt_sigreturn32.o: $(obj)/vrt_sigreturn.S
+$(obj)/vrt_sigreturn32.o: $(obj)/vrt_sigreturn.S FORCE
 	$(call if_changed,as_o_S)
 
 # Force dependency
@@ -114,5 +113,5 @@ $(obj)/vdso32.o: $(obj)/vdso32.so
 
 SYSCFLAGS_vdso32.so.dbg = -m32 -shared -s -Wl,-soname=linux-vdso32.so.1 \
 			    $(call cc-ldoption, -Wl$(comma)--hash-style=both)
-$(obj)/vdso32.so.dbg: $(src)/vdso.lds $(obj-vdso32)
+$(obj)/vdso32.so.dbg: $(src)/vdso.lds $(obj-vdso32) FORCE
 	$(call if_changed,vdsold)
-- 
2.7.4

