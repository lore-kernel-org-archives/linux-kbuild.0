Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from citi.umich.edu ([141.211.133.111]:51685 "EHLO citi.umich.edu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752532AbZCZPtU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 Mar 2009 11:49:20 -0400
From: Fred Isaman <iisaman@citi.umich.edu>
Subject: [PATCH 1/1] lib: find_next_bit.o needed by a module only, move it from lib to obj
Date: Thu, 26 Mar 2009 11:22:16 -0400
Message-Id: <1238080936-4372-1-git-send-email-iisaman@citi.umich.edu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: pnfs@linux-nfs.org

It is possible to configure the kernel such that find_next_bit is
referenced only by modules, causing linking to fail with

ERROR: "find_last_bit" [fs/nfs/nfs.ko] undefined!

Signed-off-by: Fred Isaman <iisaman@citi.umich.edu>
---
 lib/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/lib/Makefile b/lib/Makefile
index 32b0e64..286e2f7 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -37,7 +37,7 @@ lib-$(CONFIG_RWSEM_GENERIC_SPINLOCK) += rwsem-spinlock.o
 lib-$(CONFIG_RWSEM_XCHGADD_ALGORITHM) += rwsem.o
 lib-$(CONFIG_GENERIC_FIND_FIRST_BIT) += find_next_bit.o
 lib-$(CONFIG_GENERIC_FIND_NEXT_BIT) += find_next_bit.o
-lib-$(CONFIG_GENERIC_FIND_LAST_BIT) += find_last_bit.o
+obj-$(CONFIG_GENERIC_FIND_LAST_BIT) += find_last_bit.o
 obj-$(CONFIG_GENERIC_HWEIGHT) += hweight.o
 obj-$(CONFIG_LOCK_KERNEL) += kernel_lock.o
 obj-$(CONFIG_PLIST) += plist.o
-- 
1.6.0.6

