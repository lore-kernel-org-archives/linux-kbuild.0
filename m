Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:37608 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbfEMCQB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:16:01 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] alpha: move arch/alpha/defconfig to arch/alpha/configs/defconfig
Date: Mon, 13 May 2019 11:14:05 +0900
Message-Id: <20190513021405.12428-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Greentime Hu <green.hu@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Vincent Chen <deanbo422@gmail.com>, Matt Turner <mattst88@gmail.com>, Palmer Dabbelt <palmer@sifive.com>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>

As of Linux 5.1, alpha and s390 are the last architectures that
have defconfig in arch/*/ instead of arch/*/configs/.

  $ find arch -name defconfig | sort
  arch/alpha/defconfig
  arch/arm64/configs/defconfig
  arch/csky/configs/defconfig
  arch/nds32/configs/defconfig
  arch/riscv/configs/defconfig
  arch/s390/defconfig

The arch/$(ARCH)/defconfig is the hard-coded default in Kconfig,
and I want to deprecate it after evacuating the remaining defconfig
into the standard location, arch/*/configs/.

Define KBUILD_DEFCONFIG like other architectures, and move defconfig
into the configs/ subdirectory.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/alpha/Makefile                | 2 ++
 arch/alpha/{ => configs}/defconfig | 0
 2 files changed, 2 insertions(+)
 rename arch/alpha/{ => configs}/defconfig (100%)

diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
index 12dee59b011c..b3314e0dcb6f 100644
--- a/arch/alpha/Makefile
+++ b/arch/alpha/Makefile
@@ -8,6 +8,8 @@
 # Copyright (C) 1994 by Linus Torvalds
 #
 
+KBUILD_DEFCONFIG := defconfig
+
 NM := $(NM) -B
 
 LDFLAGS_vmlinux	:= -static -N #-relax
diff --git a/arch/alpha/defconfig b/arch/alpha/configs/defconfig
similarity index 100%
rename from arch/alpha/defconfig
rename to arch/alpha/configs/defconfig
-- 
2.17.1
