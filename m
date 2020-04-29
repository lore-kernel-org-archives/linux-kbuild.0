Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:30976 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgD2Dqh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Apr 2020 23:46:37 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 12/15] samples: mei: build sample program for target architecture
Date: Wed, 29 Apr 2020 12:45:24 +0900
Message-Id: <20200429034527.590520-13-masahiroy@kernel.org>
In-Reply-To: <20200429034527.590520-1-masahiroy@kernel.org>
References: <20200429034527.590520-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: bpf <bpf@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>

This userspace program includes UAPI headers exported to usr/include/.
'make headers' always works for the target architecture (i.e. the same
architecture as the kernel), so the sample program should be built for
the target as well. Kbuild now supports 'userprogs' for that.

I also guarded the CONFIG option by 'depends on CC_CAN_LINK' because
$(CC) may not provide libc.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v2: None

 samples/Kconfig      | 1 +
 samples/mei/Makefile | 9 +++------
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/samples/Kconfig b/samples/Kconfig
index c68d391c0602..69699db49675 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -193,6 +193,7 @@ config SAMPLE_VFS
 config SAMPLE_INTEL_MEI
 	bool "Build example program working with intel mei driver"
 	depends on INTEL_MEI
+	depends on CC_CAN_LINK && HEADERS_INSTALL
 	help
 	  Build a sample program to work with mei device.
 
diff --git a/samples/mei/Makefile b/samples/mei/Makefile
index f5b9d02be2cd..329411f82369 100644
--- a/samples/mei/Makefile
+++ b/samples/mei/Makefile
@@ -1,10 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Copyright (c) 2012-2019, Intel Corporation. All rights reserved.
 
-hostprogs := mei-amt-version
+userprogs := mei-amt-version
+always-y := $(userprogs)
 
-HOSTCFLAGS_mei-amt-version.o += -I$(objtree)/usr/include
-
-always-y := $(hostprogs)
-
-all: mei-amt-version
+userccflags += -I usr/include
-- 
2.25.1
