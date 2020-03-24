Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:61461 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727688AbgCXQQZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 12:16:25 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/3] kbuild: remove AS variable
Date: Wed, 25 Mar 2020 01:15:39 +0900
Message-Id: <20200324161539.7538-3-masahiroy@kernel.org>
In-Reply-To: <20200324161539.7538-1-masahiroy@kernel.org>
References: <20200324161539.7538-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, clang-built-linux@googlegroups.com

As commit 5ef872636ca7 ("kbuild: get rid of misleading $(AS) from
documents") noted, we rarely use $(AS) in the kernel build.

Now that the only/last user of $(AS) in drivers/net/wan/Makefile was
converted to $(CC), $(AS) is no longer used in the build process.

You can still pass in AS=clang, which is just a switch to turn on
the LLVM integrated assembler.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 16d8271192d1..339e8c51a10b 100644
--- a/Makefile
+++ b/Makefile
@@ -405,7 +405,6 @@ KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
 KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
 
 # Make variables (CC, etc...)
-AS		= $(CROSS_COMPILE)as
 LD		= $(CROSS_COMPILE)ld
 CC		= $(CROSS_COMPILE)gcc
 CPP		= $(CC) -E
@@ -472,7 +471,7 @@ KBUILD_LDFLAGS :=
 GCC_PLUGINS_CFLAGS :=
 CLANG_FLAGS :=
 
-export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
+export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
-- 
2.17.1
