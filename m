Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nbd.name ([46.4.11.11]:36353 "EHLO nbd.name"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750942AbdBFJbr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Feb 2017 04:31:47 -0500
From: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH] kbuild: export SUBARCH
Date: Mon,  6 Feb 2017 10:31:42 +0100
Message-Id: <20170206093142.64537-1-nbd@nbd.name>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: sfr@canb.auug.org.au

Fixes the following build error on x86:

  gcc -Wp,-MD,arch/x86/entry/vdso/.vdso2c.d -O2 -I/Users/nbd/lede/staging_dir/host/include -I/Users/nbd/lede/staging_dir/host/usr/include  -Wall -Wmissing-prototypes -Wstrict-prototypes   -I/Users/nbd/lede/staging_dir/host/include -I./tools/include -I./include/uapi -I./arch//include/uapi  -o arch/x86/entry/vdso/vdso2c arch/x86/entry/vdso/vdso2c.c -L/Users/nbd/lede/staging_dir/host/lib
  In file included from arch/x86/entry/vdso/vdso2c.c:66:
  In file included from ./include/uapi/linux/elf.h:4:
  ./tools/include/linux/types.h:9:10: fatal error: 'asm/types.h' file not found
  #include <asm/types.h>

Fixes: d51306f1a3bc ("x86: Make the vdso2c compiler use the host architecture headers")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 96b27a888285..492143bad81e 100644
--- a/Makefile
+++ b/Makefile
@@ -414,8 +414,8 @@ KERNELRELEASE = $(shell cat include/config/kernel.release 2> /dev/null)
 KERNELVERSION = $(VERSION)$(if $(PATCHLEVEL),.$(PATCHLEVEL)$(if $(SUBLEVEL),.$(SUBLEVEL)))$(EXTRAVERSION)
 
 export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION
-export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC
-export CPP AR NM STRIP OBJCOPY OBJDUMP
+export ARCH SRCARCH SUBARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD
+export CC CPP AR NM STRIP OBJCOPY OBJDUMP
 export MAKE AWK GENKSYMS INSTALLKERNEL PERL PYTHON UTS_MACHINE
 export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
 
-- 
2.11.0

