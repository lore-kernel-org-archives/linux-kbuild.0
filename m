Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:31741 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726790AbgDWHkc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 03:40:32 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 16/16] samples: watchdog: use 'userprogs' syntax
Date: Thu, 23 Apr 2020 16:39:29 +0900
Message-Id: <20200423073929.127521-17-masahiroy@kernel.org>
In-Reply-To: <20200423073929.127521-1-masahiroy@kernel.org>
References: <20200423073929.127521-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: bpf@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

Kbuild now supports the 'userprogs' syntax to describe the build rules
of userspace programs for the target architecture (i.e. the same
architecture as the kernel).

Add the entry to samples/Makefile to put this into the build bot
coverage.

I also added the CONFIG option guarded by 'depends on CC_CAN_LINK'
because $(CC) may not necessarily provide libc.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 samples/Kconfig           |  3 +++
 samples/Makefile          |  1 +
 samples/watchdog/Makefile | 10 ++--------
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/samples/Kconfig b/samples/Kconfig
index 55548a487d3c..4aa89d24a19e 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -205,5 +205,8 @@ config SAMPLE_INTEL_MEI
 	help
 	  Build a sample program to work with mei device.
 
+config SAMPLE_WATCHDOG
+	bool "watchdog sample"
+	depends on CC_CAN_LINK
 
 endif # SAMPLES
diff --git a/samples/Makefile b/samples/Makefile
index 042208326689..29c66aadd954 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -26,3 +26,4 @@ obj-$(CONFIG_VIDEO_PCI_SKELETON)	+= v4l/
 obj-y					+= vfio-mdev/
 subdir-$(CONFIG_SAMPLE_VFS)		+= vfs
 obj-$(CONFIG_SAMPLE_INTEL_MEI)		+= mei/
+subdir-$(CONFIG_SAMPLE_WATCHDOG)	+= watchdog
diff --git a/samples/watchdog/Makefile b/samples/watchdog/Makefile
index a9430fa60253..17384cfb387e 100644
--- a/samples/watchdog/Makefile
+++ b/samples/watchdog/Makefile
@@ -1,9 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-CC := $(CROSS_COMPILE)gcc
-PROGS := watchdog-simple
-
-all: $(PROGS)
-
-clean:
-	rm -fr $(PROGS)
-
+userprogs := watchdog-simple
+always-y := $(userprogs)
-- 
2.25.1
