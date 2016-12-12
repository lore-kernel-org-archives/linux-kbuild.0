Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37727 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754103AbcLLJiC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Dec 2016 04:38:02 -0500
From: Maninder Singh <maninder1.s@samsung.com>
Subject: [PATCH 1/1] kasan: Support for r/w instrumentation control
Date: Mon, 12 Dec 2016 15:02:37 +0530
Message-id: <1481535157-24628-1-git-send-email-maninder1.s@samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, aryabinin@virtuozzo.com, glider@google.com, dvyukov@google.com, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, pankaj.m@samsung.com, ajeet.y@samsung.com, Maninder Singh <maninder1.s@samsung.com>, Vaneet narang <v.narang@samsung.com>

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
 lib/Kconfig.kasan      | 16 ++++++++++++++++
 scripts/Makefile.kasan |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index bd38aab..6f0f774 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -45,6 +45,22 @@ config KASAN_INLINE
 
 endchoice
 
+config KASAN_READS
+		prompt "Read instrumentation"
+		bool
+		default y
+		depends on KASAN
+		help
+			This configuration controls the sanity of  memory read.
+
+config KASAN_WRITES
+		prompt "Write instrumentation"
+		bool
+		default y
+		depends on KASAN
+		help
+			This configuration controls the sanity of memory write.
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

