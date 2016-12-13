Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:39413 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750771AbcLMGDX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Dec 2016 01:03:23 -0500
From: Maninder Singh <maninder1.s@samsung.com>
Subject: [PATCH v2] kasan: Support for r/w instrumentation control
Date: Tue, 13 Dec 2016 11:27:45 +0530
Message-id: <1481608665-26941-1-git-send-email-maninder1.s@samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: aryabinin@virtuozzo.com, glider@google.com, dvyukov@google.com, corbet@lwn.net, mmarek@suse.com, akpm@linux-foundation.org
Cc: kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, pankaj.m@samsung.com, ajeet.y@samsung.com, Maninder Singh <maninder1.s@samsung.com>, Vaneet narang <v.narang@samsung.com>

This provide option to control sanity of read and write operations
Both read and write instrumentation increase size of uImage, So using
this option read or write instrumentation can be avoided if not required.
Useful in case of module sanity, using this uImage sanity can be avoided.

Also user space ASAN provides this support for read/write instrumentation
control.

Signed-off-by: Vaneet narang <v.narang@samsung.com>
Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
Reviewed-by: Ajeet Yadav <ajeet.y@samsung.com>
---
v1 -> v2: Added Documentation for the same.

 Documentation/dev-tools/kasan.rst | 16 ++++++++++++++++
 lib/Kconfig.kasan                 | 16 ++++++++++++++++
 scripts/Makefile.kasan            |  4 ++++
 3 files changed, 36 insertions(+)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index f7a18f2..b8147df 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -40,6 +40,22 @@ similar to the following to the respective kernel Makefile:
 
     KASAN_SANITIZE := n
 
+Control Over Read/Write Instrumentation of kernel::
+
+- To Disable Read Instrumentation of kernel with:
+
+    CONFIG_KASAN_READS = n
+
+Because in some cases we need to check only memory write sanitization
+for better performance, read instrumentation can be disabled.
+
+- To Disable Write Instrumentation of kernel with:
+
+    CONFIG_KASAN_WRITES = n
+
+In case when to instrument only external modules, not the entire kernel
+for read or write intrumentation or both.
+
 Error reports
 ~~~~~~~~~~~~~
 
diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index bd38aab..37d1de9 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -45,6 +45,22 @@ config KASAN_INLINE
 
 endchoice
 
+config KASAN_READS
+	prompt "Read instrumentation"
+	bool
+	default y
+	depends on KASAN
+	help
+	  This configuration controls the sanity of memory read.
+
+config KASAN_WRITES
+	prompt "Write instrumentation"
+	bool
+	default y
+	depends on KASAN
+	help
+	  This configuration controls the sanity of memory write.
+
 config TEST_KASAN
 	tristate "Module for testing kasan for bug detection"
 	depends on m && KASAN
diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 37323b0..a61b18e 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -29,3 +29,7 @@ else
     endif
 endif
 endif
+
+CFLAGS_KASAN += $(call cc-option, \
+		$(if $(CONFIG_KASAN_READS),, --param asan-instrument-reads=0) \
+		$(if $(CONFIG_KASAN_WRITES),, --param asan-instrument-writes=0))
-- 
1.9.1

