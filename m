Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:35266 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751149AbdFVMjz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jun 2017 08:39:55 -0400
Received: by mail-pf0-f196.google.com with SMTP id s66so2746331pfs.2
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jun 2017 05:39:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 3/3] tile: thin archives fix linking
Date: Thu, 22 Jun 2017 22:39:29 +1000
Message-Id: <20170622123929.15054-4-npiggin@gmail.com>
In-Reply-To: <20170622123929.15054-1-npiggin@gmail.com>
References: <20170622123929.15054-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org, Chris Metcalf <cmetcalf@mellanox.com>

The VDSO symbols can't be linked into built-in.o when building with
thin archives, so change this to linking a new object file that is
included into the built-in.o.

Cc: Chris Metcalf <cmetcalf@mellanox.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/tile/kernel/vdso/Makefile | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/tile/kernel/vdso/Makefile b/arch/tile/kernel/vdso/Makefile
index c54fff37b5ff..e140472d5be6 100644
--- a/arch/tile/kernel/vdso/Makefile
+++ b/arch/tile/kernel/vdso/Makefile
@@ -11,7 +11,7 @@ obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
 # vdso32 is only for tilegx -m32 compat task.
 VDSO32-$(CONFIG_COMPAT) := y
 
-obj-y += vdso.o
+obj-y += vdso.o vdso-syms.o
 obj-$(VDSO32-y) += vdso32.o
 extra-y += vdso.lds
 CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
@@ -49,16 +49,18 @@ $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso)
 # We also create a special relocatable object that should mirror the symbol
 # table and layout of the linked DSO.  With ld -R we can then refer to
 # these symbols in the kernel code rather than hand-coded addresses.
-extra-y += vdso-syms.o
-$(obj)/built-in.o: $(obj)/vdso-syms.o
-$(obj)/built-in.o: ld_flags += -R $(obj)/vdso-syms.o
 
 SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
                             $(call cc-ldoption, -Wl$(comma)--hash-style=both)
-SYSCFLAGS_vdso_syms.o = -r
-$(obj)/vdso-syms.o: $(src)/vdso.lds $(obj)/vrt_sigreturn.o FORCE
+SYSCFLAGS_vdso_dummy.o = -r
+$(obj)/vdso-dummy.o: $(src)/vdso.lds $(obj)/vrt_sigreturn.o FORCE
 	$(call if_changed,vdsold)
 
+quiet_cmd_vdso_sym = VDSOSYM $@
+      cmd_vdso_sym = $(LD) -r -R $(obj)/vdso-dummy.o -o $@
+
+$(obj)/vdso-syms.o: $(obj)/vdso-dummy.o
+	$(call if_changed,vdso_sym)
 
 # strip rule for the .so file
 $(obj)/%.so: OBJCOPYFLAGS := -S
-- 
2.11.0

