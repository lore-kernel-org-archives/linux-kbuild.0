Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:31737 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgDWHkb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 03:40:31 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 11/16] samples: vfs: build sample programs for target architecture
Date: Thu, 23 Apr 2020 16:39:24 +0900
Message-Id: <20200423073929.127521-12-masahiroy@kernel.org>
In-Reply-To: <20200423073929.127521-1-masahiroy@kernel.org>
References: <20200423073929.127521-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: bpf@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

These userspace programs include UAPI headers exported to usr/include/.
'make headers' always works for the target architecture (i.e. the same
architecture as the kernel), so the sample programs must be built for
the target as well. Kbuild now supports the 'userprogs' syntax to
describe it cleanly.

I also guarded the CONFIG option by 'depends on CC_CAN_LINK' because
$(CC) may not necessarily provide libc.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 samples/Kconfig      |  2 +-
 samples/vfs/Makefile | 11 +++--------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/samples/Kconfig b/samples/Kconfig
index 2e0ef2cc1aa8..b8beb6fd75b4 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -184,7 +184,7 @@ config SAMPLE_ANDROID_BINDERFS
 
 config SAMPLE_VFS
 	bool "Build example programs that use new VFS system calls"
-	depends on HEADERS_INSTALL
+	depends on CC_CAN_LINK && HEADERS_INSTALL
 	help
 	  Build example userspace programs that use new VFS system calls such
 	  as mount API and statx().  Note that this is restricted to the x86
diff --git a/samples/vfs/Makefile b/samples/vfs/Makefile
index 65acdde5c117..f3831466c1bb 100644
--- a/samples/vfs/Makefile
+++ b/samples/vfs/Makefile
@@ -1,10 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-# List of programs to build
-hostprogs := \
-	test-fsmount \
-	test-statx
+userprogs := test-fsmount test-statx
+always-y := $(userprogs)
 
-always-y := $(hostprogs)
-
-HOSTCFLAGS_test-fsmount.o += -I$(objtree)/usr/include
-HOSTCFLAGS_test-statx.o += -I$(objtree)/usr/include
+user-ccflags += -I usr/include
-- 
2.25.1
