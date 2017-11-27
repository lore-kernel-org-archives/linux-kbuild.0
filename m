Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:14694 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752860AbdK0Veh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:37 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 13/21] ftrace: Disable LTO for ftrace self tests
Date: Mon, 27 Nov 2017 13:34:15 -0800
Message-Id: <20171127213423.27218-14-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

Even when the test functions are not inlined something makes the ftrace
self tests fail with LTO. ftrace manually tests seems to work fine.
Disable LTO for the self test file, which makes the self tests work
again.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 kernel/trace/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index e2538c7638d4..a471a08305e9 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -8,7 +8,7 @@ KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
 
 ifdef CONFIG_FTRACE_SELFTEST
 # selftest needs instrumentation
-CFLAGS_trace_selftest_dynamic.o = $(CC_FLAGS_FTRACE)
+CFLAGS_trace_selftest_dynamic.o = $(CC_FLAGS_FTRACE) ${DISABLE_LTO}
 obj-y += trace_selftest_dynamic.o
 endif
 endif
-- 
2.13.6

