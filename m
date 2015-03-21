Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f51.google.com ([209.85.215.51]:36468 "EHLO
	mail-la0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751251AbbCUBuZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 20 Mar 2015 21:50:25 -0400
Received: by labe2 with SMTP id e2so24109659lab.3
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2015 18:50:23 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH] kbuild: include core debug info when DEBUG_INFO_REDUCED
Date: Sat, 21 Mar 2015 02:50:01 +0100
Message-Id: <1426902601-13524-1-git-send-email-linux@rasmusvillemoes.dk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org

With CONFIG_DEBUG_INFO_REDUCED, we do get quite a lot of debug info
(around 22.7 MB for a defconfig+DEBUG_INFO_REDUCED). However, the
"basenames must match" rule used by -femit-struct-debug-baseonly
option means that we miss some core data structures, such as struct
{device, file, inode, mm_struct, page} etc.

We can easily get these included as well, while still getting the
benefits of CONFIG_DEBUG_INFO_REDUCED (faster build times and smaller
individual object files): All it takes is a dummy translation unit
including a few strategic headers and compiled with a flag overriding
-femit-struct-debug-baseonly.

This increases the size of .debug_info by ~0.3%, but these 90 KB
contain some rather useful info.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 lib/Makefile     |  3 +++
 lib/debug_info.c | 27 +++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 lib/debug_info.c

diff --git a/lib/Makefile b/lib/Makefile
index 58f74d2dd396..3d788091d60c 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -45,6 +45,9 @@ CFLAGS_kobject.o += -DDEBUG
 CFLAGS_kobject_uevent.o += -DDEBUG
 endif
 
+obj-$(CONFIG_DEBUG_INFO_REDUCED) += debug_info.o
+CFLAGS_debug_info.o += $(call cc-option, -femit-struct-debug-detailed=any)
+
 obj-$(CONFIG_GENERIC_IOMAP) += iomap.o
 obj-$(CONFIG_GENERIC_PCI_IOMAP) += pci_iomap.o
 obj-$(CONFIG_HAS_IOMEM) += iomap_copy.o devres.o
diff --git a/lib/debug_info.c b/lib/debug_info.c
new file mode 100644
index 000000000000..2edbe27517ed
--- /dev/null
+++ b/lib/debug_info.c
@@ -0,0 +1,27 @@
+/*
+ * This file exists solely to ensure debug information for some core
+ * data structures is included in the final image even for
+ * CONFIG_DEBUG_INFO_REDUCED. Please do not add actual code. However,
+ * adding appropriate #includes is fine.
+ */
+#include <stdarg.h>
+
+#include <linux/cred.h>
+#include <linux/crypto.h>
+#include <linux/dcache.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/fscache-cache.h>
+#include <linux/io.h>
+#include <linux/kallsyms.h>
+#include <linux/kernel.h>
+#include <linux/kobject.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/net.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <net/addrconf.h>
+#include <net/sock.h>
+#include <net/tcp.h>
-- 
2.1.3

