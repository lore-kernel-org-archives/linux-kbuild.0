Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54876 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbfKIMMZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Nov 2019 07:12:25 -0500
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] kbuild: tell sparse about the $ARCH
Date: Sat,  9 Nov 2019 13:12:16 +0100
Message-Id: <20191109121216.61381-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

Sparse uses the same executable for all archs and uses flags
like -m64, -mbig-endian or -D__arm__ for arch-specific parameters.
But Sparse also uses value from the host machine used to build
Sparse as default value for the target machine.

This works, of course, well for native build but can create
problems when cross-compiling, like defining both '__i386__'
and '__arm__' when cross-compiling for arm on a x86-64 machine.

Fix this by explicitely telling sparse the target architecture.

Reported-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 6f54f2f95743..05a8906dde63 100644
--- a/Makefile
+++ b/Makefile
@@ -937,6 +937,9 @@ ifeq ($(CONFIG_RELR),y)
 LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr
 endif
 
+# make the checker run with the right architecture
+CHECKFLAGS += --arch=$(ARCH)
+
 # insure the checker run with the right endianness
 CHECKFLAGS += $(if $(CONFIG_CPU_BIG_ENDIAN),-mbig-endian,-mlittle-endian)
 
-- 
2.24.0
