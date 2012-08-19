Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:30968 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753218Ab2HSC5a (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Aug 2012 22:57:30 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 48/74] x86, lto: Use inline assembler instead of global register variable to get sp
Date: Sat, 18 Aug 2012 19:56:44 -0700
Message-Id: <1345345030-22211-49-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

LTO in gcc 4.6/47. has trouble with global register variables. They were used
to read the stack pointer. Use a simple inline assembler statement instead.

I verified this generates the same binary (on 64bit) as the original
register variable.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/include/asm/thread_info.h |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/thread_info.h b/arch/x86/include/asm/thread_info.h
index 89f794f..d9fbfa1 100644
--- a/arch/x86/include/asm/thread_info.h
+++ b/arch/x86/include/asm/thread_info.h
@@ -167,9 +167,11 @@ struct thread_info {
  */
 #ifndef __ASSEMBLY__
 
-
-/* how to get the current stack pointer from C */
-register unsigned long current_stack_pointer asm("esp") __used;
+#define current_stack_pointer ({ 		\
+	unsigned long sp;			\
+	asm("mov %%esp,%0" : "=r" (sp));	\
+	sp;					\
+})
 
 /* how to get the thread information struct from C */
 static inline struct thread_info *current_thread_info(void)
-- 
1.7.7.6

