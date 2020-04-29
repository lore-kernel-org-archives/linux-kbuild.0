Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:30764 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgD2Dq2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Apr 2020 23:46:28 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 08/15] samples: hidraw: build sample program for target architecture
Date: Wed, 29 Apr 2020 12:45:20 +0900
Message-Id: <20200429034527.590520-9-masahiroy@kernel.org>
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

 samples/Kconfig         | 2 +-
 samples/hidraw/Makefile | 9 +++------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/samples/Kconfig b/samples/Kconfig
index 2560e87c9cae..08f2d025ca05 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -118,7 +118,7 @@ config SAMPLE_CONNECTOR
 
 config SAMPLE_HIDRAW
 	bool "hidraw sample"
-	depends on HEADERS_INSTALL
+	depends on CC_CAN_LINK && HEADERS_INSTALL
 
 config SAMPLE_PIDFD
 	bool "pidfd sample"
diff --git a/samples/hidraw/Makefile b/samples/hidraw/Makefile
index 8bd25f77671f..d2c77ed60b39 100644
--- a/samples/hidraw/Makefile
+++ b/samples/hidraw/Makefile
@@ -1,8 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-# List of programs to build
-hostprogs := hid-example
-always-y := $(hostprogs)
+userprogs := hid-example
+always-y := $(userprogs)
 
-HOSTCFLAGS_hid-example.o += -I$(objtree)/usr/include
-
-all: hid-example
+userccflags += -I usr/include
-- 
2.25.1
