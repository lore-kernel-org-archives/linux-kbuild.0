Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:31770 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726854AbgDWHkd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 03:40:33 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 13/16] samples: mei: build sample program for target architecture
Date: Thu, 23 Apr 2020 16:39:26 +0900
Message-Id: <20200423073929.127521-14-masahiroy@kernel.org>
In-Reply-To: <20200423073929.127521-1-masahiroy@kernel.org>
References: <20200423073929.127521-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: bpf@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <masahiroy@kernel.org>, Tomas Winkler <tomas.winkler@intel.com>, linux-kernel@vger.kernel.org

This userspace program includes UAPI headers exported to usr/include/.
'make headers' always works for the target architecture (i.e. the same
architecture as the kernel), so the sample program must be built for
the target as well. Kbuild now supports the 'userprogs' syntax to
describe it cleanly.

I also guarded the CONFIG option by 'depends on CC_CAN_LINK' because
$(CC) may not necessarily provide libc.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 samples/Kconfig      | 1 +
 samples/mei/Makefile | 9 +++------
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/samples/Kconfig b/samples/Kconfig
index b8113555aa6c..b9dafee5d3af 100644
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
index f5b9d02be2cd..ced5532cbbee 100644
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
+user-ccflags += -I usr/include
-- 
2.25.1
