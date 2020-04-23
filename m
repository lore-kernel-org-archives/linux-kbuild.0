Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:31892 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726790AbgDWHkg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 03:40:36 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 08/16] samples: uhid: build sample program for target architecture
Date: Thu, 23 Apr 2020 16:39:21 +0900
Message-Id: <20200423073929.127521-9-masahiroy@kernel.org>
In-Reply-To: <20200423073929.127521-1-masahiroy@kernel.org>
References: <20200423073929.127521-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: bpf@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

This userspace program includes UAPI headers exported to usr/include/.
'make headers' always works for the target architecture (i.e. the same
architecture as the kernel), so the sample program must be built for
the target as well. Kbuild now supports the 'userprogs' syntax to
describe it cleanly.

Add the entry to samples/Makefile to put this into the build bot
coverage.

I also added the CONFIG option guarded by 'depends on CC_CAN_LINK'
because $(CC) may not necessarily provide libc.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 samples/Kconfig         | 6 ++++++
 samples/Makefile        | 1 +
 samples/uhid/.gitignore | 2 ++
 samples/uhid/Makefile   | 9 +++------
 4 files changed, 12 insertions(+), 6 deletions(-)
 create mode 100644 samples/uhid/.gitignore

diff --git a/samples/Kconfig b/samples/Kconfig
index 8949e9646125..ff9126ef1c79 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -131,6 +131,12 @@ config SAMPLE_SECCOMP
 	  Build samples of seccomp filters using various methods of
 	  BPF filter construction.
 
+config SAMPLE_UHID
+	bool "Build UHID sample code"
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
index 5f44ea40d6d5..1dc58c40298c 100644
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
+user-ccflags += -I usr/include
-- 
2.25.1
