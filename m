Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:35216 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752259AbdK0Veb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:31 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 12/21] ftrace: Mark function tracer test functions noinline/noclone
Date: Mon, 27 Nov 2017 13:34:14 -0800
Message-Id: <20171127213423.27218-13-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

The ftrace function tracer self tests calls some functions to verify
the get traced. This relies on them not being inlined. Previously
this was ensured by putting them into another file, but with LTO
the compiler can inline across files, which makes the tests fail.

Mark these functions as noinline and noclone.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 kernel/trace/trace_selftest_dynamic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_selftest_dynamic.c b/kernel/trace/trace_selftest_dynamic.c
index 8cda06a10d66..c364cf777e1a 100644
--- a/kernel/trace/trace_selftest_dynamic.c
+++ b/kernel/trace/trace_selftest_dynamic.c
@@ -1,13 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/compiler.h>
 #include "trace.h"
 
-int DYN_FTRACE_TEST_NAME(void)
+noinline __noclone int DYN_FTRACE_TEST_NAME(void)
 {
 	/* used to call mcount */
 	return 0;
 }
 
-int DYN_FTRACE_TEST_NAME2(void)
+noinline __noclone int DYN_FTRACE_TEST_NAME2(void)
 {
 	/* used to call mcount */
 	return 0;
-- 
2.13.6

