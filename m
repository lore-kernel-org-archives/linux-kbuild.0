Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:60904 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727776AbfHMGME (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 02:12:04 -0400
From: Knut Omang <knut.omang@oracle.com>
Subject: [RFC 14/19] ktf: Internal debugging facilities
Date: Tue, 13 Aug 2019 08:09:29 +0200
Message-Id: <2e0a915bf97d241eced54efa540c9a11a1996c27.1565676440.git-series.knut.omang@oracle.com>
In-Reply-To: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
References: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shreyans Devendra Doshi <0xinfosect0r@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, Brendan Higgins <brendanhiggins@google.com>, Kevin Hilman <khilman@baylibre.com>, Hidenori Yamaji <hidenori.yamaji@sony.com>, Frank Rowand <frowand.list@gmail.com>, Timothy Bird <Tim.Bird@sony.com>, Luis Chamberlain <mcgrof@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, Knut Omang <knut.omang@oracle.com>

Utilities for convenient and runtime enabled/disabled
printk debugging mainly intended for debugging ktf itself and subtle
early issues with execution/running of tests.

ktf_debug.h:     User mode debug function definitions

Signed-off-by: Knut Omang <knut.omang@oracle.com>
---
 tools/testing/selftests/ktf/lib/ktf_debug.cc | 20 +++++++-
 tools/testing/selftests/ktf/lib/ktf_debug.h  | 59 +++++++++++++++++++++-
 2 files changed, 79 insertions(+)
 create mode 100644 tools/testing/selftests/ktf/lib/ktf_debug.cc
 create mode 100644 tools/testing/selftests/ktf/lib/ktf_debug.h

diff --git a/tools/testing/selftests/ktf/lib/ktf_debug.cc b/tools/testing/selftests/ktf/lib/ktf_debug.cc
new file mode 100644
index 0000000..18ff443
--- /dev/null
+++ b/tools/testing/selftests/ktf/lib/ktf_debug.cc
@@ -0,0 +1,20 @@
+/* Copyright (c) 2012 Oracle Corporation. All rights reserved
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include "ktf_debug.h"
+#include <stdlib.h>
+
+unsigned long ktf_debug_mask = 0;
+
+
+void ktf_debug_init()
+{
+  ktf_debug_mask = 0;
+  char* dbg_mask_str = getenv("KTF_DEBUG_MASK");
+  if (dbg_mask_str) {
+    ktf_debug_mask = strtol(dbg_mask_str, NULL, 0);
+    log(KTF_INFO_V, "debug mask set to 0x%lx\n", ktf_debug_mask);
+  }
+}
diff --git a/tools/testing/selftests/ktf/lib/ktf_debug.h b/tools/testing/selftests/ktf/lib/ktf_debug.h
new file mode 100644
index 0000000..dc761a4
--- /dev/null
+++ b/tools/testing/selftests/ktf/lib/ktf_debug.h
@@ -0,0 +1,59 @@
+/* Copyright (c) 2012 Oracle Corporation. All rights reserved
+ *    Author: Knut Omang <knut.omang@oracle.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ *
+ * ktf_debug.h: User mode debug function definitions
+ * - intended for test debugging.
+ *
+ * Enabled by setting bits in the environment variable KTF_DEBUG_MASK
+ */
+
+#ifndef _KTF_DEBUG_H
+#define _KTF_DEBUG_H
+#include <time.h>
+#include <stdio.h>
+#include <sys/types.h>
+#include <pthread.h>
+#include <unistd.h>
+#include <sys/syscall.h>
+
+extern unsigned long ktf_debug_mask;
+
+
+#define KTF_ERR             0x1
+#define KTF_WARN            0x2
+#define KTF_INFO            0x4
+#define KTF_INFO_V        0x100
+#define KTF_MR           0x2000
+#define KTF_DEBUG       0x10000
+#define KTF_POLL        0x20000
+#define KTF_EVENT       0x40000
+#define KTF_DEBUG_V   0x1000000
+#define KTF_DUMP      0x2000000
+
+/* Call this to initialize the debug logic from
+ * environment KTF_DEBUG_MASK
+ */
+void ktf_debug_init();
+
+#define log(level, format, arg...)		\
+do {\
+  if (level & ktf_debug_mask) {\
+    char _tm[30]; \
+    time_t _tv = time(NULL);\
+    ctime_r(&_tv,_tm);\
+    _tm[24] = '\0';\
+    fprintf(stderr, "%s [%ld] %s: " format, \
+            _tm, (long unsigned int) pthread_self(), __func__, ## arg);     \
+  }\
+} while (0)
+
+#define logs(class, stmt_list) \
+  do {							    \
+    if (ktf_debug_mask & class) { \
+      stmt_list;  \
+    }   \
+  } while (0)
+
+#endif
-- 
git-series 0.9.1
