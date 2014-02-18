Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:60260 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755980AbaBRO3r (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 09:29:47 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 06/20] lto: Disable LTO for sys_ni
Date: Tue, 18 Feb 2014 15:28:44 +0100
Message-Id: <1392733738-8290-7-git-send-email-andi@firstfloor.org>
In-Reply-To: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
References: <1392733738-8290-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: sam@ravnborg.org, x86@kernel.org, linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

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

