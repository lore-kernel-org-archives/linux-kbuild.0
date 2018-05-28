Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:40771 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032932AbeE1Pcm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 May 2018 11:32:42 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] [net-next, wrong] make BPFILTER_UMH depend on X86
Date: Mon, 28 May 2018 17:31:01 +0200
Message-Id: <20180528153222.2037158-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>, Alexei Starovoitov <ast@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

When build testing across architectures, I run into a build error on
all targets other than X86:

gcc-8.1.0-nolibc/arm-linux-gnueabi/bin/arm-linux-gnueabi-objdump: net/bpfilter/bpfilter_umh: File format not recognized
gcc-8.1.0-nolibc/arm-linux-gnueabi/bin/arm-linux-gnueabi-objcopy:net/bpfilter/bpfilter_umh.o: Invalid bfd target

The problem is that 'hostprogs' get built with 'gcc' rather than
'$(CROSS_COMPILE)gcc', and my default gcc (as most people's) targets x86.

To work around it, adding an X86 dependency gets randconfigs building
again on my box.

Clearly, this is not a good solution, since it should actually work fine
when building native kernels on other architectures but that is now
disabled, while cross building an x86 kernel on another host is still
broken after my patch.

What we probably want here is to try out if the compiler is able to build
executables for the target architecture and not build the helper otherwise,
at least when compile-testing. No idea how to do that though.

Link: http://www.kernel.org/pub/tools/crosstool/
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 net/bpfilter/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/bpfilter/Kconfig b/net/bpfilter/Kconfig
index 60725c5f79db..61cc4fcbb4d0 100644
--- a/net/bpfilter/Kconfig
+++ b/net/bpfilter/Kconfig
@@ -9,6 +9,7 @@ menuconfig BPFILTER
 if BPFILTER
 config BPFILTER_UMH
 	tristate "bpfilter kernel module with user mode helper"
+	depends on X86 # actually depends on native builds
 	default m
 	help
 	  This builds bpfilter kernel module with embedded user mode helper
-- 
2.9.0

