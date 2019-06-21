Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:60112 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfFUQkK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Jun 2019 12:40:10 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: compile-test global headers to ensure they are self-contained
Date: Sat, 22 Jun 2019 01:39:31 +0900
Message-Id: <20190621163931.19397-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org

Make as many headers self-contained as possible so that they can be
included without relying on a specific include order.

This commit compiles only a few headers, but it is a good start point.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile         |  1 +
 include/Makefile | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 include/Makefile

diff --git a/Makefile b/Makefile
index c23f5e8381ad..82c1722dd9e9 100644
--- a/Makefile
+++ b/Makefile
@@ -610,6 +610,7 @@ drivers-y	:= drivers/ sound/
 drivers-$(CONFIG_SAMPLES) += samples/
 net-y		:= net/
 libs-y		:= lib/
+libs-$(CONFIG_HEADER_TEST) += include/
 core-y		:= usr/
 virt-y		:= virt/
 endif # KBUILD_EXTMOD
diff --git a/include/Makefile b/include/Makefile
new file mode 100644
index 000000000000..68a76ac732c3
--- /dev/null
+++ b/include/Makefile
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+# extend the test coverage when existing errors are fixed
+
+header-test += linux/w*.h
+header-test += linux/x*.h
+header-test += linux/y*.h
+header-test += ras/*.h
+header-test += soc/at91/*.h
+header-test += soc/bcm2835/*.h
+header-test += soc/mediatek/*.h
+header-test += soc/sa1100/*.h
+
+all-headers = $(patsubst $(srctree)/include/%,%,\
+	    $(wildcard $(addprefix $(srctree)/include/, $(header-test))))
+
+# Do not include directly
+no-header-test += linux/compiler-clang.h
+no-header-test += linux/compiler-gcc.h
+no-header-test += linux/patchkey.h
+no-header-test += linux/rwlock_api_smp.h
+no-header-test += linux/spinlock_types_up.h
+no-header-test += linux/spinlock_up.h
+no-header-test += linux/wimax/debug.h
+no-header-test += rdma/uverbs_named_ioctl.h
+
+# Conditionally included
+no-header-test += linux/byteorder/big_endian.h
+no-header-test += linux/byteorder/little_endian.h
+
+header-test-y = $(filter-out $(no-header-test), $(all-headers))
-- 
2.17.1
