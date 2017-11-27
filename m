Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:65529 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752486AbdK0Veb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:31 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 09/21] lto: Use C version for SYSCALL_ALIAS
Date: Mon, 27 Nov 2017 13:34:11 -0800
Message-Id: <20171127213423.27218-10-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

LTO doesn't like the assembler aliasing used for SYSCALL_ALIAS.
Replace it with C aliasing. Also mark the only user visible.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 include/linux/linkage.h   | 6 ++----
 kernel/time/posix-stubs.c | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/linux/linkage.h b/include/linux/linkage.h
index f68db9e450eb..24fb6468b1a5 100644
--- a/include/linux/linkage.h
+++ b/include/linux/linkage.h
@@ -30,10 +30,8 @@
 #endif
 
 #ifndef SYSCALL_ALIAS
-#define SYSCALL_ALIAS(alias, name) asm(			\
-	".globl " VMLINUX_SYMBOL_STR(alias) "\n\t"	\
-	".set   " VMLINUX_SYMBOL_STR(alias) ","		\
-		  VMLINUX_SYMBOL_STR(name))
+#define SYSCALL_ALIAS(a, name) \
+	__visible typeof(a) a __attribute__((alias(__stringify(name))))
 #endif
 
 #define __page_aligned_data	__section(.data..page_aligned) __aligned(PAGE_SIZE)
diff --git a/kernel/time/posix-stubs.c b/kernel/time/posix-stubs.c
index b258bee13b02..5e36cb75f3be 100644
--- a/kernel/time/posix-stubs.c
+++ b/kernel/time/posix-stubs.c
@@ -19,7 +19,7 @@
 #include <linux/posix-timers.h>
 #include <linux/compat.h>
 
-asmlinkage long sys_ni_posix_timers(void)
+__visible asmlinkage long sys_ni_posix_timers(void)
 {
 	pr_err_once("process %d (%s) attempted a POSIX timer syscall "
 		    "while CONFIG_POSIX_TIMERS is not set\n",
-- 
2.13.6

