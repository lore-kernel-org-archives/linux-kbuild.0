Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:64945 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753647Ab2HSC5l (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Aug 2012 22:57:41 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 21/74] lto: Make lockdep_sys_exit asmlinkage
Date: Sat, 18 Aug 2012 19:56:17 -0700
Message-Id: <1345345030-22211-22-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

lockdep_sys_exit can be called from assembler code, so make it
asmlinkage

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 include/linux/lockdep.h |    2 +-
 kernel/lockdep.c        |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 00e4637..f37a847 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -265,7 +265,7 @@ extern void lockdep_info(void);
 extern void lockdep_reset(void);
 extern void lockdep_reset_lock(struct lockdep_map *lock);
 extern void lockdep_free_key_range(void *start, unsigned long size);
-extern void lockdep_sys_exit(void);
+extern asmlinkage void lockdep_sys_exit(void);
 
 extern void lockdep_off(void);
 extern void lockdep_on(void);
diff --git a/kernel/lockdep.c b/kernel/lockdep.c
index ea9ee45..ef76308 100644
--- a/kernel/lockdep.c
+++ b/kernel/lockdep.c
@@ -4142,7 +4142,7 @@ void debug_show_held_locks(struct task_struct *task)
 }
 EXPORT_SYMBOL_GPL(debug_show_held_locks);
 
-void lockdep_sys_exit(void)
+asmlinkage void lockdep_sys_exit(void)
 {
 	struct task_struct *curr = current;
 
-- 
1.7.7.6

