Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:2453 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751763AbaBHICM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 8 Feb 2014 03:02:12 -0500
From: Andi Kleen <ak@linux.intel.com>
Subject: [PATCH 06/17] lto: Disable LTO for sys_ni
Date: Sat,  8 Feb 2014 09:01:10 +0100
Message-Id: <1391846481-31491-6-git-send-email-ak@linux.intel.com>
In-Reply-To: <1391846481-31491-1-git-send-email-ak@linux.intel.com>
References: <1391846481-31491-1-git-send-email-ak@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, x86@kernel.org, Andi Kleen <ak@linux.intel.com>

The assembler alias code in cond_syscall does not work
when compiled for LTO. Just disable LTO for that file.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 kernel/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/Makefile b/kernel/Makefile
index bc010ee..31c26c6 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -18,6 +18,9 @@ CFLAGS_REMOVE_cgroup-debug.o = -pg
 CFLAGS_REMOVE_irq_work.o = -pg
 endif
 
+# cond_syscall is currently not LTO compatible
+CFLAGS_sys_ni.o = $(DISABLE_LTO)
+
 obj-y += sched/
 obj-y += locking/
 obj-y += power/
-- 
1.8.5.2

