Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:30763 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgD2Dq2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Apr 2020 23:46:28 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 07/15] samples: uhid: build sample program for target architecture
Date: Wed, 29 Apr 2020 12:45:19 +0900
Message-Id: <20200429034527.590520-8-masahiroy@kernel.org>
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

Add the entry to samples/Makefile to put this into the build bot
coverage.

I also added the CONFIG option guarded by 'depends on CC_CAN_LINK'
because $(CC) may not provide libc.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v2: None

 samples/Kconfig         | 6 ++++++
 samples/Makefile        | 1 +
 samples/uhid/.gitignore | 2 ++
 samples/uhid/Makefile   | 9 +++------
 4 files changed, 12 insertions(+), 6 deletions(-)
 create mode 100644 samples/uhid/.gitignore

diff --git a/samples/Kconfig b/samples/Kconfig
index 8949e9646125..2560e87c9cae 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -131,6 +131,12 @@ config SAMPLE_SECCOMP
 	  Build samples of seccomp filters using various methods of
 	  BPF filter construction.
 
+config SAMPLE_UHID
+	bool "UHID sample"
+	depends on CC_CAN_LINK && HEADERS_INSTALL
+	help
+	  Build UHID sample program.
+
 config SAMPLE_VFIO_MDEV_MTTY
 	tristate "Build VFIO mtty example mediated device sample code -- loadable modules only"
 	depends on VFIO_MDEV_DEVICE && m
diff --git a/samples/Makefile b/samples/Makefile
index 5ce50ef0f2b2..bdc168405452 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_SAMPLE_TRACE_EVENTS)	+= trace_events/
 obj-$(CONFIG_SAMPLE_TRACE_PRINTK)	+= trace_printk/
 obj-$(CONFIG_SAMPLE_FTRACE_DIRECT)	+= ftrace/
 obj-$(CONFIG_SAMPLE_TRACE_ARRAY)	+= ftrace/
+subdir-$(CONFIG_SAMPLE_UHID)		+= uhid
 obj-$(CONFIG_VIDEO_PCI_SKELETON)	+= v4l/
 obj-y					+= vfio-mdev/
 subdir-$(CONFIG_SAMPLE_VFS)		+= vfs
diff --git a/samples/uhid/.gitignore b/samples/uhid/.gitignore
new file mode 100644
index 000000000000..0e0a5a929f5d
--- /dev/null
+++ b/samples/uhid/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+/uhid-example
diff --git a/samples/uhid/Makefile b/samples/uhid/Makefile
index 5f44ea40d6d5..9e652fc34103 100644
--- a/samples/uhid/Makefile
+++ b/samples/uhid/Makefile
@@ -1,8 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-# List of programs to build
-hostprogs := uhid-example
+userprogs := uhid-example
+always-y := $(userprogs)
 
-# Tell kbuild to always build the programs
-always-y := $(hostprogs)
-
-HOSTCFLAGS_uhid-example.o += -I$(objtree)/usr/include
+userccflags += -I usr/include
-- 
2.25.1
