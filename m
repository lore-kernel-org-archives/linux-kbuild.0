Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gauss.credativ.com ([93.94.130.89]:52208 "EHLO
        gauss.credativ.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750736AbeDXI6X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Apr 2018 04:58:23 -0400
From: Sedat Dilek <sedat.dilek@credativ.de>
Subject: [PATCH] Makefile: Fix typo s/HOST_LOADLIBES/HOST_LOADLIBS
Date: Tue, 24 Apr 2018 10:44:08 +0200
Message-Id: <20180424084408.28034-1-sedat.dilek@credativ.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sedat Dilek <sedat.dilek@credativ.de>

Signed-off-by: Sedat Dilek <sedat.dilek@credativ.de>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 83b6c541565a..e1869dc08288 100644
--- a/Makefile
+++ b/Makefile
@@ -366,7 +366,7 @@ HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
 		-fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
 HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS)
 HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
-HOST_LOADLIBES := $(HOST_LFS_LIBS)
+HOST_LOADLIBS := $(HOST_LFS_LIBS)
 
 # Make variables (CC, etc...)
 AS		= $(CROSS_COMPILE)as
@@ -433,7 +433,7 @@ LDFLAGS :=
 GCC_PLUGINS_CFLAGS :=
 
 export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC
-export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIBES
+export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIBS
 export MAKE LEX YACC AWK GENKSYMS INSTALLKERNEL PERL PYTHON PYTHON2 PYTHON3 UTS_MACHINE
 export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
 
-- 
2.17.0

